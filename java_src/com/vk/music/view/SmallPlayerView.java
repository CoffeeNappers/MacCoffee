package com.vk.music.view;

import android.content.Context;
import android.support.annotation.AttrRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes2.dex */
public class SmallPlayerView extends FrameLayout {
    public SmallPlayerView(@NonNull Context context) {
        super(context);
        init();
    }

    public SmallPlayerView(@NonNull Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public SmallPlayerView(@NonNull Context context, @Nullable AttributeSet attrs, @AttrRes int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        ItemHolder holder = new ItemHolder(this);
        addView(holder.itemView);
    }

    public void bind(PlayerState state, TrackInfo info) {
        ((ItemHolder) getChildAt(0).getTag()).bind(new Pair(state, info));
    }

    public void onBufferingProgress(TrackInfo trackInfo) {
        ((ItemHolder) getChildAt(0).getTag()).onBufferingProgress(trackInfo);
    }

    public void onProgress(TrackInfo trackInfo) {
        ((ItemHolder) getChildAt(0).getTag()).onProgress(trackInfo);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class ItemHolder extends RecyclerHolder<Pair<PlayerState, TrackInfo>> implements View.OnClickListener {
        final ThumbsImageView image;
        final ImageButton playPause;
        final ProgressBar progress;
        final TextView title;

        ItemHolder(ViewGroup parent) {
            super((int) R.layout.music_small_player, parent);
            this.image = (ThumbsImageView) $(R.id.image);
            this.title = (TextView) $(R.id.title);
            ImageButton imageButton = (ImageButton) $(R.id.play_pause);
            this.playPause = imageButton;
            imageButton.setOnClickListener(this);
            $(R.id.next).setOnClickListener(this);
            this.itemView.setOnClickListener(this);
            this.itemView.setTag(this);
            this.progress = (ProgressBar) $(R.id.player_view_progress);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Pair<PlayerState, TrackInfo> item) {
            if (((TrackInfo) item.second).hasTrack()) {
                this.image.setThumb(((TrackInfo) item.second).getTrack().getThumb());
                this.title.setText(((TrackInfo) item.second).getTitle());
            }
            if (item.first == PlayerState.PLAYING) {
                this.playPause.setImageResource(R.drawable.ic_miniplayer_pause_24dp);
            } else {
                this.playPause.setImageResource(R.drawable.ic_miniplayer_play_24dp);
            }
            if (((TrackInfo) item.second).isContentMode()) {
                this.progress.setProgressDrawable(ViewUtils.getDrawable(getContext(), R.drawable.drawer_player_progress));
            } else {
                this.progress.setProgressDrawable(ViewUtils.getDrawable(getContext(), R.drawable.drawer_player_progress_ad));
            }
            onBufferingProgress((TrackInfo) item.second);
            onProgress((TrackInfo) item.second);
        }

        public void onBufferingProgress(TrackInfo trackInfo) {
        }

        public void onProgress(TrackInfo trackInfo) {
            this.progress.setProgress(trackInfo.getPositionPercent());
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.next /* 2131755549 */:
                    AudioFacade.next();
                    return;
                case R.id.play_pause /* 2131756019 */:
                    if (getItem().first == PlayerState.PLAYING) {
                        AudioFacade.pause();
                        return;
                    } else {
                        AudioFacade.resume();
                        return;
                    }
                default:
                    AudioFacade.showPlayer();
                    return;
            }
        }
    }
}
