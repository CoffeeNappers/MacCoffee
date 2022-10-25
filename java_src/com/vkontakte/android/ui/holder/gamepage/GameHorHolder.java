package com.vkontakte.android.ui.holder.gamepage;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.GameCardActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.CatalogInfo;
import com.vkontakte.android.fragments.GamesListFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.widget.HorizontalRecyclerView;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameHorHolder extends RecyclerHolder<Ref> implements View.OnClickListener {
    private View button;
    private RecyclerView recyclerView;
    private TextView textView;
    @NonNull
    private final String visitSource;

    /* loaded from: classes3.dex */
    public interface OnNeedLoadNextPage {
        void onNeedLoadNextPage(int i);
    }

    /* loaded from: classes3.dex */
    public static class Ref {
        public final AppAdapter appAdapter;
        public final CatalogInfo catalogInfo;
        public final int index;
        public final OnNeedLoadNextPage onNeedLoadNextPage;
        public final int titleRes;

        public Ref(int titleRes, int index, @NonNull OnNeedLoadNextPage onNeedLoadNextPage, @NonNull ArrayList<ApiApplication> applications, @NonNull CatalogInfo catalogInfo, @NonNull String visitSource, boolean canShowBadge) {
            this.titleRes = titleRes;
            this.index = index;
            this.onNeedLoadNextPage = onNeedLoadNextPage;
            this.appAdapter = new AppAdapter(visitSource, canShowBadge);
            this.appAdapter.setApiApplications(applications);
            this.catalogInfo = catalogInfo;
        }

        public void clearNotificationOnApp(int appId) {
            this.appAdapter.clearNotificationOnApp(appId);
        }
    }

    public GameHorHolder(@NonNull Context context, @NonNull String visitSource) {
        super((int) R.layout.apps_horizontal_block, context);
        this.visitSource = visitSource;
        this.textView = (TextView) $(R.id.block_title);
        final LinearLayoutManager layoutManager = new LinearLayoutManager(getContext(), 0, false);
        this.recyclerView = (RecyclerView) $(R.id.recycle);
        this.recyclerView.setHasFixedSize(true);
        this.recyclerView.setLayoutManager(layoutManager);
        this.itemView.setBackgroundColor(-1315344);
        this.recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.holder.gamepage.GameHorHolder.1
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                int visibleCount = layoutManager.getChildCount();
                int totalItemCount = layoutManager.getItemCount();
                int firstVisibleItem = layoutManager.findFirstVisibleItemPosition();
                if (visibleCount + firstVisibleItem >= totalItemCount - 3 && GameHorHolder.this.getItem() != null) {
                    GameHorHolder.this.getItem().onNeedLoadNextPage.onNeedLoadNextPage(GameHorHolder.this.getItem().index);
                }
            }
        });
        View $ = $(R.id.block_button);
        this.button = $;
        $.setOnClickListener(this);
        $(R.id.block_title_layout).setOnClickListener(this);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Ref data) {
        data.appAdapter.listHolder = this;
        this.recyclerView.setAdapter(data.appAdapter);
        this.textView.setText(data.titleRes);
        this.button.setVisibility(data.appAdapter.getItemCount() > 3 ? 0 : 8);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (getItem() != null) {
            Navigate.to(GamesListFragment.class, GamesListFragment.createArgs(getItem().catalogInfo, getItem().titleRes, this.visitSource), getContext());
        }
    }

    /* loaded from: classes3.dex */
    public static class AppAdapter extends UsableRecyclerView.Adapter<ViewHolder> implements HorizontalRecyclerView.ItemWidthFixable {
        private ArrayList<ApiApplication> apiApplications = new ArrayList<>();
        private final boolean canShowBadge;
        private int itemWidth;
        private RecyclerHolder listHolder;
        @NonNull
        private final String visitSource;

        public AppAdapter(@NonNull String visitSource, boolean canShowBadge) {
            this.visitSource = visitSource;
            this.canShowBadge = canShowBadge;
        }

        @Override // com.vkontakte.android.ui.widget.HorizontalRecyclerView.ItemWidthFixable
        public void setItemWidth(int itemWidth) {
            this.itemWidth = itemWidth;
        }

        /* loaded from: classes3.dex */
        public static class ViewHolder extends UsableRecyclerView.ViewHolder implements View.OnClickListener, HorizontalRecyclerView.ItemWidthFixable {
            public ArrayList<ApiApplication> apiApplications;
            public TextView badge;
            public ImageView imageInstant;
            public VKImageView imageView;
            public int itemWidth;
            public ApiApplication lastData;
            public TextView textView;
            public String visitSource;

            public ViewHolder(View v) {
                super(v);
                this.itemView.setOnClickListener(this);
                this.textView = (TextView) v.findViewById(R.id.app_name);
                this.imageView = (VKImageView) v.findViewById(R.id.app_image);
                this.imageView.setAspectRatio(1.0f);
                this.badge = (TextView) v.findViewById(R.id.app_badge);
                this.imageInstant = (ImageView) v.findViewById(R.id.app_img_instant);
                setItemWidth(this.itemWidth);
            }

            @Override // com.vkontakte.android.ui.widget.HorizontalRecyclerView.ItemWidthFixable
            public void setItemWidth(int itemWidth) {
                if (this.itemWidth != itemWidth) {
                    this.itemWidth = itemWidth;
                    if (itemWidth > 0) {
                        this.itemView.getLayoutParams().width = itemWidth;
                        this.itemView.setMinimumWidth(itemWidth);
                        this.itemView.forceLayout();
                    }
                }
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                GameCardActivity.openApp(v.getContext(), this.visitSource, "catalog", this.apiApplications, this.apiApplications.indexOf(this.lastData));
            }
        }

        public void clearNotificationOnApp(int appId) {
            Iterator<ApiApplication> it = this.apiApplications.iterator();
            while (it.hasNext()) {
                ApiApplication application = it.next();
                if (application.id == appId) {
                    application.notificationCount = 0;
                }
            }
            notifyDataSetChanged();
        }

        public void setApiApplications(ArrayList<ApiApplication> apiApplications) {
            this.apiApplications = apiApplications;
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new ViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.apps_app_card, parent, false));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(ViewHolder holder, int position) {
            int i = 0;
            holder.setItemWidth(this.itemWidth);
            holder.lastData = this.apiApplications.get(position);
            holder.textView.setText(holder.lastData.title);
            holder.badge.setText(String.valueOf(holder.lastData.notificationCount));
            holder.badge.setVisibility((holder.lastData.notificationCount <= 0 || !this.canShowBadge) ? 8 : 0);
            holder.imageView.load(holder.lastData.icon.getImageByWidth(V.dp(112.0f)).url);
            ImageView imageView = holder.imageInstant;
            if (!holder.lastData.isHtml5App) {
                i = 8;
            }
            imageView.setVisibility(i);
            holder.apiApplications = this.apiApplications;
            holder.visitSource = this.visitSource;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.apiApplications.size();
        }
    }
}
