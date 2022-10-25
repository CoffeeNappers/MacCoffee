package com.vk.attachpicker.widget;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
/* loaded from: classes2.dex */
public class LoadingDialog {
    public static ProgressDialog getInstance(Context context, Integer messageId) {
        return getInstance(context, messageId, null);
    }

    public static ProgressDialog getInstance(Context context, Integer messageId, Integer titleId) {
        ProgressDialog dialog = new ProgressDialog(context);
        if (messageId != null) {
            dialog.setMessage(context.getString(messageId.intValue()));
        }
        if (titleId != null) {
            dialog.setTitle(context.getString(titleId.intValue()));
        }
        dialog.setIndeterminate(true);
        dialog.setCancelable(true);
        return dialog;
    }

    public static void dismissLoadingDialog(Dialog loadingDialog) {
        if (loadingDialog != null && loadingDialog.isShowing()) {
            try {
                loadingDialog.dismiss();
            } catch (IllegalArgumentException e) {
            }
        }
    }
}
