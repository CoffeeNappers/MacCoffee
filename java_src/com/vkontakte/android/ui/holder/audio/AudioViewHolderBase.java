package com.vkontakte.android.ui.holder.audio;

import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public abstract class AudioViewHolderBase extends RecyclerHolder<MusicTrack> implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
    protected TextView artist;
    protected AudioViewHolderDelegate audioViewHolderDelegate;
    protected ImageView cacheIcon;
    protected TextView duration;
    protected ProgressBar progressBar;
    protected int section;
    protected TextView title;

    /* loaded from: classes3.dex */
    public interface AudioViewHolderDelegate {
        boolean isAnimatingTransitionOut();

        void playTrack(int i, int i2);

        void setItemProgressBar(ProgressBar progressBar);
    }

    public AudioViewHolderBase(int layout, ViewGroup parent, int section, AudioViewHolderDelegate audioViewHolderDelegate) {
        super(parent.getContext(), layout, parent);
        this.audioViewHolderDelegate = audioViewHolderDelegate;
        this.title = (TextView) $(R.id.audio_title);
        this.artist = (TextView) $(R.id.audio_artist);
        this.duration = (TextView) $(R.id.audio_duration);
        this.progressBar = (ProgressBar) $(R.id.audio_progress_bar);
        this.cacheIcon = (ImageView) $(R.id.audio_saved_icon);
        this.section = section;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(MusicTrack item) {
        this.title.setText(item.title);
        this.artist.setText(item.artist);
        this.duration.setText(String.format("%d:%02d", Integer.valueOf(item.duration / 60), Integer.valueOf(item.duration % 60)));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void playPause(MusicTrack file) {
        PlayerState state = AudioFacade.getPlayerState();
        if (file.equals(AudioFacade.getCurrentTrack()) && (state == PlayerState.PAUSED || state == PlayerState.PLAYING)) {
            AudioFacade.toggleResumePause();
        } else {
            this.audioViewHolderDelegate.playTrack(getAdapterPosition(), this.section);
        }
    }
}
