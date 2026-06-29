package com.lnt.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.Map;

public final class SessionUtil {
    private SessionUtil() {
    }

    public static HttpSession renewSession(HttpServletRequest request) {
        HttpSession oldSession = request.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate();
        }
        return request.getSession(true);
    }

    public static void setAttributes(HttpSession session, Map<String, Object> attributes) {
        for (Map.Entry<String, Object> entry : attributes.entrySet()) {
            session.setAttribute(entry.getKey(), entry.getValue());
        }
    }
}
