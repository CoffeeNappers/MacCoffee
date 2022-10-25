package com.vkontakte.android;

import android.app.Fragment;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.view.MenuItem;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.HomeListener;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.FitSystemWindowsFragmentWrapperFrameLayout;
import com.vkontakte.android.ui.FragmentHelper;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.ui.navigation.NavigationDelegateActivity;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class FragmentWrapperActivity extends NavigationDelegateActivity implements ResulterProvider {
    public static final String DISABLE_DRAWER_LAYOUT_KEY = "disable_drawer_layout";
    public static final String FULLSCREEN_KEY = "fullscreen";
    public static final String ORIENTATION_KEY = "orientation";
    private List<ActivityResulter> mResulters;

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        Bundle bundle = getIntent().getBundleExtra("args");
        boolean disableDrawerLayout = false;
        if (bundle != null && bundle.containsKey(DISABLE_DRAWER_LAYOUT_KEY) && bundle.getBoolean(DISABLE_DRAWER_LAYOUT_KEY)) {
            disableDrawerLayout = true;
        }
        if (bundle != null && bundle.containsKey("fullscreen") && bundle.getBoolean("fullscreen")) {
            requestWindowFeature(1);
            getWindow().setFlags(1024, 1024);
        }
        if (bundle != null && bundle.containsKey(ORIENTATION_KEY)) {
            int orientation = bundle.getInt(ORIENTATION_KEY);
            switch (orientation) {
                case 0:
                    setRequestedOrientation(11);
                    break;
                case 1:
                    setRequestedOrientation(12);
                    break;
            }
        }
        super.onCreate(b);
        if (bundle != null && bundle.containsKey("theme")) {
            setTheme(bundle.getInt("theme"));
        }
        FrameLayout contentView = new FitSystemWindowsFragmentWrapperFrameLayout(this);
        contentView.setId(R.id.fragment_wrapper);
        if (Build.VERSION.SDK_INT >= 21) {
            contentView.setFitsSystemWindows(true);
        }
        setupMenu(contentView, disableDrawerLayout);
        if (b == null) {
            initFragment();
        }
    }

    @Nullable
    protected Fragment initFragment() {
        return FragmentHelper.replace(this, FragmentHelper.extractFragment(getIntent()), FragmentHelper.extractArgs(getIntent()), getNavigationDelegate());
    }

    private void setupMenu(View content, boolean disableDrawerLayout) {
        int intro = VKAccountManager.getCurrent().getIntro();
        if ((intro & 3) > 0) {
            setContentView(content);
        } else if (disableDrawerLayout) {
            if (Build.VERSION.SDK_INT >= 21) {
                getWindow().setStatusBarColor(-12886137);
            }
            setContentView(content);
        } else {
            getNavigationDelegate().setContentView(content);
        }
    }

    @Override // android.app.Activity
    public void setTitle(@StringRes int res) {
        setTitle(getString(res));
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        super.onPause();
        AppStateTracker.onActivityPaused();
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateActivity, com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        AppStateTracker.onActivityResumed(this);
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateActivity, com.vkontakte.android.VKActivity, android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == 16908332) {
            Fragment f = getFragmentManager().findFragmentById(R.id.fragment_wrapper);
            if ((f instanceof HomeListener) && ((HomeListener) f).onHomePressed()) {
                return true;
            }
            onBackPressed();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
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

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateActivity
    protected boolean isTopLevel() {
        return false;
    }
}
