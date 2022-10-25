package com.my.target.nativeads.views;

import android.content.Context;
import android.graphics.PorterDuff;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import com.my.target.core.resources.a;
import com.my.target.core.ui.views.CacheImageView;
import com.my.target.core.utils.l;
/* loaded from: classes2.dex */
public class MediaAdView extends RelativeLayout {
    protected static final int COLOR_PLACEHOLDER_GRAY = -1118482;
    private static final String IMAGE_CONTENT_DESCRIPTION = "mvmi";
    private static final String PLAY_BUTTON_CONTENT_DESCRIPTION = "mvpb";
    private static final String PROGRESS_BAR_CONTENT_DESCRIPTION = "mvpr";
    private final CacheImageView imageView;
    private int placeholderHeight;
    private int placeholderWidth;
    private final CacheImageView playButton;
    private final ProgressBar progressBar;

    public MediaAdView(Context context) {
        super(context);
        this.imageView = new CacheImageView(context);
        this.playButton = new CacheImageView(context);
        this.progressBar = new ProgressBar(context, null, 16842871);
        initViews(context);
    }

    public MediaAdView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.imageView = new CacheImageView(context);
        this.playButton = new CacheImageView(context);
        this.progressBar = new ProgressBar(context, null, 16842871);
        initViews(context);
    }

    public MediaAdView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.imageView = new CacheImageView(context);
        this.playButton = new CacheImageView(context);
        this.progressBar = new ProgressBar(context, null, 16842871);
        initViews(context);
    }

    private void initViews(Context context) {
        setBackgroundColor(COLOR_PLACEHOLDER_GRAY);
        this.imageView.setContentDescription(IMAGE_CONTENT_DESCRIPTION);
        addView(this.imageView, new RelativeLayout.LayoutParams(-1, -2));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13, -1);
        this.progressBar.setContentDescription(PROGRESS_BAR_CONTENT_DESCRIPTION);
        this.progressBar.setVisibility(8);
        this.progressBar.getIndeterminateDrawable().setColorFilter(-16733198, PorterDuff.Mode.SRC_ATOP);
        addView(this.progressBar, layoutParams);
        l lVar = new l(context);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(13, -1);
        this.playButton.setContentDescription(PLAY_BUTTON_CONTENT_DESCRIPTION);
        this.playButton.setImageBitmap(a.b(lVar.a(64)));
        this.playButton.setVisibility(8);
        addView(this.playButton, layoutParams2);
    }

    public ProgressBar getProgressBarView() {
        return this.progressBar;
    }

    public CacheImageView getImageView() {
        return this.imageView;
    }

    public View getPlayButtonView() {
        return this.playButton;
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        int i3;
        int i4 = 0;
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        int i5 = mode == 0 ? Integer.MIN_VALUE : mode;
        if (mode2 == 0) {
            mode2 = Integer.MIN_VALUE;
        }
        if (this.placeholderHeight == 0 || this.placeholderWidth == 0) {
            super.onMeasure(i, i2);
            return;
        }
        float f = this.placeholderWidth / this.placeholderHeight;
        float f2 = 0.0f;
        if (size2 != 0) {
            f2 = size / size2;
        }
        if (i5 == 1073741824 && mode2 == 1073741824) {
            i3 = size;
            i4 = size2;
        } else if (i5 == Integer.MIN_VALUE && mode2 == Integer.MIN_VALUE) {
            if (f < f2) {
                i3 = Math.round(size2 * f);
                if (size <= 0 || i3 <= size) {
                    i4 = size2;
                } else {
                    i4 = Math.round(size / f);
                    i3 = size;
                }
            } else {
                i4 = Math.round(size / f);
                if (size2 <= 0 || i4 <= size2) {
                    i3 = size;
                } else {
                    i3 = Math.round(size2 * f);
                    i4 = size2;
                }
            }
        } else if (i5 == Integer.MIN_VALUE && mode2 == 1073741824) {
            i3 = Math.round(size2 * f);
            if (size <= 0 || i3 <= size) {
                i4 = size2;
            } else {
                i4 = Math.round(size / f);
                i3 = size;
            }
        } else if (i5 == 1073741824 && mode2 == Integer.MIN_VALUE) {
            i4 = Math.round(size / f);
            if (size2 <= 0 || i4 <= size2) {
                i3 = size;
            } else {
                i3 = Math.round(size2 * f);
                i4 = size2;
            }
        } else {
            i3 = 0;
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(i3, 1073741824), View.MeasureSpec.makeMeasureSpec(i4, 1073741824));
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        super.onTouchEvent(motionEvent);
        return true;
    }

    public void setPlaceHolderDimension(int i, int i2) {
        this.placeholderWidth = i;
        this.placeholderHeight = i2;
    }
}
