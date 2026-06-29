package com.lnt.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    public static String hashPassword(String plain) {
        return BCrypt.hashpw(plain, BCrypt.gensalt(12));
    }

    public static boolean checkPassword(String plain, String hashed) {
        if (plain == null || hashed == null) return false;
        return BCrypt.checkpw(plain, hashed);
    }
}
