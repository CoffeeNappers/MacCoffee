package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Message;
import android.os.Parcelable;
import android.support.annotation.StyleRes;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ConsoleMessage;
import android.webkit.CookieManager;
import android.webkit.GeolocationPermissions;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.facebook.common.util.UriUtil;
import com.vk.core.util.FileUtils;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.ReportAppsActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.LinkUtils;
import java.io.File;
import java.util.ArrayList;
import me.grishka.appkit.utils.V;
import me.zhanghai.android.materialprogressbar.MaterialProgressBar;
/* loaded from: classes2.dex */
public class WebViewFragment extends me.grishka.appkit.fragments.LoaderFragment implements BackListener {
    private static final File CACHE_PATH = new File(Environment.getExternalStorageDirectory(), ".vkontakte/cache/html");
    private static final int FILECHOOSER_RESULTCODE = 9999;
    private static final int LINK_REDIR_RESULT = 101;
    private boolean appReport;
    private boolean copyLink;
    private String lastUrl;
    private WebView mWebView;
    private Uri photoFileUri;
    private MaterialProgressBar toolbarProgress;
    private ValueCallback<Uri> uploadUriCallback;
    private ValueCallback<Uri[]> uploadUrisCallback;
    private Uri videoFileUri;
    private WebViewClient mClient = new WebViewClient() { // from class: com.vkontakte.android.fragments.WebViewFragment.1
        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            WebViewFragment.this.lastUrl = url;
            if (WebViewFragment.this.getArguments().getBoolean("open_internally")) {
                Uri uri = Uri.parse(url);
                if ((UriUtil.HTTP_SCHEME.equals(uri.getScheme()) || UriUtil.HTTPS_SCHEME.equals(uri.getScheme())) && !LinkUtils.MARKET.equals(uri.getHost())) {
                    view.loadUrl(url);
                } else {
                    Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
                    if (LinkUtils.MARKET.equals(uri.getHost())) {
                        intent.setPackage("com.android.vending");
                    }
                    try {
                        WebViewFragment.this.startActivity(intent);
                        if (!WebViewFragment.this.getActivity().isTaskRoot()) {
                            WebViewFragment.this.getActivity().finish();
                        }
                    } catch (Exception e) {
                        L.e("VK", e);
                    }
                }
            } else {
                Intent intent2 = new Intent("android.intent.action.VIEW", Uri.parse(url));
                intent2.setComponent(new ComponentName(WebViewFragment.this.getActivity(), LinkRedirActivity.class));
                intent2.putExtra("no_browser", true);
                WebViewFragment.this.startActivityForResult(intent2, 101);
            }
            return true;
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            WebViewFragment.this.onError(new VKAPIRequest.VKErrorResponse(1073741824, description));
        }
    };
    private WebChromeClient mChromeClient = new WebChromeClient() { // from class: com.vkontakte.android.fragments.WebViewFragment.2
        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView view, int newProgress) {
            WebViewFragment.this.toolbarProgress.setProgress(newProgress * 100);
            V.setVisibilityAnimated(WebViewFragment.this.toolbarProgress, newProgress == 100 ? 8 : 0);
            if (newProgress > 0 && !WebViewFragment.this.loaded) {
                WebViewFragment.this.dataLoaded();
            }
        }

        @Override // android.webkit.WebChromeClient
        public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
            L.e("WebChromeClient", consoleMessage.message(), Integer.valueOf(consoleMessage.lineNumber()), consoleMessage.sourceId());
            return super.onConsoleMessage(consoleMessage);
        }

        @Override // android.webkit.WebChromeClient
        public void onReceivedTitle(WebView view, String title) {
            if (WebViewFragment.this.getScreenTitle() == null) {
                WebViewFragment.this.setTitle(title);
            }
        }

        @Override // android.webkit.WebChromeClient
        public boolean onCreateWindow(WebView view, boolean isDialog, boolean isUserGesture, Message resultMsg) {
            WebView.WebViewTransport t = (WebView.WebViewTransport) resultMsg.obj;
            WebView w = new WebView(view.getContext());
            w.setWebViewClient(new WebViewClient() { // from class: com.vkontakte.android.fragments.WebViewFragment.2.1
                @Override // android.webkit.WebViewClient
                public boolean shouldOverrideUrlLoading(WebView view2, String url) {
                    Intent intent = new Intent(WebViewFragment.this.getActivity(), LinkRedirActivity.class);
                    intent.setData(Uri.parse(url));
                    WebViewFragment.this.startActivity(intent);
                    view2.destroy();
                    return true;
                }
            });
            t.setWebView(w);
            resultMsg.sendToTarget();
            return true;
        }

        @Override // android.webkit.WebChromeClient
        public void onGeolocationPermissionsShowPrompt(final String origin, final GeolocationPermissions.Callback callback) {
            VKAlertDialog.Builder builder = new VKAlertDialog.Builder(WebViewFragment.this.getContext());
            builder.setTitle(R.string.community_app_location_request_title).setMessage(R.string.community_app_location_request_text).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.WebViewFragment.2.3
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    callback.invoke(origin, true, true);
                }
            }).setNegativeButton(R.string.no, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.WebViewFragment.2.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    callback.invoke(origin, false, false);
                }
            });
            builder.show();
        }

        public void openFileChooser(ValueCallback<Uri> uploadMsg, String acceptType, String capture) {
            openFileChooser(uploadMsg, acceptType);
        }

        protected void openFileChooser(ValueCallback<Uri> uploadMsg, String acceptType) {
            if (WebViewFragment.this.uploadUriCallback != null) {
                WebViewFragment.this.uploadUriCallback.onReceiveValue(null);
            }
            WebViewFragment.this.uploadUriCallback = uploadMsg;
            Intent intent = new Intent("android.intent.action.GET_CONTENT");
            intent.addCategory("android.intent.category.OPENABLE");
            intent.setType("*/*");
            startChooser(intent);
        }

        @Override // android.webkit.WebChromeClient
        public boolean onShowFileChooser(WebView mWebView, ValueCallback<Uri[]> filePathCallback, WebChromeClient.FileChooserParams fileChooserParams) {
            if (WebViewFragment.this.uploadUrisCallback != null) {
                WebViewFragment.this.uploadUrisCallback.onReceiveValue(null);
            }
            if (Build.VERSION.SDK_INT >= 21) {
                WebViewFragment.this.uploadUrisCallback = filePathCallback;
                startChooser(fileChooserParams.createIntent());
                return true;
            }
            return false;
        }

        private void startChooser(Intent getContentIntent) {
            ArrayList<Intent> intentArray = new ArrayList<>();
            Intent imageCaptureIntent = createImageCaptureIntent();
            if (imageCaptureIntent != null) {
                intentArray.add(imageCaptureIntent);
            }
            Intent videoCaptureIntent = createVideoCaptureIntent();
            if (videoCaptureIntent != null) {
                intentArray.add(videoCaptureIntent);
            }
            Intent chooserIntent = new Intent("android.intent.action.CHOOSER");
            chooserIntent.putExtra("android.intent.extra.INTENT", getContentIntent);
            chooserIntent.putExtra("android.intent.extra.INITIAL_INTENTS", (Parcelable[]) intentArray.toArray(new Intent[intentArray.size()]));
            WebViewFragment.this.startActivityForResult(chooserIntent, WebViewFragment.FILECHOOSER_RESULTCODE);
        }

        private Intent createImageCaptureIntent() {
            Intent takePictureIntent = new Intent("android.media.action.IMAGE_CAPTURE");
            if (takePictureIntent.resolveActivity(WebViewFragment.this.getActivity().getPackageManager()) != null) {
                File file = FileUtils.getPhotoFile();
                WebViewFragment.this.photoFileUri = Uri.fromFile(file);
                takePictureIntent.putExtra("output", WebViewFragment.this.photoFileUri);
                return takePictureIntent;
            }
            return null;
        }

        private Intent createVideoCaptureIntent() {
            Intent takePictureIntent = new Intent("android.media.action.VIDEO_CAPTURE");
            if (takePictureIntent.resolveActivity(WebViewFragment.this.getActivity().getPackageManager()) != null) {
                File file = FileUtils.getVideoFile();
                WebViewFragment.this.videoFileUri = Uri.fromFile(file);
                takePictureIntent.putExtra("output", WebViewFragment.this.videoFileUri);
                return takePictureIntent;
            }
            return null;
        }
    };

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(String url) {
            super(WebViewFragment.class);
            this.args.putString("url", url);
        }

        public Builder openInternally() {
            this.args.putBoolean("open_internally", true);
            return this;
        }

        public Builder setUrlToCopy(String urlToCopy) {
            this.args.putString("url_to_copy", urlToCopy);
            return this;
        }

        public Builder setScreenTitle(String screenTitle) {
            this.args.putString("screen_title", screenTitle);
            return this;
        }

        public Builder setAppReport(boolean appReport) {
            this.args.putBoolean("app_report", appReport);
            return this;
        }

        public Builder setOwnerId(int ownerId) {
            this.args.putInt("ownerID", ownerId);
            return this;
        }

        public Builder setAppId(int appId) {
            this.args.putInt("appID", appId);
            return this;
        }

        public Builder setTheme(@StyleRes int themeResId) {
            this.args.putInt("theme", themeResId);
            return this;
        }
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 101) {
            if (resultCode == 0 && this.mWebView != null) {
                this.mWebView.loadUrl(this.lastUrl);
            }
        } else if (requestCode == FILECHOOSER_RESULTCODE) {
            Uri pickedFileUri = null;
            if (resultCode == -1) {
                if (data != null && data.getDataString() != null) {
                    pickedFileUri = Uri.parse(data.getDataString());
                } else {
                    pickedFileUri = getCorrectFileUri();
                }
            }
            if (pickedFileUri != null) {
                if (this.uploadUrisCallback != null) {
                    this.uploadUrisCallback.onReceiveValue(new Uri[]{pickedFileUri});
                    this.uploadUrisCallback = null;
                }
                if (this.uploadUriCallback != null) {
                    this.uploadUriCallback.onReceiveValue(pickedFileUri);
                    this.uploadUriCallback = null;
                }
            } else {
                if (this.uploadUrisCallback != null) {
                    this.uploadUrisCallback.onReceiveValue(null);
                    this.uploadUrisCallback = null;
                }
                if (this.uploadUriCallback != null) {
                    this.uploadUriCallback.onReceiveValue(null);
                    this.uploadUriCallback = null;
                }
            }
            this.photoFileUri = null;
            this.videoFileUri = null;
        }
    }

    private Uri getCorrectFileUri() {
        if (this.photoFileUri != null && new File(this.photoFileUri.getPath()).length() > 0) {
            return this.photoFileUri;
        }
        if (this.videoFileUri != null && new File(this.videoFileUri.getPath()).length() > 0) {
            return this.videoFileUri;
        }
        return null;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        getActivity().finish();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        boolean z = false;
        super.onCreate(savedInstanceState);
        setTitle(getScreenTitle());
        this.copyLink = getArguments().getString("url_to_copy") != null;
        this.appReport = getArguments().getBoolean("app_report", false);
        if (this.copyLink || this.appReport) {
            z = true;
        }
        setHasOptionsMenu(z);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.mWebView = (WebView) view.findViewById(R.id.webview);
        if (Build.VERSION.SDK_INT >= 21) {
            CookieManager.getInstance().setAcceptThirdPartyCookies(this.mWebView, true);
        }
        this.toolbarProgress = (MaterialProgressBar) view.findViewById(R.id.horizontal_progress_toolbar);
        WebSettings settings = this.mWebView.getSettings();
        settings.setAllowFileAccess(true);
        settings.setAppCacheEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAppCachePath(CACHE_PATH.getAbsolutePath());
        settings.setCacheMode(-1);
        settings.setSupportMultipleWindows(true);
        settings.setJavaScriptEnabled(true);
        this.mWebView.setWebViewClient(this.mClient);
        this.mWebView.setWebChromeClient(this.mChromeClient);
        setupTheme();
        if (!this.loaded) {
            loadData();
        }
    }

    private void setupTheme() {
        Toolbar toolbar = getToolbar();
        if (this.appReport) {
            Drawable drawable = DrawableCompat.wrap(getResources().getDrawable(R.drawable.ic_close).mutate());
            DrawableCompat.setTint(drawable, ViewUtils.fetchSystemColor(getContext(), R.attr.colorAccent));
            toolbar.setNavigationIcon(drawable);
            return;
        }
        toolbar.setNavigationIcon(R.drawable.ic_ab_back);
    }

    @Override // android.app.Fragment
    public void onPause() {
        this.mWebView.onPause();
        super.onPause();
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.mWebView.onResume();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.mWebView.setWebChromeClient(null);
        this.mWebView.setWebViewClient(null);
        this.mWebView = null;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        WebView wv = new WebView(getActivity());
        wv.setId(R.id.webview);
        return wv;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void doLoadData() {
        this.mWebView.loadUrl(getArguments().getString("url"));
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.mWebView == null || !this.mWebView.canGoBack()) {
            return false;
        }
        this.mWebView.goBack();
        return true;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        setLayout(R.layout.loader_fragment_progress);
        super.onAttach(activity);
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (this.copyLink) {
            MenuItem item = menu.add(0, R.id.copy_link, 0, R.string.copy_link);
            item.setShowAsAction(0);
        }
        if (this.appReport) {
            MenuItem item2 = menu.add(0, R.id.app_report, 1, R.string.report_content);
            item2.setShowAsAction(0);
        }
        super.onCreateOptionsMenu(menu, inflater);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.app_report /* 2131755016 */:
                Context context = getContext();
                Intent intent = new Intent(context, ReportAppsActivity.class);
                intent.putExtra("ownerID", getArguments().getInt("ownerID"));
                intent.putExtra("appID", getArguments().getInt("appID"));
                context.startActivity(intent);
                return true;
            case R.id.copy_link /* 2131755023 */:
                String url = getArguments().getString("url_to_copy");
                ClipboardManager clipboard = (ClipboardManager) getActivity().getSystemService("clipboard");
                ClipData clip = ClipData.newPlainText(url, url);
                clipboard.setPrimaryClip(clip);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getScreenTitle() {
        return getArguments().getString("screen_title");
    }
}
