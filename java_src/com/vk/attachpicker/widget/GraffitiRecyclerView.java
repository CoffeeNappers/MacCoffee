package com.vk.attachpicker.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.util.AttributeSet;
import com.vkontakte.android.R;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GraffitiRecyclerView extends UsableRecyclerView {
    public GraffitiRecyclerView(Context context) {
        super(context);
    }

    public GraffitiRecyclerView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public GraffitiRecyclerView(Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        int columnWidth = (int) getResources().getDimension(R.dimen.picker_graffiti_size);
        final int spanCount = Math.max(1, getMeasuredWidth() / columnWidth);
        if (getLayoutManager() != null) {
            GridLayoutManager lm = (GridLayoutManager) getLayoutManager();
            lm.setSpanCount(spanCount);
            lm.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.attachpicker.widget.GraffitiRecyclerView.1
                @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
                public int getSpanSize(int position) {
                    if (position == 0) {
                        return spanCount;
                    }
                    return 1;
                }
            });
        }
    }
}
