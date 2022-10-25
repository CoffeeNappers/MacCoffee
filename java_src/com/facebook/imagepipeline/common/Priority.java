package com.facebook.imagepipeline.common;

import javax.annotation.Nullable;
/* loaded from: classes.dex */
public enum Priority {
    LOW,
    MEDIUM,
    HIGH;

    public static Priority getHigherPriority(@Nullable Priority priority1, @Nullable Priority priority2) {
        if (priority1 == null) {
            return priority2;
        }
        return (priority2 != null && priority1.ordinal() <= priority2.ordinal()) ? priority2 : priority1;
    }
}
