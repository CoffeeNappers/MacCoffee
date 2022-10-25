package com.vkontakte.android.audio.player;

import android.content.Context;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.DownloadTaskBase;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class DownloadTaskTracks extends DownloadTaskBase {
    private final Set<String> mMids;
    private final Collection<MusicTrack> mTracks;

    public DownloadTaskTracks(Context context, DownloadTaskBase.DownloadTaskListener listener, Collection<MusicTrack> tracks, boolean showNotification) {
        super(context, listener, showNotification);
        this.mTracks = tracks;
        this.mMids = new HashSet();
        if (this.mTracks != null) {
            for (MusicTrack track : this.mTracks) {
                this.mMids.add(track.getMid());
            }
        }
    }

    @Override // com.vkontakte.android.audio.player.DownloadTaskBase
    public boolean hasTrack(String mid) {
        return this.mMids.contains(mid);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public DownloadTaskBase.Error doInBackground(Void... params) {
        DownloadTaskBase.Error error = downloadTracks(this.mTracks);
        if (error != null) {
            error.retryIntent = PlayerIntents.getStartDownloadTracksIntent(this.mContext, this.mTracks, this.mShowNotifications);
        }
        return error;
    }
}
