package com.vkontakte.android.audio.player;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.session.MediaSessionCompat;
import android.support.v4.media.session.PlaybackStateCompat;
import android.text.TextUtils;
import android.view.KeyEvent;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.utils.L;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class MediaSessionHelper {
    private final Context mContext;
    private boolean mInitialized;
    private final Player mPlayer;
    private MediaSessionCompat mSession;

    /* JADX INFO: Access modifiers changed from: package-private */
    public MediaSessionHelper(Context context, Player player) {
        this.mContext = context.getApplicationContext();
        this.mPlayer = player;
    }

    public void init() {
        if (!this.mInitialized) {
            this.mInitialized = true;
            Intent intent = new Intent("android.intent.action.MEDIA_BUTTON", null, this.mContext, MediaButtonEventReceiver.class);
            PendingIntent pendingIntent = PendingIntent.getBroadcast(this.mContext, 0, intent, 0);
            ComponentName componentName = new ComponentName(this.mContext, MediaButtonEventReceiver.class);
            this.mSession = new MediaSessionCompat(this.mContext, "VK Music", componentName, pendingIntent);
            this.mSession.setCallback(new SessionCallback());
            this.mSession.setFlags(3);
        }
    }

    public void release() {
        if (this.mInitialized) {
            this.mInitialized = false;
            this.mSession.setActive(false);
            this.mSession.release();
            this.mSession = null;
        }
    }

    public void update() {
        PlayerState state = this.mPlayer.getState();
        if (state == PlayerState.STOPPED) {
            release();
            return;
        }
        init();
        TrackInfo trackInfo = this.mPlayer.getTrackInfo();
        PlaybackStateCompat.Builder builder = new PlaybackStateCompat.Builder();
        builder.setActions(575L);
        switch (state) {
            case STOPPED:
                builder.setState(1, 0L, 1.0f);
                break;
            case PAUSED:
                builder.setState(2, trackInfo.getPosition(), 1.0f);
                break;
            case PLAYING:
                builder.setState(3, trackInfo.getPosition(), 1.0f);
                break;
        }
        this.mSession.setPlaybackState(builder.build());
        PlayerTrack playerTrack = trackInfo.getTrack();
        if (playerTrack != null) {
            String url = playerTrack.getThumbUrl(Utils.getMaxCoverSize());
            if (TextUtils.isEmpty(url)) {
                lambda$update$0(playerTrack, null);
            } else {
                VKImageLoader.getBitmap(Uri.parse(url)).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(MediaSessionHelper$$Lambda$1.lambdaFactory$(this, playerTrack), MediaSessionHelper$$Lambda$2.lambdaFactory$(this, playerTrack));
            }
        }
        this.mSession.setActive(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$update$1(PlayerTrack playerTrack, Throwable throwable) throws Exception {
        lambda$update$0(playerTrack, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: updateMetadata */
    public void lambda$update$0(MusicTrack musicTrack, Bitmap bitmap) {
        if (this.mSession != null && this.mSession.isActive()) {
            L.d("PlayerService", "Player", "updateMetadata", "artist", musicTrack.artist, "title", musicTrack.title, "bitmap", bitmap);
            MediaMetadataCompat.Builder builder = new MediaMetadataCompat.Builder();
            builder.putString(MediaMetadataCompat.METADATA_KEY_ALBUM, musicTrack.album == null ? "" : musicTrack.album.title);
            builder.putString(MediaMetadataCompat.METADATA_KEY_ALBUM_ARTIST, musicTrack.artist);
            builder.putString(MediaMetadataCompat.METADATA_KEY_ARTIST, musicTrack.artist);
            builder.putString(MediaMetadataCompat.METADATA_KEY_TITLE, musicTrack.title);
            builder.putLong(MediaMetadataCompat.METADATA_KEY_DURATION, musicTrack.duration * 1000);
            builder.putLong(MediaMetadataCompat.METADATA_KEY_TRACK_NUMBER, AudioFacade.getActualTrackIndex() + 1);
            builder.putLong(MediaMetadataCompat.METADATA_KEY_NUM_TRACKS, AudioFacade.getActualTrackListSize());
            if (bitmap != null && !bitmap.isRecycled()) {
                if (bitmap.getConfig() == null) {
                    bitmap = bitmap.copy(Bitmap.Config.ARGB_8888, false);
                }
                builder.putBitmap(MediaMetadataCompat.METADATA_KEY_ALBUM_ART, bitmap);
            }
            this.mSession.setMetadata(builder.build());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class SessionCallback extends MediaSessionCompat.Callback {
        private SessionCallback() {
        }

        @Override // android.support.v4.media.session.MediaSessionCompat.Callback
        public boolean onMediaButtonEvent(Intent intent) {
            KeyEvent keyEvent;
            String action = intent.getAction();
            if ("android.intent.action.MEDIA_BUTTON".equals(action) && (keyEvent = (KeyEvent) intent.getParcelableExtra("android.intent.extra.KEY_EVENT")) != null && keyEvent.getAction() == 0) {
                switch (keyEvent.getKeyCode()) {
                    case 79:
                        if (MediaButtonEventReceiver.checkHeadsetHookPlayNext()) {
                            MediaSessionHelper.this.mPlayer.playNext();
                        } else {
                            MediaSessionHelper.this.mPlayer.toggleResumePause();
                        }
                        return true;
                }
            }
            return super.onMediaButtonEvent(intent);
        }

        @Override // android.support.v4.media.session.MediaSessionCompat.Callback
        public void onPlay() {
            MediaSessionHelper.this.mPlayer.resume();
        }

        @Override // android.support.v4.media.session.MediaSessionCompat.Callback
        public void onPause() {
            MediaSessionHelper.this.mPlayer.pause();
        }

        @Override // android.support.v4.media.session.MediaSessionCompat.Callback
        public void onSkipToNext() {
            MediaSessionHelper.this.mPlayer.playNext();
        }

        @Override // android.support.v4.media.session.MediaSessionCompat.Callback
        public void onSkipToPrevious() {
            MediaSessionHelper.this.mPlayer.playPrev();
        }

        @Override // android.support.v4.media.session.MediaSessionCompat.Callback
        public void onRewind() {
            MediaSessionHelper.this.mPlayer.rewind();
        }

        @Override // android.support.v4.media.session.MediaSessionCompat.Callback
        public void onStop() {
            MediaSessionHelper.this.mPlayer.stop();
        }

        @Override // android.support.v4.media.session.MediaSessionCompat.Callback
        public void onSeekTo(long pos) {
            MediaSessionHelper.this.mPlayer.seekTo((int) pos);
        }
    }
}
