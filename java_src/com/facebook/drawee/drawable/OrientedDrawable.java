package com.facebook.drawee.drawable;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.imagepipeline.common.RotationOptions;
/* loaded from: classes.dex */
public class OrientedDrawable extends ForwardingDrawable {
    private int mRotationAngle;
    @VisibleForTesting
    final Matrix mRotationMatrix;
    private final Matrix mTempMatrix;
    private final RectF mTempRectF;

    public OrientedDrawable(Drawable drawable, int rotationAngle) {
        super(drawable);
        this.mTempMatrix = new Matrix();
        this.mTempRectF = new RectF();
        Preconditions.checkArgument(rotationAngle % 90 == 0);
        this.mRotationMatrix = new Matrix();
        this.mRotationAngle = rotationAngle;
    }

    @Override // com.facebook.drawee.drawable.ForwardingDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mRotationAngle <= 0) {
            super.draw(canvas);
            return;
        }
        int saveCount = canvas.save();
        canvas.concat(this.mRotationMatrix);
        super.draw(canvas);
        canvas.restoreToCount(saveCount);
    }

    @Override // com.facebook.drawee.drawable.ForwardingDrawable, android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.mRotationAngle % RotationOptions.ROTATE_180 == 0 ? super.getIntrinsicWidth() : super.getIntrinsicHeight();
    }

    @Override // com.facebook.drawee.drawable.ForwardingDrawable, android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mRotationAngle % RotationOptions.ROTATE_180 == 0 ? super.getIntrinsicHeight() : super.getIntrinsicWidth();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.drawee.drawable.ForwardingDrawable, android.graphics.drawable.Drawable
    public void onBoundsChange(Rect bounds) {
        Drawable underlyingDrawable = getCurrent();
        if (this.mRotationAngle > 0) {
            this.mRotationMatrix.setRotate(this.mRotationAngle, bounds.centerX(), bounds.centerY());
            this.mTempMatrix.reset();
            this.mRotationMatrix.invert(this.mTempMatrix);
            this.mTempRectF.set(bounds);
            this.mTempMatrix.mapRect(this.mTempRectF);
            underlyingDrawable.setBounds((int) this.mTempRectF.left, (int) this.mTempRectF.top, (int) this.mTempRectF.right, (int) this.mTempRectF.bottom);
            return;
        }
        underlyingDrawable.setBounds(bounds);
    }

    @Override // com.facebook.drawee.drawable.ForwardingDrawable, com.facebook.drawee.drawable.TransformCallback
    public void getTransform(Matrix transform) {
        getParentTransform(transform);
        if (!this.mRotationMatrix.isIdentity()) {
            transform.preConcat(this.mRotationMatrix);
        }
    }
}
