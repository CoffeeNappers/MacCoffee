package com.vk.music.utils;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.music.view.SmallPlayerView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.ui.XFrameLayout;
import java.lang.ref.WeakReference;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class SmallPlayerHelper extends PlayerListener.PlayerListenerAdapter {
    private WeakReference<View> container;
    private TrackInfo info;
    private WeakReference<SmallPlayerView> player;
    private WeakReference<View> shadow;
    private PlayerState state = PlayerState.IDLE;
    private boolean keyBoardShowed = false;

    public View onCreateView(View innerView) {
        if (innerView == null) {
            return null;
        }
        LayoutInflater inflater = LayoutInflater.from(innerView.getContext());
        View view = inflater.inflate(R.layout.music_small_player_container, (ViewGroup) null);
        XFrameLayout layout = (XFrameLayout) view.findViewById(R.id.x_container);
        layout.setOnKeyboardStateListener(SmallPlayerHelper$$Lambda$1.lambdaFactory$(this));
        ViewGroup containerView = (ViewGroup) view.findViewById(R.id.smallPlayerContainer);
        containerView.addView(innerView);
        SmallPlayerView smallPlayerView = (SmallPlayerView) view.findViewById(R.id.smallPlayer);
        this.player = new WeakReference<>(smallPlayerView);
        this.shadow = new WeakReference<>(view.findViewById(R.id.smallPlayerShadow));
        this.container = new WeakReference<>(containerView);
        AudioFacade.addPlayerListener(this, true);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateView$0(boolean visible) {
        this.keyBoardShowed = visible;
        syncVisibilityPlayer();
    }

    public void onDestroyView() {
        AudioFacade.removePlayerListener(this);
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
    public void onStateChanged(PlayerState state, TrackInfo info) {
        this.state = state;
        this.info = info;
        syncVisibilityPlayer();
    }

    private void syncVisibilityPlayer() {
        if (this.state != null && this.info != null) {
            SmallPlayerView smallPlayerView = this.player == null ? null : this.player.get();
            View shadowView = this.shadow == null ? null : this.shadow.get();
            View containerView = this.container == null ? null : this.container.get();
            if (smallPlayerView != null && shadowView != null && containerView != null) {
                smallPlayerView.bind(this.state, this.info);
                if (this.state != PlayerState.STOPPED && this.state != PlayerState.IDLE && !this.keyBoardShowed) {
                    if (smallPlayerView.getVisibility() != 0) {
                        smallPlayerView.setVisibility(0);
                        shadowView.setVisibility(0);
                        ((ViewGroup.MarginLayoutParams) containerView.getLayoutParams()).bottomMargin = V.dp(64.0f);
                        return;
                    }
                    return;
                } else if (smallPlayerView.getVisibility() != 8) {
                    smallPlayerView.setVisibility(8);
                    shadowView.setVisibility(8);
                    ((ViewGroup.MarginLayoutParams) containerView.getLayoutParams()).bottomMargin = V.dp(0.0f);
                    return;
                } else {
                    return;
                }
            }
            ViewUtils.post(SmallPlayerHelper$$Lambda$2.lambdaFactory$(this));
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
    public void onBufferingProgress(TrackInfo trackInfo) {
        SmallPlayerView smallPlayerView = this.player == null ? null : this.player.get();
        if (smallPlayerView != null) {
            smallPlayerView.onBufferingProgress(trackInfo);
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
    public void onProgress(TrackInfo trackInfo) {
        SmallPlayerView smallPlayerView = this.player == null ? null : this.player.get();
        if (smallPlayerView != null) {
            smallPlayerView.onProgress(trackInfo);
        }
    }
}
