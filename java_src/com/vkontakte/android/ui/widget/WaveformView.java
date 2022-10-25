package com.vkontakte.android.ui.widget;

import android.animation.ObjectAnimator;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.animation.LinearInterpolator;
import com.vk.analytics.Analytics;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.media.audio.AudioMessageUtils;
/* loaded from: classes3.dex */
public class WaveformView extends View {
    private static final int BAR_WIDTH = 2;
    private static final int BAR_WIDTH_TOTAL = 3;
    private static final long THUMB_IND_DELAY = 500;
    private static final long THUMB_IND_DURATION = 2500;
    private static final float THUMB_IND_WIDTH = 0.2f;
    private final RectF barRect;
    private Bitmap bitmap;
    private int centerY;
    private DrawData curDrawData;
    private SeekBarDelegate delegate;
    private int height;
    private float indProgress;
    private final ObjectAnimator indeterminateAnimator;
    private final Paint paintPrimary;
    private final Paint paintProgress;
    private boolean pressed;
    private ViewParent scrollParentView;
    private boolean startDragging;
    private float startX;
    private Integer thumbX;
    private float totalBarsCount;
    private Canvas waveCanvas;
    private byte[] waveformBytes;
    private int width;
    private static final DisplayMetrics displayMetrics = Resources.getSystem().getDisplayMetrics();
    private static final int barWidthTotal = Global.scale(3.0f);
    private static final int barWidth = Global.scale(2.0f);
    private static final float radius = barWidth / 2.0f;

    /* loaded from: classes3.dex */
    public interface SeekBarDelegate {
        void onSeekBarDrag(float f);
    }

    public WaveformView(Context context) {
        this(context, null);
    }

