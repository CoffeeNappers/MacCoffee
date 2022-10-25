package com.vk.webapp;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Environment;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ConsoleMessage;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.vk.core.util.ToastUtils;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.ErrorViewHelper;
import com.vkontakte.android.utils.L;
import java.io.File;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.fragments.LoaderFragment;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VKUIWebContainerFragment extends LoaderFragment implements BackListener {
    private static final String BRIDGE_NAME = "AndroidBridge";
    private static final File CACHE_PATH = new File(Environment.getExternalStorageDirectory(), ".vkontakte/cache/html");
    private static final String DEFAULT_SPA_URI = "vk.com/spa";
    private static final String TAG = "VKUIWebContainerFragment";
    private boolean isInErrorState;
    private String uriToLoad;
    private WebView webView;
    private final WebViewClient webViewClient = new WebViewClient() { // from class: com.vk.webapp.VKUIWebContainerFragment.1
        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            if (!VKUIWebContainerFragment.this.loaded) {
                VKUIWebContainerFragment.this.onError(new ErrorResponse() { // from class: com.vk.webapp.VKUIWebContainerFragment.1.1
                    @Override // me.grishka.appkit.api.ErrorResponse
                    public void bindErrorView(View view2) {
                        ErrorViewHelper evh = new ErrorViewHelper(view2);
                        evh.setMessage(VKUIWebContainerFragment.this.getString(R.string.error));
                    }

                    @Override // me.grishka.appkit.api.ErrorResponse
                    public void showToast(Context context) {
                    }
                });
                VKUIWebContainerFragment.this.isInErrorState = true;
            } else {
                ToastUtils.showToast((int) R.string.error);
            }
            L.w(VKUIWebContainerFragment.TAG, "failed to load: " + failingUrl + ", errorCode = " + errorCode);
        }
    };
    private final WebChromeClient webChromeClient = new WebChromeClient() { // from class: com.vk.webapp.VKUIWebContainerFragment.2
        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView view, int newProgress) {
            Log.i(VKUIWebContainerFragment.TAG, "onProgressChanged newProgress=" + newProgress);
            if (newProgress == 100 && !VKUIWebContainerFragment.this.loaded && !VKUIWebContainerFragment.this.isInErrorState) {
                VKUIWebContainerFragment.this.handleLoaded();
            }
        }

        @Override // android.webkit.WebChromeClient
        public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
            L.i(VKUIWebContainerFragment.TAG, consoleMessage.message(), Integer.valueOf(consoleMessage.lineNumber()), consoleMessage.sourceId());
            return super.onConsoleMessage(consoleMessage);
        }
    };

    public static String getSPAUri() {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
        String spaUri = "https://" + prefs.getString("spaUri", DEFAULT_SPA_URI);
        return spaUri;
    }

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        private static final String KEY_URL = "key_url";

        public Builder(String url) {
            super(VKUIWebContainerFragment.class);
            this.args.putString(KEY_URL, url);
            this.args.putBoolean(FragmentWrapperActivity.DISABLE_DRAWER_LAYOUT_KEY, true);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class AndroidBridge {
        private static final String JS_RESULT_CANCEL = "cancel";
        private static final String JS_RESULT_FAIL = "fail";
        private static final String JS_RESULT_SUCCESS = "success";

        AndroidBridge() {
        }

        @JavascriptInterface
        public void VKWebAppClose(String data) {
            VKUIWebContainerFragment.this.getActivity().setResult(parseResult(data));
            VKUIWebContainerFragment.this.getActivity().finish();
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        private int parseResult(String data) {
            char c;
            try {
                JSONObject jsonObject = new JSONObject(data);
                String resStr = jsonObject.optString("status");
                switch (resStr.hashCode()) {
                    case -1867169789:
                        if (resStr.equals("success")) {
                            c = 0;
                            break;
                        }
                        c = 65535;
                        break;
                    case -1367724422:
                        if (resStr.equals(JS_RESULT_CANCEL)) {
                            c = 2;
                            break;
                        }
                        c = 65535;
                        break;
                    case 3135262:
                        if (resStr.equals(JS_RESULT_FAIL)) {
                            c = 1;
                            break;
                        }
                        c = 65535;
                        break;
                    default:
                        c = 65535;
                        break;
                }
                switch (c) {
                    case 0:
                        return -1;
                    case 1:
                        return 0;
                    case 2:
                        return 0;
                    default:
                        return 0;
                }
            } catch (Exception e) {
                return 0;
            }
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.uriToLoad = getArguments().getString("key_url");
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        this.webView.onPause();
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.webView.onResume();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.webView.destroy();
        this.webView = null;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.webView = new WebView(getActivity());
        this.webView.setId(R.id.webview);
        configureWebView();
        return this.webView;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!this.loaded) {
            loadData();
        }
        getToolbar().setVisibility(8);
    }

    private void configureWebView() {
        WebSettings settings = this.webView.getSettings();
        settings.setAppCacheEnabled(true);
        settings.setAppCachePath(CACHE_PATH.getAbsolutePath());
        settings.setDomStorageEnabled(true);
        settings.setCacheMode(-1);
        settings.setJavaScriptEnabled(true);
        this.webView.setWebViewClient(this.webViewClient);
        this.webView.setWebChromeClient(this.webChromeClient);
        this.webView.addJavascriptInterface(new AndroidBridge(), BRIDGE_NAME);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        Log.i(TAG, "doLoadData");
        this.isInErrorState = false;
        this.webView.loadUrl(this.uriToLoad);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleLoaded() {
        dataLoaded();
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.webView == null || !this.webView.canGoBack()) {
            return false;
        }
        this.webView.goBack();
        return true;
    }
}
