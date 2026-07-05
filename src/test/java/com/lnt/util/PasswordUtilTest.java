package com.lnt.util;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

class PasswordUtilTest {

    @Test
    void hashAndCheckPasswordWorks() {
        String raw = "Admin@1234";
        String hash = PasswordUtil.hashPassword(raw);

        assertNotEquals(raw, hash);
        assertTrue(PasswordUtil.checkPassword(raw, hash));
        assertFalse(PasswordUtil.checkPassword("wrong-password", hash));
    }
}
