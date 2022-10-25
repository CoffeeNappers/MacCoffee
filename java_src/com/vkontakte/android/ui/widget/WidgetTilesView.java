package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.api.widget.WidgetTiles;
import java.util.List;
/* loaded from: classes3.dex */
public class WidgetTilesView extends WidgetItemsView<WidgetTilesItemView> {
    private final LinearLayout viewHost;

    public WidgetTilesView(Context context) {
        this(context, null);
    }

    public WidgetTilesView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetTilesView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        setPadding(0, 0, 0, Global.scale(8.0f));
        int padding = ((int) context.getResources().getDimension(R.dimen.post_side_padding)) - WidgetTilesItemView.padding;
        this.viewHost = new LinearLayout(context);
        this.viewHost.setOrientation(0);
        this.viewHost.setPadding(padding, 0, padding, 0);
        HorizontalScrollView scrollView = new HorizontalScrollView(context);
        scrollView.setHorizontalScrollBarEnabled(false);
        scrollView.setVerticalScrollBarEnabled(false);
        scrollView.addView(this.viewHost);
        addView(scrollView);
    }

    @Override // com.vkontakte.android.ui.widget.WidgetItemsView
    protected ViewGroup getViewHost() {
        return this.viewHost;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.widget.WidgetItemsView
    @NonNull
    public WidgetTilesItemView createItemView(Context context) {
        return new WidgetTilesItemView(context);
    }

    @Override // com.vkontakte.android.ui.widget.WidgetTitleView, com.vkontakte.android.ui.widget.WidgetBinder
    public void bind(Widget widget) {
        super.bind(widget);
        if (widget instanceof WidgetTiles) {
            bind(((WidgetTiles) widget).getItems());
        }
    }

    private void bind(List<WidgetTiles.Item> rows) {
        super.bind(rows.size());
        for (int i = 0; i < rows.size(); i++) {
            ((WidgetTilesItemView) this.items.get(i)).bind(rows.get(i));
        }
    }
}
