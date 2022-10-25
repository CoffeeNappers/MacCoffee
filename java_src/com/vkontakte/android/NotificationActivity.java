package com.vkontakte.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.Html;
import android.text.TextUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
/* loaded from: classes2.dex */
public class NotificationActivity extends Activity {
    public static final String USER_NOTIFICATION = "user_notification";
    private LogoutReceiver logoutReceiver = null;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        String title;
        String message;
        String link;
        String button;
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        Intent intent = getIntent();
        UserNotification userNotification = (UserNotification) intent.getParcelableExtra(USER_NOTIFICATION);
        if (userNotification == null) {
            title = intent.hasExtra("title") ? intent.getStringExtra("title") : getResources().getString(R.string.notification);
            message = intent.getStringExtra("message");
            link = intent.hasExtra("link") ? intent.getStringExtra("link") : null;
            button = intent.hasExtra(ServerKeys.BUTTON) ? intent.getStringExtra(ServerKeys.BUTTON) : null;
        } else {
            title = userNotification.title;
            message = userNotification.message;
            link = userNotification.buttonUrl;
            button = userNotification.buttonText;
        }
        AlertDialog.Builder alert = new VKAlertDialog.Builder(this).setTitle(title).setMessage(Html.fromHtml(message)).setOnCancelListener(NotificationActivity$$Lambda$1.lambdaFactory$(this, userNotification));
        if (!TextUtils.isEmpty(link)) {
            if (TextUtils.isEmpty(button)) {
                button = getString(R.string.view);
            }
            alert.setPositiveButton(button, NotificationActivity$$Lambda$2.lambdaFactory$(this, link, userNotification)).setNegativeButton(R.string.close, NotificationActivity$$Lambda$3.lambdaFactory$(this, userNotification));
        } else {
            if (TextUtils.isEmpty(button)) {
                button = getString(R.string.close);
            }
            alert.setPositiveButton(button, NotificationActivity$$Lambda$4.lambdaFactory$(this, userNotification));
        }
        alert.show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(UserNotification userNotification, DialogInterface dialog) {
        if (userNotification != null) {
            userNotification.forceClose(this);
        }
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(String link, UserNotification userNotification, DialogInterface dialog, int which) {
        startActivity(new Intent("android.intent.action.VIEW", Uri.parse(link)));
        if (userNotification != null) {
            userNotification.forceAction(this);
        }
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$2(UserNotification userNotification, DialogInterface dialog, int which) {
        if (userNotification != null) {
            userNotification.forceClose(this);
        }
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$3(UserNotification userNotification, DialogInterface dialog, int which) {
        if (userNotification != null) {
            userNotification.forceAction(this);
        }
        finish();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }
}
