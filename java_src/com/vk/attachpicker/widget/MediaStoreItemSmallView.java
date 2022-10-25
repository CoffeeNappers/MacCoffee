package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.RecyclerView;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.RoundingParams;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.mediastore.DurationStaticLayouts;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.util.Fonts;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class MediaStoreItemSmallView extends LocalImageView {
    private static final long TIMEOUT_CLICK = 300;
    private static final Paint checkBgPaint;
    private static final StaticLayout infiniteLayout;
    private final RecyclerView.Adapter adapter;
    private Drawable bgGalleryCheck;
    private long downTime;
    private int downX;
    private int downY;
    private StaticLayout durationLayout;
    private Drawable foregroundDrawable;
    private final boolean hitClickEntireArea;
    private boolean mForegroundBoundsChanged;
    private final Rect mOverlayBounds;
    private final Rect mSelfBounds;
    private View.OnClickListener onClickListener;
    private final SelectionContext selectionContext;
    private int selectionPosition;
    private final boolean singleMode;
    private MediaStoreEntry storeEntry;
    private Drawable videoIcon;
    private static final StaticLayout[] countLayouts = new StaticLayout[99];
    public static final int CHECK_SIZE = Screen.dp(40);
    public static final int CHECK_CIRCLE_RADIUS = Screen.dp(10) + 1;
    private static final int sidePadding = Screen.dp(4);

    static {
        TextPaint tp = new TextPaint(1);
        tp.setTextSize(Screen.sp(14));
        tp.setColor(-1);
        tp.setTypeface(Fonts.getRobotoMedium());
        for (int i = 0; i < countLayouts.length; i++) {
            countLayouts[i] = new StaticLayout(String.valueOf(i + 1), tp, CHECK_CIRCLE_RADIUS * 2, Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
        }
        infiniteLayout = new StaticLayout("∞", tp, CHECK_CIRCLE_RADIUS * 2, Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
        checkBgPaint = new Paint(1);
    }

    public MediaStoreItemSmallView(Context context, SelectionContext selectionContext, RecyclerView.Adapter adapter, boolean singleMode, boolean hitClickEntireArea, int cornersRadius) {
        super(context);
        this.downX = -1;
        this.downY = -1;
        this.downTime = -1L;
        this.mSelfBounds = new Rect();
        this.mOverlayBounds = new Rect();
        this.mForegroundBoundsChanged = false;
        this.selectionPosition = -1;
        this.selectionContext = selectionContext;
        this.adapter = adapter;
        this.singleMode = singleMode;
        this.hitClickEntireArea = hitClickEntireArea;
        if (cornersRadius > 0) {
            RoundingParams roundingParams = RoundingParams.fromCornersRadius(cornersRadius);
            getHierarchy().setRoundingParams(roundingParams);
        }
        getHierarchy().setActualImageScaleType(ScalingUtils.ScaleType.CENTER_CROP);
        init();
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        this.onClickListener = l;
    }

    private void onCheckClick() {
        if (!SelectionContext.globalCheckLock.isLocked()) {
            SelectionContext.globalCheckLock.lock();
            if (this.selectionContext != null && this.storeEntry != null && !this.storeEntry.isCorrupted()) {
                if (this.selectionContext.isSelected(this.storeEntry)) {
                    this.selectionContext.removeSelection(this.storeEntry);
                    this.selectionPosition = -1;
                } else {
                    this.selectionPosition = this.selectionContext.addSelection(this.storeEntry);
                    if (this.selectionPosition < 0) {
                        Toast.makeText(getContext(), getResources().getString(R.string.picker_attachments_limit, Integer.valueOf(this.selectionContext.getLimit())), 0).show();
                    }
                }
                this.adapter.notifyDataSetChanged();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.GenericVKImageView, android.widget.ImageView, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(widthMeasureSpec), 1073741824));
    }

    private void init() {
        setScaleType(ImageView.ScaleType.CENTER_CROP);
        this.videoIcon = ContextCompat.getDrawable(getContext(), R.drawable.picker_ic_gallery_video_badge_24dp);
        this.foregroundDrawable = ContextCompat.getDrawable(getContext(), R.drawable.picker_white_ripple_bounded);
        this.foregroundDrawable.setCallback(this);
        this.bgGalleryCheck = ContextCompat.getDrawable(getContext(), R.drawable.picker_bg_gallery_check);
        checkBgPaint.setColor(ContextCompat.getColor(getContext(), R.color.picker_selection_blue));
    }

    public MediaStoreEntry getStoreEntry() {
        return this.storeEntry;
    }

    @Override // com.vk.attachpicker.widget.LocalImageView
    public void setImage(MediaStoreEntry image, boolean fullSize) {
        this.storeEntry = image;
        if (this.selectionContext != null) {
            this.selectionPosition = this.selectionContext.findSelectionPosition(image);
        } else {
            this.selectionPosition = -1;
        }
        if (image.isVideo && image.duration > 0) {
            this.durationLayout = DurationStaticLayouts.get(image.duration);
        } else {
            this.durationLayout = null;
        }
        super.setImage(image, fullSize);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        StaticLayout sl;
        super.onDraw(canvas);
        if (!this.singleMode && this.selectionContext != null && this.storeEntry != null && !this.storeEntry.isCorrupted()) {
            this.bgGalleryCheck.setBounds(canvas.getWidth() - CHECK_SIZE, 0, canvas.getWidth(), CHECK_SIZE);
            this.bgGalleryCheck.draw(canvas);
            if (this.selectionPosition >= 0 && this.selectionPosition < countLayouts.length) {
                sl = countLayouts[this.selectionPosition];
            } else if (this.selectionPosition >= countLayouts.length) {
                sl = infiniteLayout;
            } else {
                sl = null;
            }
            if (sl != null) {
                canvas.drawCircle(canvas.getWidth() - (CHECK_SIZE / 2), CHECK_SIZE / 2, CHECK_CIRCLE_RADIUS, checkBgPaint);
                int layoutWidth = (int) sl.getLineWidth(0);
                int count = canvas.save();
                canvas.translate((canvas.getWidth() - (CHECK_SIZE / 2)) - (layoutWidth / 2), (CHECK_SIZE / 2) - (sl.getHeight() / 2));
                sl.draw(canvas);
                canvas.restoreToCount(count);
            }
        }
        if (this.durationLayout != null) {
            int layoutWidth2 = (int) this.durationLayout.getLineWidth(0);
            int count2 = canvas.save();
            canvas.translate((canvas.getWidth() - layoutWidth2) - sidePadding, (canvas.getHeight() - this.durationLayout.getHeight()) - sidePadding);
            this.durationLayout.draw(canvas);
            canvas.restoreToCount(count2);
        }
        if (this.storeEntry != null && this.storeEntry.isVideo) {
            this.videoIcon.setBounds(sidePadding, (canvas.getHeight() - sidePadding) - this.videoIcon.getIntrinsicHeight(), sidePadding + this.videoIcon.getIntrinsicWidth(), canvas.getHeight() - sidePadding);
            this.videoIcon.draw(canvas);
        }
    }

    @Override // com.vk.imageloader.view.VKDraweeView, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.foregroundDrawable != null && Build.VERSION.SDK_INT >= 21) {
            this.foregroundDrawable.setHotspot(ev.getX(), ev.getY());
        }
        if (ev.getActionMasked() == 0 || ev.getActionMasked() == 5) {
            this.downX = (int) ev.getX();
            this.downY = (int) ev.getY();
            this.downTime = System.currentTimeMillis();
            return true;
        } else if (ev.getActionMasked() == 1 || ev.getActionMasked() == 6) {
            int upX = (int) ev.getX();
            int upY = (int) ev.getY();
            if (this.downX != -1 && this.downY != -1 && this.downTime != -1 && Math.abs(this.downX - upX) < Screen.dp(5) && Math.abs(this.downY - upY) < Screen.dp(5) && System.currentTimeMillis() - this.downTime < TIMEOUT_CLICK) {
                if (shouldCheckClick(upX, upY)) {
                    onCheckClick();
                } else if (this.onClickListener != null) {
                    this.onClickListener.onClick(this);
                }
            }
            this.downX = -1;
            this.downY = -1;
            this.downTime = -1L;
            return true;
        } else if (System.currentTimeMillis() - this.downTime <= TIMEOUT_CLICK) {
            return true;
        } else {
            if (this.onClickListener != null) {
                this.onClickListener.onClick(this);
            }
            this.downX = -1;
            this.downY = -1;
            this.downTime = -1L;
            return false;
        }
    }

    private boolean shouldCheckClick(int upX, int upY) {
        if (this.singleMode) {
            return false;
        }
        if (this.hitClickEntireArea) {
            return true;
        }
        int l = getMeasuredWidth() - CHECK_SIZE;
        int r = getMeasuredWidth();
        int b = CHECK_SIZE;
        return upX >= l && upX <= r && upY >= 0 && upY <= b;
    }

    @Override // android.widget.ImageView, android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return super.verifyDrawable(who) || who == this.foregroundDrawable;
    }

    @Override // android.widget.ImageView, android.view.View
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        if (this.foregroundDrawable != null) {
            this.foregroundDrawable.jumpToCurrentState();
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.foregroundDrawable != null && this.foregroundDrawable.isStateful()) {
            this.foregroundDrawable.setState(getDrawableState());
        }
    }

    @Override // android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        this.mForegroundBoundsChanged = changed;
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        this.mForegroundBoundsChanged = true;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.foregroundDrawable != null) {
            Drawable foreground = this.foregroundDrawable;
            if (this.mForegroundBoundsChanged) {
                this.mForegroundBoundsChanged = false;
                Rect selfBounds = this.mSelfBounds;
                Rect overlayBounds = this.mOverlayBounds;
                int w = getRight() - getLeft();
                int h = getBottom() - getTop();
                selfBounds.set(getPaddingLeft(), getPaddingTop(), w - getPaddingRight(), h - getPaddingBottom());
                Gravity.apply(119, foreground.getIntrinsicWidth(), foreground.getIntrinsicHeight(), selfBounds, overlayBounds);
                foreground.setBounds(overlayBounds);
            }
            foreground.draw(canvas);
        }
    }
}
