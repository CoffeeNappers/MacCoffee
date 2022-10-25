package com.vkontakte.android;

import android.text.SpannableStringBuilder;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.ui.Font;
import java.util.Stack;
/* loaded from: classes2.dex */
public class TextFormatter {
    public static CharSequence processString(String s) {
        SpannableStringBuilder ssb = new SpannableStringBuilder();
        Stack<Object> spans = new Stack<>();
        Stack<Integer> offsets = new Stack<>();
        int offset = 0;
        int outOffset = 0;
        while (true) {
            int pos = s.indexOf(47, offset);
            if (pos != -1) {
                if (pos - offset > 0) {
                    ssb.append((CharSequence) s.substring(offset, pos));
                    outOffset += pos - offset;
                }
                int offset2 = pos + 1;
                char cmd = s.charAt(offset2);
                offset = offset2 + 1;
                switch (cmd) {
                    case '/':
                        ssb.append('/');
                        outOffset++;
                        break;
                    case 'b':
                        spans.push(new StyleSpan(1));
                        offsets.push(Integer.valueOf(outOffset));
                        break;
                    case 'c':
                        spans.push(new ForegroundColorSpan((int) Long.parseLong(s.substring(offset, offset + 8), 16)));
                        offset += 8;
                        offsets.push(Integer.valueOf(outOffset));
                        break;
                    case 'e':
                        int off = offsets.pop().intValue();
                        Object span = spans.pop();
                        ssb.setSpan(span, off, outOffset, 0);
                        break;
                    case 'i':
                        spans.push(new StyleSpan(2));
                        offsets.push(Integer.valueOf(outOffset));
                        break;
                    case 'm':
                        spans.push(new Font.TypefaceSpan(Font.Medium));
                        offsets.push(Integer.valueOf(outOffset));
                        break;
                    case 's':
                        spans.push(new StrikethroughSpan());
                        offsets.push(Integer.valueOf(outOffset));
                        break;
                    case 'u':
                        spans.push(new UnderlineSpan());
                        offsets.push(Integer.valueOf(outOffset));
                        break;
                    case 'z':
                        spans.push(new AbsoluteSizeSpan(Integer.parseInt(s.substring(offset, offset + 3)), true));
                        offset += 3;
                        offsets.push(Integer.valueOf(outOffset));
                        break;
                }
            } else {
                if (offset < s.length()) {
                    ssb.append((CharSequence) s.substring(offset));
                }
                if (spans.size() > 0) {
                    throw new IllegalArgumentException("Some spans don't have their ends defined with /e");
                }
                return ssb;
            }
        }
    }

    public static String escape(String s) {
        return s.replace(CameraUtilsEffects.FILE_DELIM, "//");
    }
}
