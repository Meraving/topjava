package ru.javawebinar.topjava.util;

import ru.javawebinar.topjava.model.Role;
import ru.javawebinar.topjava.model.User;


import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class UserUtil {

    public static final List<User> USERS = Arrays.asList(
            new User(null, "Admin", "Admin@meals.com", "123qwe", Role.ADMIN),
            new User(null, "user", "user1@meals.com", "pass", Role.USER),
            new User(null, "user", "user2@meals.com", "word", Role.USER)
    );

    public static List<User> getAll(Collection<User> users) {
        return filterByPredicate(users, user -> true);
    }

    public static List<User> filterByPredicate(Collection<User> users, Predicate<User> filter) {
        return users.stream()
                .filter(filter)
                .map(UserUtil::create)
                .collect(Collectors.toList());
    }

    private static User create(User user) {
        return new User(user.getId(), user.getName(),user.getEmail(),user.getPassword(),user.getCaloriesPerDay(),user.isEnabled(),user.getRoles());
    }


}
