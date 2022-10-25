package com.vkontakte.android.ui;

import android.support.v4.view.ViewPager;
import android.view.View;
/* loaded from: classes3.dex */
public class DepthPageTransformer implements ViewPager.PageTransformer {
    private static float MIN_SCALE = 0.75f;

    @Override // android.support.v4.view.ViewPager.PageTransformer
    public void transformPage(View view, float position) {
        int pageWidth = view.getWidth();
        if (position < -1.0f) {
            view.setAlpha(1.0f);
        } else if (position <= 0.0f) {
            view.setAlpha(1.0f);
            view.setTranslationX(0.0f);
            view.setScaleX(1.0f);
            view.setScaleY(1.0f);
        } else if (position <= 1.0f) {
            view.setAlpha(1.0f - position);
            view.setTranslationX(pageWidth * (-position));
            float scaleFactor = MIN_SCALE + ((1.0f - MIN_SCALE) * (1.0f - Math.abs(position)));
            view.setScaleX(scaleFactor);
            view.setScaleY(scaleFactor);
        } else {
            view.setAlpha(0.0f);
        }
    }
}
