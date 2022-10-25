package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import com.vkontakte.android.Global;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.api.widget.WidgetList;
import java.util.List;
/* loaded from: classes3.dex */
public class WidgetListView extends WidgetItemsView<WidgetListItemView> {
    public WidgetListView(Context context) {
        this(context, null);
    }

    public WidgetListView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetListView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        setPadding(0, 0, 0, Global.scale(8.0f));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.widget.WidgetItemsView
    @NonNull
    public WidgetListItemView createItemView(Context context) {
        return new WidgetListItemView(context);
    }

    @Override // com.vkontakte.android.ui.widget.WidgetTitleView, com.vkontakte.android.ui.widget.WidgetBinder
    public void bind(Widget widget) {
        super.bind(widget);
        if (widget instanceof WidgetList) {
            bind(((WidgetList) widget).getItems());
        }
    }

    private void bind(List<WidgetList.Item> rows) {
        super.bind(rows.size());
        int i = 0;
        while (i < rows.size()) {
            WidgetListItemView view = (WidgetListItemView) this.items.get(i);
            view.bind(rows.get(i), i < this.items.size() + (-1));
            i++;
        }
    }
}
