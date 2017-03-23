package ru.javawebinar.topjava.service;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.javawebinar.topjava.MealTestData;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.util.DbPopulator;
import ru.javawebinar.topjava.util.exception.NotFoundException;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;

import static ru.javawebinar.topjava.MealTestData.*;
import static ru.javawebinar.topjava.UserTestData.*;

/**
 * Created by kirill on 23.03.17.
 */
@ContextConfiguration({
        "classpath:spring/spring-app.xml",
        "classpath:spring/spring-db.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
public class MealServiceTest {

    @Autowired
    private MealService service;

    @Autowired
    private DbPopulator dbPopulator;

    @Before
    public void setUp() throws Exception {
        dbPopulator.execute();
    }

    @Test
    public void get() throws Exception {
        Meal meal = service.get(GLOBAL_ID + 1, USER_ID);
        MealTestData.MATCHER.assertEquals(
                meal,
                MEAL2
        );
    }

    @Test(expected = NotFoundException.class)
    public void getNotFound() {
        service.get(GLOBAL_ID + 100, USER_ID);
    }

    @Test(expected = NotFoundException.class)
    public void getOtherUser() {
        service.get(GLOBAL_ID + 2, ADMIN_ID);
    }

    @Test
    public void delete() throws Exception {
        service.delete(GLOBAL_ID, USER_ID);
        MealTestData.MATCHER.assertCollectionEquals(
                Arrays.asList(MEAL6, MEAL5, MEAL4, MEAL3, MEAL2),
                service.getAll(USER_ID)
        );
    }

    @Test(expected = NotFoundException.class)
    public void deleteNotFound() throws Exception{
        service.delete(GLOBAL_ID + 100, ADMIN_ID);
    }

    @Test(expected = NotFoundException.class)
    public void deleteOtherUser() throws Exception{
        service.delete(GLOBAL_ID, ADMIN_ID);
    }

    @Test
    public void getBetweenDates() throws Exception {

        MealTestData.MATCHER.assertCollectionEquals(
                Arrays.asList(MEAL6, MEAL5, MEAL4),
                service.getBetweenDates(LocalDate.of(2017, 03, 22), LocalDate.of(2017, 03, 22), USER_ID)
        );
    }

    @Test
    public void getBetweenDateTimes() throws Exception {
        MealTestData.MATCHER.assertCollectionEquals(
                Arrays.asList(ADMIN_MEAL1),
                service.getBetweenDateTimes(LocalDateTime.of(2017, 03, 21, 10, 0, 0),
                        LocalDateTime.of(2017, 03, 21, 11, 0, 0), ADMIN_ID)
        );
    }

    @Test
    public void getAll() throws Exception {
        MealTestData.MATCHER.assertCollectionEquals(
                MEALS,
                service.getAll(USER_ID)
        );
    }

    @Test
    public void update() throws Exception {
        Meal testMeal = new Meal(
                100002,
                LocalDateTime.of(2017, 3 , 21 , 10 , 0 , 0 , 0),
                "Завтрак - тест UPDATE",
                450
        );
        Meal returnedMeal = service.update(testMeal, USER_ID);
        MealTestData.MATCHER.assertEquals(
                testMeal,
                returnedMeal
        );
    }

    @Test
    public void save() throws Exception {
        Meal testMeal = new Meal(
                LocalDateTime.of(2017, 3 , 23 , 10 , 0 , 0 , 0),
                "Завтрак - тест SAVE",
                650
        );
        Meal returnedMeal = service.save(testMeal, USER_ID);
        testMeal.setId(100014);
        MealTestData.MATCHER.assertEquals(returnedMeal, testMeal);
    }
}