package com.vkontakte.android.ui.navigation;

import android.app.Activity;
import android.app.Fragment;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import com.vkontakte.android.MainActivity;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.FragmentHelper;
/* loaded from: classes3.dex */
public abstract class NavigationDelegate {
    @NonNull
    final Activity activity;
    final boolean isTopLevel;

    public abstract Resources getResources(Resources resources);

    public abstract boolean onBackPressed();

    public abstract void onConfigurationChanged(Configuration configuration);

    public abstract boolean onNavigateUp();

    public abstract boolean onOptionsItemSelected(MenuItem menuItem);

    public abstract void onPrepareOptionsMenu(Menu menu);

    public abstract void onResume();

    public abstract void openFragment(Class<? extends Fragment> cls, @NonNull Bundle bundle, boolean z);

    public abstract void setContentView(View view);

    /* JADX INFO: Access modifiers changed from: package-private */
    public NavigationDelegate(@NonNull Activity activity, boolean isTopLevel) {
        this.activity = activity;
        this.isTopLevel = isTopLevel;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void openFragmentInner(Class<? extends Fragment> fClass, @NonNull Bundle args, boolean back) {
        if (back) {
            Navigate.to(fClass, args, this.activity);
        } else if (this.isTopLevel) {
            args.putBoolean("_from_menu", true);
            FragmentHelper.replace(this.activity, fClass, args, this);
        } else {
            this.activity.startActivity(new Navigator(fClass, MainActivity.class, args).intent(this.activity).addFlags(67108864));
        }
    }
}
