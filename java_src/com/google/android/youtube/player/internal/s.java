package com.google.android.youtube.player.internal;

import android.content.res.Configuration;
import android.os.Bundle;
import android.os.RemoteException;
import android.view.KeyEvent;
import android.view.View;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.internal.e;
import com.google.android.youtube.player.internal.f;
import com.google.android.youtube.player.internal.g;
import com.google.android.youtube.player.internal.h;
import java.util.List;
/* loaded from: classes2.dex */
public final class s implements YouTubePlayer {
    private b a;
    private d b;

    public s(b bVar, d dVar) {
        this.a = (b) ab.a(bVar, "connectionClient cannot be null");
        this.b = (d) ab.a(dVar, "embeddedPlayer cannot be null");
    }

    public final View a() {
        try {
            return (View) v.a(this.b.s());
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void a(Configuration configuration) {
        try {
            this.b.a(configuration);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void a(boolean z) {
        try {
            this.b.a(z);
            this.a.a(z);
            this.a.d();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final boolean a(int i, KeyEvent keyEvent) {
        try {
            return this.b.a(i, keyEvent);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final boolean a(Bundle bundle) {
        try {
            return this.b.a(bundle);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void addFullscreenControlFlag(int i) {
        try {
            this.b.d(i);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void b() {
        try {
            this.b.m();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void b(boolean z) {
        try {
            this.b.e(z);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final boolean b(int i, KeyEvent keyEvent) {
        try {
            return this.b.b(i, keyEvent);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void c() {
        try {
            this.b.n();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void cuePlaylist(String str) {
        cuePlaylist(str, 0, 0);
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void cuePlaylist(String str, int i, int i2) {
        try {
            this.b.a(str, i, i2);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void cueVideo(String str) {
        cueVideo(str, 0);
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void cueVideo(String str, int i) {
        try {
            this.b.a(str, i);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void cueVideos(List<String> list) {
        cueVideos(list, 0, 0);
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void cueVideos(List<String> list, int i, int i2) {
        try {
            this.b.a(list, i, i2);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void d() {
        try {
            this.b.o();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void e() {
        try {
            this.b.p();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void f() {
        try {
            this.b.q();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final void g() {
        try {
            this.b.l();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final int getCurrentTimeMillis() {
        try {
            return this.b.h();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final int getDurationMillis() {
        try {
            return this.b.i();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final int getFullscreenControlFlags() {
        try {
            return this.b.j();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    public final Bundle h() {
        try {
            return this.b.r();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final boolean hasNext() {
        try {
            return this.b.d();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final boolean hasPrevious() {
        try {
            return this.b.e();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final boolean isPlaying() {
        try {
            return this.b.c();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void loadPlaylist(String str) {
        loadPlaylist(str, 0, 0);
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void loadPlaylist(String str, int i, int i2) {
        try {
            this.b.b(str, i, i2);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void loadVideo(String str) {
        loadVideo(str, 0);
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void loadVideo(String str, int i) {
        try {
            this.b.b(str, i);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void loadVideos(List<String> list) {
        loadVideos(list, 0, 0);
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void loadVideos(List<String> list, int i, int i2) {
        try {
            this.b.b(list, i, i2);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void next() {
        try {
            this.b.f();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void pause() {
        try {
            this.b.b();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void play() {
        try {
            this.b.a();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void previous() {
        try {
            this.b.g();
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void release() {
        a(true);
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void seekRelativeMillis(int i) {
        try {
            this.b.b(i);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void seekToMillis(int i) {
        try {
            this.b.a(i);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setFullscreen(boolean z) {
        try {
            this.b.b(z);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setFullscreenControlFlags(int i) {
        try {
            this.b.c(i);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setManageAudioFocus(boolean z) {
        try {
            this.b.d(z);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setOnFullscreenListener(final YouTubePlayer.OnFullscreenListener onFullscreenListener) {
        try {
            this.b.a(new e.a() { // from class: com.google.android.youtube.player.internal.s.1
                @Override // com.google.android.youtube.player.internal.e
                public final void a(boolean z) {
                    onFullscreenListener.onFullscreen(z);
                }
            });
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setPlaybackEventListener(final YouTubePlayer.PlaybackEventListener playbackEventListener) {
        try {
            this.b.a(new f.a() { // from class: com.google.android.youtube.player.internal.s.4
                @Override // com.google.android.youtube.player.internal.f
                public final void a() {
                    playbackEventListener.onPlaying();
                }

                @Override // com.google.android.youtube.player.internal.f
                public final void a(int i) {
                    playbackEventListener.onSeekTo(i);
                }

                @Override // com.google.android.youtube.player.internal.f
                public final void a(boolean z) {
                    playbackEventListener.onBuffering(z);
                }

                @Override // com.google.android.youtube.player.internal.f
                public final void b() {
                    playbackEventListener.onPaused();
                }

                @Override // com.google.android.youtube.player.internal.f
                public final void c() {
                    playbackEventListener.onStopped();
                }
            });
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setPlayerStateChangeListener(final YouTubePlayer.PlayerStateChangeListener playerStateChangeListener) {
        try {
            this.b.a(new g.a() { // from class: com.google.android.youtube.player.internal.s.3
                @Override // com.google.android.youtube.player.internal.g
                public final void a() {
                    playerStateChangeListener.onLoading();
                }

                @Override // com.google.android.youtube.player.internal.g
                public final void a(String str) {
                    playerStateChangeListener.onLoaded(str);
                }

                @Override // com.google.android.youtube.player.internal.g
                public final void b() {
                    playerStateChangeListener.onAdStarted();
                }

                @Override // com.google.android.youtube.player.internal.g
                public final void b(String str) {
                    YouTubePlayer.ErrorReason errorReason;
                    try {
                        errorReason = YouTubePlayer.ErrorReason.valueOf(str);
                    } catch (IllegalArgumentException e) {
                        errorReason = YouTubePlayer.ErrorReason.UNKNOWN;
                    } catch (NullPointerException e2) {
                        errorReason = YouTubePlayer.ErrorReason.UNKNOWN;
                    }
                    playerStateChangeListener.onError(errorReason);
                }

                @Override // com.google.android.youtube.player.internal.g
                public final void c() {
                    playerStateChangeListener.onVideoStarted();
                }

                @Override // com.google.android.youtube.player.internal.g
                public final void d() {
                    playerStateChangeListener.onVideoEnded();
                }
            });
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setPlayerStyle(YouTubePlayer.PlayerStyle playerStyle) {
        try {
            this.b.a(playerStyle.name());
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setPlaylistEventListener(final YouTubePlayer.PlaylistEventListener playlistEventListener) {
        try {
            this.b.a(new h.a() { // from class: com.google.android.youtube.player.internal.s.2
                @Override // com.google.android.youtube.player.internal.h
                public final void a() {
                    playlistEventListener.onPrevious();
                }

                @Override // com.google.android.youtube.player.internal.h
                public final void b() {
                    playlistEventListener.onNext();
                }

                @Override // com.google.android.youtube.player.internal.h
                public final void c() {
                    playlistEventListener.onPlaylistEnded();
                }
            });
        } catch (RemoteException e) {
            throw new q(e);
        }
    }

    @Override // com.google.android.youtube.player.YouTubePlayer
    public final void setShowFullscreenButton(boolean z) {
        try {
            this.b.c(z);
        } catch (RemoteException e) {
            throw new q(e);
        }
    }
}
