package com.vkontakte.android;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
/* loaded from: classes2.dex */
public class LoadMoreCommentsView extends FrameLayout {
    public LoadMoreCommentsView(Context context) {
        super(context);
    }

    public LoadMoreCommentsView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public void showProgress(boolean show) {
        int i = 4;
        findViewById(R.id.loadmore_progress).setVisibility(show ? 0 : 4);
        View findViewById = findViewById(R.id.loadmore_text);
        if (!show) {
            i = 0;
        }
        findViewById.setVisibility(i);
    }

    public void setNumComments(int n) {
        ((TextView) findViewById(R.id.loadmore_text)).setText(getResources().getQuantityString(R.plurals.wallview_comments, n, Integer.valueOf(n)));
    }
}
