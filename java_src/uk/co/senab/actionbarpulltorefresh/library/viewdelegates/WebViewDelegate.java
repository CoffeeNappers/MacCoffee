package uk.co.senab.actionbarpulltorefresh.library.viewdelegates;

import android.view.View;
import android.webkit.WebView;
/* loaded from: classes3.dex */
public class WebViewDelegate implements ViewDelegate {
    public static final Class[] SUPPORTED_VIEW_CLASSES = {WebView.class};

    @Override // uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate
    public boolean isReadyForPull(View view, float x, float y) {
        return view.getScrollY() <= 0;
    }
}
