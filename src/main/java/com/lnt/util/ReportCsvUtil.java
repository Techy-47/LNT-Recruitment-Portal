package com.lnt.util;

public final class ReportCsvUtil {
    private ReportCsvUtil() {
    }

    public static String escape(String input) {
        String value = input == null ? "" : input;
        return '"' + value.replace("\"", "\"\"") + '"';
    }

    public static String headerLine(String[] headers) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < headers.length; i++) {
            builder.append(escape(headers[i]));
            if (i < headers.length - 1) {
                builder.append(',');
            }
        }
        return builder.toString();
    }
}
