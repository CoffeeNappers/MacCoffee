package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.v4.content.LocalBroadcastManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.apps.AppsGetRequests;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.drawables.RequestBgDrawable;
import com.vkontakte.android.ui.holder.gamepage.GameInviteHolder;
import com.vkontakte.android.utils.Utils;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GamesRequestFragment extends VKRecyclerFragment<GameRequest> {
    private static final String KEY_REQUESTS = "requests";
    private Adapter adapter;
    private ArrayList<WeakReference<RequestBgDrawable>> drawablesList;
    private boolean fadeDrawablesAndHideRequestsCalled;
    private BroadcastReceiver receiverDeleteRequest;

    public GamesRequestFragment() {
        super(100);
        this.receiverDeleteRequest = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.GamesRequestFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Games.ACTION_DELETE_REQUEST.equals(intent.getAction()) && GamesRequestFragment.this.adapter != null && GamesRequestFragment.this.data != null) {
                    GamesRequestFragment.this.data.remove(Games.getRequestFromIntent(intent));
                    GamesRequestFragment.this.adapter.notifyDataSetChanged();
                }
            }
        };
        this.drawablesList = new ArrayList<>();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LocalBroadcastManager.getInstance(getActivity()).registerReceiver(this.receiverDeleteRequest, new IntentFilter(Games.ACTION_DELETE_REQUEST));
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        LocalBroadcastManager.getInstance(getActivity()).unregisterReceiver(this.receiverDeleteRequest);
        super.onDestroy();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.games_invites_title);
        ArrayList<GameRequest> requests = getDataFromArg();
        if (requests != null) {
            onDataLoaded(requests);
        } else {
            loadData();
        }
    }

    public static Bundle createBundle(ArrayList<GameRequest> requests, @NonNull String visitSource) {
        Bundle bundle = new Bundle();
        if (requests != null) {
            bundle.putParcelableArrayList(KEY_REQUESTS, requests);
        }
        bundle.putString(ArgKeys.VISIT_SOURCE, visitSource);
        return bundle;
    }

    private ArrayList<GameRequest> getDataFromArg() {
        if (getArguments().containsKey(KEY_REQUESTS)) {
            ArrayList<Parcelable> parcelables = getArguments().getParcelableArrayList(KEY_REQUESTS);
            ArrayList<GameRequest> requests = new ArrayList<>(parcelables.size());
            Iterator<Parcelable> it = parcelables.iterator();
            while (it.hasNext()) {
                Parcelable parcelable = it.next();
                GameRequest gameRequest = (GameRequest) parcelable;
                requests.add(gameRequest);
            }
            return requests;
        }
        return null;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new AppsGetRequests().setCallback(new SimpleCallback<List<GameRequest>>(this) { // from class: com.vkontakte.android.fragments.GamesRequestFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(List<GameRequest> res) {
                GamesRequestFragment.this.onDataLoaded(res, res.isEmpty());
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        this.list.setPadding(0, V.dp(8.0f), 0, V.dp(8.0f));
        DividerItemDecoration dividers = new DividerItemDecoration(inflater.getContext().getResources().getDrawable(R.drawable.divider_game_feed), V.dp(0.5f));
        dividers.setProvider(GamesRequestFragment$$Lambda$1.lambdaFactory$(this));
        this.list.addItemDecoration(dividers);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateContentView$0(int position) {
        return position < this.data.size() + (-1);
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        startHidingRequests();
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

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(List<GameRequest> d) {
        super.onDataLoaded(d);
        if (getArguments() != null) {
            getArguments().putParcelableArrayList(KEY_REQUESTS, this.data);
        }
        startHidingRequests();
    }

    private void startHidingRequests() {
        View view = getView();
        if (view != null) {
            view.postDelayed(GamesRequestFragment$$Lambda$2.lambdaFactory$(this), 2000L);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$startHidingRequests$1() {
        if (isResumed()) {
            fadeDrawablesAndHideRequests();
        }
    }

    private void fadeDrawablesAndHideRequests() {
        if (!this.fadeDrawablesAndHideRequestsCalled) {
            Games.fadeDrawables(this.drawablesList);
            this.drawablesList.clear();
            if (this.adapter != null && this.adapter.getGameRequestsData() != null) {
                ArrayList<GameRequest> toBeMarkedAsRead = new ArrayList<>();
                toBeMarkedAsRead.addAll(this.adapter.getGameRequestsData());
                Games.markRequestsAsRead(getContext(), toBeMarkedAsRead);
            }
            this.fadeDrawablesAndHideRequestsCalled = true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class Adapter extends UsableRecyclerView.Adapter<GameInviteHolder> {
        Adapter() {
        }

        public ArrayList<GameRequest> getGameRequestsData() {
            return GamesRequestFragment.this.data;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public GameInviteHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            GameInviteHolder gameInviteHolder = new GameInviteHolder(parent.getContext(), Utils.readString(GamesRequestFragment.this.getArguments(), ArgKeys.VISIT_SOURCE, "direct"), new RequestBgDrawable());
            GamesRequestFragment.this.drawablesList.add(new WeakReference(gameInviteHolder.drawable));
            return gameInviteHolder;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(GameInviteHolder holder, int position) {
            holder.bind(GamesRequestFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return GamesRequestFragment.this.data.size();
        }
    }
}
