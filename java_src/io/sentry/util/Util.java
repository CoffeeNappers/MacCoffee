package io.sentry.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
/* loaded from: classes3.dex */
public final class Util {
    private Util() {
    }

    public static boolean isNullOrEmpty(String string) {
        return string == null || string.length() == 0;
    }

    public static Map<String, String> parseTags(String tagsString) {
        if (isNullOrEmpty(tagsString)) {
            return Collections.emptyMap();
        }
        String[] entries = tagsString.split(",");
        Map<String, String> map = new LinkedHashMap<>();
        for (String entry : entries) {
            String[] split = entry.split(":");
            if (split.length != 2) {
                throw new IllegalArgumentException("Invalid tags entry: " + entry);
            }
            map.put(split[0], split[1]);
        }
        return map;
    }

    public static Set<String> parseExtraTags(String extraTagsString) {
        return isNullOrEmpty(extraTagsString) ? Collections.emptySet() : new HashSet(Arrays.asList(extraTagsString.split(",")));
    }

    public static Integer parseInteger(String value, Integer defaultValue) {
        if (isNullOrEmpty(value)) {
            return defaultValue;
        }
        Integer defaultValue2 = Integer.valueOf(Integer.parseInt(value));
        return defaultValue2;
    }

    public static Long parseLong(String value, Long defaultValue) {
        if (isNullOrEmpty(value)) {
            return defaultValue;
        }
        Long defaultValue2 = Long.valueOf(Long.parseLong(value));
        return defaultValue2;
    }

    public static Double parseDouble(String value, Double defaultValue) {
        if (isNullOrEmpty(value)) {
            return defaultValue;
        }
        Double defaultValue2 = Double.valueOf(Double.parseDouble(value));
        return defaultValue2;
    }

    public static String trimString(String string, int maxMessageLength) {
        if (string == null) {
            return null;
        }
        if (string.length() > maxMessageLength) {
            return string.substring(0, maxMessageLength - 3) + "...";
        }
        return string;
    }
}
