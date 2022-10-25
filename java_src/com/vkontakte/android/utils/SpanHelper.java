package com.vkontakte.android.utils;

import android.text.SpannableStringBuilder;
/* loaded from: classes3.dex */
public class SpanHelper {
    public static SpannableStringBuilder format(CharSequence str, Object... args) {
        SpannableStringBuilder builder = new SpannableStringBuilder(str);
        for (int i = 0; i < builder.length(); i++) {
            int currentIndex = i;
            int currentIndex2 = currentIndex + 1;
            if (builder.charAt(currentIndex) == '%') {
                int currentIndex3 = currentIndex2 + 1;
                int argIndex = getArgIndex(builder, currentIndex2);
                if (argIndex >= 0 && argIndex < args.length) {
                    Object insertObject = args[argIndex];
                    if (getCharAtSafety(builder, currentIndex3 + 1) == 's') {
                        builder = replaceObj(builder, i, i + 4, insertObject);
                    } else if (getCharAtSafety(builder, currentIndex3 + 1) == ',' && getCharAtSafety(builder, currentIndex3 + 2) == 'd') {
                        builder = replaceObj(builder, i, i + 5, insertObject);
                    }
                }
            }
        }
        return builder;
    }

    private static int getArgIndex(SpannableStringBuilder builder, int index) {
        if (index >= builder.length()) {
            return -1;
        }
        return (builder.charAt(index) - '0') - 1;
    }

    private static char getCharAtSafety(SpannableStringBuilder builder, int index) {
        if (index < 0 || index >= builder.length()) {
            return ' ';
        }
        return builder.charAt(index);
    }

    private static SpannableStringBuilder replaceObj(SpannableStringBuilder builder, int start, int end, Object o) {
        if (o instanceof CharSequence) {
            return builder.replace(start, end, (CharSequence) o);
        }
        return builder.replace(start, end, (CharSequence) (o == null ? "" : o.toString()));
    }
}
