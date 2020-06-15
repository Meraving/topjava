package ru.javawebinar.topjava.repository.inmemory;

import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.repository.MealRepository;
import ru.javawebinar.topjava.util.MealsUtil;
import ru.javawebinar.topjava.web.SecurityUtil;

import java.util.Collection;
import java.util.Comparator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class InMemoryMealRepository implements MealRepository {
    private Map<Integer, Meal> repository = new ConcurrentHashMap<>();
    private AtomicInteger counter = new AtomicInteger(0);

    {
        MealsUtil.MEALS.forEach(this::save);
    }

    @Override
    public Meal save(Meal meal) {
        if (meal.isNew()) {
            meal.setId(counter.incrementAndGet());
            meal.setUserId(SecurityUtil.authUserId());
            repository.put(meal.getId(), meal);
            return meal;
        }
        if (meal.getUserId() != SecurityUtil.authUserId()) return null;
        // handle case: update, but not present in storage
        return repository.computeIfPresent(meal.getId(), (id, oldMeal) -> meal);
    }

    @Override
    public boolean delete(int id) {
        if (repository.containsKey(id)) {
            if (repository.get(id).getUserId() != SecurityUtil.authUserId()) return false;
        }
        return repository.remove(id) != null;
    }

    @Override
    public Meal get(int id) {
        Meal meal = repository.get(id);
        if (meal != null && meal.getUserId() == SecurityUtil.authUserId()) return meal;
        return null;
    }

    @Override
    public Collection<Meal> getAll() {
        return repository.values();
    }

    @Override
    public Collection<Meal> getAllByUserId(int id) {
        return repository.values().stream()
                .filter(meal -> meal.getUserId() == id)
                .sorted(Comparator.comparing(Meal::getDate).reversed())
                .collect(Collectors.toList());
    }
}

