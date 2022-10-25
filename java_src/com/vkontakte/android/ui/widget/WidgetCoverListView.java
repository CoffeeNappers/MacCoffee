package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import com.vkontakte.android.Global;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.api.widget.WidgetCoverList;
import java.util.List;
/* loaded from: classes3.dex */
public class WidgetCoverListView extends WidgetItemsView<WidgetCoverListItemView> {
    public WidgetCoverListView(Context context) {
        this(context, null);
    }

    public WidgetCoverListView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetCoverListView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        setPadding(0, 0, 0, Global.scale(8.0f));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.widget.WidgetItemsView
    @NonNull
    public WidgetCoverListItemView createItemView(Context context) {
        return new WidgetCoverListItemView(context);
    }

    @Override // com.vkontakte.android.ui.widget.WidgetTitleView, com.vkontakte.android.ui.widget.WidgetBinder
    public void bind(Widget widget) {
        super.bind(widget);
        if (widget instanceof WidgetCoverList) {
            bind(((WidgetCoverList) widget).getItems());
        }
    }

    private void bind(List<WidgetCoverList.Item> rows) {
        super.bind(rows.size());
        int i = 0;
        while (i < rows.size()) {
            ((WidgetCoverListItemView) this.items.get(i)).bind(rows.get(i), i > 0);
            i++;
        }
    }
}
