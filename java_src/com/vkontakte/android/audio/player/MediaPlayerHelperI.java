package com.vkontakte.android.audio.player;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.audio.MusicTrack;
import java.io.IOException;
/* loaded from: classes2.dex */
public interface MediaPlayerHelperI {
    public static final long PROGRESS_DELAY = 500;
    public static final UrlCreator URL_CREATOR_EXO_PLAYER_CACHE_FILE;
    public static final UrlCreator URL_CREATOR_EXO_PLAYER_CACHE_HTTP;
    public static final UrlCreator URL_CREATOR_LOCAL_HOST_CACHE;

    /* loaded from: classes2.dex */
    public interface MediaPlayerHelperListener {

        /* loaded from: classes2.dex */
        public enum ErrorType {
            timeout,
            unsupported,
            unknown
        }

        void onBufferingProgress(@NonNull MediaPlayerHelperI mediaPlayerHelperI, int i);

        void onCompleted(@NonNull MediaPlayerHelperI mediaPlayerHelperI);

        void onError(@NonNull MediaPlayerHelperI mediaPlayerHelperI, ErrorType errorType);

        void onHelperIdChange(int i);

        void onPrepared(@NonNull MediaPlayerHelperI mediaPlayerHelperI, int i);

        void onProgress(@NonNull MediaPlayerHelperI mediaPlayerHelperI, int i);
    }

    /* loaded from: classes.dex */
    public interface Refer {
        String getExtStr();

        int getInt();

        String getStr();
    }

    /* loaded from: classes2.dex */
    public interface UrlCreator {
        String createUrl(String str, String str2);
    }

    boolean canPlay();

    int getAudioSessionId();

    long getCurrentPosition();

    long getDuration();

    int getId();

    Refer getRefer();

    @NonNull
    PlayerState getState();

    boolean pause();

    void play(@Nullable MusicTrack musicTrack, String str, @Nullable Refer refer) throws IOException;

    void release();

    boolean resume();

    boolean rewind();

    boolean seekTo(int i);

    void setVolume(float f);

    void stop();

    boolean tryNext();

    static {
        UrlCreator urlCreator;
        UrlCreator urlCreator2;
        UrlCreator urlCreator3;
        urlCreator = MediaPlayerHelperI$$Lambda$1.instance;
        URL_CREATOR_LOCAL_HOST_CACHE = urlCreator;
        urlCreator2 = MediaPlayerHelperI$$Lambda$5.instance;
        URL_CREATOR_EXO_PLAYER_CACHE_HTTP = urlCreator2;
        urlCreator3 = MediaPlayerHelperI$$Lambda$6.instance;
        URL_CREATOR_EXO_PLAYER_CACHE_FILE = urlCreator3;
    }

    /* loaded from: classes2.dex */
    public enum Type {
        mediaPlayer(true, MediaPlayerHelperI.URL_CREATOR_LOCAL_HOST_CACHE, MediaPlayerHelperI.URL_CREATOR_LOCAL_HOST_CACHE),
        exoPlayer(true, MediaPlayerHelperI.URL_CREATOR_LOCAL_HOST_CACHE, MediaPlayerHelperI.URL_CREATOR_LOCAL_HOST_CACHE),
        exoPlayerCached(false, MediaPlayerHelperI.URL_CREATOR_EXO_PLAYER_CACHE_HTTP, MediaPlayerHelperI.URL_CREATOR_EXO_PLAYER_CACHE_FILE);
        
        private final UrlCreator urlCreatorFile;
        private final UrlCreator urlCreatorHttp;
        public final boolean useLocalhostForCache;

        Type(boolean useLocalhostForCache, UrlCreator urlCreatorHttp, UrlCreator urlCreatorFile) {
            this.useLocalhostForCache = useLocalhostForCache;
            this.urlCreatorHttp = urlCreatorHttp;
            this.urlCreatorFile = urlCreatorFile;
        }

        public String createHttpUrl(MusicTrack track, String url) {
            return this.urlCreatorHttp.createUrl(track == null ? null : track.getMid(), url);
        }

        public String createFileUrl(MusicTrack track, String url) {
            return this.urlCreatorFile.createUrl(track == null ? null : track.getMid(), url);
        }
    }

    /* loaded from: classes2.dex */
    public static final class Factory {
        private Factory() {
        }

        public static MediaPlayerHelperI get(Type type, Context ctx, int id, MediaPlayerHelperListener listener) {
            switch (type) {
                case exoPlayerCached:
                case exoPlayer:
                    return new ExoPlayerHelper(ctx, id, listener, type == Type.exoPlayer);
                default:
                    return new MediaPlayerHelper(ctx, id, listener);
            }
        }
    }
}
