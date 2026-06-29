package com.lnt.util;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

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
