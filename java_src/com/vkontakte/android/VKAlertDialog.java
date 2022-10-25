package com.vkontakte.android;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Build;
import com.vkontakte.android.utils.L;
/* loaded from: classes2.dex */
public class VKAlertDialog extends AlertDialog {
    public VKAlertDialog(Context context) {
        super(context);
    }

    public VKAlertDialog(Context context, int theme) {
        super(context, theme);
    }

    public VKAlertDialog(Context context, boolean cancelable, DialogInterface.OnCancelListener cancelListener) {
        super(context, cancelable, cancelListener);
    }

    /* loaded from: classes2.dex */
    public static class Builder extends AlertDialog.Builder {
        boolean isCancelable;

        public Builder(Context ctx) {
            super(ctx);
            this.isCancelable = true;
            init(ctx);
        }

        public Builder(Context ctx, int theme) {
            super(ctx, theme);
            this.isCancelable = true;
            init(ctx);
        }

        private void init(Context ctx) {
        }

        @Override // android.app.AlertDialog.Builder
        public AlertDialog.Builder setCancelable(boolean c) {
            this.isCancelable = c;
            return super.setCancelable(c);
        }

        @Override // android.app.AlertDialog.Builder
        public AlertDialog show() {
            try {
                AlertDialog ad = super.show();
                if (this.isCancelable) {
                    ad.setCanceledOnTouchOutside(true);
                }
                if (Build.VERSION.SDK_INT < 21) {
                    ad.getWindow().setBackgroundDrawableResource(R.drawable.transparent);
                    return ad;
                }
                return ad;
            } catch (Exception e) {
                L.e("Open alert dialog failure", e.getMessage());
                return null;
            }
        }

        @Override // android.app.AlertDialog.Builder
        public AlertDialog create() {
            AlertDialog ad = super.create();
            if (this.isCancelable) {
                ad.setCanceledOnTouchOutside(true);
            }
            if (Build.VERSION.SDK_INT < 21) {
                ad.getWindow().setBackgroundDrawableResource(R.drawable.transparent);
            }
            return ad;
        }
    }
}
