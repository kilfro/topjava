package ru.javawebinar.topjava.service;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import ru.javawebinar.topjava.model.Role;
import ru.javawebinar.topjava.model.User;
import ru.javawebinar.topjava.repository.JpaUtil;

import javax.validation.ConstraintViolationException;
import java.util.Collections;

/**
 * Created by kirill on 04.04.17.
 */
public abstract class AbstractDataAndJpaUserServiceTest extends AbstractUserServiceTest {
    @Autowired
    protected JpaUtil jpaUtil;

    @Override
    @Before
    public void setUp() throws Exception {
        super.setUp();
        jpaUtil.clear2ndLevelHibernateCache();
    }

    @Test
    public void testValidation() throws Exception {
        validateRootCause(() -> service.save(new User(null, "  ", "invalid@yandex.ru", "password", Role.ROLE_USER)), ConstraintViolationException.class);
        validateRootCause(() -> service.save(new User(null, "User", "  ", "password", Role.ROLE_USER)), ConstraintViolationException.class);
        validateRootCause(() -> service.save(new User(null, "User", "invalid@yandex.ru", "  ", Role.ROLE_USER)), ConstraintViolationException.class);
        validateRootCause(() -> service.save(new User(null, "User", "invalid@yandex.ru", "password", 9, true, Collections.emptySet())), ConstraintViolationException.class);
        validateRootCause(() -> service.save(new User(null, "User", "invalid@yandex.ru", "password", 10001, true, Collections.emptySet())), ConstraintViolationException.class);
    }
}
