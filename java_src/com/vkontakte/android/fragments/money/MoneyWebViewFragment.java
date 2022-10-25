package com.vkontakte.android.fragments.money;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.vkontakte.android.R;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.navigation.Navigator;
import me.grishka.appkit.fragments.LoaderFragment;
/* loaded from: classes3.dex */
public class MoneyWebViewFragment extends LoaderFragment implements BackListener {
    private static final String REQUEST_CODE = "request_code";
    public static final int REQUEST_TYPE_ACCEPT_TRANSFER = 2;
    public static final int REQUEST_TYPE_NEW_TRANSFER = 1;
    public static final int REQUEST_TYPE_SHOW_TERMS = 3;
    private static final String TRANSFER_ID_ARG = "transfer_id";
    public static final String URL_ARGUMENT = "url_to_load";
    private WebView mWebView;
    private WebViewClient mClient = new WebViewClient() { // from class: com.vkontakte.android.fragments.money.MoneyWebViewFragment.1
        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Uri uri = Uri.parse(url);
            if (!"oauth.vk.com".equals(uri.getHost()) || !"/blank.html".equals(uri.getPath()) || Uri.parse(url.replace('#', '?')).getQueryParameter("success") == null) {
                return false;
            }
            MoneyWebViewFragment.this.handleSuccess();
            return true;
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            MoneyWebViewFragment.this.onError(new VKAPIRequest.VKErrorResponse(1073741824, description));
        }
    };
    private WebChromeClient mChromeClient = new WebChromeClient() { // from class: com.vkontakte.android.fragments.money.MoneyWebViewFragment.2
        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView view, int newProgress) {
            if (newProgress == 100 && !MoneyWebViewFragment.this.loaded) {
                MoneyWebViewFragment.this.dataLoaded();
            }
        }
    };

    public static void showTerms(Context context, String uri) {
        Bundle args = new Bundle();
        args.putString(URL_ARGUMENT, uri);
        args.putInt("request_code", 3);
        args.putInt("transfer_id", 0);
        new Navigator(MoneyWebViewFragment.class, args).go(context);
    }

    public static void start(Fragment fragment, String url, int transferId, int requestCode) {
        Bundle args = new Bundle();
        args.putString(URL_ARGUMENT, url);
        args.putInt("request_code", requestCode);
        args.putInt("transfer_id", transferId);
        new Navigator(MoneyWebViewFragment.class, args).forResult(fragment, requestCode);
    }

    public static void start(Activity activity, String url, int transferId, int requestCode) {
        Bundle args = new Bundle();
        args.putString(URL_ARGUMENT, url);
        args.putInt("request_code", requestCode);
        args.putInt("transfer_id", transferId);
        new Navigator(MoneyWebViewFragment.class, args).forResult(activity, requestCode);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleSuccess() {
        Intent broadcastIntent = null;
        switch (getArguments().getInt("request_code")) {
            case 1:
                broadcastIntent = new Intent(MoneyTransferActions.ACTION_MONEY_TRANSFER_SENT);
                break;
            case 2:
                broadcastIntent = new Intent(MoneyTransferActions.ACTION_MONEY_TRANSFER_ACCEPTED);
                break;
        }
        if (broadcastIntent != null) {
            broadcastIntent.putExtra("transfer_id", getArguments().getInt("transfer_id"));
            getActivity().sendBroadcast(broadcastIntent, "com.vkontakte.android.permission.ACCESS_DATA");
        }
        Intent result = new Intent();
        getActivity().setResult(-1, result);
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.mWebView = (WebView) view.findViewById(R.id.webview);
        this.mWebView.setWebViewClient(this.mClient);
        this.mWebView.setWebChromeClient(this.mChromeClient);
        if (Build.VERSION.SDK_INT >= 21) {
            CookieManager.getInstance().setAcceptThirdPartyCookies(this.mWebView, true);
        }
        this.mWebView.getSettings().setJavaScriptEnabled(true);
        getToolbar().setNavigationIcon(R.drawable.ic_temp_close);
        getToolbar().setNavigationOnClickListener(MoneyWebViewFragment$$Lambda$1.lambdaFactory$(this));
        if (getArguments().getInt("request_code") == 3) {
            getToolbar().setTitle(getResources().getString(R.string.money_transfer_money_transfers));
        } else {
            getToolbar().setTitle(R.string.money_transfer_payment);
        }
        if (!this.loaded) {
            loadData();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$0(View v) {
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.mWebView.setWebChromeClient(null);
        this.mWebView.setWebViewClient(null);
        this.mWebView.destroy();
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
        this.mWebView.loadUrl(getArguments().getString(URL_ARGUMENT));
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.mWebView == null || !this.mWebView.canGoBack()) {
            return false;
        }
        this.mWebView.goBack();
        return true;
    }
}
