package com.vk.stories.view;

import android.support.v4.view.ViewPager;
import android.view.View;
import com.vk.core.util.AnimationUtils;
/* loaded from: classes2.dex */
public class StoryPageTransformer implements ViewPager.PageTransformer {
    private static final float MIN_ALPHA = 0.4f;
    private static final float MIN_SCALE = 0.9f;

    @Override // android.support.v4.view.ViewPager.PageTransformer
    public void transformPage(View view, float position) {
        int pageWidth = view.getWidth();
        if (position < -1.0f) {
            view.setAlpha(0.0f);
        } else if (position <= 0.0f) {
            view.setAlpha(1.0f);
            view.setTranslationX(0.0f);
            view.setScaleX(1.0f);
            view.setScaleY(1.0f);
        } else if (position <= 1.0f) {
            float alphaProgress = 1.0f - position;
            view.setAlpha(AnimationUtils.mix(alphaProgress, (float) MIN_ALPHA, 1.0f));
            view.setTranslationX(pageWidth * (-position));
            float scaleFactor = MIN_SCALE + (0.100000024f * (1.0f - Math.abs(position)));
            view.setScaleX(scaleFactor);
            view.setScaleY(scaleFactor);
        } else {
            view.setAlpha(0.0f);
        }
    }
}
