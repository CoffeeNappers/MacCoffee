package com.squareup.picasso;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import com.squareup.picasso.Picasso;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class TargetAction extends Action<Target> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public TargetAction(Picasso picasso, Target target, Request data, int memoryPolicy, int networkPolicy, Drawable errorDrawable, String key, Object tag, int errorResId) {
        super(picasso, target, data, memoryPolicy, networkPolicy, errorResId, errorDrawable, key, tag, false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.squareup.picasso.Action
    public void complete(Bitmap result, Picasso.LoadedFrom from) {
        if (result == null) {
            throw new AssertionError(String.format("Attempted to complete action with no result!\n%s", this));
        }
        Target target = mo443getTarget();
        if (target != null) {
            target.onBitmapLoaded(result, from);
            if (result.isRecycled()) {
                throw new IllegalStateException("Target callback must not recycle bitmap!");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.squareup.picasso.Action
    public void error() {
        Target target = mo443getTarget();
        if (target != null) {
            if (this.errorResId != 0) {
                target.onBitmapFailed(this.picasso.context.getResources().getDrawable(this.errorResId));
            } else {
                target.onBitmapFailed(this.errorDrawable);
            }
        }
    }
}
