package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.apps.AppsGetActivity;
import com.vkontakte.android.data.GameFeedEntry;
import com.vkontakte.android.data.VKFromList;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.holder.gamepage.GameFeedHolder;
import com.vkontakte.android.utils.Utils;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GamesFeedFragment extends VKRecyclerFragment<GameFeedEntry> {
    private static final String KEY_APP_ID = "app_id";
    private Adapter adapter;
    private String from;

    public static Bundle createArgs(@NonNull String visitSource) {
        return Utils.writeString(new Bundle(), ArgKeys.VISIT_SOURCE, visitSource);
    }

    public static Bundle createArgs(@NonNull String visitSource, int appId) {
        Bundle bundle = createArgs(visitSource);
        bundle.putInt("app_id", appId);
        return bundle;
    }

    public GamesFeedFragment() {
        super(30);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.games_feed);
        loadData();
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        this.list.setPadding(0, V.dp(8.0f), 0, V.dp(8.0f));
        DividerItemDecoration dividers = new DividerItemDecoration(inflater.getContext().getResources().getDrawable(R.drawable.divider_game_feed), V.dp(0.5f));
        dividers.setProvider(GamesFeedFragment$$Lambda$1.lambdaFactory$(this));
        this.list.addItemDecoration(dividers);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateContentView$0(int position) {
        return position < this.data.size() + (-1);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        SimpleCallback<VKFromList<GameFeedEntry>> simpleCallback = new SimpleCallback<VKFromList<GameFeedEntry>>(this) { // from class: com.vkontakte.android.fragments.GamesFeedFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKFromList<GameFeedEntry> feed) {
                GamesFeedFragment.this.onDataLoaded(feed, feed.from() != null && feed.from().length() > 0);
            }
        };
        if (getArguments().containsKey("app_id")) {
            this.currentRequest = new AppsGetActivity(offset == 0 ? "" : this.from, count, getArguments().getInt("app_id")).setCallback(simpleCallback).exec((Context) getActivity());
        } else {
            this.currentRequest = new AppsGetActivity(offset == 0 ? "" : this.from, count).setCallback(simpleCallback).exec((Context) getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public UsableRecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new Adapter();
        }
        return this.adapter;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class Adapter extends UsableRecyclerView.Adapter {
        Adapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new GameFeedHolder(parent, false).setClickInfo(false, Utils.readString(GamesFeedFragment.this.getArguments(), ArgKeys.VISIT_SOURCE, "direct"), "activity_full");
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
            ((GameFeedHolder) holder).bind(GamesFeedFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return GamesFeedFragment.this.data.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 2;
        }
    }
}
