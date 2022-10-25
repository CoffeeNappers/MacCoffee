package com.vkontakte.android.ui.posts;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.support.v7.widget.PopupMenu;
import android.support.v7.widget.RecyclerView;
import android.view.MenuItem;
import android.view.View;
import android.webkit.WebView;
import android.widget.HorizontalScrollView;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ReportContentActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.adsint.AdsintHideAd;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.utils.AdsUtil;
import com.vkontakte.android.utils.Utils;
import me.grishka.appkit.utils.V;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public abstract class AdBlockPostDisplayItem extends PostDisplayItem {
    static final Drawable dividerDrawable = new Drawable() { // from class: com.vkontakte.android.ui.posts.AdBlockPostDisplayItem.1
        @Override // android.graphics.drawable.Drawable
        public void draw(@Nullable Canvas canvas) {
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int alpha) {
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return 0;
        }

        @Override // android.graphics.drawable.Drawable
        public int getIntrinsicWidth() {
            return V.dp(8.0f);
        }
    };
    public NewsEntry post;

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onItemClicked(ShitAttachment ad, View v) {
        Activity activity = Utils.castToActivity(v.getContext());
        if (activity != null) {
            AdsUtil.onAdsPostClick(activity, ad);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onMenuClicked(ShitAttachment a, View v) {
        PopupMenu pm = new PopupMenu(v.getContext(), v);
        pm.getMenu().add(0, 0, 0, R.string.hide);
        pm.getMenu().add(0, 1, 0, R.string.report_content);
        if (this.post.extra.containsKey("ads_debug")) {
            pm.getMenu().add(0, 2, 0, "ads_debug");
        }
        pm.setOnMenuItemClickListener(AdBlockPostDisplayItem$$Lambda$1.lambdaFactory$(this, v, a));
        pm.show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onMenuClicked$0(View v, ShitAttachment a, MenuItem item) {
        switch (item.getItemId()) {
            case 0:
                hide(v.getContext(), a);
                return true;
            case 1:
                report(v.getContext(), a);
                return true;
            case 2:
                showDebug(v.getContext());
                return true;
            default:
                return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AdBlockPostDisplayItem(NewsEntry _post) {
        super(_post);
        this.post = _post;
    }

    protected void hide(final Context context, final ShitAttachment a) {
        new AdsintHideAd(a.data, AdsintHideAd.ObjectType.ad).setCallback(new ResultlessCallback() { // from class: com.vkontakte.android.ui.posts.AdBlockPostDisplayItem.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                AdBlockPostDisplayItem.this.doHide(context, a);
            }
        }).wrapProgress(context).exec(context);
    }

    protected void report(Context context, ShitAttachment a) {
        Intent intent = new Intent(context, ReportContentActivity.class);
        intent.putExtra(ReportContentActivity.EXTRA_AD_ATTACHMENT, a);
        intent.putExtra(ReportContentActivity.EXTRA_AD_NEWS_ENTRY, this.post);
        context.startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doHide(Context context, ShitAttachment a) {
        if (this.post.attachments.size() == 1) {
            context.sendBroadcast(new Intent("com.vkontakte.android.POST_DELETED").putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, this.post.postID).putExtra("owner_id", this.post.ownerID), "com.vkontakte.android.permission.ACCESS_DATA");
            return;
        }
        NewsEntry newPost = new NewsEntry(this.post);
        newPost.attachments.remove(a);
        context.sendBroadcast(new Intent(Posts.ACTION_POST_REPLACED_BROADCAST).putExtra("entry", newPost), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    private void showDebug(Context context) {
        WebView wv = new WebView(context);
        wv.loadData(Uri.encode(this.post.extra.getString("ads_debug")), "text/html;charset=utf-8", null);
        new VKAlertDialog.Builder(context).setTitle("Ads Debug").setView(wv).setPositiveButton(R.string.close, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void cleanScroll(HorizontalScrollView horizontalScrollView) {
        if (horizontalScrollView != null) {
            horizontalScrollView.scrollTo(0, 0);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void cleanScroll(RecyclerView recyclerView) {
        if (recyclerView != null) {
            recyclerView.scrollToPosition(0);
        }
    }
}
