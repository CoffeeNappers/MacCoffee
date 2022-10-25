package com.vkontakte.android;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;
import com.vk.webapp.ReportAppInputData;
import com.vk.webapp.VKUIWebContainerFragment;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.execute.AppsReport;
import com.vkontakte.android.auth.VKAccountManager;
/* loaded from: classes2.dex */
public class ReportAppsActivity extends Activity {
    private static final int SPA_REQUEST_CODE = 1234;
    private LogoutReceiver logoutReceiver = null;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        if (VKAccountManager.getCurrent().useWebAppForReportContent) {
            int ownerId = getIntent().getIntExtra("ownerID", 0);
            int appId = getIntent().getIntExtra("appID", 0);
            new VKUIWebContainerFragment.Builder(ReportAppInputData.getSPAUriForApp(ownerId, appId)).forResult(this, SPA_REQUEST_CODE);
            return;
        }
        new VKAlertDialog.Builder(this).setTitle(R.string.report_content).setItems(R.array.app_report_types, ReportAppsActivity$$Lambda$1.lambdaFactory$(this)).setOnCancelListener(ReportAppsActivity$$Lambda$2.lambdaFactory$(this)).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(DialogInterface dialog, int which) {
        sendReport(which + 1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(DialogInterface dialog) {
        finish();
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != SPA_REQUEST_CODE || resultCode == -1) {
        }
        finish();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    private void sendReport(int type) {
        new AppsReport(getIntent().getIntExtra("ownerID", 0), getIntent().getIntExtra("appID", 0), type).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.ReportAppsActivity.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Toast.makeText(ReportAppsActivity.this, (int) R.string.report_sent, 0).show();
                ReportAppsActivity.this.setResult(-1, ReportAppsActivity.this.getIntent());
                ReportAppsActivity.this.finish();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                super.fail(err);
                ReportAppsActivity.this.finish();
            }
        }).wrapProgress(this).exec((Context) this);
    }
}
