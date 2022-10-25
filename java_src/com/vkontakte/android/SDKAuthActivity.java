package com.vkontakte.android;

import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.Toast;
import com.facebook.AccessToken;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.ServerProtocol;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.ui.ErrorView;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Set;
/* loaded from: classes2.dex */
public class SDKAuthActivity extends VKActivity {
    private static final String TAG = "vk_sdk_auth";
    private FrameLayout contentView;
    private ErrorView error;
    private ProgressBar progress;
    private WebView webView;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        View.OnLongClickListener onLongClickListener;
        super.onCreate(b);
        if (getCallingPackage() == null) {
            Toast.makeText(this, "Be sure to call this using startActivityForResult()", 1).show();
            finish();
            return;
        }
        this.progress = new ProgressBar(this);
        this.contentView = new FrameLayout(this);
        this.contentView.setBackgroundColor(-1);
        this.webView = new WebView(this);
        this.webView.setWebViewClient(new WebClient());
        this.webView.setWebChromeClient(new ChromeClient());
        this.webView.getSettings().setJavaScriptEnabled(true);
        WebView webView = this.webView;
        onLongClickListener = SDKAuthActivity$$Lambda$1.instance;
        webView.setOnLongClickListener(onLongClickListener);
        this.webView.setLongClickable(false);
        this.contentView.addView(this.webView);
        this.contentView.addView(this.progress, new FrameLayout.LayoutParams(Global.scale(40.0f), Global.scale(40.0f), 17));
        this.error = (ErrorView) View.inflate(this, R.layout.error, null);
        this.error.setVisibility(8);
        this.contentView.addView(this.error);
        setContentView(this.contentView);
        this.webView.setVisibility(8);
        this.error.setOnRetryListener(SDKAuthActivity$$Lambda$2.lambdaFactory$(this));
        if (VKAccountManager.getCurrent().isReal()) {
            loadPage();
        } else {
            startActivityForResult(new Intent(this, AuthActivity.class), 100);
        }
    }

    public static /* synthetic */ boolean lambda$onCreate$0(View v) {
        return true;
    }

    public /* synthetic */ void lambda$onCreate$1(View v) {
        this.error.setVisibility(8);
        this.webView.reload();
    }

    public String getSig(HashMap<String, String> params) {
        Set<String> e = params.keySet();
        ArrayList<String> parts = new ArrayList<>();
        for (String key : e) {
            parts.add(key + "=" + params.get(key));
        }
        String src = "/authorize?" + TextUtils.join("&", parts);
        return VKAPIRequest.md5(src + VKAccountManager.getCurrent().getSecret());
    }

    private void loadPage() {
        String pkg = getCallingPackage();
        String certFp = "";
        try {
            PackageInfo info = getPackageManager().getPackageInfo(pkg, 64);
            Signature sig = info.signatures[0];
            MessageDigest md = MessageDigest.getInstance("SHA1");
            md.update(sig.toByteArray());
            byte[] sha = md.digest();
            certFp = "";
            for (byte sb : sha) {
                certFp = certFp + String.format("%02X", Byte.valueOf(sb));
            }
        } catch (Exception x) {
            Log.w(TAG, x);
        }
        LinkedHashMap<String, String> params = new LinkedHashMap<>();
        params.put("client_id", getIntent().getIntExtra("client_id", 0) + "");
        params.put("scope", getIntent().getStringExtra("scope"));
        params.put(ServerProtocol.DIALOG_PARAM_REDIRECT_URI, "https://oauth.vk.com/blank.html");
        params.put(ServerProtocol.DIALOG_PARAM_DISPLAY, AbstractSpiCall.ANDROID_CLIENT_TYPE);
        params.put(ServerProtocol.DIALOG_PARAM_RESPONSE_TYPE, AuthCheckFragment.KEY_TOKEN);
        params.put("access_token", VKAccountManager.getCurrent().getAccessToken());
        params.put("sdk_package", pkg);
        params.put("sdk_fingerprint", certFp);
        params.put("lang", Global.getDeviceLang());
        if (getIntent().hasExtra("revoke")) {
            params.put("revoke", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        }
        Uri.Builder bldr = new Uri.Builder().scheme(UriUtil.HTTPS_SCHEME).authority("oauth.vk.com").path("/authorize");
        Set<String> e = params.keySet();
        for (String k : e) {
            bldr.appendQueryParameter(k, params.get(k));
        }
        bldr.appendQueryParameter("sig", getSig(params));
        String url = bldr.build().toString();
        this.webView.loadUrl(url);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (reqCode == 100) {
            if (resCode == -1) {
                loadPage();
                return;
            }
            setResult(0);
            finish();
        }
    }

    /* loaded from: classes2.dex */
    private class ChromeClient extends WebChromeClient {
        private ChromeClient() {
            SDKAuthActivity.this = r1;
        }

        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView view, int progr) {
            boolean z = true;
            int i = 0;
            boolean visible = progr < 100;
            if (SDKAuthActivity.this.progress.getVisibility() != 0) {
                z = false;
            }
            if (visible != z) {
                if (visible) {
                    SDKAuthActivity.this.progress.setVisibility(0);
                } else {
                    SDKAuthActivity.this.progress.setVisibility(8);
                }
            }
            WebView webView = SDKAuthActivity.this.webView;
            if (visible || SDKAuthActivity.this.error.getVisibility() == 0) {
                i = 8;
            }
            webView.setVisibility(i);
        }
    }

    /* loaded from: classes2.dex */
    private class WebClient extends WebViewClient {
        private WebClient() {
            SDKAuthActivity.this = r1;
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Uri uri = Uri.parse(url);
            if ("oauth.vk.com".equals(uri.getHost()) && "/blank.html".equals(uri.getPath())) {
                Uri uri2 = Uri.parse(url.replace('#', '?'));
                if (uri2.getQueryParameter("error") != null) {
                    Log.w(SDKAuthActivity.TAG, "Auth not successful [fail]: " + url);
                    Intent result = new Intent();
                    result.putExtra("error", uri2.getQueryParameter("error"));
                    result.putExtra("error_reason", uri2.getQueryParameter("error_reason"));
                    result.putExtra(NativeProtocol.BRIDGE_ARG_ERROR_DESCRIPTION, uri2.getQueryParameter(NativeProtocol.BRIDGE_ARG_ERROR_DESCRIPTION));
                    SDKAuthActivity.this.setResult(0, result);
                    SDKAuthActivity.this.finish();
                    return true;
                } else if (uri2.getQueryParameter("access_token") != null) {
                    String token = uri2.getQueryParameter("access_token");
                    String secret = uri2.getQueryParameter("secret");
                    String expiresIn = uri2.getQueryParameter(AccessToken.EXPIRES_IN_KEY);
                    String email = uri2.getQueryParameter("email");
                    int uid = Integer.parseInt(uri2.getQueryParameter("user_id"));
                    Intent result2 = new Intent();
                    result2.putExtra("access_token", token);
                    if (secret != null) {
                        result2.putExtra("secret", secret);
                    }
                    if (email != null) {
                        result2.putExtra("email", email);
                    }
                    result2.putExtra("user_id", uid);
                    result2.putExtra("https_required", AppEventsConstants.EVENT_PARAM_VALUE_YES);
                    if (expiresIn != null) {
                        try {
                            result2.putExtra(AccessToken.EXPIRES_IN_KEY, Integer.parseInt(expiresIn));
                        } catch (Exception e) {
                        }
                    }
                    Log.i(SDKAuthActivity.TAG, "Auth ok");
                    SDKAuthActivity.this.setResult(-1, result2);
                    SDKAuthActivity.this.finish();
                    return true;
                } else {
                    Log.w(SDKAuthActivity.TAG, "Auth not successful [unknown]: " + url);
                    SDKAuthActivity.this.setResult(0);
                    SDKAuthActivity.this.finish();
                    return true;
                }
            }
            view.loadUrl(url);
            return true;
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errCode, String descr, String url) {
            SDKAuthActivity.this.error.setErrorInfo(errCode, descr);
            SDKAuthActivity.this.error.setVisibility(0);
            SDKAuthActivity.this.webView.setVisibility(8);
        }
    }
}
