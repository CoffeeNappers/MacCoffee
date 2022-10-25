package com.vk.imageloader.view;

import android.content.Context;
import android.util.AttributeSet;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.facebook.drawee.generic.RoundingParams;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class VKSnippetImageView extends VKImageView {
    private static final int DEFAULT_BORDER_COLOR = 1023413274;
    private static final float DEFAULT_BORDER_WIDTH = Global.scale(0.5f);
    private static final boolean DEFAULT_DRAW_BORDER = true;
    public static final int TYPE_HORIZONTAL = 0;
    public static final int TYPE_NONE = 2;
    public static final int TYPE_VERTICAL = 1;
    private int borderColor;
    private float borderWidth;
    private boolean drawBorder;

    public VKSnippetImageView(Context context) {
        super(context);
        this.borderWidth = DEFAULT_BORDER_WIDTH;
        this.borderColor = DEFAULT_BORDER_COLOR;
        this.drawBorder = true;
        init();
    }

    public VKSnippetImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.borderWidth = DEFAULT_BORDER_WIDTH;
        this.borderColor = DEFAULT_BORDER_COLOR;
        this.drawBorder = true;
        init();
    }

    public VKSnippetImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.borderWidth = DEFAULT_BORDER_WIDTH;
        this.borderColor = DEFAULT_BORDER_COLOR;
        this.drawBorder = true;
        init();
    }

    private void init() {
        setBackgroundResource(R.drawable.attach_snippet_placeholder_top);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
    public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
        builder.setActualImageScaleType(ScalingUtils.ScaleType.CENTER_CROP);
        builder.setRoundingParams(RoundingParams.fromCornersRadii(V.dp(2.0f), V.dp(2.0f), 0.0f, 0.0f).setBorderWidth(Global.scale(0.5f)).setBorderColor(DEFAULT_BORDER_COLOR));
    }

    private void setCorners(float topLeft, float topRight, float bottomRight, float bottomLeft) {
        RoundingParams roundingParams = RoundingParams.fromCornersRadii(topLeft, topRight, bottomRight, bottomLeft);
        if (this.drawBorder) {
            roundingParams.setBorderWidth(this.borderWidth).setBorderColor(this.borderColor);
        }
        getHierarchy().setRoundingParams(roundingParams);
    }

    public float getBorderWidth() {
        return this.borderWidth;
    }

    public void setBorderWidth(float borderWidth) {
        this.borderWidth = borderWidth;
    }

    public int getBorderColor() {
        return this.borderColor;
    }

    public void setBorderColor(int borderColor) {
        this.borderColor = borderColor;
    }

    public boolean isDrawBorder() {
        return this.drawBorder;
    }

    public void setDrawBorder(boolean drawBorder) {
        this.drawBorder = drawBorder;
    }

    public void setType(int type) {
        if (type == 1) {
            setBackgroundResource(R.drawable.attach_snippet_placeholder_top);
            setCorners(V.dp(2.0f), V.dp(2.0f), 0.0f, 0.0f);
        } else if (type == 0) {
            setBackgroundResource(R.drawable.attach_snippet_placeholder_left);
            setCorners(V.dp(2.0f), 0.0f, 0.0f, V.dp(2.0f));
        } else {
            setBackgroundResource(R.drawable.attach_snippet_placeholder_all);
            setCorners(V.dp(2.0f), V.dp(2.0f), V.dp(2.0f), V.dp(2.0f));
        }
    }
}
