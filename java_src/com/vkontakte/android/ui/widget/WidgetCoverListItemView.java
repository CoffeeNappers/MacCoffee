package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.AttrRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.core.common.ImageSize;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.widget.WidgetCoverList;
import com.vkontakte.android.utils.LinkUtils;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class WidgetCoverListItemView extends FrameLayout {
    private final TextView button;
    private final ViewGroup content;
    private final VKImageView cover;
    private final float coverAspectRation;
    private final TextView description;
    private int iconSize;
    private WidgetCoverList.Item item;
    private final TextView title;

    public WidgetCoverListItemView(@NonNull Context context) {
        this(context, null);
    }

    public WidgetCoverListItemView(@NonNull Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetCoverListItemView(@NonNull Context context, @Nullable AttributeSet attrs, @AttrRes int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.coverAspectRation = Screen.isTablet(context) ? 4.0f : 3.0f;
        View widgetView = inflate(getContext(), R.layout.profile_widget_cover_item, this);
        this.content = (ViewGroup) widgetView.findViewById(R.id.content);
        this.cover = (VKImageView) widgetView.findViewById(R.id.cover);
        this.title = (TextView) widgetView.findViewById(R.id.title);
        this.description = (TextView) widgetView.findViewById(R.id.description);
        this.button = (TextView) widgetView.findViewById(R.id.button);
        this.button.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.widget.WidgetCoverListItemView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WidgetCoverListItemView.processLink(v.getContext(), WidgetCoverListItemView.this.item.getButtonUrl(), WidgetCoverListItemView.this.item.getButtonTarget());
            }
        });
        setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.widget.WidgetCoverListItemView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WidgetCoverListItemView.processLink(v.getContext(), WidgetCoverListItemView.this.item.getUrl(), WidgetCoverListItemView.this.item.getTarget());
            }
        });
        getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.widget.WidgetCoverListItemView.3
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                int width = WidgetCoverListItemView.this.cover.getWidth();
                if (WidgetCoverListItemView.this.iconSize != width) {
                    WidgetCoverListItemView.this.iconSize = width;
                    WidgetCoverListItemView.this.bindCover(WidgetCoverListItemView.this.iconSize);
                    return true;
                }
                return true;
            }
        });
    }

    public void bind(WidgetCoverList.Item item, boolean topPadding) {
        this.item = item;
        this.title.setText(item.getTitle());
        bindTextView(this.description, item.getDescription());
        bindTextView(this.button, item.getButton());
        bindCover(this.iconSize);
        this.content.setPadding(this.content.getPaddingLeft(), topPadding ? V.dp(8.0f) : 0, this.content.getPaddingRight(), this.content.getPaddingBottom());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void bindCover(int coverSize) {
        ImageSize cover = this.item.getCover(coverSize);
        if (cover == null) {
            this.cover.setImageDrawable(null);
            return;
        }
        this.cover.setAspectRatio(this.coverAspectRation);
        this.cover.load(cover.getUrl());
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
