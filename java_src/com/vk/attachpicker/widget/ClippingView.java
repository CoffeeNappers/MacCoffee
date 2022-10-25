package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.util.Property;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
/* loaded from: classes2.dex */
public class ClippingView extends LocalImageView {
    private int clipBottom;
    private int clipLeft;
    private int clipRight;
    private int clipTop;
    private OnDrawListener drawListener;
    public static final Property<ClippingView, Integer> CLIP_LEFT = new Property<ClippingView, Integer>(Integer.class, "clipLeft") { // from class: com.vk.attachpicker.widget.ClippingView.1
        @Override // android.util.Property
        public void set(ClippingView object, Integer value) {
            object.setClipLeft(value.intValue());
        }

        @Override // android.util.Property
        public Integer get(ClippingView object) {
            return Integer.valueOf(object.getClipLeft());
        }
    };
    public static final Property<ClippingView, Integer> CLIP_TOP = new Property<ClippingView, Integer>(Integer.class, "clipTop") { // from class: com.vk.attachpicker.widget.ClippingView.2
        @Override // android.util.Property
        public void set(ClippingView object, Integer value) {
            object.setClipTop(value.intValue());
        }

        @Override // android.util.Property
        public Integer get(ClippingView object) {
            return Integer.valueOf(object.getClipTop());
        }
    };
    public static final Property<ClippingView, Integer> CLIP_RIGHT = new Property<ClippingView, Integer>(Integer.class, "clipRight") { // from class: com.vk.attachpicker.widget.ClippingView.3
        @Override // android.util.Property
        public void set(ClippingView object, Integer value) {
            object.setClipRight(value.intValue());
        }

        @Override // android.util.Property
        public Integer get(ClippingView object) {
            return Integer.valueOf(object.getClipRight());
        }
    };
    public static final Property<ClippingView, Integer> CLIP_BOTTOM = new Property<ClippingView, Integer>(Integer.class, "clipBottom") { // from class: com.vk.attachpicker.widget.ClippingView.4
        @Override // android.util.Property
        public void set(ClippingView object, Integer value) {
            object.setClipBottom(value.intValue());
        }

        @Override // android.util.Property
        public Integer get(ClippingView object) {
            return Integer.valueOf(object.getClipBottom());
        }
    };
    public static final Property<ClippingView, Integer> CLIP_VERTICAL = new Property<ClippingView, Integer>(Integer.class, "clipBottom") { // from class: com.vk.attachpicker.widget.ClippingView.5
        @Override // android.util.Property
        public void set(ClippingView object, Integer value) {
            object.clipBottom = value.intValue();
            object.clipTop = value.intValue();
            object.invalidate();
        }

        @Override // android.util.Property
        public Integer get(ClippingView object) {
            return Integer.valueOf(object.getClipBottom());
        }
    };
    public static final Property<ClippingView, Integer> CLIP_HORIZONTAL = new Property<ClippingView, Integer>(Integer.class, "clipBottom") { // from class: com.vk.attachpicker.widget.ClippingView.6
        @Override // android.util.Property
        public void set(ClippingView object, Integer value) {
            object.clipLeft = value.intValue();
            object.clipRight = value.intValue();
            object.invalidate();
        }

        @Override // android.util.Property
        public Integer get(ClippingView object) {
            return Integer.valueOf(object.getClipLeft());
        }
    };

    /* loaded from: classes2.dex */
    public interface OnDrawListener {
        void onDraw();
    }

    public ClippingView(Context context) {
        super(context);
    }

    public ClippingView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ClippingView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.attachpicker.widget.LocalImageView, com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
    public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
        builder.setFadeDuration(0);
        builder.setActualImageScaleType(ScalingUtils.ScaleType.FIT_XY);
    }

    public int getClipBottom() {
        return this.clipBottom;
    }

    public int getClipHorizontal() {
        return this.clipRight;
    }

    public int getClipLeft() {
        return this.clipLeft;
    }

    public int getClipRight() {
        return this.clipRight;
    }

    public int getClipTop() {
        return this.clipTop;
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas canvas) {
        if (this.drawListener != null && getScaleY() != 1.0f) {
            this.drawListener.onDraw();
        }
        canvas.save();
        canvas.clipRect(this.clipLeft / getScaleY(), this.clipTop / getScaleY(), getWidth() - (this.clipRight / getScaleY()), getHeight() - (this.clipBottom / getScaleY()));
        super.onDraw(canvas);
        canvas.restore();
    }

    public void setClipBottom(int value) {
        this.clipBottom = value;
        invalidate();
    }

    public void setClipHorizontal(int value) {
        this.clipRight = value;
        this.clipLeft = value;
        invalidate();
    }

    public void setClipLeft(int value) {
        this.clipLeft = value;
        invalidate();
    }

    public void setClipRight(int value) {
        this.clipRight = value;
        invalidate();
    }

    public void setClipTop(int value) {
        this.clipTop = value;
        invalidate();
    }

    public void setClipVertical(int value) {
        this.clipBottom = value;
        this.clipTop = value;
        invalidate();
    }

    public void setOnDrawListener(OnDrawListener listener) {
        this.drawListener = listener;
    }
}
