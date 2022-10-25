package com.vkontakte.android.activities;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import com.facebook.common.util.UriUtil;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoGetById;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.CircularProgressBar;
import me.grishka.appkit.utils.V;
import me.zhanghai.android.materialprogressbar.MaterialProgressBar;
/* loaded from: classes2.dex */
public class VideoEmbedPlayerActivity extends VKActivity {
    boolean canShowProgress = true;
    FrameLayout content;
    VideoFile file;
    NewsEntry post;
    CircularProgressBar progress;
    String referrer;
    WebView webView;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.file = (VideoFile) getIntent().getParcelableExtra(UriUtil.LOCAL_FILE_SCHEME);
        this.post = this.file.convertToPost();
        this.referrer = getIntent().getStringExtra(ArgKeys.REFERRER);
        setContentView(R.layout.embed_video_player);
        this.webView = (WebView) findViewById(R.id.video_display);
        this.progress = (CircularProgressBar) findViewById(R.id.progress);
        this.content = (FrameLayout) findViewById(R.id.video_content_wrap);
        this.webView.setPadding(0, 0, 0, 0);
        this.webView.getSettings().setJavaScriptEnabled(true);
        this.webView.getSettings().setDomStorageEnabled(true);
        this.webView.setBackgroundColor(0);
        this.webView.setVerticalScrollBarEnabled(false);
        if (!TextUtils.isEmpty(this.file.urlEmbed)) {
            startLoading();
            return;
        }
        this.progress.setVisibility(0);
        new VideoGetById(this.file.oid, this.file.vid, this.file.accessKey).setCallback(new SimpleCallback<VideoFile>(this) { // from class: com.vkontakte.android.activities.VideoEmbedPlayerActivity.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VideoFile result) {
                VideoEmbedPlayerActivity.this.file = result;
                VideoEmbedPlayerActivity.this.startLoading();
            }
        }).exec((Context) this);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        super.onPause();
        this.webView.onPause();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        this.webView.onResume();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.webView.destroy();
        this.webView = null;
    }

    void startLoading() {
        String url = (this.file.urlExternal == null || !this.file.urlExternal.endsWith(".mp4")) ? this.file.urlEmbed : this.file.urlExternal;
        Uri uri = Uri.parse(url);
        String[] domainParts = uri.getAuthority().split("\\.");
        final String baseDomain = domainParts[domainParts.length - 2] + "." + domainParts[domainParts.length - 1];
        this.webView.setWebViewClient(new WebViewClient() { // from class: com.vkontakte.android.activities.VideoEmbedPlayerActivity.2
            @Override // android.webkit.WebViewClient
            public boolean shouldOverrideUrlLoading(WebView view, String url2) {
                Uri uri2 = Uri.parse(url2);
                if (uri2.getAuthority().equals(baseDomain) || uri2.getAuthority().endsWith("." + baseDomain)) {
                    view.loadUrl(url2);
                    return true;
                }
                Intent intent = new Intent(VideoEmbedPlayerActivity.this, LinkRedirActivity.class);
                intent.setData(uri2);
                VideoEmbedPlayerActivity.this.startActivity(intent);
                return true;
            }

            @Override // android.webkit.WebViewClient
            public void onPageFinished(WebView view, String url2) {
                super.onPageFinished(view, url2);
                V.setVisibilityAnimated(VideoEmbedPlayerActivity.this.progress, 8);
            }
        });
        this.webView.setWebChromeClient(new WebChromeClient() { // from class: com.vkontakte.android.activities.VideoEmbedPlayerActivity.3
            WebChromeClient.CustomViewCallback customCallback;
            View customView;

            @Override // android.webkit.WebChromeClient
            public void onShowCustomView(View view, WebChromeClient.CustomViewCallback callback) {
                Log.d("vk", "on show custom view");
                if (this.customView != null) {
                    callback.onCustomViewHidden();
                    return;
                }
                this.customView = view;
                this.customCallback = callback;
                VideoEmbedPlayerActivity.this.webView.setVisibility(8);
                VideoEmbedPlayerActivity.this.content.addView(this.customView, new FrameLayout.LayoutParams(-1, -1, 17));
            }

            @Override // android.webkit.WebChromeClient
            public void onHideCustomView() {
                Log.d("vk", "On hide custom view");
                if (this.customView != null && this.customCallback != null) {
                    VideoEmbedPlayerActivity.this.content.removeView(this.customView);
                    this.customCallback.onCustomViewHidden();
                    this.customView = null;
                    this.customCallback = null;
                    VideoEmbedPlayerActivity.this.webView.setVisibility(0);
                }
            }

            @Override // android.webkit.WebChromeClient
            public void onProgressChanged(WebView view, int progr) {
                if (progr == 100 && VideoEmbedPlayerActivity.this.progress.getVisibility() == 0) {
                    V.setVisibilityAnimated(VideoEmbedPlayerActivity.this.progress, 8);
                    VideoEmbedPlayerActivity.this.canShowProgress = false;
                } else if (VideoEmbedPlayerActivity.this.progress.getVisibility() == 8 && VideoEmbedPlayerActivity.this.canShowProgress) {
                    V.setVisibilityAnimated(VideoEmbedPlayerActivity.this.progress, 0);
                }
                VideoEmbedPlayerActivity.this.progress.setProgress(progr / 100.0d);
            }

            @Override // android.webkit.WebChromeClient
            public View getVideoLoadingProgressView() {
                ProgressBar progr = new MaterialProgressBar(VideoEmbedPlayerActivity.this);
                progr.setBackgroundResource(R.drawable.video_btn_bg_up);
                progr.setPadding(Global.scale(10.0f), Global.scale(10.0f), Global.scale(10.0f), Global.scale(10.0f));
                return progr;
            }
        });
        if (url.endsWith(".mp4")) {
            String poster = TextUtils.isEmpty(this.file.urlBigThumb) ? "http://vk.com/images/blank.gif" : this.file.urlBigThumb;
            String code = "<!DOCTYPE html><html><body leftmargin=\"0\" topmargin=\"0\" rightmargin=\"0\" bottommargin=\"0\" style='margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;'><div style='height:100vh; margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;'><video width='100%' height='100%' controls preload='metadata' poster='" + poster + "'><source src='" + url + "' type=\"video/mp4\" /></video></div></body></html>";
            this.webView.loadData(code, "text/html", "utf-8");
            return;
        }
        this.webView.loadUrl(uri.toString());
    }
}
