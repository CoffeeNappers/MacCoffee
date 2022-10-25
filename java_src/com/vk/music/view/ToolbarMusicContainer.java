package com.vk.music.view;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.imageloader.view.VKImageView;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.PlaylistsFragment;
import com.vk.music.model.MusicModel;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.utils.Utils;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class ToolbarMusicContainer extends FrameLayout implements MusicModel.Callback, View.OnClickListener {
    public static final int REQUEST_CODE_GET_PLAYLIST = 10;
    final Activity activity;
    @Nullable
    VKImageView imageView;
    final LifecycleHandler lifecycleHandler;
    final MusicModel model;
    MusicContainer musicContainer;
    TextView titleView;
    final UserListener userListener;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class UserListener extends LifecycleListener {
        UserListener() {
            ToolbarMusicContainer.this = this$0;
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityResult(@NonNull String instanceId, int requestCode, int resultCode, @Nullable Intent data) {
            super.onActivityResult(instanceId, requestCode, resultCode, data);
            if (resultCode == -1 && requestCode == 10 && data != null) {
                ToolbarMusicContainer.this.musicContainer.onPlaylistResult((Playlist) data.getParcelableExtra("result"));
            }
        }

        @Override // com.vk.core.widget.LifecycleListener
        public void onActivityStarted(@NonNull Activity activity) {
            super.onActivityStarted(activity);
        }
    }

    public ToolbarMusicContainer(Context context, @NonNull MusicModel model) {
        super(context);
        this.activity = Utils.castToActivity(context);
        this.model = model;
        this.userListener = new UserListener();
        this.lifecycleHandler = LifecycleHandler.install(this.activity);
        this.lifecycleHandler.setLifecycleListener(this.userListener);
        inflate(context, model.hasIcon() ? R.layout.music_user_music2_icon : R.layout.music_user_music2, this);
        findViewById(R.id.back_btn).setOnClickListener(this);
        findViewById(R.id.search_btn).setOnClickListener(this);
        this.titleView = (TextView) findViewById(R.id.title);
        this.imageView = (VKImageView) findViewById(16908294);
        TextView subtitleView = (TextView) findViewById(R.id.subtitle);
        subtitleView.setText(model.getOwnerId() < 0 ? getResources().getString(R.string.music_title_community) : getResources().getString(R.string.music));
        ViewGroup headerViewGroup = (ViewGroup) findViewById(R.id.ll_header);
        View.OnClickListener listener = ToolbarMusicContainer$$Lambda$1.lambdaFactory$(model);
        headerViewGroup.setOnClickListener(listener);
        if (this.imageView != null) {
            this.imageView.setOnClickListener(listener);
        }
        fillNameAndImage(model);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-1, -1);
        params.topMargin = findViewById(R.id.toolbar).getMinimumHeight();
        this.musicContainer = new MusicContainer(context, model);
        this.musicContainer.setHost(ToolbarMusicContainer$$Lambda$2.lambdaFactory$(this));
        addView(this.musicContainer, params);
        if (model.isNeedLoadTitle()) {
            model.subscribe(this);
        }
    }

    public static /* synthetic */ void lambda$new$0(@NonNull MusicModel model, View v) {
        if (model.getOwnerId() != 0) {
            new ProfileFragment.Builder(model.getOwnerId()).go(v.getContext());
        }
    }

    public /* synthetic */ void lambda$new$1() {
        this.lifecycleHandler.startActivityForResult(this.userListener.getUniqueId(), new PlaylistsFragment.Builder().selectMy(true).intent(this.activity), 10);
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onLoadingDone(@NonNull MusicModel model) {
        fillNameAndImage(model);
    }

    private void fillNameAndImage(@NonNull MusicModel model) {
        String ownerName = model.getTitle(getContext());
        if (ownerName != null) {
            this.titleView.setText(ownerName);
        }
        if (model.hasIcon()) {
            String ownerImage = model.getIcon();
            if (!TextUtils.isEmpty(ownerImage) && this.imageView != null) {
                this.imageView.load(ownerImage);
            }
        }
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onLoadingError(@NonNull MusicModel model, @NonNull ErrorResponse response) {
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onAudioLoadingDone(@NonNull MusicModel model, @NonNull List<MusicTrack> musicTracks) {
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onAudioLoadingError(@NonNull MusicModel model, @NonNull ErrorResponse response) {
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onPlaylistChanged(@NonNull MusicModel model, @NonNull Playlist playlist) {
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onPlaylistCreated(@NonNull MusicModel model, @NonNull Playlist playlist) {
    }

    @Override // com.vk.music.model.MusicModel.Callback
    public void onPlaylistRemoved(@NonNull MusicModel model, @NonNull Playlist playlist) {
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.back_btn /* 2131755992 */:
                this.activity.finish();
                return;
            default:
                return;
        }
    }
}
