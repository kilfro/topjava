package ru.javawebinar.topjava.web.meal;

import org.junit.Test;
import org.springframework.http.MediaType;
import ru.javawebinar.topjava.web.AbstractControllerTest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import static ru.javawebinar.topjava.MealTestData.*;
/**
 * Created by kirill on 06.04.17.
 */
public class MealRestControllerTest extends AbstractControllerTest{
    private static final String URL = "/rest/meals/";

    @Test
    public void testGet() throws Exception {
        mockMvc.perform(get(URL + "100006"))
                .andExpect(status().isOk())
                .andDo(print())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(MATCHER.contentMatcher(MEAL5));
    }

    @Test
    public void testDelete() throws Exception {
        mockMvc.perform(delete(URL + "100005"))
                .andExpect(status().isOk())
                .andDo(print());
        MATCHER.assertCollectionEquals(MEALS_COLLECT, mealService.getAll(100000));
    }

}