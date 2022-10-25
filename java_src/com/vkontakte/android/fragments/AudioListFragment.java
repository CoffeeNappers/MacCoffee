package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.analytics.Analytics;
import com.vk.attachpicker.AttachActivity;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.Log;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGet;
import com.vkontakte.android.api.audio.AudioSearchOld;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.audio.AudioViewHolderAttach;
import com.vkontakte.android.ui.holder.audio.AudioViewHolderBase;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.api.APIRequest;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
import me.zhanghai.android.materialprogressbar.IndeterminateHorizontalProgressDrawable;
/* loaded from: classes2.dex */
public class AudioListFragment extends VKRecyclerFragment<MusicTrack> implements SupportExternalToolbarContainer, PlayerListener, AudioViewHolderBase.AudioViewHolderDelegate, AudioFacade.OnConnectionListener {
    private MergeRecyclerAdapter adapter;
    private AudioListAdapter adapterMainSection;
    private AudioListAdapter adapterSearchSection;
    private DataContainer dataContainer;
    private ProgressBar itemProgress;
    PlayerState lastState;
    private BroadcastReceiver receiver;
    private APIRequest searchRequest;
    private SearchViewWrapper searchView;
    private int uid;
    private Runnable updateListRunnable;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(AudioListFragment.class);
        }
    }

    private boolean isInContextOfAttachActivity() {
        return getActivity() instanceof AttachActivity;
    }

    @Override // com.vkontakte.android.audio.AudioFacade.OnConnectionListener
    public void onConnected() {
        updateList();
    }

    public void removeFromLists(String mid) {
        Iterator it = this.data.iterator();
        while (it.hasNext()) {
            MusicTrack file = (MusicTrack) it.next();
            if (TextUtils.equals(file.getMid(), mid)) {
                this.data.remove(file);
                this.dataContainer.remove(file);
                updateList();
                return;
            }
        }
    }

    public AudioListFragment() {
        super(100);
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.AudioListFragment.1
            {
                AudioListFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context arg0, Intent intent) {
                if (AudioFacade.ACTION_USER_AUDIO_ADDED.equals(intent.getAction())) {
                    AudioListFragment.this.refresh();
                } else if (AudioFacade.ACTION_USER_AUDIO_REMOVED.equals(intent.getAction())) {
                    String mid = intent.getStringExtra(AudioFacade.EXTRA_MID);
                    AudioListFragment.this.removeFromLists(mid);
                }
            }
        };
        this.dataContainer = new DataContainer();
        this.lastState = PlayerState.IDLE;
        this.updateListRunnable = new Runnable() { // from class: com.vkontakte.android.fragments.AudioListFragment.5
            {
                AudioListFragment.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (AudioListFragment.this.list == null || !AudioListFragment.this.list.isComputingLayout()) {
                        AudioListFragment.this.superUpdateList();
                    } else if (AudioListFragment.this.isResumed()) {
                        ViewUtils.removeCallbacks(this);
                        ViewUtils.postDelayed(this, 200L);
                    }
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                    Analytics.logException(e);
                }
            }
        };
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        this.uid = VKAccountManager.getCurrent().getUid();
        ActivityUtils.setBeamLink(getActivity(), MimeTypes.BASE_TYPE_AUDIO + this.uid);
        setEmptyText(R.string.no_audios);
        setTitle(R.string.my_music);
        this.searchView = new SearchViewWrapper(act, new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.AudioListFragment.2
            {
                AudioListFragment.this = this;
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryConfirmed(String query) {
                AudioListFragment.this.search(query);
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQuerySubmitted(String query) {
                AudioListFragment.this.search(query);
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryChanged(String query) {
                AudioListFragment.this.localSearch(query);
            }
        }, SearchViewWrapper.CONFIRM_TIMEOUT);
        this.searchView.setStateListener(AudioListFragment$$Lambda$1.lambdaFactory$(this));
        if (NetworkStateReceiver.isConnected() || this.uid != VKAccountManager.getCurrent().getUid()) {
            loadData();
        }
        if (isInContextOfAttachActivity()) {
            this.spinnerViewResourceId = R.layout.spinner_view_light;
        }
        setHasOptionsMenu(true);
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (this.uid == VKAccountManager.getCurrent().getUid() && !NetworkStateReceiver.isConnected()) {
            try {
                setSelectedNavigationItem(this.uid > 0 ? 2 : 1);
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
        }
        this.list.setPadding(0, V.dp(8.0f), 0, 0);
        if (isInContextOfAttachActivity()) {
            getToolbar().setVisibility(8);
            view.setBackgroundColor(-1);
            setRefreshEnabled(false);
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle state) {
        View view = super.onCreateView(inflater, container, state);
        this.list.setScrollBarStyle(33554432);
        this.list.setClipToPadding(false);
        IndeterminateHorizontalProgressDrawable pd = new IndeterminateHorizontalProgressDrawable(getActivity());
        pd.setUseIntrinsicPadding(false);
        pd.setShowTrack(false);
        return view;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean canGoBack() {
        return !isInContextOfAttachActivity() && super.canGoBack();
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return !isInContextOfAttachActivity() && super.hasNavigationDrawer();
    }

    @Override // com.vkontakte.android.ui.holder.audio.AudioViewHolderBase.AudioViewHolderDelegate
    public void playTrack(int holderAdapterPosition, int section) {
        List<MusicTrack> list = this.dataContainer.getCommonList();
        int position = this.adapter.getAdapterPosition(holderAdapterPosition);
        if (section != 0) {
            position += this.dataContainer.getFirstList().size();
        }
        AudioFacade.playTracks(list, position, section == 0 ? PlayerRefer.audios_my : PlayerRefer.search, false);
    }

    @Override // com.vkontakte.android.ui.holder.audio.AudioViewHolderBase.AudioViewHolderDelegate
    public boolean isAnimatingTransitionOut() {
        return false;
    }

    @Override // com.vkontakte.android.ui.holder.audio.AudioViewHolderBase.AudioViewHolderDelegate
    public void setItemProgressBar(ProgressBar itemProgressBar) {
        this.itemProgress = itemProgressBar;
        if ((this.lastState == PlayerState.IDLE || this.lastState == PlayerState.STOPPED) && this.itemProgress != null) {
            this.itemProgress.setProgress(0);
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new MergeRecyclerAdapter();
            this.adapter.setHasStableIds(false);
            MergeRecyclerAdapter mergeRecyclerAdapter = this.adapter;
            AudioListAdapter audioListAdapter = new AudioListAdapter(0, this);
            this.adapterMainSection = audioListAdapter;
            mergeRecyclerAdapter.addAdapter(audioListAdapter);
            this.adapter.addAdapter(new SectionHeaderAdapter(getString(R.string.search_results)));
            MergeRecyclerAdapter mergeRecyclerAdapter2 = this.adapter;
            AudioListAdapter audioListAdapter2 = new AudioListAdapter(1, this);
            this.adapterSearchSection = audioListAdapter2;
            mergeRecyclerAdapter2.addAdapter(audioListAdapter2);
        }
        return this.adapter;
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        super.onDetach();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        Log.d("vk", "invalidate menu, removing=" + isRemoving());
        if (!isRemoving()) {
            this.searchView.onCreateOptionsMenu(menu);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        AudioFacade.bind(getActivity(), this);
        IntentFilter filter = new IntentFilter();
        filter.addAction(AudioFacade.ACTION_USER_AUDIO_REMOVED);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        AudioFacade.unbind(this);
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
        super.onDestroy();
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        getActivity().setVolumeControlStream(3);
        getActivity().getWindow().setSoftInputMode(32);
        AudioFacade.addPlayerListener(this, true);
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        getActivity().setVolumeControlStream(Integer.MIN_VALUE);
        getActivity().getWindow().setSoftInputMode(16);
        AudioFacade.removePlayerListener(this);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void doLoadData(int offset, int count) {
        boolean needStartLoading = true;
        if (this.currentRequest instanceof AudioGet) {
            AudioGet audioGet = (AudioGet) this.currentRequest;
            needStartLoading = audioGet.isCanceled();
        }
        if (needStartLoading || this.refreshing) {
            if (this.currentRequest != null) {
                this.currentRequest.cancel();
            }
            this.currentRequest = new AudioGet(this.uid).setCallback(new SimpleCallback<VKList<MusicTrack>>(this) { // from class: com.vkontakte.android.fragments.AudioListFragment.3
                {
                    AudioListFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<MusicTrack> files) {
                    AudioListFragment.this.currentRequest = null;
                    AudioListFragment.this.onLoadTracksList(files);
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    AudioListFragment.this.currentRequest = null;
                    super.fail(error);
                }
            }).exec((View) this.list);
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(List<MusicTrack> d, boolean more) {
        this.data.clear();
        this.preloadedData.clear();
        super.onDataLoaded(d, more);
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onBufferingProgress(TrackInfo trackInfo) {
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onProgress(TrackInfo trackInfo) {
        if (this.lastState != PlayerState.IDLE && this.lastState != PlayerState.STOPPED && this.itemProgress != null) {
            this.itemProgress.setProgress(trackInfo.getPositionPercent());
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
        this.lastState = state;
        if ((state == PlayerState.IDLE || state == PlayerState.STOPPED) && this.itemProgress != null) {
            this.itemProgress.setProgress(0);
        }
        updateList();
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onTrackListChanged(List<PlayerTrack> list) {
        updateList();
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onParametersChanged(Player player) {
        updateList();
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
    }

    /* loaded from: classes2.dex */
    private class AudioListAdapter extends UsableRecyclerView.Adapter<AudioViewHolderBase> {
        static final int SECTION_MAIN = 0;
        static final int SECTION_SEARCH = 1;
        final AudioListFragment audioListFragment;
        private int section;

        AudioListAdapter(int section, AudioListFragment audioListFragment) {
            AudioListFragment.this = r2;
            this.section = section;
            this.audioListFragment = audioListFragment;
            setHasStableIds(false);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public AudioViewHolderBase mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new AudioViewHolderAttach(parent, this.section, this.audioListFragment);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(AudioViewHolderBase holder, int position) {
            holder.bind(getList().get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return getList().size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return this.section;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            MusicTrack af = getList().get(position);
            return (af.oid << 32) | af.aid;
        }

        List<MusicTrack> getList() {
            return this.section == 0 ? AudioListFragment.this.dataContainer.getFirstList() : AudioListFragment.this.dataContainer.getSecondList();
        }
    }

    /* loaded from: classes2.dex */
    private class SectionHeaderAdapter extends UsableRecyclerView.Adapter<SectionViewHolder> {
        private String title;

        SectionHeaderAdapter(String title) {
            AudioListFragment.this = r2;
            this.title = title;
            setHasStableIds(false);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public SectionViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new SectionViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(SectionViewHolder holder, int position) {
            holder.bind(this.title);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return (!AudioListFragment.this.dataContainer.isSearching() || AudioListFragment.this.dataContainer.getServerSearchResult().size() <= 0) ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 4;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return 0L;
        }
    }

    /* loaded from: classes2.dex */
    public class SectionViewHolder extends RecyclerHolder<String> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        SectionViewHolder() {
            super(View.inflate(this$0.getActivity(), R.layout.list_section_header, null));
            AudioListFragment.this = this$0;
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(String item) {
            ((TextView) this.itemView).setText(item);
        }
    }

    public void onLoadTracksList(List<MusicTrack> tracks) {
        this.dataContainer.putTracksList(tracks);
        applyListChanges();
    }

    public void onLoadTracksList(String searchQuery, List<MusicTrack> tracks) {
        this.dataContainer.putSearchResult(tracks, searchQuery);
        applyListChanges();
    }

    private void onLoadLocalTracksList(String searchQuery, List<MusicTrack> tracks) {
        this.dataContainer.putLocalSearchResult(tracks, searchQuery);
        applyListChanges();
    }

    private void applyListChanges() {
        this.dataContainer.run();
    }

    public void setIsSearching(boolean isSearching) {
        this.dataContainer.setIsSearching(isSearching);
        updateList();
    }

    public void search(final String query) {
        this.dataContainer.setCurrentSearchQuery(query);
        if (this.searchRequest != null) {
            this.searchRequest.cancel();
            this.searchRequest = null;
        }
        if (this.errorView != null) {
            this.errorView.setVisibility(8);
        }
        this.searchRequest = new AudioSearchOld(query).setCallback(new SimpleCallback<VKList<MusicTrack>>(this) { // from class: com.vkontakte.android.fragments.AudioListFragment.4
            {
                AudioListFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<MusicTrack> files) {
                AudioListFragment.this.searchRequest = null;
                AudioListFragment.this.onLoadTracksList(query, files);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                AudioListFragment.this.searchRequest = null;
                if (AudioListFragment.this.list != null && AudioListFragment.this.getActivity() != null) {
                    super.fail(error);
                }
            }
        }).exec((View) this.list);
    }

    public void localSearch(String query) {
        this.dataContainer.setCurrentSearchQuery(query);
        onLoadLocalTracksList(query, filterTracks(this.dataContainer.getCurrentTrackList(), query));
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void updateList() {
        this.updateListRunnable.run();
    }

    public void superUpdateList() {
        super.updateList();
    }

    /* loaded from: classes2.dex */
    public class DataContainer implements Runnable {
        private String currentSearchQuery;
        private final List<MusicTrack> data;
        private boolean isSearching;
        private List<MusicTrack> localSearchResult;
        private List<MusicTrack> serverSearchResult;

        private DataContainer() {
            AudioListFragment.this = r2;
            this.isSearching = false;
            this.currentSearchQuery = null;
            this.localSearchResult = Collections.emptyList();
            this.serverSearchResult = Collections.emptyList();
            this.data = new ArrayList();
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                if (AudioListFragment.this.list == null || !AudioListFragment.this.list.isComputingLayout()) {
                    AudioListFragment.this.onDataLoaded(AudioListFragment.this.dataContainer.getCommonList(), false);
                    AudioListFragment.this.showContent();
                } else if (AudioListFragment.this.isResumed()) {
                    ViewUtils.removeCallbacks(AudioListFragment.this.dataContainer);
                    ViewUtils.postDelayed(AudioListFragment.this.dataContainer, 200L);
                }
            } catch (Exception e) {
                L.e(e, new Object[0]);
                Analytics.logException(e);
            }
        }

        List<MusicTrack> getFirstList() {
            return (!AudioListFragment.this.dataContainer.isSearching() || TextUtils.isEmpty(this.currentSearchQuery)) ? AudioListFragment.this.dataContainer.getCurrentTrackList() : AudioListFragment.this.dataContainer.getLocalSearchResult();
        }

        List<MusicTrack> getSecondList() {
            return AudioListFragment.this.dataContainer.isSearching() ? AudioListFragment.this.dataContainer.getServerSearchResult() : Collections.emptyList();
        }

        List<MusicTrack> getCommonList() {
            List<MusicTrack> firstList = getFirstList();
            List<MusicTrack> secondList = getSecondList();
            ArrayList<MusicTrack> tracks = new ArrayList<>(firstList.size() + secondList.size());
            tracks.addAll(firstList);
            tracks.addAll(secondList);
            return tracks;
        }

        public void setCurrentSearchQuery(String currentSearchQuery) {
            if (!TextUtils.equals(this.currentSearchQuery, currentSearchQuery)) {
                this.currentSearchQuery = currentSearchQuery;
                this.localSearchResult.clear();
                this.serverSearchResult.clear();
            }
        }

        public void setIsSearching(boolean isSearching) {
            this.isSearching = isSearching;
        }

        public boolean isSearching() {
            return this.isSearching;
        }

        void putLocalSearchResult(List<MusicTrack> musicTracks, String query) {
            if (TextUtils.equals(this.currentSearchQuery, query)) {
                if (musicTracks == null) {
                    musicTracks = Collections.emptyList();
                }
                this.localSearchResult = musicTracks;
            }
        }

        void putSearchResult(List<MusicTrack> musicTracks, String query) {
            if (TextUtils.equals(this.currentSearchQuery, query)) {
                if (musicTracks == null) {
                    musicTracks = Collections.emptyList();
                }
                this.serverSearchResult = musicTracks;
            }
        }

        List<MusicTrack> getLocalSearchResult() {
            return this.localSearchResult;
        }

        List<MusicTrack> getServerSearchResult() {
            return this.serverSearchResult;
        }

        List<MusicTrack> getCurrentTrackList() {
            return this.data;
        }

        void putTracksList(List<MusicTrack> tracks) {
            this.data.clear();
            this.data.addAll(tracks);
        }

        public void remove(MusicTrack musicTrack) {
            this.data.remove(musicTrack);
        }
    }

    public static List<MusicTrack> filterTracks(List<MusicTrack> tracks, String query) {
        String[] words = query.toLowerCase().split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        List<MusicTrack> retList = new ArrayList<>();
        List<MusicTrack> localList = new ArrayList<>();
        int i = 0;
        for (String word : words) {
            for (MusicTrack f : tracks) {
                if (f.artist.toLowerCase().contains(word) || f.title.toLowerCase().contains(word)) {
                    if (!retList.contains(f)) {
                        retList.add(f);
                    }
                }
            }
            if (words.length > i + 1) {
                retList.clear();
                retList.addAll(localList);
                localList.clear();
            }
            i++;
        }
        return retList;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected View onCreateFooterView(LayoutInflater inflater) {
        return null;
    }
}
