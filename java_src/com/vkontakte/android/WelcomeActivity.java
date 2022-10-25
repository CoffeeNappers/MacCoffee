package com.vkontakte.android;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.RadioButton;
import android.widget.TextView;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.auth.VKAuthUtils;
/* loaded from: classes2.dex */
public class WelcomeActivity extends Activity implements View.OnClickListener {
    private View alertView;
    int currentSyncOption;
    private boolean hqPhotos;
    private LogoutReceiver logoutReceiver = null;
    boolean syncAll;
    boolean syncEnabled;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        boolean z = true;
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        overridePendingTransition(0, 0);
        getWindow().setBackgroundDrawableResource(R.drawable.transparent);
        setContentView(new View(this));
        this.alertView = View.inflate(new ContextThemeWrapper(this, (int) R.style.BaseStyle), R.layout.welcome, null);
        SharedPreferences prefs = getApplicationContext().getSharedPreferences(null, 0);
        this.syncAll = prefs.getBoolean("sync_all", false);
        this.hqPhotos = prefs.getBoolean("sync_hq_photos", false);
        this.syncEnabled = false;
        AccountManager am = AccountManager.get(VKApplication.context);
        Account[] accounts = am.getAccountsByType(VKAuth.ACCOUNT_TYPE);
        if (accounts.length == 0 && VKAccountManager.getCurrent().isReal()) {
            Account account = new Account(VKAccountManager.getCurrent().getName(), VKAuth.ACCOUNT_TYPE);
            am.addAccountExplicitly(account, null, null);
            accounts = new Account[]{account};
        }
        this.syncEnabled = ContentResolver.getSyncAutomatically(accounts[0], "com.android.contacts");
        ((RadioButton) this.alertView.findViewById(R.id.welcome_sync_opt1)).setChecked(this.syncAll && this.syncEnabled);
        ((RadioButton) this.alertView.findViewById(R.id.welcome_sync_opt2)).setChecked(!this.syncAll && this.syncEnabled);
        RadioButton radioButton = (RadioButton) this.alertView.findViewById(R.id.welcome_sync_opt3);
        if (this.syncAll || this.syncEnabled) {
            z = false;
        }
        radioButton.setChecked(z);
        ((CheckBox) this.alertView.findViewById(R.id.sync_big_pictures)).setChecked(this.hqPhotos);
        ((CheckBox) this.alertView.findViewById(R.id.sync_big_pictures)).setEnabled(this.syncEnabled);
        this.currentSyncOption = VKAuthUtils.getCurrentSyncOption();
        this.alertView.findViewById(R.id.welcome_sync1).setOnClickListener(this);
        this.alertView.findViewById(R.id.welcome_sync2).setOnClickListener(this);
        this.alertView.findViewById(R.id.welcome_sync3).setOnClickListener(this);
        ((CheckBox) this.alertView.findViewById(R.id.sync_big_pictures)).setOnCheckedChangeListener(WelcomeActivity$$Lambda$1.lambdaFactory$(this));
        if (Build.VERSION.SDK_INT < 11) {
            setTextColor(this.alertView);
        }
        new VKAlertDialog.Builder(this).setTitle(R.string.sett_sync).setView(this.alertView).setPositiveButton(R.string.save, WelcomeActivity$$Lambda$2.lambdaFactory$(this)).setNegativeButton(R.string.cancel, WelcomeActivity$$Lambda$3.lambdaFactory$(this)).setOnCancelListener(WelcomeActivity$$Lambda$4.lambdaFactory$(this)).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(CompoundButton compoundButton, boolean b1) {
        this.hqPhotos = b1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(DialogInterface dialog, int which) {
        saveSyncSettings();
        Intent intent = new Intent();
        intent.putExtra("option", this.currentSyncOption);
        setResult(-1, intent);
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$2(DialogInterface dialog, int which) {
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$3(DialogInterface dialog) {
        finish();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.welcome_sync1 /* 2131756454 */:
                setSyncOption(0);
                return;
            case R.id.welcome_sync2 /* 2131756457 */:
                setSyncOption(1);
                return;
            case R.id.welcome_sync3 /* 2131756460 */:
                setSyncOption(2);
                return;
            default:
                return;
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    private void setTextColor(View v) {
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                setTextColor(g.getChildAt(i));
            }
        }
        if (v instanceof TextView) {
            TextView t = (TextView) v;
            t.setTextColor(t.getCurrentTextColor() | ViewCompat.MEASURED_SIZE_MASK);
        }
    }

    private void saveSyncSettings() {
        try {
            AccountManager am = AccountManager.get(VKApplication.context);
            Account[] accounts = am.getAccountsByType(VKAuth.ACCOUNT_TYPE);
            if (accounts.length == 0 && VKAccountManager.getCurrent().isReal()) {
                Account account = new Account(VKAccountManager.getCurrent().getName(), VKAuth.ACCOUNT_TYPE);
                am.addAccountExplicitly(account, null, null);
                accounts = new Account[]{account};
            }
            ContentResolver.setSyncAutomatically(accounts[0], "com.android.contacts", this.syncEnabled);
            SharedPreferences prefs = getApplicationContext().getSharedPreferences(null, 0);
            prefs.edit().putBoolean("sync_all", this.syncAll).putBoolean("sync_hq_photos", this.hqPhotos).apply();
        } catch (Exception x) {
            Log.w("vk", x);
        }
    }

    private void setSyncOption(int o) {
        this.currentSyncOption = o;
        ((RadioButton) this.alertView.findViewById(R.id.welcome_sync_opt1)).setChecked(o == 0);
        ((RadioButton) this.alertView.findViewById(R.id.welcome_sync_opt2)).setChecked(o == 1);
        ((RadioButton) this.alertView.findViewById(R.id.welcome_sync_opt3)).setChecked(o == 2);
        switch (o) {
            case 0:
                this.syncAll = true;
                this.syncEnabled = true;
                break;
            case 1:
                this.syncAll = false;
                this.syncEnabled = true;
                break;
            case 2:
                this.syncEnabled = false;
                this.syncAll = false;
                break;
        }
        this.alertView.findViewById(R.id.sync_big_pictures).setEnabled(this.syncEnabled);
    }
}
