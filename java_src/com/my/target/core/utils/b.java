package com.my.target.core.utils;

import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
/* compiled from: AnimationUtils.java */
/* loaded from: classes2.dex */
public final class b {
    public static Animation a() {
        TranslateAnimation translateAnimation = new TranslateAnimation(2, 0.0f, 2, 0.0f, 2, 1.0f, 2, 0.0f);
        translateAnimation.setDuration(400L);
        translateAnimation.setInterpolator(new AccelerateDecelerateInterpolator());
        return translateAnimation;
    }

    public static Animation b() {
        TranslateAnimation translateAnimation = new TranslateAnimation(2, 0.0f, 2, 0.0f, 2, 0.0f, 2, -1.0f);
        translateAnimation.setDuration(400L);
        translateAnimation.setInterpolator(new AccelerateDecelerateInterpolator());
        return translateAnimation;
    }
}
