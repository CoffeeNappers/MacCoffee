package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.apps.AppsGetCatalog;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.CatalogInfo;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.holder.gamepage.GameAppHolder;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GamesListFragment extends VKRecyclerFragment<ApiApplication> implements GameAppHolder.GetterData {
    private static final String KEY_CATALOG_INFO = "key_filter";
    private static final String KEY_TITLE = "key_title";
    private AppsAdapter adapter;
    private BroadcastReceiver receiver;

    public static Bundle createArgs(@NonNull CatalogInfo info, int titleRes, @NonNull String visitSource) {
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_CATALOG_INFO, info);
        bundle.putInt(KEY_TITLE, titleRes);
        bundle.putString(ArgKeys.VISIT_SOURCE, visitSource);
        return bundle;
    }

    private CatalogInfo getCatalogInfo() {
        return (CatalogInfo) getArguments().getParcelable(KEY_CATALOG_INFO);
    }

    public GamesListFragment() {
        super(50);
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.GamesListFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Games.ACTION_RELOAD_INSTALLED.equals(intent.getAction())) {
                    GamesListFragment.this.refresh();
                }
            }
        };
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        loadData();
        setTitle(getArguments().getInt(KEY_TITLE));
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        this.list.setPadding(0, V.dp(8.0f), 0, V.dp(8.0f));
        return view;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        IntentFilter filter = new IntentFilter();
        filter.addAction(Games.ACTION_RELOAD_INSTALLED);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new AppsGetCatalog(getCatalogInfo().getServerKey(), offset, count, getCatalogInfo().platform).setCallback(new SimpleListCallback(this)).exec(Looper.getMainLooper());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(List<ApiApplication> d, boolean more) {
        if (d != null) {
            CatalogInfo catalogInfo = getCatalogInfo();
            for (ApiApplication application : d) {
                application.catalogInfo = catalogInfo;
            }
        }
        super.onDataLoaded(d, more);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public AppsAdapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new AppsAdapter();
        }
        return this.adapter;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class AppsAdapter extends UsableRecyclerView.Adapter<GameAppHolder> {
        private AppsAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public GameAppHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new GameAppHolder(GamesListFragment.this, parent.getContext(), Utils.readString(GamesListFragment.this.getArguments(), ArgKeys.VISIT_SOURCE, "direct"));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(GameAppHolder holder, int position) {
            holder.bind(GamesListFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return GamesListFragment.this.data.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return GameAppHolder.getIconUrl((ApiApplication) GamesListFragment.this.data.get(position));
        }
    }

    @Override // com.vkontakte.android.ui.holder.gamepage.GameAppHolder.GetterData
    public ArrayList<ApiApplication> getApiApplications() {
        return this.data;
    }
}
