package com.vk.sharing.action;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
@Retention(RetentionPolicy.SOURCE)
/* loaded from: classes.dex */
public @interface Action {
    public static final int COPY_LINK = 3;
    public static final int GROUP_POST = 2;
    public static final int SYSTEM_SHARING = 4;
    public static final int WALL_POST = 1;
}
