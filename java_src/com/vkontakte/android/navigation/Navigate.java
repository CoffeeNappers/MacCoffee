package com.vkontakte.android.navigation;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
/* loaded from: classes3.dex */
public final class Navigate {
    public static void to(@NonNull Class<? extends Fragment> clazz, @Nullable Bundle args, @NonNull Context act) {
        new Navigator(clazz, args).go(act);
    }

    public static void to(@NonNull Class<? extends Fragment> clazz, @Nullable Bundle args, @NonNull Activity act, boolean overlay, int inAnim, int outAnim) {
        new Navigator(clazz, args).go(act, overlay, inAnim, outAnim);
    }

    public static void forResult(@NonNull Class<? extends Fragment> clazz, @Nullable Bundle args, @NonNull Activity act, int requestCode) {
        new Navigator(clazz, args).forResult(act, requestCode);
    }
}
