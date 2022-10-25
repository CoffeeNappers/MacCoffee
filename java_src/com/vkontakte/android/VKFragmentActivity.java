package com.vkontakte.android;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vkontakte.android.activities.LogoutReceiver;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
/* loaded from: classes2.dex */
public class VKFragmentActivity extends AppCompatActivity {
    private LogoutReceiver logoutReceiver = null;

    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        getWindow().setBackgroundDrawableResource(R.drawable.transparent);
        if (!isTaskRoot() && getActionBar() != null) {
            getActionBar().setDisplayHomeAsUpEnabled(true);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == 16908332) {
            onBackPressed();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        super.onPause();
        AppStateTracker.onActivityPaused();
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        AppStateTracker.onActivityResumed(this);
    }

    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration cfg) {
        super.onConfigurationChanged(cfg);
        setTitleMarquee();
    }

    @Override // android.app.Activity
    public void setTitle(CharSequence title) {
        super.setTitle(title);
        setTitleMarquee();
    }

    @Override // android.app.Activity
    public void setTitle(int res) {
        super.setTitle(res);
        setTitleMarquee();
    }

    private void setTitleMarquee() {
        if (getWindow().getDecorView() != null) {
            getWindow().getDecorView().postDelayed(VKFragmentActivity$$Lambda$1.lambdaFactory$(this), 100L);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$setTitleMarquee$0() {
        int btnId;
        try {
            int btnId2 = Resources.getSystem().getIdentifier("action_bar_title", "id", AbstractSpiCall.ANDROID_CLIENT_TYPE);
            if (btnId2 != 0) {
                setTextViewMarquee((TextView) findViewById(btnId2));
            }
            int btnId3 = Resources.getSystem().getIdentifier("action_bar_subtitle", "id", AbstractSpiCall.ANDROID_CLIENT_TYPE);
            if (btnId3 != 0) {
                setTextViewMarquee((TextView) findViewById(btnId3));
            }
            if (Build.VERSION.SDK_INT < 17 && (btnId = Resources.getSystem().getIdentifier("action_bar", "id", AbstractSpiCall.ANDROID_CLIENT_TYPE)) != 0) {
                ViewGroup vg = (ViewGroup) findViewById(btnId);
                for (int i = 0; i < vg.getChildCount(); i++) {
                    if (vg.getChildAt(i) instanceof LinearLayout) {
                        vg.getChildAt(i).setBackgroundDrawable(null);
                        return;
                    }
                }
            }
        } catch (Exception e) {
        }
    }

    private void setTextViewMarquee(TextView t) {
        t.setEllipsize(TextUtils.TruncateAt.MARQUEE);
        t.setSelected(true);
        t.setHorizontalFadingEdgeEnabled(true);
        t.setFadingEdgeLength(Global.scale(10.0f));
        t.setMarqueeRepeatLimit(2);
    }
}
