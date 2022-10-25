package com.vkontakte.android;

import android.net.Uri;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PostInteract;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class LinkParser {
    public static final int ALL = 7;
    public static final int HASHTAGS = 4;
    public static final int URLS = 1;
    public static final int VK_MENTIONS = 2;
    public static final Pattern URL_PATTERN = Pattern.compile("(?:http(?:s)?:\\/\\/)?(?:(?:[a-zа-я]|[a-zа-я0-9_-]{2,})\\.)+(?:[a-z][a-z0-9-]{1,20}|рф)(?:\\/[!a-z0-9а-яё_z%~:\\.,-]*)*(?:[\\?&#:\\/][a-z0-9\\[\\]_]*(?:=?[a-z0-9~\\._=,%\\|+!-]*))*(?<![\\.,:!?-])", 66);
    public static final Pattern MENTIONS_PATTERN = Pattern.compile("\\[((?:id|club)[0-9]+)\\|([^\\]]+)\\]");
    public static final Pattern BOARD_REPLIES_PATTERN = Pattern.compile("\\[((?:id|club)[0-9]+):bp[0-9_-]+\\|([^\\]]+)\\]");
    public static final Pattern HASHTAGS_PATTERN = Pattern.compile("\\B(#\\w{2,})(?:@([-a-zA-Z0-9_\\.]{2,}))?");

    public static CharSequence parseLinks(CharSequence in, int flags) {
        return parseLinks(in, flags, null);
    }

    public static CharSequence parseLinks(CharSequence in, int flags, PostInteract postInteract) {
        int slashIndex;
        if (in == null) {
            return "";
        }
        List<CharRange> usedRanges = Collections.emptyList();
        SpannableStringBuilder result = null;
        if ((flags & 1) > 0) {
            Matcher matcher = URL_PATTERN.matcher(in);
            int offset = 0;
            while (matcher.find()) {
                if (result == null) {
                    result = new SpannableStringBuilder(in);
                }
                if (matcher.start() > 0) {
                    char prev = result.charAt((matcher.start() - 1) - offset);
                    if (prev != '@') {
                    }
                }
                LinkSpan span = new LinkSpan(matcher.group(), postInteract);
                String replacement = matcher.group();
                if (replacement.startsWith("http:") || replacement.startsWith("https:")) {
                    slashIndex = replacement.indexOf(47, 7);
                } else {
                    slashIndex = replacement.indexOf(47);
                }
                if (slashIndex != -1 && replacement.length() - slashIndex > 30) {
                    replacement = replacement.substring(0, slashIndex + 30) + "...";
                }
                result = result.replace(matcher.start() - offset, matcher.end() - offset, (CharSequence) replacement);
                result.setSpan(span, matcher.start() - offset, (matcher.start() - offset) + replacement.length(), 0);
                offset += matcher.group().length() - replacement.length();
                if (usedRanges == Collections.EMPTY_LIST) {
                    usedRanges = new ArrayList<>();
                }
                usedRanges.add(new CharRange(matcher.start() - offset, (matcher.start() - offset) + replacement.length()));
            }
        }
        if ((flags & 4) > 0) {
            Matcher matcher2 = HASHTAGS_PATTERN.matcher(result == null ? in : result);
            while (matcher2.find()) {
                int s = matcher2.start();
                int e = matcher2.end();
                boolean intersects = false;
                for (int i = 0; i < usedRanges.size(); i++) {
                    CharRange r = usedRanges.get(i);
                    if ((s >= r.start && s <= r.end) || (e >= r.start && e <= r.end)) {
                        intersects = true;
                        break;
                    }
                }
                if (!intersects) {
                    if (result == null) {
                        result = new SpannableStringBuilder(in);
                    }
                    if (matcher2.group(2) == null) {
                        LinkSpan span2 = new LinkSpan("vkontakte://search/" + matcher2.group(), postInteract);
                        result.setSpan(span2, matcher2.start(), matcher2.end(), 0);
                    } else {
                        LinkSpan span3 = new LinkSpan("vkontakte://vk.com/" + matcher2.group(2) + CameraUtilsEffects.FILE_DELIM + Uri.encode(matcher2.group(1).substring(1)), postInteract);
                        result.setSpan(span3, matcher2.start(), matcher2.end(), 0);
                    }
                }
            }
        }
        if ((flags & 2) > 0) {
            Matcher matcher3 = MENTIONS_PATTERN.matcher(result == null ? in : result);
            int offset2 = 0;
            while (matcher3.find()) {
                if (result == null) {
                    result = new SpannableStringBuilder(in);
                }
                LinkSpan span4 = new LinkSpan("vkontakte://vk.com/" + matcher3.group(1), postInteract);
                result = result.replace(matcher3.start() - offset2, matcher3.end() - offset2, (CharSequence) matcher3.group(2));
                result.setSpan(span4, matcher3.start() - offset2, (matcher3.start() - offset2) + matcher3.group(2).length(), 0);
                offset2 += matcher3.group().length() - matcher3.group(2).length();
            }
        }
        return result != null ? result : in;
    }

    public static String stripMentions(String src) {
        Matcher matcher = MENTIONS_PATTERN.matcher(src);
        StringBuffer result = new StringBuffer();
        while (matcher.find()) {
            matcher.appendReplacement(result, matcher.group(2));
        }
        matcher.appendTail(result);
        String src2 = result.toString();
        StringBuffer result2 = new StringBuffer();
        Matcher matcher2 = BOARD_REPLIES_PATTERN.matcher(src2);
        while (matcher2.find()) {
            matcher2.appendReplacement(result2, matcher2.group(2));
        }
        matcher2.appendTail(result2);
        return result2.toString();
    }

    public static CharSequence truncatePost(CharSequence in) {
        return truncatePost(in, true);
    }

    public static CharSequence truncatePost(CharSequence in, boolean addShowMore) {
        int truncateAt = -1;
        if (in.toString().split("\n").length > 6) {
            int index = 0;
            String str = in.toString();
            for (int i = 0; i < 6; i++) {
                index = str.indexOf(10, index + 1);
            }
            truncateAt = index;
        }
        if (in.length() > 280 && ((truncateAt == -1 || truncateAt > 300) && (truncateAt = Math.min(in.toString().indexOf(32, 280), 300)) == -1)) {
            truncateAt = 280;
        }
        if (truncateAt != -1) {
            SpannableStringBuilder ssb = new SpannableStringBuilder();
            ssb.append(in, 0, truncateAt);
            ssb.append((CharSequence) "...\n");
            if (addShowMore) {
                Spannable showMore = Spannable.Factory.getInstance().newSpannable(VKApplication.context.getResources().getString(R.string.post_show_full));
                ExpandTextSpan span = new ExpandTextSpan(null);
                showMore.setSpan(span, 0, showMore.length(), 0);
                ssb.append((CharSequence) showMore);
            }
            return ssb;
        }
        return in;
    }

    public static CharSequence parseLinks(CharSequence in) {
        return parseLinks(in, 7);
    }

    public static CharSequence parseLinks(CharSequence in, PostInteract postInteract) {
        return parseLinks(in, 7, postInteract);
    }

    public static String tryExtractLink(CharSequence in) {
        Matcher matcher = URL_PATTERN.matcher(in);
        if (!matcher.find()) {
            return null;
        }
        return matcher.group();
    }

    public static boolean isLink(String in) {
        Matcher matcher = URL_PATTERN.matcher(in);
        return matcher.find() && matcher.start() == 0 && matcher.end() == in.length();
    }

    public static boolean isMention(String in) {
        Matcher matcher = MENTIONS_PATTERN.matcher(in);
        return matcher.find() && matcher.start() == 0 && (matcher.end() == in.length() || matcher.end() == in.length() + (-1));
    }

    public static boolean hasCurrentUserMention(String in) {
        boolean z = true;
        Matcher matcher = MENTIONS_PATTERN.matcher(in);
        if (matcher.find()) {
            String group = matcher.group(1);
            if (!group.startsWith("id")) {
                return false;
            }
            try {
                int id = Integer.parseInt(group.substring(2));
                if (id != VKAccountManager.getCurrent().getUid()) {
                    z = false;
                }
                return z;
            } catch (NumberFormatException e) {
                return false;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class CharRange {
        int end;
        int start;

        public CharRange(int s, int e) {
            this.start = s;
            this.end = e;
        }
    }
}
