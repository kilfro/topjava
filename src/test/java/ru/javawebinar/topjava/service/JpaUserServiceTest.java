package ru.javawebinar.topjava.service;

import org.springframework.test.context.ActiveProfiles;
import ru.javawebinar.topjava.Profiles;

/**
 * Created by kirill on 30.03.17.
 */
@ActiveProfiles({Profiles.ACTIVE_DB, Profiles.JPA})
public class JpaUserServiceTest extends UserServiceTest {
}
