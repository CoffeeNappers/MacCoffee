package com.vk.imageloader.view;

import android.content.Context;
import android.util.AttributeSet;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.facebook.drawee.generic.RoundingParams;
/* loaded from: classes2.dex */
public class VKCircleImageView extends VKImageView {
    public VKCircleImageView(Context context) {
        super(context);
    }

    public VKCircleImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public VKCircleImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
    public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
        super.buildHierarchy(builder);
        builder.setRoundingParams(RoundingParams.asCircle());
        builder.setActualImageScaleType(ScalingUtils.ScaleType.CENTER_CROP);
    }
}
