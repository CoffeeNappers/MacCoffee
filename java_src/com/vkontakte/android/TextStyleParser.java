package com.vkontakte.android;

import android.text.SpannableStringBuilder;
import android.text.style.StyleSpan;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class TextStyleParser {
    private static final String BOLD_MARKER = "'''";
    private static final Pattern BOLD_PATTERN = Pattern.compile("\\'''(.*?)\\'''");

    public static CharSequence parse(CharSequence text) {
        return parse(text, BOLD_PATTERN, BOLD_MARKER, 1);
    }

    private static CharSequence parse(CharSequence text, Pattern pattern, String marker, int typeface) {
        if (text == null) {
            return "";
        }
        StringBuffer sb = new StringBuffer();
        SpannableStringBuilder spannable = new SpannableStringBuilder();
        Matcher matcher = pattern.matcher(text);
        while (matcher.find()) {
            sb.setLength(0);
            String group = matcher.group();
            String spanText = group.substring(marker.length(), group.length() - marker.length());
            matcher.appendReplacement(sb, spanText);
            spannable.append((CharSequence) sb);
            int start = spannable.length() - spanText.length();
            StyleSpan boldStyleSpan = new StyleSpan(typeface);
            spannable.setSpan(boldStyleSpan, start, spannable.length(), 33);
        }
        sb.setLength(0);
        matcher.appendTail(sb);
        spannable.append((CharSequence) sb.toString());
        return spannable;
    }
}
