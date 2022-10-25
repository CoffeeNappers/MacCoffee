package com.vk.emoji;

import android.support.annotation.NonNull;
import android.text.Spanned;
import java.util.Arrays;
/* loaded from: classes2.dex */
final class SpanRangeList {
    public static final int SPAN_NOT_FOUND = -1;
    private final Range[] ranges;

    public SpanRangeList(Spanned spanned) {
        EmojiSpan[] spans = (EmojiSpan[]) spanned.getSpans(0, spanned.length(), EmojiSpan.class);
        this.ranges = new Range[spans.length];
        for (int i = 0; i < spans.length; i++) {
            this.ranges[i] = new Range(spanned.getSpanStart(spans[i]), spanned.getSpanEnd(spans[i]));
        }
        Arrays.sort(this.ranges);
    }

    public int spanEnd(int index) {
        int res = rangeBinarySearch(index);
        if (res < 0) {
            return -1;
        }
        return this.ranges[res].end;
    }

    public int nextSpanStart(int index) {
        int res = rangeBinarySearch(index);
        if (res < 0 || res >= this.ranges.length - 1) {
            return -1;
        }
        return this.ranges[res + 1].start;
    }

    private int rangeBinarySearch(int index) {
        int low = 0;
        int high = this.ranges.length - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            Range midVal = this.ranges[mid];
            if (index < midVal.start || index >= midVal.end) {
                if (midVal.end <= index) {
                    low = mid + 1;
                } else if (midVal.start > index) {
                    high = mid - 1;
                }
            } else {
                return mid;
            }
        }
        return -1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Range implements Comparable<Range> {
        final int end;
        final int start;

        public Range(int start, int end) {
            this.start = start;
            this.end = end;
        }

        @Override // java.lang.Comparable
        public int compareTo(@NonNull Range o) {
            return this.start - o.start;
        }
    }
}
