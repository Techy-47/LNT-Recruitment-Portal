package com.lnt.util;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class ReportCsvUtilTest {

    @Test
    void escapeQuotesAndWrapsValue() {
        assertEquals("\"hello\"", ReportCsvUtil.escape("hello"));
        assertEquals("\"he said \"\"hi\"\"\"", ReportCsvUtil.escape("he said \"hi\""));
    }

    @Test
    void headerLineFormatsCsvHeaders() {
        assertEquals("\"id\",\"name\",\"email\"", ReportCsvUtil.headerLine(new String[]{"id", "name", "email"}));
    }
}
