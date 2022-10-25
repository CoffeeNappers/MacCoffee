package android.support.v7.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.annotation.RequiresApi;
import android.support.v7.appcompat.R;
import android.util.AttributeSet;
import android.widget.TextView;
/* JADX INFO: Access modifiers changed from: package-private */
@RequiresApi(17)
@TargetApi(17)
/* loaded from: classes.dex */
public class AppCompatTextHelperV17 extends AppCompatTextHelper {
    private TintInfo mDrawableEndTint;
    private TintInfo mDrawableStartTint;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AppCompatTextHelperV17(TextView view) {
        super(view);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.v7.widget.AppCompatTextHelper
    public void loadFromAttributes(AttributeSet attrs, int defStyleAttr) {
        super.loadFromAttributes(attrs, defStyleAttr);
        Context context = this.mView.getContext();
        AppCompatDrawableManager drawableManager = AppCompatDrawableManager.get();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.AppCompatTextHelper, defStyleAttr, 0);
        if (a.hasValue(R.styleable.AppCompatTextHelper_android_drawableStart)) {
            this.mDrawableStartTint = createTintInfo(context, drawableManager, a.getResourceId(R.styleable.AppCompatTextHelper_android_drawableStart, 0));
        }
        if (a.hasValue(R.styleable.AppCompatTextHelper_android_drawableEnd)) {
            this.mDrawableEndTint = createTintInfo(context, drawableManager, a.getResourceId(R.styleable.AppCompatTextHelper_android_drawableEnd, 0));
        }
        a.recycle();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.v7.widget.AppCompatTextHelper
    public void applyCompoundDrawablesTints() {
        super.applyCompoundDrawablesTints();
        if (this.mDrawableStartTint != null || this.mDrawableEndTint != null) {
            Drawable[] compoundDrawables = this.mView.getCompoundDrawablesRelative();
            applyCompoundDrawableTint(compoundDrawables[0], this.mDrawableStartTint);
            applyCompoundDrawableTint(compoundDrawables[2], this.mDrawableEndTint);
        }
    }
}
