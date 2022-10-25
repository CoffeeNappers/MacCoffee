package com.fourmob.datetimepicker;

import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.os.Build;
import android.view.View;
import android.view.accessibility.AccessibilityManager;
/* loaded from: classes.dex */
public class Utils {
    public static int getDaysInMonth(int month, int year) {
        switch (month) {
            case 0:
            case 2:
            case 4:
            case 6:
            case 7:
            case 9:
            case 11:
                return 31;
            case 1:
                if (year % 4 == 0) {
                    return 29;
                }
                return 28;
            case 3:
            case 5:
            case 8:
            case 10:
                return 30;
            default:
                throw new IllegalArgumentException("Invalid Month");
        }
    }

    public static ObjectAnimator getPulseAnimator(View view, float animVal1, float animVal2) {
        Keyframe keyframe1 = Keyframe.ofFloat(0.0f, 1.0f);
        Keyframe keyframe2 = Keyframe.ofFloat(0.275f, animVal1);
        Keyframe keyframe3 = Keyframe.ofFloat(0.69f, animVal2);
        Keyframe keyframe4 = Keyframe.ofFloat(1.0f, 1.0f);
        ObjectAnimator animator = ObjectAnimator.ofPropertyValuesHolder(view, PropertyValuesHolder.ofKeyframe("scaleX", keyframe1, keyframe2, keyframe3, keyframe4), PropertyValuesHolder.ofKeyframe("scaleY", keyframe1, keyframe2, keyframe3, keyframe4));
        animator.setDuration(544L);
        return animator;
    }

    public static boolean isJellybeanOrLater() {
        return Build.VERSION.SDK_INT >= 16;
    }

    public static void tryAccessibilityAnnounce(Object obj, Object announcement) {
    }

    public static boolean isTouchExplorationEnabled(AccessibilityManager accessibilityManager) {
        if (Build.VERSION.SDK_INT >= 14) {
            return accessibilityManager.isTouchExplorationEnabled();
        }
        return false;
    }
}
