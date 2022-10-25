package me.grishka.appkit.views;

import android.support.annotation.ColorRes;
import android.support.v4.widget.SwipeRefreshLayout;
/* loaded from: classes3.dex */
public interface SwipeRefreshLayoutI {
    int getVisibility();

    boolean isReversed();

    boolean post(Runnable runnable);

    void setColorSchemeResources(@ColorRes int... iArr);

    void setEnabled(boolean z);

    void setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener onRefreshListener);

    void setRefreshing(boolean z);

    void setReversed(boolean z);

    void setVisibility(int i);
}
