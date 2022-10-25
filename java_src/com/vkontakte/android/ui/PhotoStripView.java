package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.SparseIntArray;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.facebook.drawee.generic.RoundingParams;
import com.vk.imageloader.view.VKMultiImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.OsUtil;
import java.util.List;
/* loaded from: classes3.dex */
public class PhotoStripView extends VKMultiImageView {
    private SparseIntArray alpha;
    private GestureDetector.SimpleOnGestureListener gListener;
    private GestureDetector gestureDetector;
    private OnPhotoClickListener listener;
    private Drawable moreIcon;
    private float offset;
    private float overlap;
    private Path overlapShape;
    private int padding;
    private boolean showMoreIcon;

    /* loaded from: classes3.dex */
    public interface OnPhotoClickListener {
        void onPhotoClick(PhotoStripView photoStripView, int i);
    }

    public PhotoStripView(Context context) {
        super(context);
        this.alpha = new SparseIntArray();
        this.padding = Global.scale(3.0f);
        this.gListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.vkontakte.android.ui.PhotoStripView.1
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent ev) {
                int index = (int) (ev.getX() / (PhotoStripView.this.getHeight() + PhotoStripView.this.padding));
                if (index < PhotoStripView.this.draweeHolder.size()) {
                    PhotoStripView.this.playSoundEffect(0);
                    if (PhotoStripView.this.listener != null) {
                        PhotoStripView.this.listener.onPhotoClick(PhotoStripView.this, index);
                        return true;
                    }
                    return true;
                }
                return true;
            }
        };
        this.offset = 0.0f;
        this.overlap = 1.0f;
        this.showMoreIcon = false;
        init();
    }

    public PhotoStripView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.alpha = new SparseIntArray();
        this.padding = Global.scale(3.0f);
        this.gListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.vkontakte.android.ui.PhotoStripView.1
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent ev) {
                int index = (int) (ev.getX() / (PhotoStripView.this.getHeight() + PhotoStripView.this.padding));
                if (index < PhotoStripView.this.draweeHolder.size()) {
                    PhotoStripView.this.playSoundEffect(0);
                    if (PhotoStripView.this.listener != null) {
                        PhotoStripView.this.listener.onPhotoClick(PhotoStripView.this, index);
                        return true;
                    }
                    return true;
                }
                return true;
            }
        };
        this.offset = 0.0f;
        this.overlap = 1.0f;
        this.showMoreIcon = false;
        init();
    }

    public PhotoStripView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.alpha = new SparseIntArray();
        this.padding = Global.scale(3.0f);
        this.gListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.vkontakte.android.ui.PhotoStripView.1
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent ev) {
                int index = (int) (ev.getX() / (PhotoStripView.this.getHeight() + PhotoStripView.this.padding));
                if (index < PhotoStripView.this.draweeHolder.size()) {
                    PhotoStripView.this.playSoundEffect(0);
                    if (PhotoStripView.this.listener != null) {
                        PhotoStripView.this.listener.onPhotoClick(PhotoStripView.this, index);
                        return true;
                    }
                    return true;
                }
                return true;
            }
        };
        this.offset = 0.0f;
        this.overlap = 1.0f;
        this.showMoreIcon = false;
        init();
    }

    private void init() {
        this.gestureDetector = new GestureDetector(getContext(), this.gListener);
        this.overlapShape = new Path();
        this.moreIcon = getResources().getDrawable(R.drawable.ic_post_morelikes);
        if (!OsUtil.isAtLeastJB_MR2()) {
            setLayerType(1, null);
        }
    }

    public void setCount(int count) {
        reset();
        for (int i = 0; i < count; i++) {
            addImage();
            this.draweeHolder.get(i).getHierarchy().setRoundingParams(RoundingParams.asCircle());
            this.draweeHolder.get(i).getHierarchy().setPlaceholderImage(getResources().getDrawable(R.drawable.placeholder_user_72dp));
        }
        requestLayout();
    }

    public void load(List<String> urls) {
        load(urls, -1);
    }

    public void load(String[] urls) {
        load(urls, -1);
    }

    public void load(String[] urls, int maxCount) {
        int count;
        if (maxCount >= 0) {
            count = Math.min(urls.length, maxCount);
        } else {
            count = urls.length;
        }
        setCount(count);
        for (int i = 0; i < count; i++) {
            load(i, urls[i]);
        }
    }

    public void load(List<String> urls, int maxCount) {
        int count;
        if (maxCount >= 0) {
            count = Math.min(urls.size(), maxCount);
        } else {
            count = urls.size();
        }
        setCount(count);
        for (int i = 0; i < count; i++) {
            load(i, urls.get(i));
        }
    }

    public void setOffset(float offset) {
        this.offset = offset;
        invalidate();
    }

    public float getOffset() {
        return this.offset;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.listener == null || this.overlap != 1.0f) {
            return super.onTouchEvent(ev);
        }
        this.gestureDetector.onTouchEvent(ev);
        return true;
    }

    public void setListener(OnPhotoClickListener l) {
        this.listener = l;
    }

    public void setPadding(int padding) {
        this.padding = padding;
        invalidate();
    }

    public void setOverlapOffset(float overlap) {
        this.overlap = overlap;
        int size = getHeight();
        this.overlapShape.reset();
        this.overlapShape.setFillType(Path.FillType.EVEN_ODD);
        if (overlap != 1.0f) {
            float r = size / 2;
            float s = (size / 2) + (this.padding / 2);
            float a = size / 2;
            float b = size / 2;
            float c = (-s) + (2.0f * s * (1.0f - overlap));
            float d = size / 2;
            this.overlapShape.addCircle(a, b, r + 0.5f, Path.Direction.CW);
            this.overlapShape.addCircle(c, d, s + 0.5f, Path.Direction.CW);
            invalidate();
        }
    }

    public void setShowMoreIcon(boolean show) {
        this.showMoreIcon = show;
        invalidate();
    }

    public void setBitmapAlpha(int index, int alpha) {
        if (alpha == 255) {
            this.alpha.delete(index);
        } else {
            this.alpha.append(index, alpha);
        }
        invalidate();
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int h = View.MeasureSpec.getSize(heightMeasureSpec);
        int w = View.MeasureSpec.getSize(widthMeasureSpec);
        if (View.MeasureSpec.getMode(widthMeasureSpec) == 1073741824) {
            setMeasuredDimension(w, h);
        } else if (this.overlap < 1.0f) {
            int ww = 0;
            if (getCount() > 0) {
                ww = 0 + this.padding + h;
            }
            if (getCount() > 1) {
                ww = (int) (ww + ((getCount() - 1) * h * this.overlap) + (this.padding * (getCount() - 2)));
            }
            setMeasuredDimension(ww, h);
        } else {
            setMeasuredDimension((this.padding + h) * getCount(), h);
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        setOverlapOffset(this.overlap);
    }

    @Override // android.view.View
    public void onDraw(Canvas c) {
        super.onDraw(c);
        int size = getHeight();
        int sizePadding = size + this.padding;
        for (int i = 0; i < size(); i++) {
            int x = (sizePadding * i) - Math.round(this.offset * sizePadding);
            if (i > 0 && this.overlap < 1.0f) {
                x = (int) (x - ((size * (1.0f - this.overlap)) * i));
            }
            if (x + size > c.getWidth() - (this.showMoreIcon ? sizePadding : 0)) {
                break;
            }
            Drawable d = this.draweeHolder.get(i).getTopLevelDrawable();
            if (d != null) {
                d.setAlpha(this.alpha.get(i, 255));
                if (this.overlap == 1.0f || i == 0) {
                    d.setBounds(Math.round(x), 0, Math.round(x + size), size);
                    d.draw(c);
                } else {
                    c.save();
                    this.overlapShape.offset(x, 0.0f);
                    c.clipPath(this.overlapShape);
                    d.setBounds(Math.round(x), 0, Math.round(x + size), size);
                    d.draw(c);
                    this.overlapShape.offset(-x, 0.0f);
                    c.restore();
                }
            }
        }
        if (this.showMoreIcon) {
            int maxIndex = (c.getWidth() / sizePadding) - 1;
            int x2 = Math.min(Math.min(maxIndex, getCount()) * sizePadding, c.getWidth() - size);
            if (maxIndex > getCount()) {
                x2 -= Math.round(this.offset * sizePadding);
            }
            this.moreIcon.setBounds(x2, 0, x2 + size, size);
            this.moreIcon.draw(c);
        }
    }

    public int getCount() {
        return this.draweeHolder.size();
    }
}
