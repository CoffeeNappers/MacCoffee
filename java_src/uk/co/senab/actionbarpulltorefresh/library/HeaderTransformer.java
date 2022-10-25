package uk.co.senab.actionbarpulltorefresh.library;

import android.app.Activity;
import android.content.res.Configuration;
import android.view.View;
/* loaded from: classes3.dex */
public abstract class HeaderTransformer {
    public abstract boolean hideHeaderView();

    public abstract boolean showHeaderView();

    public void onViewCreated(Activity activity, View headerView) {
    }

    public void onReset() {
    }

    public void onPulled(float percentagePulled) {
    }

    public void onRefreshStarted() {
    }

    public void onReleaseToRefresh() {
    }

    public void onRefreshMinimized() {
    }

    public void onConfigurationChanged(Activity activity, Configuration newConfig) {
    }
}
