package ru.javawebinar.topjava.service;

import ru.javawebinar.topjava.model.Meal;

import java.util.Collection;

/**
 * GKislin
 * 15.06.2015.
 */
public interface MealService {
    Meal save(Meal meal);

    boolean delete(int id, int userID);

    Meal get(int id, int userID);

    Collection<Meal> getAll(int userID);
}