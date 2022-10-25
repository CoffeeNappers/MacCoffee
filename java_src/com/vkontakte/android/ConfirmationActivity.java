package com.vkontakte.android;

import android.content.DialogInterface;
import android.os.Bundle;
import com.vkontakte.android.VKAlertDialog;
/* loaded from: classes2.dex */
public class ConfirmationActivity extends VKActivity {
    public static boolean ready;
    public static boolean result;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        new VKAlertDialog.Builder(this).setTitle(R.string.confirm).setMessage(getIntent().getStringExtra("confirm_text")).setPositiveButton(R.string.reg_continue, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.ConfirmationActivity.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ConfirmationActivity.result = true;
                ConfirmationActivity.ready = true;
                ConfirmationActivity.this.finish();
            }
        }).setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.ConfirmationActivity.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ConfirmationActivity.result = false;
                ConfirmationActivity.ready = true;
                ConfirmationActivity.this.finish();
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.vkontakte.android.ConfirmationActivity.1
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialogInterface) {
                ConfirmationActivity.result = false;
                ConfirmationActivity.ready = true;
                ConfirmationActivity.this.finish();
            }
        }).show();
    }
}
