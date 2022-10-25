package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.AttrRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.core.common.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.widget.WidgetTiles;
import com.vkontakte.android.utils.LinkUtils;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class WidgetTilesItemView extends LinearLayout {
    private final TextView button;
    private final TextView description;
    private final VKImageView icon;
    private WidgetTiles.Item item;
    private final TextView title;
    static final int padding = V.dp(6.0f);
    private static final int iconSize = V.dp(132.0f);

    public WidgetTilesItemView(@NonNull Context context) {
        this(context, null);
    }

    public WidgetTilesItemView(@NonNull Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetTilesItemView(@NonNull Context context, @Nullable AttributeSet attrs, @AttrRes int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        View widgetView = inflate(getContext(), R.layout.profile_widget_tiles_item, this);
        this.icon = (VKImageView) widgetView.findViewById(R.id.icon);
        this.title = (TextView) widgetView.findViewById(R.id.title);
        this.description = (TextView) widgetView.findViewById(R.id.description);
        this.button = (TextView) widgetView.findViewById(R.id.button);
        ViewGroup content = (ViewGroup) widgetView.findViewById(R.id.content);
        content.setPadding(padding, 0, padding, padding);
        this.button.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.widget.WidgetTilesItemView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WidgetTilesItemView.processLink(v.getContext(), WidgetTilesItemView.this.item.getButtonUrl(), WidgetTilesItemView.this.item.getButtonTarget());
            }
        });
        setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.widget.WidgetTilesItemView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WidgetTilesItemView.processLink(v.getContext(), WidgetTilesItemView.this.item.getUrl(), WidgetTilesItemView.this.item.getTarget());
            }
        });
    }

    public void bind(WidgetTiles.Item item) {
        this.item = item;
        this.title.setText(item.getTitle());
        bindTextView(this.description, item.getDescription());
        bindTextView(this.button, item.getButton());
        bindCover(iconSize);
    }

    private void bindCover(int coverSize) {
        ImageSize icon = this.item.getIcon(coverSize);
        if (icon == null) {
            this.icon.setImageDrawable(null);
            return;
        }
        this.icon.setAspectRatio(icon.getWidth(), icon.getHeight());
        this.icon.load(icon.getUrl());
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
