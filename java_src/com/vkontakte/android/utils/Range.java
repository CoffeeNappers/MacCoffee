package com.vkontakte.android.utils;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes3.dex */
public class Range implements Comparable<Range> {
    private static final String PARSING_ERROR_EMPTY = "Range string cannot be empty";
    private static final String PARSING_ERROR_FORMAT = "Range string should consists of two long values divided by '-' sign. Passed string is ";
    private long end;
    private long start;

    public Range(long start, long end) {
        this.start = start;
        this.end = end;
    }

    public Range(String range) {
        if (TextUtils.isEmpty(range)) {
            throw new IllegalArgumentException(PARSING_ERROR_EMPTY);
        }
        String[] split = range.split("-");
        if (split.length == 2) {
            try {
                this.start = Integer.valueOf(split[0]).intValue();
                this.end = Integer.valueOf(split[1]).intValue();
                return;
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException(PARSING_ERROR_FORMAT + range);
            }
        }
        throw new IllegalArgumentException(PARSING_ERROR_FORMAT + range);
    }

    public long getStart() {
        return this.start;
    }

    public long getEnd() {
        return this.end;
    }

    public void setEnd(long end) {
        this.end = end;
    }

    public long getLength() {
        return this.end - this.start;
    }

    @Override // java.lang.Comparable
    public int compareTo(@NonNull Range another) {
        return (int) (this.start - another.start);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || !(o instanceof Range)) {
            return false;
        }
        Range range = (Range) o;
        return this.start == range.start && this.end == range.end;
    }

    public int hashCode() {
        int result = (int) (this.start ^ (this.start >>> 32));
        return (result * 31) + ((int) (this.end ^ (this.end >>> 32)));
    }

    public String toString() {
        return this.start + "-" + this.end;
    }

    public static Set<Range> merge(List<Range> intervals) {
        if (intervals.isEmpty()) {
            return Collections.emptySet();
        }
        if (intervals.size() == 1) {
            return Collections.singleton(intervals.get(0));
        }
        Collections.sort(intervals);
        Range first = intervals.get(0);
        long start = first.start;
        long end = first.end;
        Set<Range> result = new LinkedHashSet<>();
        for (int i = 1; i < intervals.size(); i++) {
            Range current = intervals.get(i);
            if (current.start <= end) {
                end = Math.max(current.end, end);
            } else {
                result.add(new Range(start, end));
                start = current.start;
                end = current.end;
            }
        }
        result.add(new Range(start, end));
        return result;
    }

    public static long getLength(Collection<Range> intervals) {
        long result = 0;
        for (Range range : intervals) {
            result += range.getLength();
        }
        return result;
    }
}
