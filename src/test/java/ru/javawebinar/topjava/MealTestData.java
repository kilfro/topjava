package ru.javawebinar.topjava;

import ru.javawebinar.topjava.matcher.ModelMatcher;
import ru.javawebinar.topjava.model.Meal;

import static java.time.LocalDateTime.of;
import static ru.javawebinar.topjava.model.BaseEntity.START_SEQ;

/**
 * GKislin
 * 13.03.2015.
 */
public class MealTestData {

    public static final ModelMatcher<Meal> MATCHER = new ModelMatcher<>();
    public static final int GLOBAL_ID = START_SEQ + 2;

    public static final Meal MEAL1 = new Meal(GLOBAL_ID, of(2017, 3, 21, 9, 0, 0), "Завтрак", 500);
    public static final Meal MEAL2 = new Meal(GLOBAL_ID + 1, of(2017, 3, 21, 14, 30, 0), "Обед", 1200);
    public static final Meal MEAL3 = new Meal(GLOBAL_ID + 2, of(2017, 3, 21, 20, 15, 0), "Ужин",500);
    public static final Meal MEAL4 = new Meal(GLOBAL_ID + 3, of(2017, 3, 22, 10, 0, 0), "Завтрак",500);
    public static final Meal MEAL5 = new Meal(GLOBAL_ID + 4, of(2017, 3, 22, 13, 0, 0), "Обед",1000);
    public static final Meal MEAL6 = new Meal(GLOBAL_ID + 5, of(2017, 3, 22, 19, 0, 0), "Ужин",500);

    public static final Meal ADMIN_MEAL1 = new Meal(GLOBAL_ID + 6, of(2017, 3, 21, 10, 20, 0), "Завтрак админ",600);
    public static final Meal ADMIN_MEAL2 = new Meal(GLOBAL_ID + 7, of(2017, 3, 21, 13, 0, 0), "Обед админ",700);
    public static final Meal ADMIN_MEAL3 = new Meal(GLOBAL_ID + 8, of(2017, 3, 21 , 20, 0, 0), "Ужин админ",800);
    public static final Meal ADMIN_MEAL4 = new Meal(GLOBAL_ID + 9, of(2017, 3, 22, 10, 0, 0), "Завтрак админ",500);
    public static final Meal ADMIN_MEAL5 = new Meal(GLOBAL_ID + 10, of(2017, 3, 22, 14, 0, 0), "Обед админ",800);
    public static final Meal ADMIN_MEAL6 = new Meal(GLOBAL_ID + 11, of(2017, 3, 22, 19, 30, 0), "Ужин админ",400);

}
