package com.vkontakte.android;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Bundle;
import android.text.Html;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.CookieSyncManager;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.analytics.Analytics;
import com.vk.core.network.Network;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.NewsFragment;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.FitSystemWindowsFragmentWrapperFrameLayout;
import com.vkontakte.android.ui.FragmentHelper;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.ui.navigation.NavigationDelegateActivity;
import com.vkontakte.android.utils.L;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class MainActivity extends NavigationDelegateActivity implements ResulterProvider {
    private List<ActivityResulter> mResulters;
    private boolean showNewsOnResume = false;
    private long lastUpdatedCounters = 0;

    static {
        ConnectivityManager cm = (ConnectivityManager) VKApplication.context.getSystemService("connectivity");
        NetworkInfo info = cm.getActiveNetworkInfo();
        if (info != null && info.isAvailable()) {
            NetworkStateReceiver.isConnected = true;
            NetworkStateReceiver.updateInfo(VKApplication.context);
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle bundle) {
        boolean z = false;
        super.onCreate(bundle);
        Analytics analytics = Analytics.getInstance();
        if (bundle == null) {
            z = true;
        }
        analytics.enableCheckForUpdates(z);
        FrameLayout contentView = new FitSystemWindowsFragmentWrapperFrameLayout(this);
        contentView.setId(R.id.fragment_wrapper);
        if (Build.VERSION.SDK_INT >= 21) {
            contentView.setFitsSystemWindows(true);
        }
        getNavigationDelegate().setContentView(contentView);
        if (VKAccountManager.getCurrent().isReal()) {
            ShortcutManagerWrapper.getInstance().ensureShortcuts(this);
            if (getIntent().hasExtra("class")) {
                FragmentHelper.replace(this, (Class) getIntent().getSerializableExtra("class"), getIntent().getBundleExtra("args"), getNavigationDelegate());
            } else if (bundle == null) {
                NewsFragment fragment = new NewsFragment();
                fragment.setArguments(new Bundle());
                getFragmentManager().beginTransaction().replace(R.id.fragment_wrapper, fragment, "news").commit();
            }
            try {
                final WebView webView = new WebView(this);
                CookieSyncManager.createInstance(VKApplication.context);
                CookieSyncManager.getInstance().sync();
                webView.getSettings().setBuiltInZoomControls(false);
                webView.setWebViewClient(new WebViewClient() { // from class: com.vkontakte.android.MainActivity.1
                    {
                        MainActivity.this = this;
                    }

                    @Override // android.webkit.WebViewClient
                    public boolean shouldOverrideUrlLoading(WebView view, String url) {
                        Network.getInstance().proxy().loadUrl(webView, url);
                        return true;
                    }

                    @Override // android.webkit.WebViewClient
                    public void onPageFinished(WebView webView2, String url) {
                        CookieSyncManager.getInstance().sync();
                        webView2.destroy();
                    }
                });
                Network.getInstance().proxy().loadUrl(webView, "https://m.vk.com/counters.php");
            } catch (Exception e) {
            }
            checkForIntro();
            return;
        }
        startActivityForResult(new Intent(this, AuthActivity.class), 100);
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateActivity, com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        if (VKApplication.isDeployApplication() && VKAccountManager.getCurrent().debugAvailable) {
            Analytics.getInstance().registerCrashReporter(this);
        }
        if (this.showNewsOnResume) {
            this.showNewsOnResume = false;
            NewsFragment fragment = new NewsFragment();
            getFragmentManager().beginTransaction().replace(R.id.fragment_wrapper, fragment, "news").commit();
        }
        if (Global.longPoll != null && System.currentTimeMillis() - this.lastUpdatedCounters > 10000) {
            LongPollService longPollService = Global.longPoll;
            LongPollService.updateCounters();
            this.lastUpdatedCounters = System.currentTimeMillis();
        }
        NetworkStateReceiver.getNotifications(this);
        NetworkStateReceiver.getAppNotifications(this);
    }

    private void checkForIntro() {
        int intro = VKAccountManager.getCurrent().getIntro();
        if ((intro & 1) > 0 || (intro & 2) > 0) {
            Intent intent = new Intent(this, SuggestionsActivity.class);
            if ((intro & 1) == 0) {
                intent.putExtra("groups", true);
            }
            startActivityForResult(intent, 101);
        }
    }

    public static void showAbout(final Context context) {
        int i = 2;
        try {
            Html.ImageGetter igetter = MainActivity$$Lambda$1.lambdaFactory$(context);
            AlertDialog.Builder dlg = new VKAlertDialog.Builder(context);
            if (Integer.parseInt(Build.VERSION.SDK) > 10) {
                Constructor<?> constructor = dlg.getClass().getConstructor(Context.class, Integer.TYPE);
                Object[] objArr = new Object[2];
                objArr[0] = context;
                if (Build.VERSION.SDK_INT >= 21) {
                    i = 4;
                }
                objArr[1] = Integer.valueOf(i);
                dlg = (AlertDialog.Builder) constructor.newInstance(objArr);
            }
            dlg.setTitle(context.getResources().getString(R.string.menu_about));
            dlg.setMessage(Html.fromHtml("<br/><img src='1'/><br/>" + context.getResources().getString(R.string.about_text, context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName, Integer.valueOf(context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode)), igetter, null));
            dlg.setPositiveButton("OK", (DialogInterface.OnClickListener) null);
            AlertDialog d = dlg.show();
            if (Build.VERSION.SDK_INT < 21) {
                d.getWindow().setBackgroundDrawableResource(R.drawable.transparent);
            }
            ((TextView) d.findViewById(16908299)).setLinkTextColor(-6300676);
            ((TextView) d.findViewById(16908299)).setHighlightColor(-2137007108);
            ((TextView) d.findViewById(16908299)).setGravity(1);
            ((TextView) d.findViewById(16908299)).setMovementMethod(LinkMovementMethod.getInstance());
            d.findViewById(16908299).setOnTouchListener(new View.OnTouchListener() { // from class: com.vkontakte.android.MainActivity.2
                int ccnt = 0;

                @Override // android.view.View.OnTouchListener
                public boolean onTouch(View v, MotionEvent event) {
                    this.ccnt++;
                    if (this.ccnt == 5) {
                        context.getSharedPreferences(null, 0).edit().putBoolean("sinv", true).commit();
                    }
                    return false;
                }
            });
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    public static /* synthetic */ Drawable lambda$showAbout$0(Context context, String arg0) {
        Drawable bmp = context.getResources().getDrawable(R.drawable.ic_about);
        bmp.setBounds(0, 0, bmp.getIntrinsicWidth(), bmp.getIntrinsicHeight());
        return bmp;
    }

    public void restartAfterLogout() {
        if (Build.VERSION.SDK_INT >= 16) {
            finishAffinity();
        }
        LogoutReceiver.sendLogout();
        Intent intent = new Intent(getApplicationContext(), MainActivity.class);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 100) {
            if (resultCode == -1) {
                L.e(VKAccountManager.getCurrent());
                NetworkStateReceiver.updateInfo(this);
                updateUserInfo();
                C2DM.checkForUpdate();
                startService(new Intent(this, LongPollService.class));
                this.showNewsOnResume = true;
                Friends.reload(false);
                Groups.reload(false);
                Stickers.get().reload();
                if (Global.longPoll != null) {
                    LongPollService longPollService = Global.longPoll;
                    LongPollService.updateCounters();
                }
                checkForIntro();
            } else {
                finish();
            }
        }
        if (requestCode == 101 && resultCode != -1) {
            finish();
        }
        if (this.mResulters != null) {
            for (ActivityResulter resulter : this.mResulters) {
                resulter.onActivityResult(requestCode, resultCode, data);
            }
        }
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void registerActivityResult(ActivityResulter result) {
        if (this.mResulters == null) {
            this.mResulters = new ArrayList();
        }
        this.mResulters.add(result);
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void unregisterActivityResult(ActivityResulter result) {
        if (this.mResulters != null) {
            this.mResulters.remove(result);
        }
    }

    private void setTextViewMarquee(TextView t) {
        if (t != null) {
            t.setEllipsize(TextUtils.TruncateAt.MARQUEE);
            t.setSelected(true);
            t.setHorizontalFadingEdgeEnabled(true);
            t.setFadingEdgeLength(Global.scale(10.0f));
            t.setMarqueeRepeatLimit(2);
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateActivity
    protected boolean isTopLevel() {
        return true;
    }
}
