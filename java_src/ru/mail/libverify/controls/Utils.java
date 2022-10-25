package ru.mail.libverify.controls;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
/* loaded from: classes3.dex */
public class Utils {
    public static Handler uiHandler = new Handler(Looper.getMainLooper());

    public static boolean hasSelfPermission(@NonNull Context context, @NonNull String str) {
        try {
            return ContextCompat.checkSelfPermission(context, str) == 0;
        } catch (Throwable th) {
            return true;
        }
    }

    public static void hideKeyboard(View view) {
        if (view != null) {
            ((InputMethodManager) view.getContext().getSystemService("input_method")).hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
    }

    private static boolean safeRequestFocus(View view) {
        if (view != null) {
            try {
                return view.requestFocus();
            } catch (NullPointerException e) {
            }
        }
        return false;
    }

    private static void showKeyboard(View view) {
        showKeyboardDelayed(view, 10);
    }

    public static void showKeyboard(boolean z, View view) {
        if (!z) {
            hideKeyboard(view);
            return;
        }
        safeRequestFocus(view);
        showKeyboardReliable(view);
    }

    private static void showKeyboardDelayed(final View view, int i) {
        if (view != null) {
            uiHandler.postDelayed(new Runnable() { // from class: ru.mail.libverify.controls.Utils.1
                @Override // java.lang.Runnable
                public final void run() {
                    Utils.showKeyboardSync(view);
                }
            }, i);
        }
    }

    private static void showKeyboardReliable(View view) {
        showKeyboardDelayed(view, 100);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void showKeyboardSync(View view) {
        if (view != null) {
            ((InputMethodManager) view.getContext().getSystemService("input_method")).showSoftInput(view, 1);
        }
    }
}
