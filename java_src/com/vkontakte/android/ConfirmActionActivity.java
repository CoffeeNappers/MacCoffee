package com.vkontakte.android;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.utils.XSRFTokenUtil;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
/* loaded from: classes2.dex */
public class ConfirmActionActivity extends VKActivity {
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        String msg = getIntent().getStringExtra("confirm_text");
        getIntent().getIntExtra("notification_id", 0);
        new VKAlertDialog.Builder(this).setTitle(R.string.confirm_action_title).setMessage(msg).setPositiveButton(R.string.signup_confirm, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.ConfirmActionActivity.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ConfirmActionActivity.this.confirmAction(true);
                ConfirmActionActivity.this.finish();
            }
        }).setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.ConfirmActionActivity.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ConfirmActionActivity.this.confirmAction(false);
                ConfirmActionActivity.this.finish();
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.vkontakte.android.ConfirmActionActivity.1
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialogInterface) {
                ConfirmActionActivity.this.finish();
            }
        }).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void confirmAction(boolean confirm) {
        Intent intent = new Intent(this, ConfirmActionBroadcastReceiver.class);
        intent.setAction(confirm ? ConfirmActionBroadcastReceiver.ACTION_CONFIRM : ConfirmActionBroadcastReceiver.ACTION_DECLINE);
        intent.putExtra(SettingsJsonConstants.ICON_HASH_KEY, getIntent().getStringExtra(SettingsJsonConstants.ICON_HASH_KEY));
        intent.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(getIntent().getStringExtra(SettingsJsonConstants.ICON_HASH_KEY)));
        sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }
}
