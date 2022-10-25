package uk.co.senab.actionbarpulltorefresh.library.listeners;

import android.view.View;
/* loaded from: classes3.dex */
public interface HeaderViewListener {
    public static final int STATE_HIDDEN = 2;
    public static final int STATE_MINIMIZED = 1;
    public static final int STATE_VISIBLE = 0;

    void onStateChanged(View view, int i);
}
