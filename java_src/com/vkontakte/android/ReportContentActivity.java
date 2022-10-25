package com.vkontakte.android;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vk.webapp.ReportAppInputData;
import com.vk.webapp.VKUIWebContainerFragment;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.adsint.AdsintReportAd;
import com.vkontakte.android.api.execute.ContentReport;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes2.dex */
public class ReportContentActivity extends Activity {
    public static final String EXTRA_AD_ATTACHMENT = "adAttachment";
    public static final String EXTRA_AD_NEWS_ENTRY = "newsEntry";
    private static final int SPA_REQUEST_CODE = 1234;
    private static final int[] typeMap = {0, 6, 5, 4, 1, 2, 8};
    ShitAttachment adAttachment;
    NewsEntry newsEntry;
    private LogoutReceiver logoutReceiver = null;
    private boolean reportAd = false;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        if (getIntent().hasExtra(EXTRA_AD_ATTACHMENT)) {
            this.adAttachment = (ShitAttachment) getIntent().getParcelableExtra(EXTRA_AD_ATTACHMENT);
            this.newsEntry = (NewsEntry) getIntent().getParcelableExtra(EXTRA_AD_NEWS_ENTRY);
            this.reportAd = true;
        }
        if (VKAccountManager.getCurrent().useWebAppForReportContent) {
            if (this.reportAd) {
                new VKUIWebContainerFragment.Builder(ReportAppInputData.getSPAUriForAd(this.adAttachment.data, "")).forResult(this, SPA_REQUEST_CODE);
                return;
            }
            String type = getIntent().getStringExtra(ServerKeys.TYPE);
            String type2 = mapTypeForSPA(type);
            int ownerId = getIntent().getIntExtra("ownerID", 0);
            int itemId = getIntent().getIntExtra("itemID", 0);
            String ref = getIntent().getStringExtra("refer");
            new VKUIWebContainerFragment.Builder(ReportAppInputData.getSPAUriForMainContentTypes(type2, ownerId, itemId, ref)).forResult(this, SPA_REQUEST_CODE);
        } else if (this.reportAd) {
            new VKAlertDialog.Builder(this).setItems(R.array.ad_report_reasons, ReportContentActivity$$Lambda$1.lambdaFactory$(this)).setTitle(R.string.report_content).setOnCancelListener(ReportContentActivity$$Lambda$2.lambdaFactory$(this)).show();
        } else {
            new VKAlertDialog.Builder(this).setTitle(R.string.report_content).setItems(R.array.report_types, ReportContentActivity$$Lambda$3.lambdaFactory$(this)).setOnCancelListener(ReportContentActivity$$Lambda$4.lambdaFactory$(this)).show();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(DialogInterface dialog, int which) {
        new AdsintReportAd(this.adAttachment.data, getResources().getStringArray(R.array.ad_report_reasons_api)[which]).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.ReportContentActivity.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                ReportContentActivity.this.doHideAd();
                ReportContentActivity.this.finish();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                ReportContentActivity.this.finish();
            }
        }).wrapProgress(this).exec((Context) this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(DialogInterface dialog) {
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$2(DialogInterface dialog, int which) {
        sendReport(typeMap[which]);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$3(DialogInterface dialog) {
        finish();
    }

    private String mapTypeForSPA(String type) {
        if (type.equals(ArgKeys.POST)) {
            return ReportAppInputData.REPORT_TYPE_WALL;
        }
        if (type.equals("post_comment")) {
            return ReportAppInputData.REPORT_TYPE_WALL_COMMENT;
        }
        return type;
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == SPA_REQUEST_CODE && resultCode == -1 && this.reportAd) {
            doHideAd();
        }
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doHideAd() {
        if (this.newsEntry.attachments.size() == 1) {
            VKApplication.context.sendBroadcast(new Intent("com.vkontakte.android.POST_DELETED").putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, this.newsEntry.postID).putExtra("owner_id", this.newsEntry.ownerID), "com.vkontakte.android.permission.ACCESS_DATA");
            return;
        }
        NewsEntry newPost = new NewsEntry(this.newsEntry);
        newPost.attachments.remove(this.adAttachment);
        VKApplication.context.sendBroadcast(new Intent(Posts.ACTION_POST_REPLACED_BROADCAST).putExtra("entry", newPost), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    private void sendReport(int type) {
        PostInteract postInteract;
        if (getIntent().hasExtra("postInteract") && (postInteract = (PostInteract) getIntent().getParcelableExtra("postInteract")) != null) {
            postInteract.commit(PostInteract.Type.report);
        }
        new ContentReport(getIntent().getIntExtra("ownerID", 0), getIntent().getIntExtra("itemID", 0), getIntent().getStringExtra(ServerKeys.TYPE), getIntent().getStringExtra("refer"), type, getIntent().getStringExtra(AttachmentInfo.DATA_TRACK_CODE)).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.ReportContentActivity.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Toast.makeText(ReportContentActivity.this, (int) R.string.report_sent, 0).show();
                ReportContentActivity.this.setResult(-1, ReportContentActivity.this.getIntent());
                ReportContentActivity.this.finish();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                super.fail(err);
                ReportContentActivity.this.finish();
            }
        }).wrapProgress(this).exec((Context) this);
    }
}
