package com.my.target.ads;

import android.app.ActionBar;
import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import com.my.target.Tracer;
import com.my.target.core.engines.b;
import com.my.target.core.engines.e;
import com.my.target.core.facades.g;
import com.my.target.core.factories.c;
import com.my.target.core.ui.views.AdTitle;
import com.my.target.core.ui.views.chrome.CustomWebView;
import com.my.target.core.utils.l;
import com.my.target.nativeads.NativeAppwallAd;
/* loaded from: classes2.dex */
public class MyTargetActivity extends Activity implements b.a, CustomWebView.a {
    public static final String ACTION_CLOSE = "com.my.target.ACTION_CLOSE_ACTIVITY";
    public static final String WEB_VIEW_URL = "com.my.target.extras.web_vew_url";
    public static g ad;
    private CloseReceiver closeReceiver;
    private CustomWebView customWebView;
    private b engine;
    private LinearLayout rootLayout;
    private boolean shouldWeFinish;
    private l uiUtils;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.rootLayout = new LinearLayout(this);
        this.rootLayout.setOrientation(1);
        this.rootLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        this.uiUtils = new l(this);
        Intent intent = getIntent();
        if (intent != null) {
            processIntent(intent);
        } else {
            finish();
        }
    }

    private void processIntent(Intent intent) {
        if ("com.my.target.actions.webview".equals(intent.getAction())) {
            String stringExtra = intent.getStringExtra(WEB_VIEW_URL);
            if (!TextUtils.isEmpty(stringExtra)) {
                setupStatusBarForWebView();
                setContentView(this.rootLayout);
                showWebPage(stringExtra);
                return;
            }
            return;
        }
        g gVar = ad;
        ad = null;
        if (gVar == null) {
            Tracer.d("MyTargetActivity has not enough data for displaying");
            finish();
            return;
        }
        this.engine = c.a(gVar, this.rootLayout, this);
        if (this.engine != null) {
            if ("com.my.target.actions.appwall".equals(intent.getAction())) {
                setupActionBarForAppwall((NativeAppwallAd) gVar);
            } else if ("com.my.target.actions.interstitial".equals(intent.getAction())) {
                setupStatusbarForFullscreen();
            }
            this.engine.a(this);
            setContentView(this.rootLayout);
        }
    }

    private void setupStatusBarForWebView() {
        setTheme(16973837);
        if (Build.VERSION.SDK_INT >= 21) {
            Window window = getWindow();
            window.addFlags(Integer.MIN_VALUE);
            window.setStatusBarColor(-12232092);
        }
    }

    private void showWebPage(String str) {
        if (this.rootLayout != null) {
            this.customWebView = new CustomWebView(this);
            this.rootLayout.addView(this.customWebView);
            this.customWebView.a();
            this.customWebView.setUrl(str);
            this.customWebView.setListener(this);
        }
    }

    private void setupActionBarForAppwall(NativeAppwallAd nativeAppwallAd) {
        if (Build.VERSION.SDK_INT >= 21) {
            getWindow().addFlags(Integer.MIN_VALUE);
            setTheme(16974392);
            ActionBar actionBar = getActionBar();
            if (actionBar != null) {
                actionBar.setTitle(nativeAppwallAd.getTitle());
                actionBar.setIcon(17170445);
                actionBar.setDisplayShowTitleEnabled(true);
                actionBar.setDisplayHomeAsUpEnabled(true);
                actionBar.setBackgroundDrawable(new ColorDrawable(nativeAppwallAd.getTitleBackgroundColor()));
                setActionbarTextColor(actionBar, nativeAppwallAd.getTitleTextColor());
                actionBar.setElevation(this.uiUtils.a(4));
            }
            getWindow().setStatusBarColor(nativeAppwallAd.getTitleSupplementaryColor());
        } else if (Build.VERSION.SDK_INT >= 14) {
            setTheme(16974105);
            ActionBar actionBar2 = getActionBar();
            if (actionBar2 != null) {
                actionBar2.setTitle(nativeAppwallAd.getTitle());
                actionBar2.setBackgroundDrawable(new ColorDrawable(nativeAppwallAd.getTitleBackgroundColor()));
                setActionbarTextColor(actionBar2, nativeAppwallAd.getTitleTextColor());
                actionBar2.setIcon(17170445);
                actionBar2.setDisplayShowTitleEnabled(true);
                actionBar2.setDisplayHomeAsUpEnabled(true);
            }
        } else if (this.rootLayout != null) {
            setTheme(16973830);
            AdTitle adTitle = new AdTitle(this);
            adTitle.setLabel(nativeAppwallAd.getTitle());
            adTitle.setCloseClickListener(this);
            adTitle.setLayoutParams(new ViewGroup.LayoutParams(-1, this.uiUtils.a(52)));
            adTitle.setStripeColor(nativeAppwallAd.getTitleSupplementaryColor());
            adTitle.setMainColor(nativeAppwallAd.getTitleBackgroundColor());
            adTitle.setTitleColor(nativeAppwallAd.getTitleTextColor());
            this.rootLayout.addView(adTitle, 0);
        }
    }

    private void setupStatusbarForFullscreen() {
        setTheme(16973830);
        getWindow().setFlags(1024, 1024);
    }

    private void setActionbarTextColor(ActionBar actionBar, int i) {
        if (Build.VERSION.SDK_INT >= 11) {
            SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(actionBar.getTitle());
            spannableStringBuilder.setSpan(new ForegroundColorSpan(i), 0, actionBar.getTitle().length(), 18);
            actionBar.setTitle(spannableStringBuilder);
        }
    }

    @Override // android.app.Activity
    protected void onStart() {
        super.onStart();
        if (this.engine != null) {
            this.engine.d();
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        IntentFilter intentFilter = new IntentFilter(ACTION_CLOSE);
        this.closeReceiver = new CloseReceiver();
        registerReceiver(this.closeReceiver, intentFilter);
        if (this.engine != null) {
            this.engine.b();
        }
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        unregisterReceiver(this.closeReceiver);
        if (this.engine != null) {
            this.engine.a();
        }
    }

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        if (this.engine != null) {
            this.engine.c();
        }
        if (this.shouldWeFinish) {
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.engine != null) {
            this.engine.e();
            this.engine.f();
        }
        if (this.customWebView != null) {
            if (!l.c(11)) {
                this.customWebView.setVisibility(8);
            }
            this.customWebView.d();
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        if (this.customWebView != null && this.customWebView.b()) {
            this.customWebView.c();
        } else if (isBackAllowed()) {
            super.onBackPressed();
        }
    }

    private boolean isBackAllowed() {
        if (!(this.engine instanceof e)) {
            return true;
        }
        return ((e) this.engine).h();
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 16908332:
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    @Override // com.my.target.core.engines.b.a
    public void onClick(boolean z) {
        this.shouldWeFinish = z;
    }

    @Override // com.my.target.core.engines.b.a
    public void onCloseClick() {
        finish();
    }

    @Override // com.my.target.core.ui.views.chrome.CustomWebView.a
    public void onWebViewClosed() {
        finish();
    }

    /* loaded from: classes2.dex */
    private class CloseReceiver extends BroadcastReceiver {
        private CloseReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals(MyTargetActivity.ACTION_CLOSE)) {
                Tracer.d("finishing MyTargetActivity because of broadcast");
                MyTargetActivity.this.finish();
            }
        }
    }
}
