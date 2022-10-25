package fr.castorflex.android.smoothprogressbar;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.widget.ProgressBar;
import com.vkontakte.android.R;
import fr.castorflex.android.smoothprogressbar.SmoothProgressDrawable;
/* loaded from: classes3.dex */
public class SmoothProgressBar extends ProgressBar {
    private static final int INTERPOLATOR_ACCELERATE = 0;
    private static final int INTERPOLATOR_ACCELERATEDECELERATE = 2;
    private static final int INTERPOLATOR_DECELERATE = 3;
    private static final int INTERPOLATOR_LINEAR = 1;

    public SmoothProgressBar(Context context) {
        this(context, null);
    }

    public SmoothProgressBar(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.spbStyle);
    }

    public SmoothProgressBar(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        if (isInEditMode()) {
            setIndeterminateDrawable(new SmoothProgressDrawable.Builder(context).build());
            return;
        }
        Resources res = context.getResources();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SmoothProgressBar, defStyle, 0);
        int color = a.getColor(1, res.getColor(R.color.spb_default_color));
        int sectionsCount = a.getInteger(4, res.getInteger(R.integer.spb_default_sections_count));
        int separatorLength = a.getDimensionPixelSize(3, res.getDimensionPixelSize(R.dimen.spb_default_stroke_separator_length));
        float strokeWidth = a.getDimension(2, res.getDimension(R.dimen.spb_default_stroke_width));
        float speed = a.getFloat(5, Float.parseFloat(res.getString(R.string.spb_default_speed)));
        float speedProgressiveStart = a.getFloat(6, speed);
        float speedProgressiveStop = a.getFloat(7, speed);
        int iInterpolator = a.getInteger(8, -1);
        boolean reversed = a.getBoolean(9, res.getBoolean(R.bool.spb_default_reversed));
        boolean mirrorMode = a.getBoolean(10, res.getBoolean(R.bool.spb_default_mirror_mode));
        int colorsId = a.getResourceId(11, 0);
        boolean progressiveStartActivated = a.getBoolean(12, res.getBoolean(R.bool.spb_default_progressiveStart_activated));
        Drawable backgroundDrawable = a.getDrawable(13);
        boolean generateBackgroundWithColors = a.getBoolean(14, false);
        boolean gradients = a.getBoolean(15, false);
        a.recycle();
        Interpolator interpolator = null;
        interpolator = iInterpolator == -1 ? getInterpolator() : interpolator;
        if (interpolator == null) {
            switch (iInterpolator) {
                case 1:
                    interpolator = new LinearInterpolator();
                    break;
                case 2:
                    interpolator = new AccelerateDecelerateInterpolator();
                    break;
                case 3:
                    interpolator = new DecelerateInterpolator();
                    break;
                default:
                    interpolator = new AccelerateInterpolator();
                    break;
            }
        }
        int[] colors = null;
        colors = colorsId != 0 ? res.getIntArray(colorsId) : colors;
        SmoothProgressDrawable.Builder builder = new SmoothProgressDrawable.Builder(context).speed(speed).progressiveStartSpeed(speedProgressiveStart).progressiveStopSpeed(speedProgressiveStop).interpolator(interpolator).sectionsCount(sectionsCount).separatorLength(separatorLength).strokeWidth(strokeWidth).reversed(reversed).mirrorMode(mirrorMode).progressiveStart(progressiveStartActivated).gradients(gradients);
        if (backgroundDrawable != null) {
            builder.backgroundDrawable(backgroundDrawable);
        }
        if (generateBackgroundWithColors) {
            builder.generateBackgroundUsingColors();
        }
        if (colors != null && colors.length > 0) {
            builder.colors(colors);
        } else {
            builder.color(color);
        }
        SmoothProgressDrawable d = builder.build();
        setIndeterminateDrawable(d);
    }

    public void applyStyle(int styleResId) {
        Interpolator interpolator;
        int colorsId;
        int[] colors;
        TypedArray a = getContext().obtainStyledAttributes(null, R.styleable.SmoothProgressBar, 0, styleResId);
        if (a.hasValue(1)) {
            setSmoothProgressDrawableColor(a.getColor(1, 0));
        }
        if (a.hasValue(11) && (colorsId = a.getResourceId(11, 0)) != 0 && (colors = getResources().getIntArray(colorsId)) != null && colors.length > 0) {
            setSmoothProgressDrawableColors(colors);
        }
        if (a.hasValue(4)) {
            setSmoothProgressDrawableSectionsCount(a.getInteger(4, 0));
        }
        if (a.hasValue(3)) {
            setSmoothProgressDrawableSeparatorLength(a.getDimensionPixelSize(3, 0));
        }
        if (a.hasValue(2)) {
            setSmoothProgressDrawableStrokeWidth(a.getDimension(2, 0.0f));
        }
        if (a.hasValue(5)) {
            setSmoothProgressDrawableSpeed(a.getFloat(5, 0.0f));
        }
        if (a.hasValue(6)) {
            setSmoothProgressDrawableProgressiveStartSpeed(a.getFloat(6, 0.0f));
        }
        if (a.hasValue(7)) {
            setSmoothProgressDrawableProgressiveStopSpeed(a.getFloat(7, 0.0f));
        }
        if (a.hasValue(9)) {
            setSmoothProgressDrawableReversed(a.getBoolean(9, false));
        }
        if (a.hasValue(10)) {
            setSmoothProgressDrawableMirrorMode(a.getBoolean(10, false));
        }
        if (a.hasValue(12)) {
            setProgressiveStartActivated(a.getBoolean(12, false));
        }
        if (a.hasValue(12)) {
            setProgressiveStartActivated(a.getBoolean(12, false));
        }
        if (a.hasValue(15)) {
            setSmoothProgressDrawableUseGradients(a.getBoolean(15, false));
        }
        if (a.hasValue(14) && a.getBoolean(14, false)) {
            setSmoothProgressDrawableBackgroundDrawable(SmoothProgressBarUtils.generateDrawableWithColors(checkIndeterminateDrawable().getColors(), checkIndeterminateDrawable().getStrokeWidth()));
        }
        if (a.hasValue(8)) {
            int iInterpolator = a.getInteger(8, -1);
            switch (iInterpolator) {
                case 0:
                    interpolator = new AccelerateInterpolator();
                    break;
                case 1:
                    interpolator = new LinearInterpolator();
                    break;
                case 2:
                    interpolator = new AccelerateDecelerateInterpolator();
                    break;
                case 3:
                    interpolator = new DecelerateInterpolator();
                    break;
                default:
                    interpolator = null;
                    break;
            }
            if (interpolator != null) {
                setInterpolator(interpolator);
            }
        }
        a.recycle();
    }

    @Override // android.widget.ProgressBar, android.view.View
    protected synchronized void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (isIndeterminate() && (getIndeterminateDrawable() instanceof SmoothProgressDrawable) && !((SmoothProgressDrawable) getIndeterminateDrawable()).isRunning()) {
            getIndeterminateDrawable().draw(canvas);
        }
    }

    private SmoothProgressDrawable checkIndeterminateDrawable() {
        Drawable ret = getIndeterminateDrawable();
        if (ret == null || !(ret instanceof SmoothProgressDrawable)) {
            throw new RuntimeException("The drawable is not a SmoothProgressDrawable");
        }
        return (SmoothProgressDrawable) ret;
    }

    @Override // android.widget.ProgressBar
    public void setInterpolator(Interpolator interpolator) {
        super.setInterpolator(interpolator);
        Drawable ret = getIndeterminateDrawable();
        if (ret != null && (ret instanceof SmoothProgressDrawable)) {
            ((SmoothProgressDrawable) ret).setInterpolator(interpolator);
        }
    }

    public void setSmoothProgressDrawableInterpolator(Interpolator interpolator) {
        checkIndeterminateDrawable().setInterpolator(interpolator);
    }

    public void setSmoothProgressDrawableColors(int[] colors) {
        checkIndeterminateDrawable().setColors(colors);
    }

    public void setSmoothProgressDrawableColor(int color) {
        checkIndeterminateDrawable().setColor(color);
    }

    public void setSmoothProgressDrawableSpeed(float speed) {
        checkIndeterminateDrawable().setSpeed(speed);
    }

    public void setSmoothProgressDrawableProgressiveStartSpeed(float speed) {
        checkIndeterminateDrawable().setProgressiveStartSpeed(speed);
    }

    public void setSmoothProgressDrawableProgressiveStopSpeed(float speed) {
        checkIndeterminateDrawable().setProgressiveStopSpeed(speed);
    }

    public void setSmoothProgressDrawableSectionsCount(int sectionsCount) {
        checkIndeterminateDrawable().setSectionsCount(sectionsCount);
    }

    public void setSmoothProgressDrawableSeparatorLength(int separatorLength) {
        checkIndeterminateDrawable().setSeparatorLength(separatorLength);
    }

    public void setSmoothProgressDrawableStrokeWidth(float strokeWidth) {
        checkIndeterminateDrawable().setStrokeWidth(strokeWidth);
    }

    public void setSmoothProgressDrawableReversed(boolean reversed) {
        checkIndeterminateDrawable().setReversed(reversed);
    }

    public void setSmoothProgressDrawableMirrorMode(boolean mirrorMode) {
        checkIndeterminateDrawable().setMirrorMode(mirrorMode);
    }

    public void setProgressiveStartActivated(boolean progressiveStartActivated) {
        checkIndeterminateDrawable().setProgressiveStartActivated(progressiveStartActivated);
    }

    public void setSmoothProgressDrawableCallbacks(SmoothProgressDrawable.Callbacks listener) {
        checkIndeterminateDrawable().setCallbacks(listener);
    }

    public void setSmoothProgressDrawableBackgroundDrawable(Drawable drawable) {
        checkIndeterminateDrawable().setBackgroundDrawable(drawable);
    }

    public void setSmoothProgressDrawableUseGradients(boolean useGradients) {
        checkIndeterminateDrawable().setUseGradients(useGradients);
    }

    public void progressiveStart() {
        checkIndeterminateDrawable().progressiveStart();
    }

    public void progressiveStop() {
        checkIndeterminateDrawable().progressiveStop();
    }
}
