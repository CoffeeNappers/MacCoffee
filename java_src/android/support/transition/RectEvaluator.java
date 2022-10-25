package android.support.transition;

import android.animation.TypeEvaluator;
import android.annotation.TargetApi;
import android.graphics.Rect;
import android.support.annotation.RequiresApi;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class RectEvaluator implements TypeEvaluator<Rect> {
    private Rect mRect;

    public RectEvaluator() {
    }

    public RectEvaluator(Rect reuseRect) {
        this.mRect = reuseRect;
    }

    @Override // android.animation.TypeEvaluator
    public Rect evaluate(float fraction, Rect startValue, Rect endValue) {
        int left = startValue.left + ((int) ((endValue.left - startValue.left) * fraction));
        int top = startValue.top + ((int) ((endValue.top - startValue.top) * fraction));
        int right = startValue.right + ((int) ((endValue.right - startValue.right) * fraction));
        int bottom = startValue.bottom + ((int) ((endValue.bottom - startValue.bottom) * fraction));
        if (this.mRect == null) {
            return new Rect(left, top, right, bottom);
        }
        this.mRect.set(left, top, right, bottom);
        return this.mRect;
    }
}
