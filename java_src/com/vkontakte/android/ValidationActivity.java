package com.vkontakte.android;

import android.app.ProgressDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.webkit.CookieSyncManager;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.vkontakte.android.activities.TabletsDialogActivity;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.store.GetStockItemByProductId;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.utils.L;
import io.reactivex.Observable;
import io.reactivex.annotations.NonNull;
import io.reactivex.functions.Consumer;
/* loaded from: classes2.dex */
public class ValidationActivity extends TabletsDialogActivity {
    public static final String KEY_ACCESS_TOKEN = "access_token";
    public static final String KEY_AUTH_STATE = "auth_state";
    public static final String KEY_REQUIRE_JUST_ACCESS_TOKEN = "require_access_token";
    public static final String KEY_RETURN_RESULT = "return_result";
    public static final String KEY_SECRET = "secret";
    public static final String KEY_URL = "url";
    public static final String KEY_USER_ID = "user_id";
    public static final int VRESULT_CANCEL = 1;
    public static final int VRESULT_NONE = 0;
    public static final int VRESULT_RETRY = 2;
    public static int result = 0;
    @Nullable
    private PurchasesManager<PurchasesManager.Product> mManager = null;
    private ProgressDialog progress;
    private WebView webView;

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (this.mManager != null) {
            this.mManager.onActivityResult(reqCode, resCode, data);
        }
    }

    @Override // com.vkontakte.android.activities.TabletsDialogActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        setFinishOnTouchOutside(false);
        this.webView = new WebView(this);
        CookieSyncManager.createInstance(this);
        CookieSyncManager.getInstance().sync();
        this.webView.getSettings().setJavaScriptEnabled(true);
        this.webView.getSettings().setSupportMultipleWindows(true);
        this.webView.setWebViewClient(new AnonymousClass1());
        this.webView.setWebChromeClient(new WebChromeClient() { // from class: com.vkontakte.android.ValidationActivity.2
            @Override // android.webkit.WebChromeClient
            public void onProgressChanged(WebView view, int progr) {
                boolean visible = progr < 100;
                ProgressDialog dialog = ValidationActivity.this.progress;
                if (dialog != null && visible != dialog.isShowing()) {
                    if (visible) {
                        ViewUtils.showDialogSafety(dialog);
                        return;
                    }
                    ViewUtils.dismissDialogSafety(dialog);
                    ValidationActivity.this.progress = null;
                }
            }

            @Override // android.webkit.WebChromeClient
            public void onCloseWindow(WebView window) {
                if (ValidationActivity.result == 0 && !ValidationActivity.this.getIntent().getBooleanExtra(ValidationActivity.KEY_RETURN_RESULT, false)) {
                    ValidationActivity.result = 1;
                }
                ValidationActivity.this.finish();
            }

            @Override // android.webkit.WebChromeClient
            public boolean onCreateWindow(WebView view, boolean isDialog, boolean isUserGesture, android.os.Message resultMsg) {
                WebView.WebViewTransport t = (WebView.WebViewTransport) resultMsg.obj;
                WebView w = new WebView(view.getContext());
                w.setWebViewClient(new WebViewClient() { // from class: com.vkontakte.android.ValidationActivity.2.1
                    @Override // android.webkit.WebViewClient
                    public boolean shouldOverrideUrlLoading(WebView view2, String url) {
                        ValidationActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
                        view2.destroy();
                        return true;
                    }
                });
                t.setWebView(w);
                resultMsg.sendToTarget();
                return true;
            }
        });
        this.webView.loadUrl(getIntent().getStringExtra("url"));
        this.webView.setBackgroundResource(R.color.cards_bg);
        setContentView(this.webView);
        this.progress = new ProgressDialog(this);
        this.progress.setMessage(getString(R.string.loading));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ValidationActivity$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 extends WebViewClient {
        AnonymousClass1() {
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Uri uri = Uri.parse(url);
            if (ValidationActivity.isGooglePurchasesLink(uri)) {
                String type = uri.getQueryParameter(ServerKeys.TYPE);
                int id = LinkRedirActivity.parseInt(uri.getQueryParameter("id"));
                Observable<PurchasesManager.Product> observable = new GetStockItemByProductId().productId(id).type(type).ignoreValidation(true).toObservable();
                observable.subscribe(new Consumer<PurchasesManager.Product>() { // from class: com.vkontakte.android.ValidationActivity.1.1
                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull PurchasesManager.Product product) throws Exception {
                        ValidationActivity.this.mManager = new PurchasesManager(ValidationActivity.this).ignoreValidation();
                        ValidationActivity.this.mManager.purchase(product, new PurchasesManager.OnSuccessListener<PurchasesManager.Product>() { // from class: com.vkontakte.android.ValidationActivity.1.1.1
                            @Override // com.vkontakte.android.data.PurchasesManager.OnSuccessListener
                            public void onSuccess(PurchasesManager.Product o) {
                                Intent intent = new Intent();
                                intent.putExtra("access_token", VKAccountManager.getCurrent().getAccessToken());
                                ValidationActivity.this.setResult(-1, intent);
                                ValidationActivity.result = 2;
                                ValidationActivity.this.finish();
                            }
                        });
                    }
                }, new Consumer<Throwable>() { // from class: com.vkontakte.android.ValidationActivity.1.2
                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull Throwable throwable) throws Exception {
                        if (throwable instanceof APIException) {
                            ((APIException) throwable).errorResponse.showToast(ValidationActivity.this);
                        }
                        ValidationActivity.this.setResult(0);
                        ValidationActivity.result = 1;
                        ValidationActivity.this.finish();
                    }
                });
                return true;
            }
            if ("oauth.vk.com".equals(uri.getHost()) && "/blank.html".equals(uri.getPath())) {
                Uri uri2 = Uri.parse(url.replace('#', '?'));
                if (ValidationActivity.this.getIntent().getBooleanExtra(ValidationActivity.KEY_RETURN_RESULT, false)) {
                    if (uri2.getQueryParameter("success") != null) {
                        Intent intent = new Intent();
                        if (uri2.getQueryParameter("access_token") != null) {
                            intent.putExtra("access_token", uri2.getQueryParameter("access_token"));
                            intent.putExtra("secret", uri2.getQueryParameter("secret"));
                            intent.putExtra("user_id", Integer.parseInt(uri2.getQueryParameter("user_id")));
                        }
                        intent.putExtra("auth_state", ValidationActivity.this.getIntent().getParcelableExtra("auth_state"));
                        intent.setData(uri2);
                        ValidationActivity.this.setResult(-1, intent);
                    } else if (ValidationActivity.this.getIntent().getBooleanExtra(ValidationActivity.KEY_REQUIRE_JUST_ACCESS_TOKEN, false) && uri2.getQueryParameter("access_token") != null) {
                        Intent intent2 = new Intent();
                        intent2.putExtra("access_token", uri2.getQueryParameter("access_token"));
                        intent2.setData(uri2);
                        ValidationActivity.this.setResult(-1, intent2);
                    } else {
                        ValidationActivity.this.setResult(0);
                    }
                    ValidationActivity.this.finish();
                    return true;
                } else if (uri2.getQueryParameter("fail") != null) {
                    L.d("Validation fail");
                    VKAuth.logout();
                    ValidationActivity.result = 1;
                    ValidationActivity.this.finish();
                } else if (uri2.getQueryParameter("cancel") != null) {
                    ValidationActivity.result = 1;
                    ValidationActivity.this.finish();
                } else if (uri2.getQueryParameter("success") != null) {
                    if (ValidationActivity.this.getIntent().hasExtra("device_token")) {
                        String devToken = ValidationActivity.this.getIntent().getStringExtra("device_token");
                        int userId = VKAccountManager.getCurrent().getUid();
                        if (uri2.getQueryParameter("user_id") != null) {
                            userId = Integer.parseInt(uri2.getQueryParameter("user_id"));
                        }
                        ValidationActivity.this.getSharedPreferences(null, 0).edit().putString("device_token" + userId, devToken).apply();
                    }
                    if (uri2.getQueryParameter("access_token") != null) {
                        String token = uri2.getQueryParameter("access_token");
                        String secret = uri2.getQueryParameter("secret");
                        int uid = Integer.parseInt(uri2.getQueryParameter("user_id"));
                        if (!VKAccountManager.isCurrentUser(uid)) {
                            L.d("Current user is not current");
                            VKAuth.logout();
                        } else {
                            VKAccountManager.editCurrent().setAccessToken(token).setSecret(secret).commit();
                        }
                    }
                    ValidationActivity.result = 2;
                    ValidationActivity.this.finish();
                }
            } else {
                view.loadUrl(url);
            }
            return true;
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView webView, String url) {
            CookieSyncManager.getInstance().sync();
            Uri uri = Uri.parse(url);
            if (ValidationActivity.this.getIntent().hasExtra(SignupPhoneFragment.KEY_PHONE) && "m.vk.com".equals(uri.getHost()) && "/restore".equals(uri.getPath()) && uri.getQueryParameter("rh") != null) {
                ValidationActivity.this.webView.loadUrl("javascript:document.getElementsByTagName('input')[0].value='" + ValidationActivity.this.getIntent().getStringExtra(SignupPhoneFragment.KEY_PHONE) + "';void(0);");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        if (result == 0) {
            result = 1;
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (result == 0 && !getIntent().getBooleanExtra(KEY_RETURN_RESULT, false)) {
            result = 1;
        }
        super.onBackPressed();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isGooglePurchasesLink(Uri uri) {
        return LinkRedirActivity.isVKScheme(uri) && "purchases_googleplay".equals(uri.getHost());
    }
}
