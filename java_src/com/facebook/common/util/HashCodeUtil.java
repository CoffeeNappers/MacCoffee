package com.facebook.common.util;

import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class HashCodeUtil {
    private static final int X = 31;

    public static int hashCode(@Nullable Object o1) {
        return hashCode(o1 == null ? 0 : o1.hashCode());
    }

    public static int hashCode(@Nullable Object o1, @Nullable Object o2) {
        int i = 0;
        int hashCode = o1 == null ? 0 : o1.hashCode();
        if (o2 != null) {
            i = o2.hashCode();
        }
        return hashCode(hashCode, i);
    }

    public static int hashCode(@Nullable Object o1, @Nullable Object o2, @Nullable Object o3) {
        int i = 0;
        int hashCode = o1 == null ? 0 : o1.hashCode();
        int hashCode2 = o2 == null ? 0 : o2.hashCode();
        if (o3 != null) {
            i = o3.hashCode();
        }
        return hashCode(hashCode, hashCode2, i);
    }

    public static int hashCode(@Nullable Object o1, @Nullable Object o2, @Nullable Object o3, @Nullable Object o4) {
        int i = 0;
        int hashCode = o1 == null ? 0 : o1.hashCode();
        int hashCode2 = o2 == null ? 0 : o2.hashCode();
        int hashCode3 = o3 == null ? 0 : o3.hashCode();
        if (o4 != null) {
            i = o4.hashCode();
        }
        return hashCode(hashCode, hashCode2, hashCode3, i);
    }

    public static int hashCode(@Nullable Object o1, @Nullable Object o2, @Nullable Object o3, @Nullable Object o4, @Nullable Object o5) {
        int i = 0;
        int hashCode = o1 == null ? 0 : o1.hashCode();
        int hashCode2 = o2 == null ? 0 : o2.hashCode();
        int hashCode3 = o3 == null ? 0 : o3.hashCode();
        int hashCode4 = o4 == null ? 0 : o4.hashCode();
        if (o5 != null) {
            i = o5.hashCode();
        }
        return hashCode(hashCode, hashCode2, hashCode3, hashCode4, i);
    }

    public static int hashCode(@Nullable Object o1, @Nullable Object o2, @Nullable Object o3, @Nullable Object o4, @Nullable Object o5, @Nullable Object o6) {
        int i = 0;
        int hashCode = o1 == null ? 0 : o1.hashCode();
        int hashCode2 = o2 == null ? 0 : o2.hashCode();
        int hashCode3 = o3 == null ? 0 : o3.hashCode();
        int hashCode4 = o4 == null ? 0 : o4.hashCode();
        int hashCode5 = o5 == null ? 0 : o5.hashCode();
        if (o6 != null) {
            i = o6.hashCode();
        }
        return hashCode(hashCode, hashCode2, hashCode3, hashCode4, hashCode5, i);
    }

    public static int hashCode(int i1) {
        int acc = i1 + 31;
        return acc;
    }

    public static int hashCode(int i1, int i2) {
        int acc = i1 + 31;
        return (acc * 31) + i2;
    }

    public static int hashCode(int i1, int i2, int i3) {
        int acc = i1 + 31;
        return (((acc * 31) + i2) * 31) + i3;
    }

    public static int hashCode(int i1, int i2, int i3, int i4) {
        int acc = i1 + 31;
        return (((((acc * 31) + i2) * 31) + i3) * 31) + i4;
    }

    public static int hashCode(int i1, int i2, int i3, int i4, int i5) {
        int acc = i1 + 31;
        return (((((((acc * 31) + i2) * 31) + i3) * 31) + i4) * 31) + i5;
    }

    public static int hashCode(int i1, int i2, int i3, int i4, int i5, int i6) {
        int acc = i1 + 31;
        return (((((((((acc * 31) + i2) * 31) + i3) * 31) + i4) * 31) + i5) * 31) + i6;
    }
}
