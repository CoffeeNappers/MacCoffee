package com.vkontakte.android.ui.holder.gamepage;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.api.apps.CatalogLoader;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.CatalogInfo;
import com.vkontakte.android.data.GameGenre;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.commons.LoaderHolder;
import com.vkontakte.android.ui.holder.gamepage.GameAppHolder;
import com.vkontakte.android.ui.holder.gamepage.GameHorHolder;
import com.vkontakte.android.ui.widget.SubPagerOfList;
import com.vkontakte.android.ui.widget.SubPagerOfListItem;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes3.dex */
public class GameGenresHolder extends RecyclerHolder<SubPagerOfList.ArrayListWithIndex<GenresData>> {
    private SubPagerOfList viewPager;
    @NonNull
    private final String visitSource;

    /* loaded from: classes3.dex */
    public static class GenresData implements GameHorHolder.OnNeedLoadNextPage {
        public ArrayList<ApiApplication> apiApplications;
        public AppsAdapter appsAdapter;
        private CatalogLoader catalogLoaderFeatured = null;
        @Nullable
        public final GameGenre gameGenre;

        public GenresData(@Nullable GameGenre gameGenre, @NonNull ArrayList<ApiApplication> apiApplications) {
            this.gameGenre = gameGenre;
            this.apiApplications = apiApplications;
        }

        public AppsAdapter getAppsAdapter(@NonNull Context ctx, @NonNull String visitSource) {
            if (this.appsAdapter == null) {
                String title = this.gameGenre == null ? ctx.getString(R.string.games_recommended) : this.gameGenre.name;
                this.appsAdapter = new AppsAdapter(this.apiApplications, title, ctx, true, this, visitSource);
                this.catalogLoaderFeatured = new CatalogLoader(this.apiApplications, this.gameGenre == null ? new CatalogInfo(title) : new CatalogInfo(this.gameGenre), false) { // from class: com.vkontakte.android.ui.holder.gamepage.GameGenresHolder.GenresData.1
                    @Override // com.vkontakte.android.api.apps.CatalogLoader
                    public void onLoadedNextPage(ArrayList<ApiApplication> allData, boolean canLoadMore) {
                        AppsAdapter appsAdapter = GenresData.this.appsAdapter;
                        GenresData.this.apiApplications = allData;
                        appsAdapter.setData(allData, canLoadMore);
                    }
                };
            }
            return this.appsAdapter;
        }

        @Override // com.vkontakte.android.ui.holder.gamepage.GameHorHolder.OnNeedLoadNextPage
        public void onNeedLoadNextPage(int index) {
            if (this.catalogLoaderFeatured != null) {
                this.catalogLoaderFeatured.forceLoadNextPage();
            }
        }
    }

    public GameGenresHolder(@NonNull ViewGroup parent, @NonNull String visitSource) {
        super((int) R.layout.apps_genre_tabs, parent);
        this.visitSource = visitSource;
        this.viewPager = (SubPagerOfList) $(R.id.pager);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(SubPagerOfList.ArrayListWithIndex<GenresData> data) {
        List<SubPagerOfListItem.SubPagerOfListAdapter> baseAdapters = new ArrayList<>();
        Iterator<GenresData> it = data.iterator();
        while (it.hasNext()) {
            GenresData genre = it.next();
            baseAdapters.add(genre.getAppsAdapter(getContext(), this.visitSource));
        }
        this.viewPager.setData(baseAdapters, R.dimen.app_item_height, null, GameGenresHolder$$Lambda$1.lambdaFactory$(this, data));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onBind$0(SubPagerOfList.ArrayListWithIndex data) {
        ((RecyclerView) getParent()).scrollToPosition(data.index);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class AppsAdapter extends SubPagerOfListItem.SubPagerOfListAdapter implements GameAppHolder.GetterData {
        private static final int VIEW_TYPE_APP = 0;
        private static final int VIEW_TYPE_LOADER = 1;
        private final Context context;
        private ArrayList<ApiApplication> data;
        private boolean isLoaderShowing;
        @NonNull
        private final GameHorHolder.OnNeedLoadNextPage onNeedLoadNextPage;
        private final String title;
        @NonNull
        private final String visitSource;

        public AppsAdapter(@NonNull ArrayList<ApiApplication> data, @Nullable String title, @NonNull Context context, boolean isLoaderShowing, @NonNull GameHorHolder.OnNeedLoadNextPage onNeedLoadNextPage, @NonNull String visitSource) {
            this.isLoaderShowing = false;
            this.isLoaderShowing = isLoaderShowing;
            this.data = data;
            this.title = title;
            this.context = context;
            this.onNeedLoadNextPage = onNeedLoadNextPage;
            this.visitSource = visitSource;
        }

        public void setData(@NonNull ArrayList<ApiApplication> data, boolean isLoaderShowing) {
            this.data = data;
            this.isLoaderShowing = isLoaderShowing;
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return (!this.isLoaderShowing || position < this.data.size()) ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    GameAppHolder gameAppHolder = new GameAppHolder(this, this.context, this.visitSource);
                    gameAppHolder.itemView.setClickable(true);
                    gameAppHolder.itemView.setOnClickListener(gameAppHolder);
                    gameAppHolder.itemView.setBackgroundResource(R.drawable.highlight);
                    return gameAppHolder;
                default:
                    return new LoaderHolder(parent);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
            switch (getItemViewType(position)) {
                case 0:
                    ((GameAppHolder) holder).bind(this.data.get(position));
                    return;
                default:
                    return;
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.isLoaderShowing ? this.data.size() + 1 : this.data.size();
        }

        @Override // com.vkontakte.android.ui.holder.gamepage.GameAppHolder.GetterData
        public ArrayList<ApiApplication> getApiApplications() {
            return this.data;
        }

        @Override // com.vkontakte.android.ui.widget.SubPagerOfListItem.SubPagerOfListAdapter
        public String getTitle() {
            return this.title;
        }

        @Override // com.vkontakte.android.ui.widget.SubPagerOfListItem.SubPagerOfListAdapter
        public void onScroll(RecyclerView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
            if (visibleItemCount + firstVisibleItem >= totalItemCount - 3) {
                this.onNeedLoadNextPage.onNeedLoadNextPage(0);
            }
        }
    }
}
