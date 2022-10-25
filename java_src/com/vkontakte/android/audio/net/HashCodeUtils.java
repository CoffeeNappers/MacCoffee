package com.vkontakte.android.audio.net;

import java.util.Collection;
/* loaded from: classes2.dex */
public final class HashCodeUtils {
    private HashCodeUtils() {
    }

    public static int add(int hashCode, boolean value) {
        return (value ? 0 : 1) + (hashCode * 37);
    }

    public static int add(int hashCode, int value) {
        return (hashCode * 37) + value;
    }

    public static int add(int hashCode, long value) {
        return add(hashCode, (int) ((value >>> 32) ^ value));
    }

    public static int add(int hashCode, byte value) {
        return add(hashCode, (int) value);
    }

    public static int add(int hashCode, char value) {
        return add(hashCode, (int) value);
    }

    public static int add(int hashCode, short value) {
        return add(hashCode, (int) value);
    }

    public static int add(int hashCode, float value) {
        return add(hashCode, Float.floatToIntBits(value));
    }

    public static int add(int hashCode, double value) {
        return add(hashCode, Double.doubleToLongBits(value));
    }

    public static int add(int hashCode, Object o) {
        return add(hashCode, o == null ? 0 : o.hashCode());
    }

    public static int add(int hashCode, Collection<?> collection) {
        if (collection == null) {
            return add(hashCode, 0);
        }
        for (Object object : collection) {
            hashCode = add(hashCode, object);
        }
        return hashCode;
    }
}
