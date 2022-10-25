package com.vkontakte.android.functions;

import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes3.dex */
public class Functions {
    private static final Handler sHandler = new Handler(Looper.getMainLooper());

    private Functions() {
    }

    @Nullable
    public static <K, V> Map<K, V> map(@Nullable Collection<V> collection, @NonNull Predicate<V> filter, @NonNull F1<K, V> projection) {
        Map<K, V> result = null;
        if (collection != null) {
            for (V entry : collection) {
                if (filter.f(entry)) {
                    if (result == null) {
                        result = new HashMap<>();
                    }
                    result.put(projection.f(entry), entry);
                }
            }
        }
        return result;
    }

    @Nullable
    public static <K, V> Map<K, V> map(@Nullable Collection<V> collection, @NonNull F1<K, V> projection) {
        Map<K, V> result = null;
        if (collection != null) {
            result = new HashMap<>(collection.size());
            for (V entry : collection) {
                result.put(projection.f(entry), entry);
            }
        }
        return result;
    }

    public static <From, To> List<To> project(@Nullable Collection<From> collection, @NonNull F1<To, From> projection) {
        if (collection != null) {
            List<To> result = new ArrayList<>(collection.size());
            for (From from : collection) {
                result.add(projection.f(from));
            }
            return result;
        }
        return null;
    }

    public static <From, To> List<To> project(@Nullable List<From> collection, @NonNull F1<To, From> projection) {
        if (collection != null) {
            List<To> result = new ArrayList<>(collection.size());
            for (int i = 0; i < collection.size(); i++) {
                result.add(projection.f(collection.get(i)));
            }
            return result;
        }
        return null;
    }

    public static <T> void addAll(List<T> target, List<T> source, Predicate<T> condition) {
        for (int i = 0; i < source.size(); i++) {
            T item = source.get(i);
            if (condition.f(item)) {
                target.add(item);
            }
        }
    }

    public static void post(@NonNull Runnable what) {
        sHandler.post(what);
    }

    public static void postDelayed(@NonNull Runnable what, long when) {
        if (when > 0) {
            sHandler.postDelayed(what, when);
        } else {
            sHandler.post(what);
        }
    }

    public static boolean contains(int[] array, int value) {
        for (int i : array) {
            if (i == value) {
                return true;
            }
        }
        return false;
    }

    public static <Arg> Predicate<Arg> combineAnd(@NonNull Predicate<Arg> p1, @NonNull Predicate<Arg> p2) {
        return Functions$$Lambda$1.lambdaFactory$(p1, p2);
    }

    public static /* synthetic */ boolean lambda$combineAnd$0(@NonNull Predicate p1, @NonNull Predicate p2, Object arg) {
        return p1.f(arg) && p2.f(arg);
    }
}
