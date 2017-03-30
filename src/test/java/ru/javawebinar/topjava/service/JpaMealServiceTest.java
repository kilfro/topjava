package ru.javawebinar.topjava.service;

import org.junit.BeforeClass;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ActiveProfiles;
import ru.javawebinar.topjava.Profiles;

/**
 * Created by kirill on 30.03.17.
 */
@ActiveProfiles({Profiles.ACTIVE_DB, Profiles.JPA})
public class JpaMealServiceTest extends MealServiceTest {
    @BeforeClass
    public static void setLog() {
        setLog(LoggerFactory.getLogger(JpaMealServiceTest.class));
    }
}
