package com.vk.core.util;

import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import com.vkontakte.android.VKApplication;
/* loaded from: classes2.dex */
public class ToastUtils {
    private static final Handler handler = new Handler(Looper.getMainLooper());

    public static void showToast(int resId) {
        showToast(VKApplication.context.getResources().getString(resId));
    }

    public static void showToast(final String text) {
        handler.post(new Runnable() { // from class: com.vk.core.util.ToastUtils.1
            @Override // java.lang.Runnable
            public void run() {
                Toast.makeText(VKApplication.context, text, 0).show();
            }
        });
    }
}
