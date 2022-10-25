package com.vk.attachpicker.widget;

import android.content.Context;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.vk.attachpicker.adapter.TabsAdapter;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class TabView extends FrameLayout {
    private ImageView badge;
    private TabImageView icon;
    private TabTextView title;

    public TabView(Context context) {
        super(context);
        init(context);
    }

    public TabView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    public TabView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }

    private void init(Context context) {
        LayoutInflater.from(context).inflate(R.layout.picker_adapter_tabs, this);
        this.icon = (TabImageView) findViewById(R.id.iv_icon);
        this.icon.setColorFilter(ContextCompat.getColor(context, R.color.picker_tab_panel_bg));
        this.title = (TabTextView) findViewById(R.id.tv_title);
        this.badge = (ImageView) findViewById(R.id.attach_badge);
    }

    public void update(TabsAdapter.TabInfo tabInfo, int holderPosition, int realCurrentPage, float positionOffset) {
        this.icon.setImageResource(tabInfo.iconResId);
        this.title.setText(tabInfo.titleResId);
        this.badge.setVisibility(tabInfo.showBadge ? 0 : 8);
        setSelection(holderPosition, realCurrentPage, positionOffset);
    }

    public void setSelection(int holderPosition, int realCurrentPage, float positionOffset) {
        this.icon.setSelection(holderPosition, realCurrentPage, positionOffset);
        this.title.setSelection(holderPosition, realCurrentPage, positionOffset);
        if (holderPosition == realCurrentPage) {
            this.badge.setVisibility(8);
        }
    }
}
