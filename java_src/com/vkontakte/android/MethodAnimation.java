package com.vkontakte.android;

import android.view.animation.Animation;
import android.view.animation.Transformation;
import java.lang.reflect.Method;
/* loaded from: classes2.dex */
public class MethodAnimation extends Animation {
    Method method;
    Object obj;
    Object param;

    public MethodAnimation(Object obj, String methodName, Object addParam) {
        if (addParam == null) {
            try {
                this.obj = obj;
                this.method = obj.getClass().getMethod(methodName, Float.TYPE);
                return;
            } catch (Exception e) {
                return;
            }
        }
        try {
            this.obj = obj;
            this.param = addParam;
            this.method = obj.getClass().getDeclaredMethod(methodName, Float.TYPE, Integer.TYPE);
        } catch (Exception x) {
            Log.w("vk", x);
        }
    }

    @Override // android.view.animation.Animation
    protected void applyTransformation(float interpolatedTime, Transformation t) {
        t.clear();
        try {
            if (this.param == null) {
                this.method.invoke(this.obj, Float.valueOf(interpolatedTime));
            } else {
                this.method.invoke(this.obj, Float.valueOf(interpolatedTime), this.param);
            }
        } catch (Exception e) {
        }
    }
}
