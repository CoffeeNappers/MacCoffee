package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import me.grishka.appkit.views.RecyclerViewDelegate;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class VKRecyclerView extends UsableRecyclerView {
    public final VKRecyclerViewDelegate delegate;

    public VKRecyclerView(Context context) {
        super(context);
        this.delegate = new VKRecyclerViewDelegate(this);
    }

    public VKRecyclerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.delegate = new VKRecyclerViewDelegate(this);
    }

    public VKRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.delegate = new VKRecyclerViewDelegate(this);
    }

    /* loaded from: classes3.dex */
    public static class VKRecyclerViewDelegate extends RecyclerViewDelegate {
        private VKRecyclerView recyclerView;

        public VKRecyclerViewDelegate(VKRecyclerView view) {
            super(view);
            this.recyclerView = view;
        }

        public void setSelectionFromTop(int position, int y) {
            RecyclerView.LayoutManager lm = this.recyclerView.getLayoutManager();
            if (lm instanceof LinearLayoutManager) {
                ((LinearLayoutManager) lm).scrollToPositionWithOffset(position, y);
            }
        }

        public void setSelection(int position) {
            setSelectionFromTop(position, 0);
        }

        public void setStackFromBottom(boolean b) {
            RecyclerView.LayoutManager lm = this.recyclerView.getLayoutManager();
            if (lm instanceof LinearLayoutManager) {
                ((LinearLayoutManager) lm).setStackFromEnd(b);
            }
        }
    }
}
