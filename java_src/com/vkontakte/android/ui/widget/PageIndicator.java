package com.vkontakte.android.ui.widget;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ArgbEvaluator;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class PageIndicator extends View {
    @NonNull
    private final PageIndicatorDrawable pageIndicatorDrawable;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static abstract class PageIndicatorDrawable extends Drawable {
        int windowSize = 0;
        int offset = 0;
        int count = 0;
        int current = 0;

        abstract void setCurrentPage(int i, boolean z);

        abstract void setPageCount(int i);

        PageIndicatorDrawable() {
        }
    }

    public PageIndicator(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.pageIndicatorDrawable = createIndicatorAndAddToBg(context, attrs);
    }

    public PageIndicator(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.pageIndicatorDrawable = createIndicatorAndAddToBg(context, attrs);
    }

    @TargetApi(21)
    public PageIndicator(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.pageIndicatorDrawable = createIndicatorAndAddToBg(context, attrs);
    }

    private PageIndicatorDrawable createIndicatorAndAddToBg(Context ctx, AttributeSet attrs) {
        PageIndicatorDrawable pageIndicatorDrawable;
        setLayerType(1, null);
        int type = 0;
        TypedArray a = ctx.obtainStyledAttributes(attrs, R.styleable.PageIndicator);
        if (a != null) {
            type = a.getInt(0, 0);
            a.recycle();
        }
        switch (type) {
            case 1:
                pageIndicatorDrawable = new ResourcesDrawable(ctx, attrs);
                break;
            default:
                pageIndicatorDrawable = new CirclesDrawable(ctx, attrs);
                break;
        }
        if (Build.VERSION.SDK_INT >= 16) {
            setBackground(pageIndicatorDrawable);
        } else {
            setBackgroundDrawable(pageIndicatorDrawable);
        }
        return pageIndicatorDrawable;
    }

    public void setCountOfPages(int count) {
        this.pageIndicatorDrawable.setPageCount(count);
    }

    public void setIndexOfCurrentPage(int index, boolean animate) {
        this.pageIndicatorDrawable.setCurrentPage(index, animate);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(getSuggestedMinimumWidth(), getSuggestedMinimumHeight());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int max(@NonNull int... ints) {
        int max = Integer.MIN_VALUE;
        for (int i : ints) {
            max = Math.max(max, i);
        }
        return max;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int dpToPx(@NonNull Resources resources, int dp) {
        return (int) TypedValue.applyDimension(1, dp, resources.getDisplayMetrics());
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.windowSize = this.pageIndicatorDrawable.windowSize;
        ss.offset = this.pageIndicatorDrawable.offset;
        ss.count = this.pageIndicatorDrawable.count;
        ss.current = this.pageIndicatorDrawable.current;
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        this.pageIndicatorDrawable.windowSize = ss.windowSize;
        this.pageIndicatorDrawable.offset = ss.offset;
        this.pageIndicatorDrawable.count = ss.count;
        this.pageIndicatorDrawable.current = ss.current;
        setCountOfPages(ss.count);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.vkontakte.android.ui.widget.PageIndicator.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public SavedState mo1106createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public SavedState[] mo1107newArray(int size) {
                return new SavedState[size];
            }
        };
        int count;
        int current;
        int offset;
        int windowSize;

        SavedState(Parcelable superState) {
            super(superState);
            this.windowSize = 0;
            this.offset = 0;
            this.count = 0;
            this.current = 0;
        }

        private SavedState(Parcel in) {
            super(in);
            this.windowSize = 0;
            this.offset = 0;
            this.count = 0;
            this.current = 0;
            this.windowSize = in.readInt();
            this.offset = in.readInt();
            this.count = in.readInt();
            this.current = in.readInt();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.windowSize);
            out.writeInt(this.offset);
            out.writeInt(this.count);
            out.writeInt(this.current);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ResourcesDrawable extends PageIndicatorDrawable {
        final int halfHeight;
        Drawable normal;
        final Paint paint = new Paint();
        Drawable selected;
        final int verticalPadding;

        public ResourcesDrawable(@NonNull Context ctx, @NonNull AttributeSet attrs) {
            TypedArray a = ctx.obtainStyledAttributes(attrs, R.styleable.PageIndicator);
            this.normal = a.getDrawable(2);
            this.selected = a.getDrawable(1);
            this.verticalPadding = a.getDimensionPixelSize(14, 0);
            this.halfHeight = this.selected.getIntrinsicHeight() / 2;
            a.recycle();
        }

        @Override // com.vkontakte.android.ui.widget.PageIndicator.PageIndicatorDrawable
        void setPageCount(int count) {
            this.count = count;
            invalidateSelf();
        }

        @Override // com.vkontakte.android.ui.widget.PageIndicator.PageIndicatorDrawable
        void setCurrentPage(int currentPage, boolean animate) {
            this.current = currentPage;
            invalidateSelf();
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            canvas.save();
            canvas.translate(0.0f, getBounds().centerY());
            for (int i = 0; i < this.count; i++) {
                if (i == this.current) {
                    this.selected.setBounds(this.normal.getIntrinsicWidth() * i, -this.halfHeight, (i + 1) * this.selected.getIntrinsicWidth(), this.halfHeight);
                    this.selected.draw(canvas);
                } else {
                    this.normal.setBounds(this.normal.getIntrinsicWidth() * i, -this.halfHeight, (i + 1) * this.normal.getIntrinsicWidth(), this.halfHeight);
                    this.normal.draw(canvas);
                }
            }
            canvas.restore();
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int alpha) {
            this.paint.setAlpha(alpha);
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter colorFilter) {
            this.paint.setColorFilter(colorFilter);
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return 0;
        }

        @Override // android.graphics.drawable.Drawable
        public int getIntrinsicHeight() {
            return this.normal.getIntrinsicHeight() + this.verticalPadding;
        }

        @Override // android.graphics.drawable.Drawable
        public int getIntrinsicWidth() {
            return this.normal.getIntrinsicWidth() * this.count;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class CirclesDrawable extends PageIndicatorDrawable {
        final int colorNormal;
        final int colorSelect;
        final int durationMillis;
        final int durationTriangleMillis;
        final int maxCount;
        final Paint paint = new Paint();
        final Path pathTriangleLeft;
        final Path pathTriangleRight;
        final Point[] points;
        final int radiusBig;
        final int radiusNormal;
        final int shadowColor;
        final float shadowRadius;
        final float shadowX;
        final float shadowY;
        final int stepInner;
        final int stepOuter;
        final int triangleHeight;
        final Point triangleLeft;
        final Point triangleRight;
        final int triangleWidth;
        final int verticalPadding;

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes3.dex */
        public class Point {
            int color;
            int size;

            public Point(int color, int size) {
                setColor(color);
                setSize(size);
            }

            public void setColor(int color) {
                this.color = color;
                CirclesDrawable.this.invalidateSelf();
            }

            public void setSize(int size) {
                this.size = size;
                CirclesDrawable.this.invalidateSelf();
            }
        }

        CirclesDrawable(@NonNull Context ctx, @NonNull AttributeSet attrs) {
            Resources rc = ctx.getResources();
            TypedArray a = ctx.obtainStyledAttributes(attrs, R.styleable.PageIndicator);
            this.radiusBig = a.getDimensionPixelSize(3, PageIndicator.dpToPx(rc, 4));
            this.radiusNormal = a.getDimensionPixelSize(4, PageIndicator.dpToPx(rc, 3));
            this.triangleWidth = a.getDimensionPixelSize(5, PageIndicator.dpToPx(rc, 5));
            this.triangleHeight = a.getDimensionPixelSize(6, PageIndicator.dpToPx(rc, 7));
            this.stepInner = a.getDimensionPixelSize(7, PageIndicator.dpToPx(rc, 11));
            this.stepOuter = a.getDimensionPixelSize(8, PageIndicator.dpToPx(rc, 9));
            this.maxCount = a.getInteger(9, 5);
            this.colorSelect = a.getColor(10, -1);
            this.colorNormal = a.getColor(11, 1728053247);
            this.durationMillis = a.getInteger(12, 200);
            this.durationTriangleMillis = a.getInteger(13, 0);
            this.verticalPadding = a.getDimensionPixelSize(14, 0);
            this.shadowRadius = a.getDimensionPixelSize(17, 0);
            this.shadowX = a.getDimensionPixelSize(15, 0);
            this.shadowY = a.getDimensionPixelSize(16, 0);
            this.shadowColor = a.getColor(18, 0);
            a.recycle();
            this.pathTriangleRight = new Path();
            this.pathTriangleRight.moveTo(this.triangleWidth, 0.0f);
            this.pathTriangleRight.lineTo(0.0f, (-this.triangleHeight) / 2);
            this.pathTriangleRight.lineTo(0.0f, this.triangleHeight / 2);
            this.pathTriangleRight.close();
            this.pathTriangleLeft = new Path();
            this.pathTriangleLeft.moveTo(0.0f, 0.0f);
            this.pathTriangleLeft.lineTo(this.triangleWidth, (-this.triangleHeight) / 2);
            this.pathTriangleLeft.lineTo(this.triangleWidth, this.triangleHeight / 2);
            this.pathTriangleLeft.close();
            this.points = new Point[this.maxCount];
            int i = 0;
            while (i < this.maxCount) {
                this.points[i] = i == 0 ? new Point(this.colorSelect, this.radiusBig) : new Point(this.colorNormal, this.radiusNormal);
                i++;
            }
            this.triangleRight = new Point(0, this.colorNormal);
            this.triangleLeft = new Point(0, this.colorNormal);
            this.paint.setAntiAlias(true);
            if (this.shadowColor != 0) {
                this.paint.setShadowLayer(this.shadowRadius, this.shadowX, this.shadowY, this.shadowColor);
            }
        }

        @Override // com.vkontakte.android.ui.widget.PageIndicator.PageIndicatorDrawable
        public void setPageCount(int count) {
            if (count <= 0) {
                count = 0;
            }
            this.count = count;
            setCurrentPage(this.current, false);
            invalidateSelf();
        }

        @Override // com.vkontakte.android.ui.widget.PageIndicator.PageIndicatorDrawable
        public void setCurrentPage(int index, boolean animate) {
            int current = index > 0 ? index : 0;
            if (current >= this.count) {
                current = this.count - 1;
            }
            int offset = this.offset;
            if (offset < 0) {
                offset = 0;
            }
            this.windowSize = this.maxCount;
            if (this.windowSize + offset > this.count) {
                offset = this.count - this.windowSize;
                if (offset <= 0) {
                    offset = 0;
                }
            } else if (current > (this.windowSize + offset) - 1) {
                offset = (current - this.windowSize) + 1;
            } else if (current < offset) {
                offset = current;
            }
            int pointsSizeForDraw = Math.min(this.maxCount, this.count);
            int currentPointPositionNew = Math.min(current - offset, pointsSizeForDraw - 1);
            if (animate) {
                List<Animator> animators = new ArrayList<>();
                ArgbEvaluator argbEvaluator = new ArgbEvaluator();
                int i = 0;
                while (i < pointsSizeForDraw) {
                    int neededSize = i == currentPointPositionNew ? this.radiusBig : this.radiusNormal;
                    int neededColor = i == currentPointPositionNew ? this.colorSelect : this.colorNormal;
                    if (this.points[i].size != neededSize || this.points[i].color != neededColor) {
                        animators.add(ObjectAnimator.ofInt(this.points[i], "size", this.points[i].size, neededSize).setDuration(this.durationMillis));
                        ValueAnimator animator = ObjectAnimator.ofInt(this.points[i], TtmlNode.ATTR_TTS_COLOR, this.points[i].color, neededColor).setDuration(this.durationMillis);
                        animator.setEvaluator(argbEvaluator);
                        animators.add(animator);
                    }
                    i++;
                }
                int duration = this.durationMillis;
                if (isNeedShowLeftTriangle(offset, current) && isNeedShowLeftTriangle(this.offset, this.current)) {
                    duration = addTriangleAnimation(this.triangleLeft, argbEvaluator, animators, duration);
                } else if (isNeedShowRightTriangle(offset, current) && isNeedShowRightTriangle(this.offset, this.current)) {
                    duration = addTriangleAnimation(this.triangleRight, argbEvaluator, animators, duration);
                }
                if (!animators.isEmpty()) {
                    AnimatorSet animatorSet = new AnimatorSet();
                    animatorSet.playTogether(animators);
                    animatorSet.setDuration(duration);
                    animatorSet.start();
                }
            } else {
                int i2 = 0;
                while (i2 < pointsSizeForDraw) {
                    this.points[i2].size = i2 == currentPointPositionNew ? this.radiusBig : this.radiusNormal;
                    this.points[i2].color = i2 == currentPointPositionNew ? this.colorSelect : this.colorNormal;
                    this.triangleRight.color = this.colorNormal;
                    this.triangleLeft.color = this.colorNormal;
                    i2++;
                }
            }
            this.current = current;
            this.offset = offset;
            invalidateSelf();
        }

        private int addTriangleAnimation(Point triangle, ArgbEvaluator argbEvaluator, List<Animator> animators, int duration) {
            ValueAnimator animator = ObjectAnimator.ofInt(triangle, TtmlNode.ATTR_TTS_COLOR, triangle.color, this.colorSelect).setDuration(this.durationMillis);
            animator.setEvaluator(argbEvaluator);
            ValueAnimator animatorAfter = ObjectAnimator.ofInt(triangle, TtmlNode.ATTR_TTS_COLOR, this.colorSelect, this.colorNormal).setDuration(this.durationMillis);
            animatorAfter.setEvaluator(argbEvaluator);
            animatorAfter.setStartDelay(this.durationTriangleMillis);
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.playSequentially(animator, animatorAfter);
            animators.add(animatorSet);
            return duration + this.durationTriangleMillis;
        }

        private boolean isNeedShowLeftTriangle(int offset, int current) {
            return offset == current && offset > 0 && this.count >= this.maxCount;
        }

        private boolean isNeedShowRightTriangle(int offset, int current) {
            return current == (this.windowSize + offset) + (-1) && current < this.count + (-1) && this.count >= this.maxCount;
        }

        @Override // android.graphics.drawable.Drawable
        public int getMinimumHeight() {
            return PageIndicator.max(this.radiusBig * 2, this.radiusNormal * 2, this.triangleHeight) + (this.verticalPadding * 2);
        }

        @Override // android.graphics.drawable.Drawable
        public int getMinimumWidth() {
            return ((this.maxCount - 1) * this.stepInner) + (this.stepOuter * 2) + (this.triangleWidth * 2);
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            canvas.save();
            canvas.translate(0.0f, getBounds().centerY());
            if (isNeedShowLeftTriangle(this.offset, this.current)) {
                this.paint.setColor(this.triangleLeft.color);
                canvas.drawPath(this.pathTriangleLeft, this.paint);
            }
            if (this.count < this.maxCount) {
                canvas.translate(((this.maxCount - this.count) * this.stepInner) / 2, 0.0f);
            }
            canvas.translate(this.stepOuter + this.triangleWidth, 0.0f);
            int pointsSizeForDraw = Math.min(this.maxCount, this.count);
            for (int i = 0; i < pointsSizeForDraw; i++) {
                this.paint.setColor(this.points[i].color);
                canvas.drawCircle(this.stepInner * i, 0.0f, this.points[i].size, this.paint);
            }
            if (isNeedShowRightTriangle(this.offset, this.current)) {
                canvas.translate(((this.maxCount - 1) * this.stepInner) + this.stepOuter, 0.0f);
                this.paint.setColor(this.triangleRight.color);
                canvas.drawPath(this.pathTriangleRight, this.paint);
            }
            canvas.restore();
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int alpha) {
            this.paint.setAlpha(alpha);
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter cf) {
            this.paint.setColorFilter(cf);
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return 0;
        }
    }
}
