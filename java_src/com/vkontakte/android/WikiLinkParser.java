package com.vkontakte.android;

import android.text.SpannableStringBuilder;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class WikiLinkParser {
    public static final Pattern WIKI_PATTERN = Pattern.compile("\\[(\\S+?)\\|(.+?)\\]");

    public static CharSequence parse(CharSequence in) {
        if (in == null) {
            return "";
        }
        Matcher matcher = WIKI_PATTERN.matcher(in);
        StringBuffer sb = new StringBuffer();
        ArrayList<LinkSpan> linksList = new ArrayList<>();
        ArrayList<Integer> spanStartList = new ArrayList<>();
        ArrayList<Integer> spanEndList = new ArrayList<>();
        while (matcher.find()) {
            String urlCandidate = matcher.group(1);
            if (LinkParser.isLink(urlCandidate)) {
                matcher.appendReplacement(sb, "$2");
                spanEndList.add(Integer.valueOf(sb.length()));
                spanStartList.add(Integer.valueOf(sb.length() - matcher.group(2).length()));
                linksList.add(new LinkSpan(matcher.group(1)));
            }
        }
        matcher.appendTail(sb);
        SpannableStringBuilder stringResult = new SpannableStringBuilder(sb.toString());
        for (int i = 0; i < linksList.size(); i++) {
            stringResult.setSpan(linksList.get(i), spanStartList.get(i).intValue(), spanEndList.get(i).intValue(), 0);
        }
        return stringResult;
    }
}
