package com.vkontakte.android.fragments.base;

import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewTreeObserver;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.functions.IntFIntInt;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public abstract class GridFragment<T> extends VKRecyclerFragment<T> {
    private GridFragment<T>.GridAdapter<?> mAdapter;
    private RecyclerView.ItemDecoration mCardDecoration;
    private IntFIntInt mSpanSizeLoockuper;

    protected abstract GridFragment<T>.GridAdapter<?> createAdapter();

    protected abstract int getColumnsCount();

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSpanSizeLoockuper(IntFIntInt spanSizeLoockuper) {
        this.mSpanSizeLoockuper = spanSizeLoockuper;
    }

    public GridFragment(int perPage) {
        super(perPage);
    }

    public GridFragment(int layoutId, int perPage) {
        super(layoutId, perPage);
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        updateDecorator();
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.setScrollBarStyle(33554432);
        updateLayoutManager();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateDecorator();
        updateLayoutManager();
    }

    public void updateDecorator() {
        this.list.removeItemDecoration(this.mCardDecoration);
        this.mCardDecoration = onCreateCardDecorator();
        if (this.mCardDecoration != null) {
            this.list.addItemDecoration(this.mCardDecoration);
        }
    }

    public void updateLayoutManager() {
        updateLayoutManager(false);
    }

    public void updateLayoutManager(final boolean force) {
        final int oldWidth = this.list.getWidth();
        this.list.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.vkontakte.android.fragments.base.GridFragment.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                if (GridFragment.this.list != null) {
                    if (GridFragment.this.list.getWidth() != oldWidth || (GridFragment.this.list.getWidth() > 0 && force)) {
                        GridLayoutManager layoutManager = (GridLayoutManager) GridFragment.this.list.getLayoutManager();
                        if (layoutManager != null) {
                            layoutManager.setSpanCount(GridFragment.this.getColumnsCount());
                            layoutManager.requestLayout();
                        }
                        GridFragment.this.list.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                    }
                }
            }
        });
    }

    protected CardItemDecoration onCreateCardDecorator() {
        int padding;
        CardItemDecoration decorator = new CardItemDecoration(null, !this.isTablet);
        if (this.scrW >= 600) {
            padding = V.dp(12.0f);
        } else if (this.scrW >= 480) {
            padding = V.dp(8.0f);
        } else {
            padding = 0;
        }
        int paddingTop = V.dp(8.0f) + padding;
        int margin = this.scrW >= 924 ? V.dp(Math.max(16, ((this.scrW - 840) - 84) / 2)) : 0;
        this.list.setPadding(margin + padding, paddingTop, margin + padding, padding);
        decorator.setPadding(padding, paddingTop, padding, padding);
        return decorator;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: onCreateLayoutManager */
    public final GridLayoutManager mo1032onCreateLayoutManager() {
        final GridLayoutManager manager = new GridLayoutManager(getActivity(), 1);
        manager.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.vkontakte.android.fragments.base.GridFragment.2
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                if (GridFragment.this.mSpanSizeLoockuper != null) {
                    return GridFragment.this.mSpanSizeLoockuper.f(position, manager.getSpanCount());
                }
                return 1;
            }
        });
        return manager;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public GridFragment<T>.GridAdapter<?> mo1066getAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = createAdapter();
        }
        return this.mAdapter;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public abstract class GridAdapter<VH extends RecyclerHolder> extends UsableRecyclerView.Adapter<VH> implements CardItemDecoration.Provider {
        /* JADX INFO: Access modifiers changed from: protected */
        public GridAdapter() {
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.v7.widget.RecyclerView.Adapter
        public /* bridge */ /* synthetic */ void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
            onBindViewHolder((GridAdapter<VH>) ((RecyclerHolder) viewHolder), i);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public void onBindViewHolder(VH holder, int position) {
            holder.bind(GridFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            if (GridFragment.this.data == null) {
                return 0;
            }
            return GridFragment.this.data.size();
        }

        @Override // com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            int result = 0;
            int itemCount = getItemCount();
            if (position == itemCount) {
                return 0;
            }
            if (position == 0) {
                result = 0 | 2;
            }
            if (position == itemCount - 1) {
                result |= 4;
            }
            if (result == 0) {
                result |= 1;
            }
            return result;
        }
    }
}
