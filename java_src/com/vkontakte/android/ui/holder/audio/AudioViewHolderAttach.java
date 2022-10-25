package com.vkontakte.android.ui.holder.audio;

import android.app.Activity;
import android.content.Intent;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.ui.holder.audio.AudioViewHolderBase;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes3.dex */
public class AudioViewHolderAttach extends AudioViewHolderBase {
    private ImageView playPauseIcon;

    public AudioViewHolderAttach(ViewGroup parent, int section, AudioViewHolderBase.AudioViewHolderDelegate audioViewHolderDelegate) {
        super(R.layout.audio_list_item_attach, parent, section, audioViewHolderDelegate);
        this.playPauseIcon = (ImageView) $(R.id.audio_play_pause_icon);
        this.playPauseIcon.setOnClickListener(AudioViewHolderAttach$$Lambda$1.lambdaFactory$(this));
        this.cacheIcon.setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View v) {
        playPause((MusicTrack) this.item);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.ui.holder.audio.AudioViewHolderBase, com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(MusicTrack item) {
        super.onBind(item);
        boolean isCurrent = Utils.equals(item, AudioFacade.getCurrentTrack());
        boolean isPlaying = isCurrent && AudioFacade.getPlayerState().isPlayState();
        if (isPlaying) {
            this.playPauseIcon.setImageResource(R.drawable.ic_pause_circle_32dp);
        } else {
            this.playPauseIcon.setImageResource(R.drawable.ic_play_circle_32dp);
        }
        if (isCurrent) {
            this.progressBar.setVisibility(0);
            this.audioViewHolderDelegate.setItemProgressBar(this.progressBar);
            return;
        }
        this.progressBar.setVisibility(8);
        this.progressBar.setProgress(0);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        Intent result = new Intent().putExtra(MimeTypes.BASE_TYPE_AUDIO, (Parcelable) this.item);
        if (this.itemView.getContext() instanceof Activity) {
            Utils.castToActivity(this.itemView.getContext()).setResult(-1, result);
            Utils.castToActivity(this.itemView.getContext()).finish();
        }
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
    public boolean onLongClick() {
        return false;
    }
}
