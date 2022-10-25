package com.vk.music.view;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.core.util.CollectionUtils;
import com.vk.core.util.DrawableUtils;
import com.vk.core.util.Resourcer;
import com.vk.core.util.ToastUtils;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.music.attach.AttachMusicActivity;
import com.vk.music.dto.Playlist;
import com.vk.music.event.MusicEventBus;
import com.vk.music.event.PlaylistChanged;
import com.vk.music.event.PlaylistCreated;
import com.vk.music.model.EditPlaylistModel;
import com.vk.music.view.LastReachedScrollListener;
import com.vk.music.view.adapter.HighlightMusicBinder;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.TotalFooterCreatorBinder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.VoidF;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class EditPlaylistContainer extends LinearLayout implements EditPlaylistModel.Callback {
    private static final int ATTACH_LIMIT = 100;
    private static final int REQUEST_CODE_ATTACH_MUSIC = 10;
    private static final int VIEW_TYPE_FOOTER1 = 4;
    private static final int VIEW_TYPE_FOOTER2 = 5;
    private static final int VIEW_TYPE_HEADER1 = 1;
    private static final int VIEW_TYPE_HEADER2 = 2;
    private static final int VIEW_TYPE_MUSIC_TRACK = 3;
    final Activity activity;
    ViewAdapter attachHeaderAdapter;
    private TextView btnSave;
    final LayoutInflater inflater;
    ViewAdapter infoHeaderAdapter;
    InfoHeaderCreatorBinder infoHeaderCreatorBinder;
    final LifecycleHandler lifecycleHandler;
    ViewAdapter loadingFooterAdapter;
    final EditPlaylistModel model;
    ItemAdapter<MusicTrack> musicTracksAdapter;
    RecyclerView recyclerView;
    final Resourcer resourcer;
    ViewAdapter totalFooterAdapter;
    TotalFooterCreatorBinder totalFooterCreatorBinder;
    final UserListener userListener;

    /* loaded from: classes2.dex */
    public class InfoHeaderCreatorBinder implements F1<View, ViewGroup>, VoidF {
        String currentDescription;
        String currentTitle;
        EditText description;
        ThumbsImageView image;
        public VoidF onTitleTextChanged;
        EditText title;

        private InfoHeaderCreatorBinder() {
            EditPlaylistContainer.this = r2;
            this.currentTitle = null;
            this.currentDescription = null;
        }

        @Override // com.vkontakte.android.functions.F1
        public View f(ViewGroup viewGroup) {
            View view = EditPlaylistContainer.this.inflater.inflate(R.layout.music_edit_playlist_header_info, viewGroup, false);
            this.image = (ThumbsImageView) view.findViewById(R.id.playlist_image);
            this.title = (EditText) view.findViewById(R.id.playlist_title);
            this.description = (EditText) view.findViewById(R.id.playlist_description);
            this.title.addTextChangedListener(new TextWatcher() { // from class: com.vk.music.view.EditPlaylistContainer.InfoHeaderCreatorBinder.1
                {
                    InfoHeaderCreatorBinder.this = this;
                }

                @Override // android.text.TextWatcher
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override // android.text.TextWatcher
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                }

                @Override // android.text.TextWatcher
                public void afterTextChanged(Editable s) {
                    InfoHeaderCreatorBinder.this.currentTitle = s.toString();
                    InfoHeaderCreatorBinder.this.invokeOnTextChanged();
                }
            });
            this.description.addTextChangedListener(new TextWatcher() { // from class: com.vk.music.view.EditPlaylistContainer.InfoHeaderCreatorBinder.2
                {
                    InfoHeaderCreatorBinder.this = this;
                }

                @Override // android.text.TextWatcher
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override // android.text.TextWatcher
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                }

                @Override // android.text.TextWatcher
                public void afterTextChanged(Editable s) {
                    InfoHeaderCreatorBinder.this.currentDescription = s.toString();
                    InfoHeaderCreatorBinder.this.invokeOnTextChanged();
                }
            });
            invokeOnTextChanged();
            return view;
        }

        @Override // com.vkontakte.android.functions.VoidF
        public void f() {
            this.image.setThumb(EditPlaylistContainer.this.model.getPhotoUrl());
            this.title.setText(this.currentTitle != null ? this.currentTitle : EditPlaylistContainer.this.model.getTitle());
            this.description.setText(this.currentDescription != null ? this.currentDescription : EditPlaylistContainer.this.model.getDescription());
        }

        @NonNull
        String getTitle() {
            return this.currentTitle != null ? this.currentTitle : this.title.getText().toString().trim();
        }

        @NonNull
        String getDescription() {
            return this.currentDescription != null ? this.currentDescription : this.description.getText().toString().trim();
        }

        boolean isTitleValid() {
            return !getTitle().isEmpty();
        }

        public void invokeOnTextChanged() {
            if (this.onTitleTextChanged != null) {
                this.onTitleTextChanged.f();
            }
        }
    }

    /* loaded from: classes2.dex */
    public class UserListener extends LifecycleListener implements View.OnClickListener, LastReachedScrollListener.OnLastReachedListener {
        private UserListener() {
            EditPlaylistContainer.this = r1;
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityResult(@NonNull String instanceId, int requestCode, int resultCode, @Nullable Intent data) {
            super.onActivityResult(instanceId, requestCode, resultCode, data);
            if (resultCode == -1 && requestCode == 10 && data != null && data.hasExtra("result")) {
                ArrayList<MusicTrack> musicTracksToAttach = data.getParcelableArrayListExtra("result");
                int attachedCount = EditPlaylistContainer.this.model.getAttached().size();
                if (musicTracksToAttach.size() + attachedCount > 100) {
                    ToastUtils.showToast(EditPlaylistContainer.this.resourcer.str(R.string.music_toast_attach_limit_exceeded, 100));
                }
                EditPlaylistContainer.this.model.attachTracks(CollectionUtils.subList(musicTracksToAttach, 100 - attachedCount));
                EditPlaylistContainer.this.musicTracksAdapter.setItems(EditPlaylistContainer.this.model.getMusicTracks());
                EditPlaylistContainer.this.updateAttachHeader();
                EditPlaylistContainer.this.updateTotalFooter();
            }
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityStopped(@NonNull Activity activity) {
            super.onActivityStopped(activity);
            EditPlaylistContainer.this.model.setTitle(EditPlaylistContainer.this.infoHeaderCreatorBinder.getTitle());
            EditPlaylistContainer.this.model.setDescription(EditPlaylistContainer.this.infoHeaderCreatorBinder.getDescription());
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.close_btn /* 2131755674 */:
                    EditPlaylistContainer.this.activity.finish();
                    return;
                case R.id.save_btn /* 2131755978 */:
                    EditPlaylistContainer.this.model.setTitle(EditPlaylistContainer.this.infoHeaderCreatorBinder.getTitle());
                    EditPlaylistContainer.this.model.setDescription(EditPlaylistContainer.this.infoHeaderCreatorBinder.getDescription());
                    EditPlaylistContainer.this.model.savePlaylist();
                    return;
                default:
                    return;
            }
        }

        @Override // com.vk.music.view.LastReachedScrollListener.OnLastReachedListener
        public void onLastReached() {
            if (EditPlaylistContainer.this.model.canLoadMore()) {
                EditPlaylistContainer.this.model.loadMore();
            }
        }

        public void onActionClick(@NonNull MusicTrack musicTrack) {
            if (EditPlaylistContainer.this.model.isTrackAttached(musicTrack)) {
                EditPlaylistContainer.this.model.removeAttachedTrack(musicTrack);
                EditPlaylistContainer.this.musicTracksAdapter.removeItem(musicTrack);
                EditPlaylistContainer.this.updateAttachHeader();
                EditPlaylistContainer.this.updateTotalFooter();
                return;
            }
            EditPlaylistContainer.this.model.toggleRemoved(musicTrack);
            EditPlaylistContainer.this.updateRemovedState(musicTrack);
        }

        public void onAttachMusicClick() {
            EditPlaylistContainer.this.lifecycleHandler.startActivityForResult(getUniqueId(), new Intent(EditPlaylistContainer.this.activity, AttachMusicActivity.class), 10);
        }
    }

    public EditPlaylistContainer(Context context, @NonNull final EditPlaylistModel model) {
        super(context);
        IdResolver idResolver;
        this.activity = Utils.castToActivity(context);
        this.resourcer = Resourcer.of(context);
        this.model = model;
        this.inflater = LayoutInflater.from(context);
        this.userListener = new UserListener();
        this.inflater.inflate(R.layout.music_edit_playlist, this);
        setOrientation(1);
        TextView toolbarTitle = (TextView) findViewById(R.id.toolbar_title);
        if (model.isNew()) {
            toolbarTitle.setText(R.string.music_title_new_playlist);
        } else {
            toolbarTitle.setText(R.string.music_title_playlist);
        }
        findViewById(R.id.close_btn).setOnClickListener(this.userListener);
        this.btnSave = (TextView) findViewById(R.id.save_btn);
        this.btnSave.setOnClickListener(this.userListener);
        this.recyclerView = (RecyclerView) findViewById(R.id.list);
        this.recyclerView.setHasFixedSize(true);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this.activity);
        this.recyclerView.setLayoutManager(layoutManager);
        LastReachedScrollListener scrollListener = new LastReachedScrollListener(layoutManager);
        scrollListener.setListener(this.userListener);
        this.recyclerView.addOnScrollListener(scrollListener);
        this.infoHeaderCreatorBinder = new InfoHeaderCreatorBinder();
        this.infoHeaderCreatorBinder.onTitleTextChanged = EditPlaylistContainer$$Lambda$1.lambdaFactory$(this);
        this.infoHeaderAdapter = new ViewAdapter(this.infoHeaderCreatorBinder, this.infoHeaderCreatorBinder, 1);
        this.attachHeaderAdapter = new ViewAdapter(EditPlaylistContainer$$Lambda$2.lambdaFactory$(this), 2);
        ItemAdapter.Builder registerClickListener = new ItemAdapter.Builder(this.inflater).layout(R.layout.music_audio_item6).binder(new HighlightMusicBinder(model.getRemoved())).registerClickListener(R.id.audio_action, EditPlaylistContainer$$Lambda$3.lambdaFactory$(this));
        idResolver = EditPlaylistContainer$$Lambda$4.instance;
        this.musicTracksAdapter = registerClickListener.resolver(idResolver).viewType(3).build();
        this.loadingFooterAdapter = new ViewAdapter(this.inflater, (int) R.layout.music_footer_loading, 4);
        this.totalFooterCreatorBinder = new TotalFooterCreatorBinder(new TotalFooterCreatorBinder.Interactor() { // from class: com.vk.music.view.EditPlaylistContainer.1
            {
                EditPlaylistContainer.this = this;
            }

            @Override // com.vk.music.view.adapter.TotalFooterCreatorBinder.Interactor
            @NonNull
            public LayoutInflater getLayoutInflater() {
                return EditPlaylistContainer.this.inflater;
            }

            @Override // com.vk.music.view.adapter.TotalFooterCreatorBinder.Interactor
            @NonNull
            public Resourcer getResourcer() {
                return EditPlaylistContainer.this.resourcer;
            }

            @Override // com.vk.music.view.adapter.TotalFooterCreatorBinder.Interactor
            @Nullable
            public List<MusicTrack> getMusicTracks() {
                return model.getMusicTracks();
            }
        });
        this.totalFooterAdapter = new ViewAdapter(this.totalFooterCreatorBinder, this.totalFooterCreatorBinder, 5);
        MergeRecyclerAdapter adapter = new MergeRecyclerAdapter();
        adapter.setHasStableIds(true);
        adapter.addAdapter(this.infoHeaderAdapter);
        adapter.addAdapter(this.attachHeaderAdapter);
        adapter.addAdapter(this.musicTracksAdapter);
        adapter.addAdapter(this.loadingFooterAdapter);
        adapter.addAdapter(this.totalFooterAdapter);
        this.recyclerView.setAdapter(adapter);
        this.lifecycleHandler = LifecycleHandler.install(this.activity);
        this.lifecycleHandler.setLifecycleListener(this.userListener);
    }

    public /* synthetic */ View lambda$new$1(ViewGroup viewGroup) {
        TextView view = (TextView) this.inflater.inflate(R.layout.music_header_shuffle, viewGroup, false);
        view.setText(R.string.music_button_add_music);
        DrawableUtils.setLeft(view, (int) R.drawable.ic_add_24dp, (int) R.color.music_action_button_blue);
        view.setOnClickListener(EditPlaylistContainer$$Lambda$5.lambdaFactory$(this));
        return view;
    }

    public /* synthetic */ void lambda$null$0(View v) {
        this.userListener.onAttachMusicClick();
    }

    public /* synthetic */ void lambda$new$2(View v, MusicTrack musicTrack, int position) {
        this.userListener.onActionClick(musicTrack);
    }

    public void updateBtnSaveState() {
        this.btnSave.setEnabled(this.infoHeaderCreatorBinder.isTitleValid());
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        Utils.castToActivity(getContext()).getWindow().setSoftInputMode(3);
        this.model.subscribe(this);
        bind();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.model.unsubscribe(this);
    }

    private void bind() {
        List<MusicTrack> musicTracks = this.model.getMusicTracks();
        if (musicTracks == null) {
            this.loadingFooterAdapter.setEnabled(false);
        } else {
            this.loadingFooterAdapter.setEnabled(this.model.canLoadMore());
        }
        updateTotalFooter();
        this.musicTracksAdapter.setItems(musicTracks);
    }

    public void updateAttachHeader() {
        this.attachHeaderAdapter.setEnabled(this.model.getAttached().size() < 100);
    }

    public void updateTotalFooter() {
        this.totalFooterAdapter.setEnabled(!CollectionUtils.isEmpty(this.model.getMusicTracks()));
    }

    public void updateRemovedState(@NonNull MusicTrack musicTrack) {
        int childCount = this.recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            RecyclerView.ViewHolder holder = this.recyclerView.findContainingViewHolder(this.recyclerView.getChildAt(i));
            if (holder != null && holder.getItemViewType() == 3 && holder.getItemId() == musicTrack.getMidId()) {
                ((ItemViewHolder) holder).rebind();
            }
        }
    }

    @Override // com.vk.music.model.EditPlaylistModel.Callback
    public void onSavingDone(@NonNull EditPlaylistModel model, @NonNull Playlist playlist) {
        if (model.isNew()) {
            MusicEventBus.post(new PlaylistCreated(playlist));
        } else {
            MusicEventBus.post(new PlaylistChanged(playlist));
        }
        this.activity.finish();
    }

    @Override // com.vk.music.model.EditPlaylistModel.Callback
    public void onSavingError(@NonNull EditPlaylistModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }

    @Override // com.vk.music.model.EditPlaylistModel.Callback
    public void onLoadingMoreDone(@NonNull EditPlaylistModel model, @NonNull List<MusicTrack> musicTracks) {
        this.musicTracksAdapter.addItems(musicTracks);
        this.loadingFooterAdapter.setEnabled(model.canLoadMore());
        updateTotalFooter();
    }

    @Override // com.vk.music.model.EditPlaylistModel.Callback
    public void onLoadingMoreError(@NonNull EditPlaylistModel model, @NonNull ErrorResponse response) {
        response.showToast(getContext());
    }
}
