package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Property;
import android.widget.FrameLayout;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
/* loaded from: classes2.dex */
public class BgColorFrameLayout extends FrameLayout {
    public static final Property<BgColorFrameLayout, Integer> BACKGROUND_COLOR = new Property<BgColorFrameLayout, Integer>(Integer.class, TtmlNode.ATTR_TTS_BACKGROUND_COLOR) { // from class: com.vk.attachpicker.widget.BgColorFrameLayout.1
        @Override // android.util.Property
        public void set(BgColorFrameLayout object, Integer value) {
            object.setBackgroundColor(value.intValue());
        }

        @Override // android.util.Property
        public Integer get(BgColorFrameLayout object) {
            return Integer.valueOf(object.backgroundColor);
        }
    };
    private int backgroundColor;

    public BgColorFrameLayout(Context context) {
        super(context);
    }

    public BgColorFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public BgColorFrameLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public int getBackgroundColor() {
        return this.backgroundColor;
    }

    @Override // android.view.View
    public void setBackgroundColor(int backgroundColor) {
        this.backgroundColor = backgroundColor;
        super.setBackgroundColor(backgroundColor);
    }
}
