package uk.co.senab.actionbarpulltorefresh.library.viewdelegates;

import android.view.View;
import android.widget.ScrollView;
/* loaded from: classes3.dex */
public class ScrollYDelegate implements ViewDelegate {
    public static final Class[] SUPPORTED_VIEW_CLASSES = {ScrollView.class};

    @Override // uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate
    public boolean isReadyForPull(View view, float x, float y) {
        return view.getScrollY() <= 0;
    }
}
