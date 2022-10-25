package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class EditText extends android.widget.EditText {
    public EditText(Context context) {
        super(context);
    }

    public EditText(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(attrs);
    }

    public EditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(attrs);
    }

    @TargetApi(21)
    public EditText(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(attrs);
    }

    private void init(AttributeSet attrs) {
        TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.EditText);
        String typeface = a.getString(0);
        if (!TextUtils.isEmpty(typeface) && !isInEditMode()) {
            setTypeface(Font.valueOf(typeface).typeface);
        }
        int tint = a.getColor(1, 0);
        if (tint != 0) {
            Drawable[] drawables = getCompoundDrawables();
            for (Drawable drawable : drawables) {
                if (drawable != null) {
                    drawable.mutate().setColorFilter(tint, PorterDuff.Mode.SRC_IN);
                }
            }
        }
        a.recycle();
    }
}
