package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.os.Build;
import android.view.View;
import android.widget.AbsListView;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;
/* loaded from: classes3.dex */
public class InverseAbsListViewDelegate implements ViewDelegate {
    public static final Class[] SUPPORTED_VIEW_CLASSES = {AbsListView.class};

    @Override // uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate
    public boolean isReadyForPull(View view, float x, float y) {
        boolean ready = false;
        AbsListView absListView = (AbsListView) view;
        if (absListView.getCount() == 0) {
            ready = true;
        } else if (absListView.getLastVisiblePosition() == absListView.getCount() - 1) {
            View firstVisibleChild = absListView.getChildAt(absListView.getChildCount() - 1);
            ready = firstVisibleChild != null && firstVisibleChild.getBottom() <= absListView.getHeight() - absListView.getPaddingBottom();
        }
        if (!ready || !absListView.isFastScrollEnabled() || !isFastScrollAlwaysVisible(absListView)) {
            return ready;
        }
        switch (getVerticalScrollbarPosition(absListView)) {
            case 1:
                return x > ((float) absListView.getVerticalScrollbarWidth());
            case 2:
                return x < ((float) (absListView.getRight() - absListView.getVerticalScrollbarWidth()));
            default:
                return ready;
        }
    }

    int getVerticalScrollbarPosition(AbsListView absListView) {
        return Build.VERSION.SDK_INT >= 11 ? CompatV11.getVerticalScrollbarPosition(absListView) : Compat.getVerticalScrollbarPosition(absListView);
    }

    boolean isFastScrollAlwaysVisible(AbsListView absListView) {
        return Build.VERSION.SDK_INT >= 11 ? CompatV11.isFastScrollAlwaysVisible(absListView) : Compat.isFastScrollAlwaysVisible(absListView);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class Compat {
        Compat() {
        }

        static int getVerticalScrollbarPosition(AbsListView absListView) {
            return 2;
        }

        static boolean isFastScrollAlwaysVisible(AbsListView absListView) {
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(11)
    /* loaded from: classes3.dex */
    public static class CompatV11 {
        CompatV11() {
        }

        static int getVerticalScrollbarPosition(AbsListView absListView) {
            return absListView.getVerticalScrollbarPosition();
        }

        static boolean isFastScrollAlwaysVisible(AbsListView absListView) {
            return absListView.isFastScrollAlwaysVisible();
        }
    }
}
