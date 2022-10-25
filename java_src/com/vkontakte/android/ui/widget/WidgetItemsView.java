package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public abstract class WidgetItemsView<V extends View> extends WidgetTitleView {
    protected final List<V> items;

    @NonNull
    protected abstract V createItemView(Context context);

    public WidgetItemsView(Context context) {
        super(context);
        this.items = new ArrayList();
    }

    public WidgetItemsView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.items = new ArrayList();
    }

    public WidgetItemsView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.items = new ArrayList();
    }

    protected ViewGroup getViewHost() {
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void bind(int itemsCount) {
        while (itemsCount != this.items.size()) {
            if (itemsCount > this.items.size()) {
                V view = createItemView(getContext());
                this.items.add(view);
                getViewHost().addView(view);
            } else {
                V view2 = this.items.get(this.items.size() - 1);
                this.items.remove(view2);
                getViewHost().removeView(view2);
            }
        }
    }
}
