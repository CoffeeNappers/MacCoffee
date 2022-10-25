package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.AttrRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.core.common.ImageSize;
import com.vk.core.util.DrawableUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.api.widget.WidgetList;
import com.vkontakte.android.utils.LinkUtils;
/* loaded from: classes3.dex */
public class WidgetListItemView extends FrameLayout {
    private static final int iconSize = Global.scale(48.0f);
    private final TextView address;
    private final TextView button;
    private final TextView description;
    private final VKImageView icon;
    private WidgetList.Item item;
    private final View separator;
    private final TextView text;
    private final TextView time;
    private final TextView title;

    public WidgetListItemView(@NonNull Context context) {
        this(context, null);
    }

    public WidgetListItemView(@NonNull Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetListItemView(@NonNull Context context, @Nullable AttributeSet attrs, @AttrRes int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        View widgetView = inflate(getContext(), R.layout.profile_widget_list_item, this);
        this.icon = (VKImageView) widgetView.findViewById(R.id.icon);
        this.title = (TextView) widgetView.findViewById(R.id.title);
        this.description = (TextView) widgetView.findViewById(R.id.description);
        this.address = (TextView) widgetView.findViewById(R.id.address);
        this.time = (TextView) widgetView.findViewById(R.id.time);
        this.text = (TextView) widgetView.findViewById(R.id.text);
        this.button = (TextView) widgetView.findViewById(R.id.button);
        this.separator = widgetView.findViewById(R.id.separator);
        DrawableUtils.setLeft(this.address, (int) R.drawable.ic_place_16dp, (int) R.color.mid_gray);
        DrawableUtils.setLeft(this.time, (int) R.drawable.ic_time_16dp, (int) R.color.mid_gray);
        this.button.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.widget.WidgetListItemView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WidgetListItemView.processLink(v.getContext(), WidgetListItemView.this.item.getButtonUrl(), WidgetListItemView.this.item.getButtonTarget());
            }
        });
        setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.widget.WidgetListItemView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WidgetListItemView.processLink(v.getContext(), WidgetListItemView.this.item.getTitleUrl(), WidgetListItemView.this.item.getTitleTarget());
            }
        });
    }

    public void bind(WidgetList.Item item, boolean showSeparator) {
        int i = 8;
        this.item = item;
        this.title.setText(item.getTitle());
        bindTextView(this.description, item.getDescription());
        bindTextView(this.address, item.getAddress());
        bindTextView(this.time, item.getTime());
        bindTextView(this.text, item.getText());
        bindTextView(this.button, item.getButton());
        this.separator.setVisibility(showSeparator ? 0 : 8);
        ImageSize icon = item.getIcon(iconSize);
        VKImageView vKImageView = this.icon;
        if (icon != null) {
            i = 0;
        }
        vKImageView.setVisibility(i);
        if (icon == null) {
            this.icon.setImageDrawable(null);
        } else {
            this.icon.load(icon.getUrl());
        }
    }

    private static void bindTextView(TextView textView, CharSequence text) {
        textView.setText(text);
        textView.setVisibility(TextUtils.isEmpty(text) ? 8 : 0);
    }

    public static void processLink(Context ctx, String url, String target) {
        if (!TextUtils.isEmpty(url)) {
            String valueOf = String.valueOf(target);
            char c = 65535;
            switch (valueOf.hashCode()) {
                case -1820761141:
                    if (valueOf.equals("external")) {
                        c = 0;
                        break;
                    }
                    break;
                case -1544407700:
                    if (valueOf.equals("internal_hidden")) {
                        c = 3;
                        break;
                    }
                    break;
                case 570410685:
                    if (valueOf.equals("internal")) {
                        c = 1;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    LinkUtils.processExternalLink(ctx, url);
                    return;
                case 1:
                    LinkUtils.processInternalLink(ctx, url);
                    return;
                default:
                    LinkUtils.processInternalHiddenLink(ctx, url);
                    return;
            }
        }
    }
}
