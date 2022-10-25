package com.vkontakte.android.ui;

import android.content.res.TypedArray;
import android.util.Log;
import android.view.View;
import java.lang.reflect.Method;
/* loaded from: classes3.dex */
public class UIHacks {
    private static Method sInitializeScrollbars;

    private UIHacks() {
    }

    public static void enableScrollbars(View view) {
        try {
            TypedArray a = view.getContext().getTheme().obtainStyledAttributes(new int[0]);
            if (sInitializeScrollbars == null) {
                sInitializeScrollbars = View.class.getDeclaredMethod("initializeScrollbars", TypedArray.class);
                sInitializeScrollbars.setAccessible(true);
            }
            sInitializeScrollbars.invoke(view, a);
            a.recycle();
        } catch (Throwable e) {
            Log.e("UIHacks", "enableScrollbars(View)", e);
        }
    }
}
