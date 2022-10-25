package com.vk.imageloader.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import com.facebook.drawee.generic.GenericDraweeHierarchy;
import com.facebook.drawee.generic.RoundingParams;
import com.facebook.drawee.view.DraweeHolder;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class VKLayerImageView extends VKMultiImageView {
    private final ArrayList<Rect> insets;

    public VKLayerImageView(Context context) {
        super(context);
        this.insets = new ArrayList<>();
    }

    public VKLayerImageView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.insets = new ArrayList<>();
    }

    public VKLayerImageView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.insets = new ArrayList<>();
    }

    public VKLayerImageView(Context context, int layersCount) {
        super(context);
        this.insets = new ArrayList<>();
        for (int i = 0; i < layersCount; i++) {
            addLayer();
        }
    }

    public void addLayer() {
        addImage();
        this.insets.add(new Rect(0, 0, 0, 0));
    }

    public void setLayerInset(int index, int left, int top, int right, int bottom) {
        this.insets.get(index).set(left, top, right, bottom);
        invalidate();
    }

    public void setLayerCorners(int index, int left, int top, int right, int bottom) {
        this.draweeHolder.get(index).getHierarchy().setRoundingParams(RoundingParams.fromCornersRadii(left, top, right, bottom));
        invalidate();
    }

    public void setLayerPlaceholderColor(int index, int placeholderColor) {
        this.draweeHolder.get(index).getHierarchy().setPlaceholderImage(new ColorDrawable(placeholderColor));
    }

    public void setLayerPlaceholders(int placeholderColor) {
        for (int i = 0; i < this.draweeHolder.size(); i++) {
            setLayerPlaceholderColor(i, placeholderColor);
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        for (int i = 0; i < this.draweeHolder.size(); i++) {
            DraweeHolder<GenericDraweeHierarchy> d = this.draweeHolder.get(i);
            if (d != null && d.getTopLevelDrawable() != null) {
                Rect in = this.insets.get(i);
                d.getTopLevelDrawable().setBounds(in.left + 0, in.top + 0, canvas.getWidth() - in.right, canvas.getHeight() - in.bottom);
                d.getTopLevelDrawable().draw(canvas);
            }
        }
    }
}
