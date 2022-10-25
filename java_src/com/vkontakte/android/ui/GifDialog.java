package com.vkontakte.android.ui;

import android.app.Dialog;
import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import com.vkontakte.android.Global;
import com.vkontakte.android.ui.GifView;
/* loaded from: classes3.dex */
public class GifDialog extends Dialog {
    private GifView gifView;
    private ProgressBar progress;

    public GifDialog(Context context) {
        super(context);
        requestWindowFeature(1);
    }

    public void init(String url) {
        if (this.gifView != null) {
            throw new IllegalStateException("Already initialized");
        }
        this.gifView = new GifView(getContext());
        this.gifView.setProgressCallback(new GifView.ProgressCallback() { // from class: com.vkontakte.android.ui.GifDialog.1
            @Override // com.vkontakte.android.ui.GifView.ProgressCallback
            public void setProgress(final int loaded, final int total) {
                GifDialog.this.progress.post(new Runnable() { // from class: com.vkontakte.android.ui.GifDialog.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        GifDialog.this.progress.setMax(total);
                        GifDialog.this.progress.setProgress(loaded);
                    }
                });
            }

            @Override // com.vkontakte.android.ui.GifView.ProgressCallback
            public void hideProgressBar() {
                GifDialog.this.progress.post(new Runnable() { // from class: com.vkontakte.android.ui.GifDialog.1.2
                    @Override // java.lang.Runnable
                    public void run() {
                        GifDialog.this.progress.setVisibility(8);
                    }
                });
            }
        });
        FrameLayout content = new FrameLayout(getContext());
        content.addView(this.gifView);
        this.progress = new ProgressBar(getContext(), null, 16974021);
        this.progress.setIndeterminate(false);
        CircularProgressDrawable cpd = new CircularProgressDrawable(false);
        cpd.setColors(1342177280, ViewCompat.MEASURED_STATE_MASK);
        cpd.setDimBackground(false);
        cpd.setPad(false);
        this.progress.setProgressDrawable(cpd);
        content.addView(this.progress, new FrameLayout.LayoutParams(Global.scale(40.0f), Global.scale(40.0f), 17));
        setContentView(content);
        this.gifView.loadURL(url);
    }
}
