package com.vk.core.util;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Point;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.Display;
import android.view.View;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import com.vk.attachpicker.Picker;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes2.dex */
public class KeyboardUtils {
    private static Handler handler = new Handler(Looper.getMainLooper());

    public static void setSoftInputModeAdjustResize(Window window) {
        if (window != null) {
            window.setSoftInputMode(16);
        }
    }

    public static void setSoftInputModeAdjustPan(Window window) {
        if (window != null) {
            window.setSoftInputMode(32);
        }
    }

    public static void setSoftInputModeNothing(Activity activity) {
        if (activity != null) {
            if (Build.VERSION.SDK_INT >= 11) {
                activity.getWindow().setSoftInputMode(48);
            } else {
                activity.getWindow().setSoftInputMode(0);
            }
        }
    }

    public static void showKeyboard(final View view) {
        Picker.runDelayed(new Runnable() { // from class: com.vk.core.util.KeyboardUtils.1
            @Override // java.lang.Runnable
            public void run() {
                view.requestFocus();
                InputMethodManager imm = (InputMethodManager) view.getContext().getSystemService("input_method");
                imm.showSoftInput(view, 1);
            }
        }, 10L);
    }

    public static void hideKeyboard(Context context) {
        if (context != null && (context instanceof Activity)) {
            final Activity activity = Utils.castToActivity(context);
            handler.postDelayed(new Runnable() { // from class: com.vk.core.util.KeyboardUtils.2
                @Override // java.lang.Runnable
                public void run() {
                    InputMethodManager inputManager = (InputMethodManager) activity.getSystemService("input_method");
                    inputManager.hideSoftInputFromWindow(activity.getWindow().getDecorView().getWindowToken(), 0);
                }
            }, 10L);
        }
    }

    public static void copyTextToClipboard(CharSequence text) {
        if (!TextUtils.isEmpty(text)) {
            ClipboardManager clipboard = (ClipboardManager) Picker.getContext().getSystemService("clipboard");
            ClipData clip = ClipData.newPlainText(text, text);
            clipboard.setPrimaryClip(clip);
        }
    }

    private static int getScreenOrientation(Window window) {
        Display getOrient = window.getWindowManager().getDefaultDisplay();
        Point p = new Point();
        getOrient.getSize(p);
        if (p.x < p.y) {
            return 1;
        }
        return 2;
    }
}
