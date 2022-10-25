package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.TextFormatter;
import com.vkontakte.android.api.widget.Widget;
import java.text.NumberFormat;
/* loaded from: classes3.dex */
public class WidgetTitleView extends WidgetView {
    private final TextView moreView;
    private final TextView titleView;

    public WidgetTitleView(Context context) {
        this(context, null);
    }

    public WidgetTitleView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetTitleView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        View widgetView = inflate(getContext(), R.layout.profile_widget_title, this);
        this.titleView = (TextView) widgetView.findViewById(R.id.title);
        this.moreView = (TextView) widgetView.findViewById(R.id.button_more);
    }

    public void bind(Widget widget) {
        CharSequence title;
        CharSequence more = widget.getMore();
        if (widget.getTitleCounter() == null) {
            title = widget.getTitle();
        } else {
            title = TextFormatter.processString(widget.getTitle() + "  /cFF909499" + NumberFormat.getInstance().format(widget.getTitleCounter()) + "/e");
        }
        this.titleView.setText(title);
        this.moreView.setText(more);
        this.moreView.setVisibility(TextUtils.isEmpty(more) ? 8 : 0);
        String titleUrl = widget.getTitleUrl();
        String moreUrl = widget.getMoreUrl();
        if (!TextUtils.isEmpty(moreUrl)) {
            this.moreView.setOnClickListener(WidgetTitleView$$Lambda$1.lambdaFactory$(this, moreUrl));
        }
        if (!TextUtils.isEmpty(titleUrl)) {
            this.titleView.setOnClickListener(WidgetTitleView$$Lambda$2.lambdaFactory$(this, titleUrl));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$bind$0(String moreUrl, View v) {
        openLink(getContext(), moreUrl);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$bind$1(String titleUrl, View v) {
        openLink(getContext(), titleUrl);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void openLink(Context context, String url) {
        Intent intent = new Intent(context, LinkRedirActivity.class);
        intent.setData(Uri.parse(url));
        context.startActivity(intent);
    }
}