    public WaveformView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WaveformView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.paintPrimary = new Paint(1);
        this.paintProgress = new Paint(1);
        this.indeterminateAnimator = ObjectAnimator.ofFloat(this, "indProgress", 0.0f, 0.0f);
        this.barRect = new RectF();
        this.indProgress = -1.0f;
        init(context, attrs);
    }

    @TargetApi(21)
    public WaveformView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.paintPrimary = new Paint(1);
        this.paintProgress = new Paint(1);
        this.indeterminateAnimator = ObjectAnimator.ofFloat(this, "indProgress", 0.0f, 0.0f);
        this.barRect = new RectF();
        this.indProgress = -1.0f;
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        if (attrs != null) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.WaveformView);
            this.paintPrimary.setColor(a.getColor(0, ViewCompat.MEASURED_STATE_MASK));
            this.paintProgress.setColor(a.getColor(1, ViewCompat.MEASURED_STATE_MASK));
            a.recycle();
        }
        this.indeterminateAnimator.setDuration(THUMB_IND_DURATION);
        this.indeterminateAnimator.setRepeatCount(-1);
        this.indeterminateAnimator.setInterpolator(new LinearInterpolator());
    }

    public void setSeekBarDelegate(SeekBarDelegate delegate) {
        this.delegate = delegate;
    }

    public void setColors(int primary, int progress) {
        this.paintPrimary.setColor(primary);
        this.paintProgress.setColor(progress);
    }

    public void setIndProgress(float progress) {
        this.indProgress = progress;
        invalidate();
    }

    public void setWaveform(byte[] waveform) {
        if (this.waveformBytes != null || waveform != null) {
            this.waveformBytes = waveform;
            this.curDrawData = calcDrawData(this.waveformBytes, (int) this.totalBarsCount);
            invalidate();
            setProgress(null);
        }
    }

    public void setProgress(Float progress) {
        if (!this.pressed) {
            if (progress == null) {
                this.thumbX = null;
                stopAnimation();
                invalidate();
            } else if (progress.floatValue() == -1.0f) {
                this.indeterminateAnimator.setFloatValues(0.0f, 0.8f, 0.0f);
                this.indeterminateAnimator.setStartDelay(500L);
                this.indeterminateAnimator.start();
            } else {
                this.thumbX = Integer.valueOf((int) Math.ceil(getWidth() * progress.floatValue()));
                if (this.thumbX.intValue() < 0) {
                    this.thumbX = 0;
                } else if (this.thumbX.intValue() > getWidth()) {
                    this.thumbX = Integer.valueOf(getWidth());
                }
                stopAnimation();
                invalidate();
            }
        }
    }

    private void stopAnimation() {
        if (this.indeterminateAnimator.isStarted()) {
            this.indeterminateAnimator.cancel();
            this.indProgress = -1.0f;
        }
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.scrollParentView = getScrollParent(this);
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        this.indeterminateAnimator.cancel();
        this.indProgress = -1.0f;
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        float delta = 0.0f;
        float x = event.getX();
        float y = event.getY();
        int action = event.getAction();
        if (action == 0) {
            if (0.0f <= x && x <= this.width && y >= 0.0f && y <= this.height) {
                this.startX = x;
                this.pressed = true;
                this.startDragging = false;
                return true;
            }
        } else if (action == 1 || action == 3) {
            if (this.pressed) {
                if (action == 1 && this.delegate != null) {
                    if (this.thumbX != null) {
                        delta = this.thumbX.intValue();
                    }
                    this.delegate.onSeekBarDrag(delta / this.width);
                }
                this.pressed = false;
                invalidate();
                return true;
            }
        } else if (action == 2 && this.pressed) {
            if (this.startDragging) {
                this.thumbX = Integer.valueOf((int) x);
                if (this.thumbX.intValue() < 0) {
                    this.thumbX = 0;
                } else if (this.thumbX.intValue() > this.width) {
                    this.thumbX = Integer.valueOf(this.width);
                }
                invalidate();
            }
            if (this.startX == -1.0f || Math.abs(x - this.startX) <= getPixelsInCM(0.2f, true)) {
                return true;
            }
            if (this.scrollParentView != null) {
                this.scrollParentView.requestDisallowInterceptTouchEvent(true);
            }
            this.startDragging = true;
            this.startX = -1.0f;
            return true;
        }
        return super.onTouchEvent(event);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w > 0 && h > 0) {
            try {
                this.width = Math.min(w, displayMetrics.widthPixels);
                this.height = Math.min(h, displayMetrics.heightPixels);
                this.centerY = ((getPaddingTop() + h) - getPaddingBottom()) / 2;
                if (this.bitmap != null) {
                    this.bitmap.recycle();
                }
                this.bitmap = Bitmap.createBitmap(this.width, this.height, Bitmap.Config.ARGB_8888);
                this.waveCanvas = new Canvas(this.bitmap);
                if (!isInEditMode()) {
                    this.totalBarsCount = w / barWidthTotal;
                }
                this.curDrawData = calcDrawData(this.waveformBytes, (int) this.totalBarsCount);
                return;
            } catch (Exception e) {
                Analytics.log(e.getMessage() + " size is " + w + ":" + h);
                this.waveCanvas = null;
                return;
            }
        }
        this.waveCanvas = null;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        Paint paint;
        super.onDraw(canvas);
        if (this.totalBarsCount > 0.1f && this.curDrawData != null && this.waveCanvas != null) {
            this.waveCanvas.drawColor(0, PorterDuff.Mode.CLEAR);
            float length = this.curDrawData.waveform.length;
            for (int bar = 0; bar < length; bar++) {
                byte value = this.curDrawData.waveform[bar];
                int x = bar * barWidthTotal;
                int barHeight = (int) ((value / 31.0f) * this.centerY);
                if (this.indProgress >= 0.0f) {
                    float prg = bar / length;
                    paint = (prg < this.indProgress || prg > this.indProgress + 0.2f) ? this.paintProgress : this.paintPrimary;
                } else {
                    paint = (this.thumbX == null || (x < this.thumbX.intValue() && barWidth + x < this.thumbX.intValue())) ? this.paintPrimary : this.paintProgress;
                }
                drawBar(x, barHeight, paint);
            }
            canvas.drawBitmap(this.bitmap, 0.0f, 0.0f, this.paintPrimary);
        }
    }

    private void drawBar(int left, int barHeight, Paint paint) {
        float right = barWidth + left;
        if (barHeight < radius) {
            this.barRect.set(left, this.centerY - radius, right, this.centerY + radius);
            this.waveCanvas.drawRoundRect(this.barRect, radius, radius, paint);
            return;
        }
        float top = Math.min(this.centerY, this.centerY - barHeight);
        float bottom = Math.max(this.centerY, this.centerY + barHeight);
        this.barRect.set(left, top, right, bottom);
        this.waveCanvas.drawRoundRect(this.barRect, radius, radius, paint);
    }

    private static DrawData calcDrawData(byte[] waveformBytes, int newSize) {
        if (waveformBytes == null) {
            return null;
        }
        byte[] result = AudioMessageUtils.resizeWaveform(waveformBytes, newSize);
        return new DrawData(result, getMaxValue(result));
    }

    private static byte getMaxValue(byte[] source) {
        byte max = Byte.MIN_VALUE;
        for (byte val : source) {
            if (val > max) {
                max = val;
            }
        }
        return max;
    }

    private static float getPixelsInCM(float cm, boolean isX) {
        return (isX ? displayMetrics.xdpi : displayMetrics.ydpi) * (cm / 2.54f);
    }

    private static ViewParent getScrollParent(View view) {
        for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof RecyclerView) {
                return parent;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class DrawData {
        byte maxValue;
        byte[] waveform;

        public DrawData(byte[] waveform, byte maxValue) {
            this.waveform = waveform;
            this.maxValue = maxValue;
        }
    }
}
