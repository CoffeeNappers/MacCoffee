package com.vkontakte.android.fragments.base;

import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.tonicartos.superslim.GridSLM;
import com.tonicartos.superslim.LayoutManager;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.fragments.friends.HeaderHolder;
import com.vkontakte.android.ui.MathUtils;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.ui.recyclerview.FastScroller;
import com.vkontakte.android.ui.util.Segmenter;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public abstract class SegmenterFragment<T> extends VKRecyclerFragment<T> {
    private SegmenterFragment<T>.GridAdapter<T, ?> mAdapter;
    private CardItemDecoration mCardDecoration;
    protected int margin;
    protected int padding;

    protected abstract SegmenterFragment<T>.GridAdapter<T, ?> createAdapter();

    protected abstract int getColumnsCount();

    protected abstract Segmenter getSegmenter();

    public SegmenterFragment() {
        this(Integer.MAX_VALUE);
    }

    public SegmenterFragment(int perPage) {
        super(perPage);
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
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateDecorator();
        mo1066getAdapter().notifyDataSetChanged();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.views.UsableRecyclerView.Listener
    public final void onScrolledToLastItem() {
        super.onScrolledToLastItem();
        getSegmenter().onScrollToLastItem();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected final View onCreateFooterView(LayoutInflater inflater) {
        return null;
    }

    public void updateDecorator() {
        if (this.list != null) {
            this.list.removeItemDecoration(this.mCardDecoration);
        }
        this.mCardDecoration = onCreateCardDecorator();
        if (this.mCardDecoration != null) {
            this.list.addItemDecoration(this.mCardDecoration);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public CardItemDecoration onCreateCardDecorator() {
        int paddingTop;
        int i = 0;
        CardItemDecoration decorator = new CardItemDecoration(null, !this.isTablet);
        if (this.scrW >= 600) {
            this.padding = V.dp(12.0f);
            paddingTop = V.dp(6.0f);
        } else if (this.scrW >= 480) {
            this.padding = V.dp(8.0f);
            paddingTop = 0;
        } else {
            this.padding = 0;
            paddingTop = 0;
        }
        int paddingTop2 = paddingTop + V.dp(8.0f);
        if (this.scrW >= 924) {
            i = V.dp(Math.max(16, ((this.scrW - 840) - 84) / 2));
        }
        this.margin = i;
        this.list.setPadding(this.margin + this.padding, paddingTop2, this.margin + this.padding, this.padding);
        decorator.setPadding(this.padding, paddingTop2, this.padding, this.padding);
        return decorator;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: onCreateLayoutManager  reason: collision with other method in class */
    public final LayoutManager mo1032onCreateLayoutManager() {
        return new LayoutManager(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public SegmenterFragment<T>.GridAdapter<T, ?> mo1066getAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = createAdapter();
        }
        return this.mAdapter;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public final void updateList() {
        mo1066getAdapter().setData(getSegmenter());
        super.updateList();
    }

    protected int getColumnsCount(int position) {
        return getColumnsCount();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public abstract class GridAdapter<T, VH extends RecyclerHolder<T>> extends UsableRecyclerView.Adapter implements CardItemDecoration.Provider, BottomDividerDecoration.Provider, FastScroller.Provider {
        protected static final int TYPE_FOOTER = 2;
        protected static final int TYPE_HEADER = 0;
        protected static final int TYPE_ITEM = 1;
        protected Segmenter mSegmenter;

        /* renamed from: createViewHolder */
        public abstract VH mo1074createViewHolder(ViewGroup viewGroup);

        /* JADX INFO: Access modifiers changed from: protected */
        public GridAdapter() {
        }

        public GridAdapter setData(Segmenter segmenter) {
            this.mSegmenter = segmenter;
            notifyDataSetChanged();
            return this;
        }

        public GridAdapter setDataWithoutUpdate(Segmenter segmenter) {
            this.mSegmenter = segmenter;
            return this;
        }

        public RecyclerView.ViewHolder createHeaderHolder(ViewGroup parent) {
            return new HeaderHolder(parent);
        }

        public void bindHeaderHolder(RecyclerView.ViewHolder holder, GridSLM.LayoutParams params, int position) {
            ((HeaderHolder) holder).bind(getPopupText(position));
            params.isHeader = true;
            params.headerDisplay = 1;
        }

        public void bindViewHolder(VH holder, GridSLM.LayoutParams params, int position) {
            holder.bind(getItem(position));
        }

        public void bindCustomViewHolder(RecyclerView.ViewHolder holder, GridSLM.LayoutParams params, int position) {
        }

        public RecyclerView.ViewHolder createFooterHolder(ViewGroup parent) {
            return new FooterHolder(parent);
        }

        public void bindFooterHolder(RecyclerView.ViewHolder holder, GridSLM.LayoutParams params, int position) {
            ((FooterHolder) holder).bind(this.mSegmenter.getFooter());
            params.isHeader = true;
            params.headerDisplay = 1;
            params.topMargin = SegmenterFragment.this.mCardDecoration == null ? 0 : SegmenterFragment.this.mCardDecoration.getPaddingBottom();
            params.setFirstPosition(position);
        }

        public int getImagesCountForItem(int position) {
            return 0;
        }

        public String getImageUrl(int position, int image) {
            return null;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public void adjustMultiColumn(GridSLM.LayoutParams params) {
            if (SegmenterFragment.this.scrW >= 600) {
                if (SegmenterFragment.this.isTablet) {
                    params.setColumnWidth(V.dp(160.0f));
                    params.setNumColumns(-1);
                    return;
                }
                params.setColumnWidth(V.dp(270.0f));
                params.setNumColumns(2);
                return;
            }
            params.setNumColumns(1);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return createHeaderHolder(parent);
                case 1:
                    return mo1074createViewHolder(parent);
                case 2:
                    return createFooterHolder(parent);
                default:
                    return null;
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
            GridSLM.LayoutParams params = GridSLM.LayoutParams.from(holder.itemView.getLayoutParams());
            params.height = -2;
            params.setNumColumns(SegmenterFragment.this.getColumnsCount(position));
            params.setFirstPosition(this.mSegmenter.getSegmentIndex(position));
            params.bottomMargin = 0;
            params.topMargin = 0;
            params.setSlm(GridSLM.ID);
            holder.itemView.setLayoutParams(params);
            switch (getItemViewType(position)) {
                case 0:
                    bindHeaderHolder(holder, params, position);
                    return;
                case 1:
                    bindViewHolder((RecyclerHolder) holder, params, position);
                    return;
                case 2:
                    bindFooterHolder(holder, params, position);
                    return;
                default:
                    bindCustomViewHolder(holder, params, position);
                    return;
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            if (position == this.mSegmenter.getItemCount()) {
                return 2;
            }
            return this.mSegmenter.isHeader(position) ? 0 : 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            if (getItemViewType(position) == 1) {
                return getImagesCountForItem(position);
            }
            return 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return getImageUrl(position, image);
        }

        @Override // com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            int itemCount = getItemCount() - (this.mSegmenter.getFooter() != null ? 2 : 1);
            int result = 0;
            if (position == 0) {
                result = 0 | 2;
            }
            if (result == 0 && position <= itemCount) {
                return result | 1;
            }
            return result;
        }

        @Override // com.vkontakte.android.ui.recyclerview.BottomDividerDecoration.Provider
        public boolean drawAfter(int position) {
            if (getItemViewType(position) == 1) {
                int lastHeaderPosition = this.mSegmenter.getSegmentIndex(position);
                int currentSection = this.mSegmenter.getSegmentForPosition(position);
                int segmentItemsCount = this.mSegmenter.getSegmentItemsCount(currentSection);
                int columnsCount = SegmenterFragment.this.getColumnsCount();
                boolean segmentHasHeader = this.mSegmenter.isHeader(lastHeaderPosition);
                int positionInSegment = (position - lastHeaderPosition) - (segmentHasHeader ? 1 : 0);
                int lastRowStart = MathUtils.truncate(segmentItemsCount, columnsCount);
                return positionInSegment >= lastRowStart && currentSection < this.mSegmenter.getSegmentsCount() + (-1);
            }
            return false;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            if (this.mSegmenter == null) {
                return 0;
            }
            return this.mSegmenter.getFooter() == null ? this.mSegmenter.getItemCount() : this.mSegmenter.getItemCount() + 1;
        }

        @Override // com.vkontakte.android.ui.recyclerview.FastScroller.Provider
        public CharSequence getPopupText(int position) {
            if (position == getItemCount()) {
                position--;
            }
            return this.mSegmenter.getSegment(this.mSegmenter.getSegmentForPosition(position));
        }

        public T getItem(int position) {
            return (T) this.mSegmenter.getItem(position);
        }
    }

    /* loaded from: classes2.dex */
    public static class FooterHolder extends RecyclerHolder<Segmenter.Footer> {
        private ViewGroup mError;
        private View mErrorRetry;
        private TextView mErrorText;
        private ProgressBar mProgress;

        public FooterHolder(ViewGroup parent) {
            super((int) R.layout.appkit_load_more, parent);
            this.mProgress = (ProgressBar) $(R.id.load_more_progress);
            this.mError = (ViewGroup) $(R.id.load_more_error);
            this.mErrorText = (TextView) $(R.id.error_text);
            this.mErrorRetry = $(R.id.error_retry);
            showProgress();
        }

        void showProgress() {
            this.mProgress.setVisibility(0);
            this.mError.setVisibility(8);
            this.mErrorText.setVisibility(8);
            this.mErrorRetry.setVisibility(8);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Segmenter.Footer item) {
            if (item.getState() != null) {
                switch (item.getState()) {
                    case Loading:
                        showProgress();
                        return;
                    case Error:
                        this.mProgress.setVisibility(8);
                        this.mError.setVisibility(0);
                        this.mErrorText.setVisibility(0);
                        this.mErrorRetry.setVisibility(0);
                        this.mErrorText.setText(item.toString());
                        return;
                    case Message:
                        this.mProgress.setVisibility(8);
                        this.mError.setVisibility(0);
                        this.mErrorText.setVisibility(0);
                        this.mErrorRetry.setVisibility(8);
                        this.mErrorText.setText(item.toString());
                        return;
                    default:
                        return;
                }
            }
        }
    }
}
