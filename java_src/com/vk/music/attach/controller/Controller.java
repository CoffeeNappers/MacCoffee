package com.vk.music.attach.controller;

import android.content.Context;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.music.attach.loader.MusicLoader;
import com.vk.music.attach.loader.PlaylistMusicLoader;
import com.vk.music.attach.loader.PlaylistsLoader;
import com.vk.music.attach.sharedstate.SharedState;
import com.vk.music.view.LastReachedScrollListener;
import com.vkontakte.android.audio.MusicTrack;
import java.util.Collection;
/* loaded from: classes2.dex */
public abstract class Controller extends Fragment {
    private static final String KEY_RECYCLER_STATE = "Controller.key.recyclerState";
    private HostController hostController;
    private SparseArray<Parcelable> recyclerState;

    /* loaded from: classes2.dex */
    public interface HostController {
        @NonNull
        <T extends Fragment> T addLoader(@NonNull Class cls, @Nullable Bundle bundle);

        void close();

        void destroyLoader(@NonNull Class cls);

        @Nullable
        RecyclerView.Adapter getAdapter();

        @NonNull
        Collection<MusicTrack> getAttachedTracks();

        ImageView getLeftButton();

        @NonNull
        MusicLoader getMusicLoader();

        @NonNull
        PlaylistMusicLoader getPlaylistMusicLoader();

        @NonNull
        PlaylistsLoader getPlaylistsLoader();

        ImageView getRightButton();

        EditText getSearchView();

        @Nullable
        Bundle getSharedState(@NonNull Class<? extends SharedState> cls);

        TextView getTitleView();

        boolean isAttached(@NonNull MusicTrack musicTrack);

        void moveBack();

        void moveNext(@NonNull Controller controller, @NonNull Class<? extends Controller> cls, @Nullable Bundle bundle);

        void putSharedState(@NonNull Class<? extends SharedState> cls, @NonNull Bundle bundle);

        void removeSharedState(@NonNull Class<? extends SharedState> cls);

        void restoreRecyclerState(@NonNull SparseArray<Parcelable> sparseArray);

        void saveRecyclerState(@NonNull SparseArray<Parcelable> sparseArray);

        void setAdapter(@Nullable RecyclerView.Adapter adapter);

        void setOnLastReachedListener(@Nullable LastReachedScrollListener.OnLastReachedListener onLastReachedListener);

        void setOnRefreshListener(@Nullable SwipeRefreshLayout.OnRefreshListener onRefreshListener);

        void setRefreshing(boolean z);

        void startVoiceSearch();

        boolean supportsVoiceSearch();

        boolean tryToggleAttached(@NonNull MusicTrack musicTrack);
    }

    @Override // android.support.v4.app.Fragment
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (this.recyclerState != null) {
            outState.putSparseParcelableArray(KEY_RECYCLER_STATE, this.recyclerState);
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.hostController = (HostController) context;
    }

    @Override // android.support.v4.app.Fragment
    public void onDetach() {
        super.onDetach();
        this.hostController = null;
    }

    @Override // android.support.v4.app.Fragment
    public void onResume() {
        super.onResume();
        this.hostController.getLeftButton().setOnClickListener(Controller$$Lambda$1.lambdaFactory$(this));
        this.hostController.getRightButton().setOnClickListener(Controller$$Lambda$2.lambdaFactory$(this));
        this.hostController.setOnRefreshListener(Controller$$Lambda$3.lambdaFactory$(this));
        this.hostController.setOnLastReachedListener(Controller$$Lambda$4.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onResume$0(View v) {
        onLeftButtonClicked();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onResume$1(View v) {
        onRightButtonClicked();
    }

    @Override // android.support.v4.app.Fragment
    public void onPause() {
        super.onPause();
        this.hostController.getLeftButton().setOnClickListener(null);
        this.hostController.getRightButton().setOnClickListener(null);
        this.hostController.setOnRefreshListener(null);
        this.hostController.setOnLastReachedListener(null);
    }

    @Override // android.support.v4.app.Fragment
    @Nullable
    public final View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        onViewAttached(savedInstanceState);
        if (this.recyclerState == null && savedInstanceState != null) {
            this.recyclerState = savedInstanceState.getSparseParcelableArray(KEY_RECYCLER_STATE);
        }
        if (this.recyclerState != null) {
            getHostController().restoreRecyclerState(this.recyclerState);
        }
        return super.onCreateView(inflater, container, savedInstanceState);
    }

    @Override // android.support.v4.app.Fragment
    public final void onDestroyView() {
        super.onDestroyView();
        if (this.recyclerState == null) {
            this.recyclerState = new SparseArray<>();
        }
        getHostController().saveRecyclerState(this.recyclerState);
        onViewDetached();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onViewAttached(@Nullable Bundle savedState) {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onViewDetached() {
    }

    public boolean onBackClicked() {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onLeftButtonClicked() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onRightButtonClicked() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onRefreshRequested() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onEndOfListReached() {
    }

    public void onVoiceSearchResult(@NonNull String query) {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final HostController getHostController() {
        return this.hostController;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void moveNext(@NonNull Class<? extends Controller> toClass, @Nullable Bundle args) {
        getHostController().moveNext(this, toClass, args);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void moveNext(@NonNull Class<? extends Controller> toClass) {
        moveNext(toClass, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void moveBack() {
        getHostController().moveBack();
    }
}
