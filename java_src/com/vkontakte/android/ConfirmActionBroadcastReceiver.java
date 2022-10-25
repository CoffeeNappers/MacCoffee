package com.vkontakte.android;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountValidateAction;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.utils.XSRFTokenUtil;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
/* loaded from: classes2.dex */
public class ConfirmActionBroadcastReceiver extends BroadcastReceiver {
    public static final String ACTION_CONFIRM = "com.vkontatke.android.ACTION_CONFIRM_ACTION";
    public static final String ACTION_DECLINE = "com.vkontatke.android.ACTION_DECLINE_ACTION";
    public static final String ACTION_OPEN_BOX = "com.vkontatke.android.ACTION_CONFIRM_OPEN_BOX";
    public static final String ACTION_OPEN_NOTIFICATION = "com.vkontatke.android.ACTION_CONFIRM_OPEN_NOTIFICATION";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (XSRFTokenUtil.verifyToken(intent.getStringExtra(AuthCheckFragment.KEY_TOKEN), intent.getStringExtra(SettingsJsonConstants.ICON_HASH_KEY))) {
            if (ACTION_CONFIRM.equals(intent.getAction())) {
                sendRequest(true, intent.getStringExtra(SettingsJsonConstants.ICON_HASH_KEY), 0);
                if (intent.hasExtra("notification_id")) {
                    ((NotificationManager) context.getSystemService("notification")).cancel(intent.getIntExtra("notification_id", 0));
                }
            } else if (ACTION_DECLINE.equals(intent.getAction())) {
                sendRequest(false, intent.getStringExtra(SettingsJsonConstants.ICON_HASH_KEY), 0);
                if (intent.hasExtra("notification_id")) {
                    ((NotificationManager) context.getSystemService("notification")).cancel(intent.getIntExtra("notification_id", 0));
                }
            } else if (ACTION_OPEN_BOX.equals(intent.getAction())) {
                Intent i = new Intent(context, ConfirmActionActivity.class);
                i.addFlags(1484783616);
                i.putExtra("confirm_text", intent.getStringExtra("confirm_text"));
                i.putExtra(SettingsJsonConstants.ICON_HASH_KEY, intent.getStringExtra(SettingsJsonConstants.ICON_HASH_KEY));
                i.putExtra("notification_id", intent.getIntExtra("notification_id", 0));
                context.startActivity(i);
            } else if (ACTION_OPEN_NOTIFICATION.equals(intent.getAction())) {
                Intent i2 = new Intent(context, NotificationActivity.class);
                i2.addFlags(1484783616);
                i2.putExtra("message", intent.getStringExtra("text"));
                i2.putExtra("title", intent.getStringExtra("title"));
                i2.putExtra(ServerKeys.BUTTON, intent.getStringExtra(ServerKeys.BUTTON));
                context.startActivity(i2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendRequest(final boolean confirm, final String hash, final int retry) {
        new AccountValidateAction(hash, confirm).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.ConfirmActionBroadcastReceiver.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                int errorCode = error.getCodeValue();
                if ((errorCode < 0 || errorCode == 10) && retry < 5) {
                    try {
                        Thread.sleep(500L);
                    } catch (Exception e) {
                    }
                    ConfirmActionBroadcastReceiver.this.sendRequest(confirm, hash, retry + 1);
                }
            }
        }).exec();
    }
}
