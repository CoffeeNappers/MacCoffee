package com.vk.core.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.functions.Predicate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class CollectionUtils {
    private CollectionUtils() {
    }

    @SafeVarargs
    @NonNull
    public static <T> List<T> listOf(@NonNull T... items) {
        List<T> list = new ArrayList<>();
        Collections.addAll(list, items);
        return list;
    }

    @SafeVarargs
    @NonNull
    public static <T> ArrayList<T> arrayOf(@NonNull T... items) {
        ArrayList<T> list = new ArrayList<>();
        Collections.addAll(list, items);
        return list;
    }

    @NonNull
    public static <T> ArrayList<T> arrayOf(@Nullable Collection<T> c) {
        ArrayList<T> list = new ArrayList<>();
        if (c != null) {
            list.addAll(c);
        }
        return list;
    }

    @NonNull
    public static <T> List<T> subList(@NonNull List<T> src, int from, int to) {
        if (from < 0) {
            throw new IllegalArgumentException("Argument 'from' must be positive");
        }
        if (to > src.size()) {
            to = src.size();
        }
        if (from > to) {
            throw new IllegalArgumentException("Argument 'from' must be less or equal to argument 'to'");
        }
        List<T> dst = new ArrayList<>();
        if (to - from == src.size()) {
            dst.addAll(src);
        } else {
            for (int i = from; i < to; i++) {
                dst.add(src.get(i));
            }
        }
        return dst;
    }

    @NonNull
    public static <T> List<T> subList(@NonNull List<T> src, int dstSize) {
        return subList(src, 0, dstSize);
    }

    @NonNull
    public static <T> List<T> filter(@NonNull List<T> collection, @NonNull Predicate<T> p) {
        List<T> result = new ArrayList<>();
        for (T t : collection) {
            if (p.f(t)) {
                result.add(t);
            }
        }
        return result;
    }

    public static <T> int count(@NonNull List<T> src, @NonNull Predicate<T> p) {
        int count = 0;
        for (T t : src) {
            if (p.f(t)) {
                count++;
            }
        }
        return count;
    }

    @Nullable
    public static <T> T findFirst(@NonNull List<T> src, @NonNull Predicate<T> p) {
        for (T t : src) {
            if (p.f(t)) {
                return t;
            }
        }
        return null;
    }

    public static boolean isEmpty(@Nullable Collection c) {
        return c == null || c.isEmpty();
    }

    public static boolean isNotEmpty(@Nullable Collection c) {
        return !isEmpty(c);
    }

    public static int count(@Nullable Collection c) {
        return count(c, 0);
    }

    public static int count(@Nullable Collection c, int defVal) {
        if (c != null) {
            int defVal2 = c.size();
            return defVal2;
        }
        return defVal;
    }

    public static int count(@Nullable Collection... c) {
        int count = 0;
        if (c != null) {
            for (Collection collection : c) {
                count += count(collection);
            }
        }
        return count;
    }

    public static int countIfNotLess(@Nullable Collection c, int countToCompare, int defVal) {
        int count = count(c);
        return count >= countToCompare ? count : defVal;
    }

    public static int countIfNotLess(@Nullable Collection c, int countToCompare) {
        return countIfNotLess(c, countToCompare, countToCompare);
    }

    public static int countIfNotGreater(@Nullable Collection c, int countToCompare, int defVal) {
        int count = count(c);
        return count <= countToCompare ? count : defVal;
    }

    public static int countIfNotGreater(@Nullable Collection c, int countToCompare) {
        return countIfNotGreater(c, countToCompare, countToCompare);
    }

    public static <T> void shift(@NonNull List<T> list, int shift) {
        int size = list.size();
        if (shift > 0) {
            if (shift > size) {
                shift = size;
            }
            for (int i = 0; i < shift; i++) {
                list.add(0, null);
            }
            return;
        }
        int shift2 = -shift;
        if (shift2 > size) {
            shift2 = size;
        }
        for (int i2 = 0; i2 < shift2; i2++) {
            list.remove(0);
        }
    }
}
