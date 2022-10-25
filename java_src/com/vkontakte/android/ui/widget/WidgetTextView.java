package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import com.vk.attachpicker.util.Fonts;
import com.vkontakte.android.R;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.api.widget.WidgetText;
/* loaded from: classes3.dex */
public class WidgetTextView extends WidgetTitleView {
    private final TextView descriptionView;
    private final TextView textView;

    public WidgetTextView(Context context) {
        this(context, null);
    }

    public WidgetTextView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetTextView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        View widgetView = inflate(getContext(), R.layout.profile_widget_text, this);
        this.textView = (TextView) widgetView.findViewById(R.id.text);
        this.textView.setTypeface(Fonts.getRobotoRegular());
        this.descriptionView = (TextView) widgetView.findViewById(R.id.description);
        this.descriptionView.setTypeface(Fonts.getRobotoRegular());
    }

    @Override // com.vkontakte.android.ui.widget.WidgetTitleView, com.vkontakte.android.ui.widget.WidgetBinder
    public void bind(Widget widget) {
        int i = 8;
        super.bind(widget);
        if (widget instanceof WidgetText) {
            WidgetText widgetText = (WidgetText) widget;
            this.textView.setText(widgetText.getText());
            this.descriptionView.setText(widgetText.getDescription());
            this.textView.setVisibility(TextUtils.isEmpty(widgetText.getText()) ? 8 : 0);
            TextView textView = this.descriptionView;
            if (!TextUtils.isEmpty(widgetText.getDescription())) {
                i = 0;
            }
            textView.setVisibility(i);
        }
    }
}
