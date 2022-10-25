package com.vk.music.attach;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.gms.actions.SearchIntents;
import com.vk.core.util.ToastUtils;
import com.vk.music.attach.controller.Controller;
import com.vk.music.attach.controller.MyMusicController;
import com.vk.music.attach.loader.MusicLoader;
import com.vk.music.attach.loader.PlaylistMusicLoader;
import com.vk.music.attach.loader.PlaylistsLoader;
import com.vk.music.attach.sharedstate.SharedState;
import com.vk.music.view.LastReachedScrollListener;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.MusicTrack;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public final class AttachMusicActivity extends VKActivity implements Controller.HostController, View.OnClickListener {
    private static final int ATTACH_LIMIT = 100;
    private static final String KEY_ATTACHED_TRACKS = "AttachMusicActivity.key.attachedTracks";
    private static final int REQUEST_CODE_VOICE_SEARCH = 10;
    TextView attachButtonCounterView;
    ArrayList<MusicTrack> attachedTracks;
    ImageView leftButton;
    Map<Class, Fragment> loadersCache;
    MusicLoader musicLoader;
    PlaylistMusicLoader playlistMusicLoader;
    PlaylistsLoader playlistsLoader;
    RecyclerView recyclerView;
    SwipeRefreshLayout refreshLayout;
    ImageView rightButton;
    LastReachedScrollListener scrollListener;
    EditText searchView;
    Map<Class, Bundle> sharedStates;
    TextView titleView;
    View toolbarView;

    private static String createTag(@NonNull Class fragmentClass) {
        return fragmentClass.getSimpleName() + ".tag";
    }

    private static String createTag(int entryIndex) {
        return entryIndex + ".tag";
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public TextView getTitleView() {
        return this.titleView;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public EditText getSearchView() {
        return this.searchView;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public ImageView getLeftButton() {
        return this.leftButton;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public ImageView getRightButton() {
        return this.rightButton;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    @Nullable
    public RecyclerView.Adapter getAdapter() {
        return this.recyclerView.mo1204getAdapter();
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void setAdapter(@Nullable RecyclerView.Adapter adapter) {
        this.recyclerView.setAdapter(adapter);
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void setRefreshing(boolean refreshing) {
        this.refreshLayout.setRefreshing(refreshing);
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void saveRecyclerState(@NonNull SparseArray<Parcelable> outState) {
        this.recyclerView.saveHierarchyState(outState);
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void restoreRecyclerState(@NonNull SparseArray<Parcelable> savedState) {
        this.recyclerView.restoreHierarchyState(savedState);
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void setOnRefreshListener(@Nullable SwipeRefreshLayout.OnRefreshListener listener) {
        this.refreshLayout.setOnRefreshListener(listener);
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void setOnLastReachedListener(@Nullable LastReachedScrollListener.OnLastReachedListener listener) {
        this.scrollListener.setListener(listener);
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public boolean tryToggleAttached(@NonNull MusicTrack musicTrack) {
        boolean isTrackToBeRemoved = getAttachedTracks().contains(musicTrack);
        int attachedTracksSizeAfterToggle = getAttachedTracks().size() + (isTrackToBeRemoved ? -1 : 1);
        if (attachedTracksSizeAfterToggle > 100) {
            ToastUtils.showToast(getString(R.string.music_toast_attach_limit_exceeded, new Object[]{100}));
            return false;
        }
        if (isTrackToBeRemoved) {
            getAttachedTracks().remove(musicTrack);
        } else {
            getAttachedTracks().add(musicTrack);
        }
        updateCounter();
        return true;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public boolean isAttached(@NonNull MusicTrack musicTrack) {
        return this.attachedTracks != null && this.attachedTracks.contains(musicTrack);
    }

    private void updateCounter() {
        ViewUtils.setText(this.attachButtonCounterView, this.attachedTracks.size() > 0 ? String.valueOf(this.attachedTracks.size()) : "", true);
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    @NonNull
    public Collection<MusicTrack> getAttachedTracks() {
        if (this.attachedTracks == null) {
            this.attachedTracks = new ArrayList<>();
        }
        return this.attachedTracks;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    @NonNull
    public MusicLoader getMusicLoader() {
        if (this.musicLoader == null) {
            this.musicLoader = (MusicLoader) addLoader(MusicLoader.class, null);
        }
        return this.musicLoader;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    @NonNull
    public PlaylistsLoader getPlaylistsLoader() {
        if (this.playlistsLoader == null) {
            this.playlistsLoader = (PlaylistsLoader) addLoader(PlaylistsLoader.class, null);
        }
        return this.playlistsLoader;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    @NonNull
    public PlaylistMusicLoader getPlaylistMusicLoader() {
        if (this.playlistMusicLoader == null) {
            this.playlistMusicLoader = (PlaylistMusicLoader) addLoader(PlaylistMusicLoader.class, null);
        }
        return this.playlistMusicLoader;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    @NonNull
    public <T extends Fragment> T addLoader(@NonNull Class loaderClass, @Nullable Bundle args) {
        Fragment loader = (T) findLoader(loaderClass);
        if (loader == null) {
            loader = (T) Fragment.instantiate(this, loaderClass.getName(), args);
            if (this.loadersCache == null) {
                this.loadersCache = new HashMap();
            }
            this.loadersCache.put(loaderClass, loader);
            if (!getSupportFragmentManager().isDestroyed()) {
                getSupportFragmentManager().beginTransaction().add(loader, createTag(loaderClass)).commitAllowingStateLoss();
            }
        }
        return (T) loader;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void destroyLoader(@NonNull Class loaderClass) {
        Fragment loader = findLoader(loaderClass);
        if (loader != null) {
            if (this.loadersCache != null) {
                this.loadersCache.remove(loaderClass);
            }
            if (!getSupportFragmentManager().isDestroyed()) {
                getSupportFragmentManager().beginTransaction().remove(loader).commitAllowingStateLoss();
            }
        }
    }

    @Nullable
    private Fragment findLoader(@NonNull Class loaderClass) {
        Fragment loader = null;
        if (this.loadersCache != null) {
            Fragment loader2 = this.loadersCache.get(loaderClass);
            loader = loader2;
        }
        if (loader == null) {
            Fragment loader3 = getSupportFragmentManager().findFragmentByTag(createTag(loaderClass));
            if (loader3 == null) {
                return null;
            }
            if (this.loadersCache == null) {
                this.loadersCache = new HashMap();
            }
            this.loadersCache.put(loaderClass, loader3);
            return loader3;
        }
        return loader;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void putSharedState(@NonNull Class<? extends SharedState> sharedStateClass, @NonNull Bundle bundle) {
        if (this.sharedStates == null) {
            this.sharedStates = new HashMap();
        }
        this.sharedStates.put(sharedStateClass, bundle);
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void removeSharedState(@NonNull Class<? extends SharedState> sharedStateClass) {
        if (this.sharedStates != null) {
            this.sharedStates.remove(sharedStateClass);
        }
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    @Nullable
    public Bundle getSharedState(@NonNull Class<? extends SharedState> sharedStateClass) {
        if (this.sharedStates != null) {
            return this.sharedStates.get(sharedStateClass);
        }
        return null;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void moveNext(@NonNull Controller from, @NonNull Class<? extends Controller> toClass, @Nullable Bundle args) {
        if (!isFinishing()) {
            moveNext(from, toClass, args, true);
        }
    }

    private void moveNext(@Nullable Controller from, @NonNull Class<? extends Controller> toClass, @Nullable Bundle args, boolean addToBackStack) {
        FragmentManager fm = getSupportFragmentManager();
        if (!fm.isDestroyed()) {
            FragmentTransaction transaction = fm.beginTransaction();
            if (from != null) {
                transaction.remove(from);
            }
            String toTag = createTag(addToBackStack ? fm.getBackStackEntryCount() + 1 : 0);
            transaction.add(Fragment.instantiate(this, toClass.getName(), args), toTag);
            if (from != null && addToBackStack) {
                transaction.addToBackStack(from.getTag() + "->" + toTag);
            }
            transaction.commit();
        }
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void moveBack() {
        getSupportFragmentManager().popBackStackImmediate();
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void close() {
        finish();
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public boolean supportsVoiceSearch() {
        return getPackageManager().resolveActivity(new Intent("android.speech.action.RECOGNIZE_SPEECH"), 0) != null;
    }

    @Override // com.vk.music.attach.controller.Controller.HostController
    public void startVoiceSearch() {
        startActivityForResult(new Intent("android.speech.action.RECOGNIZE_SPEECH").putExtra("android.speech.extra.LANGUAGE_MODEL", "free_form").putExtra("android.speech.extra.MAX_RESULTS", 10), 10);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v.getId() == R.id.music_attach_button) {
            setResult(-1, new Intent().putExtra("result", this.attachedTracks));
            finish();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putParcelableArrayList(KEY_ATTACHED_TRACKS, this.attachedTracks);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        setContentView(R.layout.music_select_music);
        this.toolbarView = findViewById(R.id.music_toolbar);
        this.titleView = (TextView) findViewById(R.id.music_title);
        this.searchView = (EditText) findViewById(R.id.music_search);
        this.leftButton = (ImageView) findViewById(R.id.music_left_btn);
        this.rightButton = (ImageView) findViewById(R.id.music_right_btn);
        this.refreshLayout = (SwipeRefreshLayout) findViewById(R.id.music_refresh_layout);
        this.refreshLayout.setColorSchemeResources(R.color.brand_primary);
        this.recyclerView = (RecyclerView) findViewById(R.id.music_recycler);
        this.recyclerView.setHasFixedSize(true);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        this.recyclerView.setLayoutManager(layoutManager);
        this.scrollListener = new LastReachedScrollListener(layoutManager);
        this.recyclerView.addOnScrollListener(this.scrollListener);
        findViewById(R.id.music_attach_button).setOnClickListener(this);
        this.attachButtonCounterView = (TextView) findViewById(R.id.music_attach_button_counter);
        if (b == null) {
            moveNext(null, MyMusicController.class, null, false);
            return;
        }
        this.attachedTracks = b.getParcelableArrayList(KEY_ATTACHED_TRACKS);
        updateCounter();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == -1 && requestCode == 10 && data != null) {
            String query = data.getStringExtra(SearchIntents.EXTRA_QUERY);
            Controller currentController = getCurrentController();
            if (query == null) {
                query = "";
            }
            currentController.onVoiceSearchResult(query);
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (!getCurrentController().onBackClicked()) {
            super.onBackPressed();
        }
    }

    @NonNull
    private Controller getCurrentController() {
        return (Controller) getSupportFragmentManager().findFragmentByTag(createTag(getSupportFragmentManager().getBackStackEntryCount()));
    }
}
