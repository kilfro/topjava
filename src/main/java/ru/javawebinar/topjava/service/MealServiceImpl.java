package ru.javawebinar.topjava.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.repository.MealRepository;
import ru.javawebinar.topjava.util.exception.NotFoundException;

import java.util.Collection;

/**
 * GKislin
 * 06.03.2015.
 */
@Service
public class MealServiceImpl implements MealService {
    @Autowired
    private MealRepository repository;

    public Meal save(Meal meal) {
        return repository.save(meal);
    }

    public boolean delete(int id, int userID) {
        if (repository.delete(id, userID)) {
            return true;
        } else {
            throw new NotFoundException("Not found!");
        }
    }

    public Meal get(int id, int userID) {
        Meal meal = repository.get(id, userID);
        if (meal == null) {
            throw new NotFoundException("Not found!");
        }
        return meal;
    }

    public Collection<Meal> getAll(int userID) {
        Collection<Meal> meals = repository.getAll(userID);
        if (meals == null || meals.isEmpty() || meals.size() == 0) {
            throw new NotFoundException("Not found!");
        }
        return meals;
    }
}