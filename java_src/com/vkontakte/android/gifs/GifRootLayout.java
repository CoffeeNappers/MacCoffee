package com.vkontakte.android.gifs;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.annotation.Size;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.widget.ViewDragHelper;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public final class GifRootLayout extends FrameLayout {
    View mBottomBar;
    final ViewDragHelper.Callback mCallback;
    final ViewDragHelper mDragHelper;
    View mDraggableView;
    int mDraggableXOffset;
    int mDraggableYOffset;
    View.OnKeyListener mKeyListener;
    Callback mNavigationCallback;
    final Paint mOverlayPaint;
    @Nullable
    Rect mOverlayRect;
    final int[] mPositionOnScreen;
    final Drawable mScripBottom;
    final Drawable mScripTop;
    View mToolbar;

    /* loaded from: classes3.dex */
    public interface Callback {
        void finishWithoutAnimation();

        @Size(2)
        @Nullable
        int[] getClipTopBottom();

        @Nullable
        Rect getViewLocation();

        boolean hasPreviewLocationData();
    }

    public GifRootLayout(Context context) {
        super(context);
        this.mCallback = new ViewDragHelper.Callback() { // from class: com.vkontakte.android.gifs.GifRootLayout.1
            boolean mCaptured;

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public boolean tryCaptureView(View child, int pointerId) {
                boolean z = child == GifRootLayout.this.mDraggableView;
                this.mCaptured = z;
                return z;
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
                float offset = (top + changedView.getHeight()) / (GifRootLayout.this.getHeight() + changedView.getHeight());
                float percent = 1.0f - (Math.abs(0.5f - offset) * 2.0f);
                GifRootLayout.this.setBackgroundAlpha((int) (255.0f * percent));
                if (percent == 0.0f && !this.mCaptured && GifRootLayout.this.mNavigationCallback != null) {
                    GifRootLayout.this.mNavigationCallback.finishWithoutAnimation();
                }
                GifRootLayout.this.invalidate();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public void onViewReleased(View releasedChild, float xvel, float yvel) {
                float offset = (releasedChild.getTop() + (releasedChild.getHeight() >> 1)) / GifRootLayout.this.getHeight();
                this.mCaptured = false;
                if (yvel > 0.0f || (yvel == 0.0f && offset > 0.75f)) {
                    if (GifRootLayout.this.mNavigationCallback != null && GifRootLayout.this.mNavigationCallback.hasPreviewLocationData()) {
                        GifRootLayout.this.performBack();
                    } else {
                        GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), GifRootLayout.this.getHeight());
                    }
                } else if (yvel < 0.0f || (yvel == 0.0f && offset < 0.25f)) {
                    if (GifRootLayout.this.mNavigationCallback != null && GifRootLayout.this.mNavigationCallback.hasPreviewLocationData()) {
                        GifRootLayout.this.performBack();
                    } else {
                        GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), -releasedChild.getHeight());
                    }
                } else {
                    GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), (GifRootLayout.this.getHeight() - releasedChild.getHeight()) >> 1);
                }
                GifRootLayout.this.invalidate();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int getViewHorizontalDragRange(View child) {
                return GifRootLayout.this.getWidth();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int clampViewPositionHorizontal(View child, int left, int dx) {
                return child.getLeft();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int clampViewPositionVertical(View child, int top, int dy) {
                int topBound = GifRootLayout.this.getPaddingTop() - child.getHeight();
                int bottomBound = GifRootLayout.this.getHeight();
                return Math.min(Math.max(top, topBound), bottomBound);
            }
        };
        this.mDragHelper = ViewDragHelper.create(this, 5000.0f, this.mCallback);
        this.mOverlayPaint = new Paint();
        this.mPositionOnScreen = new int[2];
        this.mDragHelper.setMinVelocity(V.dp(400.0f));
        setWillNotDraw(true);
        this.mScripTop = getResources().getDrawable(R.drawable.scrim_top);
        this.mScripBottom = getResources().getDrawable(R.drawable.scrim_bottom);
        this.mOverlayPaint.setColor(-1);
        if (Build.VERSION.SDK_INT < 20) {
            return;
        }
        setFitsSystemWindows(true);
        setClipChildren(false);
        setClipToPadding(false);
        setSystemUiVisibility(1792);
    }

    public GifRootLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCallback = new ViewDragHelper.Callback() { // from class: com.vkontakte.android.gifs.GifRootLayout.1
            boolean mCaptured;

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public boolean tryCaptureView(View child, int pointerId) {
                boolean z = child == GifRootLayout.this.mDraggableView;
                this.mCaptured = z;
                return z;
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
                float offset = (top + changedView.getHeight()) / (GifRootLayout.this.getHeight() + changedView.getHeight());
                float percent = 1.0f - (Math.abs(0.5f - offset) * 2.0f);
                GifRootLayout.this.setBackgroundAlpha((int) (255.0f * percent));
                if (percent == 0.0f && !this.mCaptured && GifRootLayout.this.mNavigationCallback != null) {
                    GifRootLayout.this.mNavigationCallback.finishWithoutAnimation();
                }
                GifRootLayout.this.invalidate();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public void onViewReleased(View releasedChild, float xvel, float yvel) {
                float offset = (releasedChild.getTop() + (releasedChild.getHeight() >> 1)) / GifRootLayout.this.getHeight();
                this.mCaptured = false;
                if (yvel > 0.0f || (yvel == 0.0f && offset > 0.75f)) {
                    if (GifRootLayout.this.mNavigationCallback != null && GifRootLayout.this.mNavigationCallback.hasPreviewLocationData()) {
                        GifRootLayout.this.performBack();
                    } else {
                        GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), GifRootLayout.this.getHeight());
                    }
                } else if (yvel < 0.0f || (yvel == 0.0f && offset < 0.25f)) {
                    if (GifRootLayout.this.mNavigationCallback != null && GifRootLayout.this.mNavigationCallback.hasPreviewLocationData()) {
                        GifRootLayout.this.performBack();
                    } else {
                        GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), -releasedChild.getHeight());
                    }
                } else {
                    GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), (GifRootLayout.this.getHeight() - releasedChild.getHeight()) >> 1);
                }
                GifRootLayout.this.invalidate();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int getViewHorizontalDragRange(View child) {
                return GifRootLayout.this.getWidth();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int clampViewPositionHorizontal(View child, int left, int dx) {
                return child.getLeft();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int clampViewPositionVertical(View child, int top, int dy) {
                int topBound = GifRootLayout.this.getPaddingTop() - child.getHeight();
                int bottomBound = GifRootLayout.this.getHeight();
                return Math.min(Math.max(top, topBound), bottomBound);
            }
        };
        this.mDragHelper = ViewDragHelper.create(this, 5000.0f, this.mCallback);
        this.mOverlayPaint = new Paint();
        this.mPositionOnScreen = new int[2];
        this.mDragHelper.setMinVelocity(V.dp(400.0f));
        setWillNotDraw(true);
        this.mScripTop = getResources().getDrawable(R.drawable.scrim_top);
        this.mScripBottom = getResources().getDrawable(R.drawable.scrim_bottom);
        this.mOverlayPaint.setColor(-1);
        if (Build.VERSION.SDK_INT < 20) {
            return;
        }
        setFitsSystemWindows(true);
        setClipChildren(false);
        setClipToPadding(false);
        setSystemUiVisibility(1792);
    }

    public GifRootLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCallback = new ViewDragHelper.Callback() { // from class: com.vkontakte.android.gifs.GifRootLayout.1
            boolean mCaptured;

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public boolean tryCaptureView(View child, int pointerId) {
                boolean z = child == GifRootLayout.this.mDraggableView;
                this.mCaptured = z;
                return z;
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
                float offset = (top + changedView.getHeight()) / (GifRootLayout.this.getHeight() + changedView.getHeight());
                float percent = 1.0f - (Math.abs(0.5f - offset) * 2.0f);
                GifRootLayout.this.setBackgroundAlpha((int) (255.0f * percent));
                if (percent == 0.0f && !this.mCaptured && GifRootLayout.this.mNavigationCallback != null) {
                    GifRootLayout.this.mNavigationCallback.finishWithoutAnimation();
                }
                GifRootLayout.this.invalidate();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public void onViewReleased(View releasedChild, float xvel, float yvel) {
                float offset = (releasedChild.getTop() + (releasedChild.getHeight() >> 1)) / GifRootLayout.this.getHeight();
                this.mCaptured = false;
                if (yvel > 0.0f || (yvel == 0.0f && offset > 0.75f)) {
                    if (GifRootLayout.this.mNavigationCallback != null && GifRootLayout.this.mNavigationCallback.hasPreviewLocationData()) {
                        GifRootLayout.this.performBack();
                    } else {
                        GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), GifRootLayout.this.getHeight());
                    }
                } else if (yvel < 0.0f || (yvel == 0.0f && offset < 0.25f)) {
                    if (GifRootLayout.this.mNavigationCallback != null && GifRootLayout.this.mNavigationCallback.hasPreviewLocationData()) {
                        GifRootLayout.this.performBack();
                    } else {
                        GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), -releasedChild.getHeight());
                    }
                } else {
                    GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), (GifRootLayout.this.getHeight() - releasedChild.getHeight()) >> 1);
                }
                GifRootLayout.this.invalidate();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int getViewHorizontalDragRange(View child) {
                return GifRootLayout.this.getWidth();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int clampViewPositionHorizontal(View child, int left, int dx) {
                return child.getLeft();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int clampViewPositionVertical(View child, int top, int dy) {
                int topBound = GifRootLayout.this.getPaddingTop() - child.getHeight();
                int bottomBound = GifRootLayout.this.getHeight();
                return Math.min(Math.max(top, topBound), bottomBound);
            }
        };
        this.mDragHelper = ViewDragHelper.create(this, 5000.0f, this.mCallback);
        this.mOverlayPaint = new Paint();
        this.mPositionOnScreen = new int[2];
        this.mDragHelper.setMinVelocity(V.dp(400.0f));
        setWillNotDraw(true);
        this.mScripTop = getResources().getDrawable(R.drawable.scrim_top);
        this.mScripBottom = getResources().getDrawable(R.drawable.scrim_bottom);
        this.mOverlayPaint.setColor(-1);
        if (Build.VERSION.SDK_INT < 20) {
            return;
        }
        setFitsSystemWindows(true);
        setClipChildren(false);
        setClipToPadding(false);
        setSystemUiVisibility(1792);
    }

    @TargetApi(21)
    public GifRootLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mCallback = new ViewDragHelper.Callback() { // from class: com.vkontakte.android.gifs.GifRootLayout.1
            boolean mCaptured;

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public boolean tryCaptureView(View child, int pointerId) {
                boolean z = child == GifRootLayout.this.mDraggableView;
                this.mCaptured = z;
                return z;
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
                float offset = (top + changedView.getHeight()) / (GifRootLayout.this.getHeight() + changedView.getHeight());
                float percent = 1.0f - (Math.abs(0.5f - offset) * 2.0f);
                GifRootLayout.this.setBackgroundAlpha((int) (255.0f * percent));
                if (percent == 0.0f && !this.mCaptured && GifRootLayout.this.mNavigationCallback != null) {
                    GifRootLayout.this.mNavigationCallback.finishWithoutAnimation();
                }
                GifRootLayout.this.invalidate();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public void onViewReleased(View releasedChild, float xvel, float yvel) {
                float offset = (releasedChild.getTop() + (releasedChild.getHeight() >> 1)) / GifRootLayout.this.getHeight();
                this.mCaptured = false;
                if (yvel > 0.0f || (yvel == 0.0f && offset > 0.75f)) {
                    if (GifRootLayout.this.mNavigationCallback != null && GifRootLayout.this.mNavigationCallback.hasPreviewLocationData()) {
                        GifRootLayout.this.performBack();
                    } else {
                        GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), GifRootLayout.this.getHeight());
                    }
                } else if (yvel < 0.0f || (yvel == 0.0f && offset < 0.25f)) {
                    if (GifRootLayout.this.mNavigationCallback != null && GifRootLayout.this.mNavigationCallback.hasPreviewLocationData()) {
                        GifRootLayout.this.performBack();
                    } else {
                        GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), -releasedChild.getHeight());
                    }
                } else {
                    GifRootLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), (GifRootLayout.this.getHeight() - releasedChild.getHeight()) >> 1);
                }
                GifRootLayout.this.invalidate();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int getViewHorizontalDragRange(View child) {
                return GifRootLayout.this.getWidth();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int clampViewPositionHorizontal(View child, int left, int dx) {
                return child.getLeft();
            }

            @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
            public int clampViewPositionVertical(View child, int top, int dy) {
                int topBound = GifRootLayout.this.getPaddingTop() - child.getHeight();
                int bottomBound = GifRootLayout.this.getHeight();
                return Math.min(Math.max(top, topBound), bottomBound);
            }
        };
        this.mDragHelper = ViewDragHelper.create(this, 5000.0f, this.mCallback);
        this.mOverlayPaint = new Paint();
        this.mPositionOnScreen = new int[2];
        this.mDragHelper.setMinVelocity(V.dp(400.0f));
        setWillNotDraw(true);
        this.mScripTop = getResources().getDrawable(R.drawable.scrim_top);
        this.mScripBottom = getResources().getDrawable(R.drawable.scrim_bottom);
        this.mOverlayPaint.setColor(-1);
        if (Build.VERSION.SDK_INT < 20) {
            return;
        }
        setFitsSystemWindows(true);
        setClipChildren(false);
        setClipToPadding(false);
        setSystemUiVisibility(1792);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mDraggableView = findViewById(R.id.drag);
        this.mToolbar = findViewById(R.id.toolbar);
        this.mBottomBar = findViewById(R.id.photo_viewer_bottom_panel);
        setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
    }

    @Override // android.view.View
    @TargetApi(20)
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        return insets.consumeSystemWindowInsets();
    }

    @Override // android.view.ViewGroup, android.view.View
    @TargetApi(20)
    public WindowInsets dispatchApplyWindowInsets(WindowInsets insets) {
        ((ViewGroup.MarginLayoutParams) this.mToolbar.getLayoutParams()).topMargin = insets.getSystemWindowInsetTop();
        ((ViewGroup.MarginLayoutParams) this.mBottomBar.getLayoutParams()).bottomMargin = insets.getSystemWindowInsetBottom();
        return insets;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        this.mDraggableView.offsetLeftAndRight(this.mDraggableXOffset);
        this.mDraggableView.offsetTopAndBottom(this.mDraggableYOffset);
    }

    @Override // android.view.View
    public void computeScroll() {
        if (this.mDragHelper.continueSettling(true)) {
            ViewCompat.postInvalidateOnAnimation(this);
            return;
        }
        this.mDraggableXOffset = this.mDraggableView.getLeft();
        this.mDraggableYOffset = this.mDraggableView.getTop();
    }

    @Override // android.view.ViewGroup
    protected boolean drawChild(Canvas canvas, View child, long drawingTime) {
        if (child == this.mToolbar) {
            this.mScripTop.setBounds(0, 0, getWidth(), this.mToolbar.getBottom());
            this.mScripTop.draw(canvas);
        }
        if (child == this.mBottomBar) {
            this.mScripBottom.setBounds(0, this.mBottomBar.getTop(), getWidth(), getHeight());
            this.mScripBottom.draw(canvas);
        }
        return super.drawChild(canvas, child, drawingTime);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        return this.mDragHelper.shouldInterceptTouchEvent(ev);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        this.mDragHelper.processTouchEvent(ev);
        return true;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        if (this.mNavigationCallback != null && this.mNavigationCallback.hasPreviewLocationData()) {
            if (this.mOverlayRect == null) {
                this.mOverlayRect = this.mNavigationCallback.getViewLocation();
                int[] topBottom = this.mNavigationCallback.getClipTopBottom();
                this.mOverlayRect.top += topBottom[0];
                this.mOverlayRect.bottom -= topBottom[1];
            }
            getLocationOnScreen(this.mPositionOnScreen);
            canvas.save();
            canvas.translate(0.0f, -this.mPositionOnScreen[1]);
            canvas.clipRect(0, getPaddingTop(), canvas.getWidth(), canvas.getHeight() - getPaddingBottom());
            canvas.drawRect(this.mOverlayRect, this.mOverlayPaint);
            canvas.restore();
        }
        super.draw(canvas);
    }

    public void setBackgroundAlpha(int alpha) {
        Drawable background = getBackground();
        if (background != null) {
            background.setAlpha(alpha);
            this.mScripTop.setAlpha(alpha);
            this.mScripBottom.setAlpha(alpha);
            this.mBottomBar.setAlpha(alpha / 255.0f);
            this.mToolbar.setAlpha(alpha / 255.0f);
        }
    }

    public int getBackgroundAlpha() {
        Drawable background = getBackground();
        if (background == null || Build.VERSION.SDK_INT < 19) {
            return 0;
        }
        return background.getAlpha();
    }

    public void setNavigationProvider(@Nullable Callback provider) {
        this.mNavigationCallback = provider;
    }

    @Override // android.view.View
    public void setOnKeyListener(View.OnKeyListener l) {
        super.setOnKeyListener(l);
        this.mKeyListener = l;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent event) {
        return (this.mKeyListener != null && this.mKeyListener.onKey(this, event.getKeyCode(), event)) || super.dispatchKeyEvent(event);
    }

    void performBack() {
        dispatchKeyEvent(new KeyEvent(1, 4));
    }
}
