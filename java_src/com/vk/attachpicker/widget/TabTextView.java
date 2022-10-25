package com.vk.attachpicker.widget;

import android.content.Context;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.widget.TextView;
import com.vk.attachpicker.util.Utils;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class TabTextView extends TextView {
    private int notSelectedColor;
    private int selectedColor;

    public TabTextView(Context context) {
        super(context);
        init(context);
    }

    public TabTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    public TabTextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }

    private void init(Context context) {
        this.notSelectedColor = ContextCompat.getColor(context, R.color.picker_tab_text_normal);
        this.selectedColor = ContextCompat.getColor(context, R.color.picker_tab_text_selected);
    }

    public void setSelection(int holderPosition, int realCurrentPage, float positionOffset) {
        float selection;
        if (holderPosition == realCurrentPage) {
            selection = 1.0f - positionOffset;
        } else if (holderPosition == realCurrentPage + 1) {
            selection = positionOffset;
        } else {
            selection = 0.0f;
        }
        setTextColor(Utils.interpolateColors(this.notSelectedColor, this.selectedColor, selection));
    }
}
