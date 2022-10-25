package com.facebook.drawee.generic;

import android.content.res.Resources;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import com.facebook.common.internal.Preconditions;
import com.facebook.drawee.drawable.DrawableParent;
import com.facebook.drawee.drawable.FadeDrawable;
import com.facebook.drawee.drawable.ForwardingDrawable;
import com.facebook.drawee.drawable.MatrixDrawable;
import com.facebook.drawee.drawable.ScaleTypeDrawable;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.interfaces.SettableDraweeHierarchy;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class GenericDraweeHierarchy implements SettableDraweeHierarchy {
    private static final int ACTUAL_IMAGE_INDEX = 2;
    private static final int BACKGROUND_IMAGE_INDEX = 0;
    private static final int FAILURE_IMAGE_INDEX = 5;
    private static final int OVERLAY_IMAGES_INDEX = 6;
    private static final int PLACEHOLDER_IMAGE_INDEX = 1;
    private static final int PROGRESS_BAR_IMAGE_INDEX = 3;
    private static final int RETRY_IMAGE_INDEX = 4;
    private final FadeDrawable mFadeDrawable;
    private final Resources mResources;
    @Nullable
    private RoundingParams mRoundingParams;
    private final RootDrawable mTopLevelDrawable;
    private final Drawable mEmptyActualImageDrawable = new ColorDrawable(0);
    private final ForwardingDrawable mActualImageWrapper = new ForwardingDrawable(this.mEmptyActualImageDrawable);

    /* JADX INFO: Access modifiers changed from: package-private */
    public GenericDraweeHierarchy(GenericDraweeHierarchyBuilder builder) {
        this.mResources = builder.getResources();
        this.mRoundingParams = builder.getRoundingParams();
        int numOverlays = (builder.getOverlays() != null ? builder.getOverlays().size() : 1) + (builder.getPressedStateOverlay() != null ? 1 : 0);
        int numLayers = numOverlays + 6;
        Drawable[] layers = new Drawable[numLayers];
        layers[0] = buildBranch(builder.getBackground(), null);
        layers[1] = buildBranch(builder.getPlaceholderImage(), builder.getPlaceholderImageScaleType());
        layers[2] = buildActualImageBranch(this.mActualImageWrapper, builder.getActualImageScaleType(), builder.getActualImageFocusPoint(), builder.getActualImageMatrix(), builder.getActualImageColorFilter());
        layers[3] = buildBranch(builder.getProgressBarImage(), builder.getProgressBarImageScaleType());
        layers[4] = buildBranch(builder.getRetryImage(), builder.getRetryImageScaleType());
        layers[5] = buildBranch(builder.getFailureImage(), builder.getFailureImageScaleType());
        if (numOverlays > 0) {
            int index = 0;
            if (builder.getOverlays() != null) {
                for (Drawable overlay : builder.getOverlays()) {
                    layers[index + 6] = buildBranch(overlay, null);
                    index++;
                }
            } else {
                index = 1;
            }
            if (builder.getPressedStateOverlay() != null) {
                layers[index + 6] = buildBranch(builder.getPressedStateOverlay(), null);
            }
        }
        this.mFadeDrawable = new FadeDrawable(layers);
        this.mFadeDrawable.setTransitionDuration(builder.getFadeDuration());
        Drawable maybeRoundedDrawable = WrappingUtils.maybeWrapWithRoundedOverlayColor(this.mFadeDrawable, this.mRoundingParams);
        this.mTopLevelDrawable = new RootDrawable(maybeRoundedDrawable);
        this.mTopLevelDrawable.mutate();
        resetFade();
    }

    @Nullable
    private Drawable buildActualImageBranch(Drawable drawable, @Nullable ScalingUtils.ScaleType scaleType, @Nullable PointF focusPoint, @Nullable Matrix matrix, @Nullable ColorFilter colorFilter) {
        drawable.setColorFilter(colorFilter);
        return WrappingUtils.maybeWrapWithMatrix(WrappingUtils.maybeWrapWithScaleType(drawable, scaleType, focusPoint), matrix);
    }

    @Nullable
    private Drawable buildBranch(@Nullable Drawable drawable, @Nullable ScalingUtils.ScaleType scaleType) {
        return WrappingUtils.maybeWrapWithScaleType(WrappingUtils.maybeApplyLeafRounding(drawable, this.mRoundingParams, this.mResources), scaleType);
    }

    private void resetActualImages() {
        this.mActualImageWrapper.setDrawable(this.mEmptyActualImageDrawable);
    }

    private void resetFade() {
        if (this.mFadeDrawable != null) {
            this.mFadeDrawable.beginBatchMode();
            this.mFadeDrawable.fadeInAllLayers();
            fadeOutBranches();
            fadeInLayer(1);
            this.mFadeDrawable.finishTransitionImmediately();
            this.mFadeDrawable.endBatchMode();
        }
    }

    private void fadeOutBranches() {
        fadeOutLayer(1);
        fadeOutLayer(2);
        fadeOutLayer(3);
        fadeOutLayer(4);
        fadeOutLayer(5);
    }

    private void fadeInLayer(int index) {
        if (index >= 0) {
            this.mFadeDrawable.fadeInLayer(index);
        }
    }

    private void fadeOutLayer(int index) {
        if (index >= 0) {
            this.mFadeDrawable.fadeOutLayer(index);
        }
    }

    private void setProgress(float progress) {
        Drawable progressBarDrawable = this.mFadeDrawable.getDrawable(3);
        if (progressBarDrawable != null) {
            if (progress >= 0.999f) {
                if (progressBarDrawable instanceof Animatable) {
                    ((Animatable) progressBarDrawable).stop();
                }
                fadeOutLayer(3);
            } else {
                if (progressBarDrawable instanceof Animatable) {
                    ((Animatable) progressBarDrawable).start();
                }
                fadeInLayer(3);
            }
            progressBarDrawable.setLevel(Math.round(10000.0f * progress));
        }
    }

    @Override // com.facebook.drawee.interfaces.DraweeHierarchy
    public Drawable getTopLevelDrawable() {
        return this.mTopLevelDrawable;
    }

    @Override // com.facebook.drawee.interfaces.SettableDraweeHierarchy
    public void reset() {
        resetActualImages();
        resetFade();
    }

    @Override // com.facebook.drawee.interfaces.SettableDraweeHierarchy
    public void setImage(Drawable drawable, float progress, boolean immediate) {
        Drawable drawable2 = WrappingUtils.maybeApplyLeafRounding(drawable, this.mRoundingParams, this.mResources);
        drawable2.mutate();
        this.mActualImageWrapper.setDrawable(drawable2);
        this.mFadeDrawable.beginBatchMode();
        fadeOutBranches();
        fadeInLayer(2);
        setProgress(progress);
        if (immediate) {
            this.mFadeDrawable.finishTransitionImmediately();
        }
        this.mFadeDrawable.endBatchMode();
    }

    @Override // com.facebook.drawee.interfaces.SettableDraweeHierarchy
    public void setProgress(float progress, boolean immediate) {
        if (this.mFadeDrawable.getDrawable(3) != null) {
            this.mFadeDrawable.beginBatchMode();
            setProgress(progress);
            if (immediate) {
                this.mFadeDrawable.finishTransitionImmediately();
            }
            this.mFadeDrawable.endBatchMode();
        }
    }

    @Override // com.facebook.drawee.interfaces.SettableDraweeHierarchy
    public void setFailure(Throwable throwable) {
        this.mFadeDrawable.beginBatchMode();
        fadeOutBranches();
        if (this.mFadeDrawable.getDrawable(5) != null) {
            fadeInLayer(5);
        } else {
            fadeInLayer(1);
        }
        this.mFadeDrawable.endBatchMode();
    }

    @Override // com.facebook.drawee.interfaces.SettableDraweeHierarchy
    public void setRetry(Throwable throwable) {
        this.mFadeDrawable.beginBatchMode();
        fadeOutBranches();
        if (this.mFadeDrawable.getDrawable(4) != null) {
            fadeInLayer(4);
        } else {
            fadeInLayer(1);
        }
        this.mFadeDrawable.endBatchMode();
    }

    @Override // com.facebook.drawee.interfaces.SettableDraweeHierarchy
    public void setControllerOverlay(@Nullable Drawable drawable) {
        this.mTopLevelDrawable.setControllerOverlay(drawable);
    }

    private DrawableParent getParentDrawableAtIndex(int index) {
        DrawableParent parent = this.mFadeDrawable.getDrawableParentForIndex(index);
        if (parent.getDrawable() instanceof MatrixDrawable) {
            parent = (MatrixDrawable) parent.getDrawable();
        }
        if (parent.getDrawable() instanceof ScaleTypeDrawable) {
            return (ScaleTypeDrawable) parent.getDrawable();
        }
        return parent;
    }

    private void setChildDrawableAtIndex(int index, @Nullable Drawable drawable) {
        if (drawable == null) {
            this.mFadeDrawable.setDrawable(index, null);
            return;
        }
        getParentDrawableAtIndex(index).setDrawable(WrappingUtils.maybeApplyLeafRounding(drawable, this.mRoundingParams, this.mResources));
    }

    private ScaleTypeDrawable getScaleTypeDrawableAtIndex(int index) {
        DrawableParent parent = getParentDrawableAtIndex(index);
        return parent instanceof ScaleTypeDrawable ? (ScaleTypeDrawable) parent : WrappingUtils.wrapChildWithScaleType(parent, ScalingUtils.ScaleType.FIT_XY);
    }

    private boolean hasScaleTypeDrawableAtIndex(int index) {
        DrawableParent parent = getParentDrawableAtIndex(index);
        return parent instanceof ScaleTypeDrawable;
    }

    public void setFadeDuration(int durationMs) {
        this.mFadeDrawable.setTransitionDuration(durationMs);
    }

    public int getFadeDuration() {
        return this.mFadeDrawable.getTransitionDuration();
    }

    public void setActualImageFocusPoint(PointF focusPoint) {
        Preconditions.checkNotNull(focusPoint);
        getScaleTypeDrawableAtIndex(2).setFocusPoint(focusPoint);
    }

    public void setActualImageScaleType(ScalingUtils.ScaleType scaleType) {
        Preconditions.checkNotNull(scaleType);
        getScaleTypeDrawableAtIndex(2).setScaleType(scaleType);
    }

    @Nullable
    public ScalingUtils.ScaleType getActualImageScaleType() {
        if (!hasScaleTypeDrawableAtIndex(2)) {
            return null;
        }
        return getScaleTypeDrawableAtIndex(2).getScaleType();
    }

    public void setActualImageColorFilter(ColorFilter colorfilter) {
        this.mActualImageWrapper.setColorFilter(colorfilter);
    }

    public void getActualImageBounds(RectF outBounds) {
        this.mActualImageWrapper.getTransformedBounds(outBounds);
    }

    public void setPlaceholderImage(@Nullable Drawable drawable) {
        setChildDrawableAtIndex(1, drawable);
    }

    public void setPlaceholderImage(Drawable drawable, ScalingUtils.ScaleType scaleType) {
        setChildDrawableAtIndex(1, drawable);
        getScaleTypeDrawableAtIndex(1).setScaleType(scaleType);
    }

    public boolean hasPlaceholderImage() {
        return this.mFadeDrawable.getDrawable(1) != null;
    }

    public void setPlaceholderImageFocusPoint(PointF focusPoint) {
        Preconditions.checkNotNull(focusPoint);
        getScaleTypeDrawableAtIndex(1).setFocusPoint(focusPoint);
    }

    public void setPlaceholderImage(int resourceId) {
        setPlaceholderImage(this.mResources.getDrawable(resourceId));
    }

    public void setPlaceholderImage(int resourceId, ScalingUtils.ScaleType scaleType) {
        setPlaceholderImage(this.mResources.getDrawable(resourceId), scaleType);
    }

    public void setFailureImage(@Nullable Drawable drawable) {
        setChildDrawableAtIndex(5, drawable);
    }

    public void setFailureImage(Drawable drawable, ScalingUtils.ScaleType scaleType) {
        setChildDrawableAtIndex(5, drawable);
        getScaleTypeDrawableAtIndex(5).setScaleType(scaleType);
    }

    public void setFailureImage(int resourceId) {
        setFailureImage(this.mResources.getDrawable(resourceId));
    }

    public void setFailureImage(int resourceId, ScalingUtils.ScaleType scaleType) {
        setFailureImage(this.mResources.getDrawable(resourceId), scaleType);
    }

    public void setRetryImage(@Nullable Drawable drawable) {
        setChildDrawableAtIndex(4, drawable);
    }

    public void setRetryImage(Drawable drawable, ScalingUtils.ScaleType scaleType) {
        setChildDrawableAtIndex(4, drawable);
        getScaleTypeDrawableAtIndex(4).setScaleType(scaleType);
    }

    public void setRetryImage(int resourceId) {
        setRetryImage(this.mResources.getDrawable(resourceId));
    }

    public void setRetryImage(int resourceId, ScalingUtils.ScaleType scaleType) {
        setRetryImage(this.mResources.getDrawable(resourceId), scaleType);
    }

    public void setProgressBarImage(@Nullable Drawable drawable) {
        setChildDrawableAtIndex(3, drawable);
    }

    public void setProgressBarImage(Drawable drawable, ScalingUtils.ScaleType scaleType) {
        setChildDrawableAtIndex(3, drawable);
        getScaleTypeDrawableAtIndex(3).setScaleType(scaleType);
    }

    public void setProgressBarImage(int resourceId) {
        setProgressBarImage(this.mResources.getDrawable(resourceId));
    }

    public void setProgressBarImage(int resourceId, ScalingUtils.ScaleType scaleType) {
        setProgressBarImage(this.mResources.getDrawable(resourceId), scaleType);
    }

    public void setBackgroundImage(@Nullable Drawable drawable) {
        setChildDrawableAtIndex(0, drawable);
    }

    public void setOverlayImage(int index, @Nullable Drawable drawable) {
        Preconditions.checkArgument(index >= 0 && index + 6 < this.mFadeDrawable.getNumberOfLayers(), "The given index does not correspond to an overlay image.");
        setChildDrawableAtIndex(index + 6, drawable);
    }

    public void setOverlayImage(@Nullable Drawable drawable) {
        setOverlayImage(0, drawable);
    }

    public void setRoundingParams(@Nullable RoundingParams roundingParams) {
        this.mRoundingParams = roundingParams;
        WrappingUtils.updateOverlayColorRounding(this.mTopLevelDrawable, this.mRoundingParams);
        for (int i = 0; i < this.mFadeDrawable.getNumberOfLayers(); i++) {
            WrappingUtils.updateLeafRounding(getParentDrawableAtIndex(i), this.mRoundingParams, this.mResources);
        }
    }

    @Nullable
    public RoundingParams getRoundingParams() {
        return this.mRoundingParams;
    }
}
