package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Checkable;
import android.widget.LinearLayout;
import com.vkontakte.android.ui.CheckableRelativeLayout;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes3.dex */
public class CompoundRadioGroup extends LinearLayout {
    private List<View> mCheckables;
    private int mCheckedId;
    private CheckableRelativeLayout.OnCheckedChangeListener mChildOnCheckedChangeListener;
    private CheckableRelativeLayout.OnCheckedChangeListener mListenerDelegate;

    public CompoundRadioGroup(Context context) {
        super(context);
        this.mCheckables = new ArrayList();
        this.mCheckedId = -1;
        this.mListenerDelegate = new CheckableRelativeLayout.OnCheckedChangeListener() { // from class: com.vkontakte.android.ui.CompoundRadioGroup.1
            @Override // com.vkontakte.android.ui.CheckableRelativeLayout.OnCheckedChangeListener
            public void onCheckedChanged(View buttonView, boolean isChecked) {
                if (isChecked) {
                    CompoundRadioGroup.this.mCheckedId = buttonView.getId();
                    for (View view : CompoundRadioGroup.this.mCheckables) {
                        if (buttonView != view) {
                            ((Checkable) view).setChecked(false);
                        }
                    }
                }
                if (CompoundRadioGroup.this.mChildOnCheckedChangeListener != null) {
                    CompoundRadioGroup.this.mChildOnCheckedChangeListener.onCheckedChanged(buttonView, ((Checkable) buttonView).isChecked());
                }
            }
        };
    }

    public CompoundRadioGroup(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCheckables = new ArrayList();
        this.mCheckedId = -1;
        this.mListenerDelegate = new CheckableRelativeLayout.OnCheckedChangeListener() { // from class: com.vkontakte.android.ui.CompoundRadioGroup.1
            @Override // com.vkontakte.android.ui.CheckableRelativeLayout.OnCheckedChangeListener
            public void onCheckedChanged(View buttonView, boolean isChecked) {
                if (isChecked) {
                    CompoundRadioGroup.this.mCheckedId = buttonView.getId();
                    for (View view : CompoundRadioGroup.this.mCheckables) {
                        if (buttonView != view) {
                            ((Checkable) view).setChecked(false);
                        }
                    }
                }
                if (CompoundRadioGroup.this.mChildOnCheckedChangeListener != null) {
                    CompoundRadioGroup.this.mChildOnCheckedChangeListener.onCheckedChanged(buttonView, ((Checkable) buttonView).isChecked());
                }
            }
        };
    }

    public CompoundRadioGroup(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mCheckables = new ArrayList();
        this.mCheckedId = -1;
        this.mListenerDelegate = new CheckableRelativeLayout.OnCheckedChangeListener() { // from class: com.vkontakte.android.ui.CompoundRadioGroup.1
            @Override // com.vkontakte.android.ui.CheckableRelativeLayout.OnCheckedChangeListener
            public void onCheckedChanged(View buttonView, boolean isChecked) {
                if (isChecked) {
                    CompoundRadioGroup.this.mCheckedId = buttonView.getId();
                    for (View view : CompoundRadioGroup.this.mCheckables) {
                        if (buttonView != view) {
                            ((Checkable) view).setChecked(false);
                        }
                    }
                }
                if (CompoundRadioGroup.this.mChildOnCheckedChangeListener != null) {
                    CompoundRadioGroup.this.mChildOnCheckedChangeListener.onCheckedChanged(buttonView, ((Checkable) buttonView).isChecked());
                }
            }
        };
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        super.addView(child, index, params);
        if (child instanceof CheckableRelativeLayout) {
            this.mCheckables.add(child);
            ((CheckableRelativeLayout) child).setOnCheckedChangedListener(this.mListenerDelegate);
            if (((Checkable) child).isChecked()) {
                check(child);
            }
        }
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
    }

    public void setOnCheckedChangeListener(CheckableRelativeLayout.OnCheckedChangeListener mChildOnCheckedChangeListener) {
        this.mChildOnCheckedChangeListener = mChildOnCheckedChangeListener;
    }

    public int getCheckedId() {
        return this.mCheckedId;
    }

    private void check(View v) {
        this.mCheckedId = v.getId();
        if (this.mChildOnCheckedChangeListener != null) {
            this.mChildOnCheckedChangeListener.onCheckedChanged(v, ((Checkable) v).isChecked());
        }
        Iterator<View> it = this.mCheckables.iterator();
        while (it.hasNext()) {
            View view = it.next();
            ((Checkable) v).setChecked(v == view);
        }
    }

    public void setCheckedId(int id) {
        ((Checkable) findViewById(id)).setChecked(true);
    }
}
