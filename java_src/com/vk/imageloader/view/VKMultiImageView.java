package com.vk.imageloader.view;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.drawee.backends.pipeline.PipelineDraweeControllerBuilder;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchy;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.facebook.drawee.view.DraweeHolder;
import com.facebook.drawee.view.MultiDraweeHolder;
import com.facebook.imagepipeline.request.ImageRequestBuilder;
/* loaded from: classes2.dex */
public class VKMultiImageView extends View {
    protected PipelineDraweeControllerBuilder controllerBuilder;
    protected final MultiDraweeHolder<GenericDraweeHierarchy> draweeHolder;

    public VKMultiImageView(Context context) {
        super(context);
        this.draweeHolder = new MultiDraweeHolder<>();
        init(context, null);
    }

    public VKMultiImageView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.draweeHolder = new MultiDraweeHolder<>();
        init(context, attrs);
    }

    public VKMultiImageView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.draweeHolder = new MultiDraweeHolder<>();
        init(context, attrs);
    }

    @TargetApi(21)
    public VKMultiImageView(Context context, @Nullable AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.draweeHolder = new MultiDraweeHolder<>();
        init(context, attrs);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void init(@NonNull Context context, @Nullable AttributeSet attrs) {
        if (!isInEditMode()) {
            this.controllerBuilder = Fresco.newDraweeControllerBuilder();
        }
    }

    @Override // android.view.View
    protected boolean verifyDrawable(@NonNull Drawable who) {
        return super.verifyDrawable(who) || this.draweeHolder.verifyDrawable(who);
    }

    @Override // android.view.View, android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(@NonNull Drawable drawable) {
        invalidate();
    }

    @Override // android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.draweeHolder.onDetach();
    }

    @Override // android.view.View
    public void onStartTemporaryDetach() {
        super.onStartTemporaryDetach();
        this.draweeHolder.onDetach();
    }

    @Override // android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.draweeHolder.onAttach();
    }

    @Override // android.view.View
    public void onFinishTemporaryDetach() {
        super.onFinishTemporaryDetach();
        this.draweeHolder.onAttach();
    }

    public void reset() {
        this.draweeHolder.clear();
    }

    public void clear() {
        for (int i = 0; i < this.draweeHolder.size(); i++) {
            this.draweeHolder.get(i).setController(null);
        }
    }

    public void setScaleType(ScalingUtils.ScaleType scaleType) {
        for (int i = 0; i < this.draweeHolder.size(); i++) {
            this.draweeHolder.get(i).getHierarchy().setActualImageScaleType(scaleType);
        }
    }

    public void addImage() {
        GenericDraweeHierarchyBuilder gdh = new GenericDraweeHierarchyBuilder(getContext().getResources());
        gdh.setPlaceholderImage(new ColorDrawable(0));
        gdh.setFadeDuration(0);
        gdh.setActualImageScaleType(ScalingUtils.ScaleType.FIT_CENTER);
        DraweeHolder<GenericDraweeHierarchy> holder = new DraweeHolder<>(gdh.build());
        if (holder.getTopLevelDrawable() != null) {
            holder.getTopLevelDrawable().setCallback(this);
        }
        this.draweeHolder.add(holder);
    }

    public void load(int index, Uri uri) {
        if (uri != null) {
            ImageRequestBuilder imageRequestBuilder = ImageRequestBuilder.newBuilderWithSource(uri);
            this.controllerBuilder.reset();
            this.controllerBuilder.setImageRequest(imageRequestBuilder.build());
            this.controllerBuilder.mo210setOldController(this.draweeHolder.get(index).getController());
            this.controllerBuilder.mo209setCallerContext((Object) null);
            this.draweeHolder.get(index).setController(this.controllerBuilder.mo208build());
            return;
        }
        this.draweeHolder.get(index).setController(null);
    }

    public void load(int index, String url) {
        if (url == null) {
            load(index, (Uri) null);
        } else {
            load(index, Uri.parse(url));
        }
    }

    public int size() {
        return this.draweeHolder.size();
    }
}
