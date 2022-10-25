package com.my.target.core.ui.views.video;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.net.Uri;
import android.text.TextUtils;
import android.view.Surface;
import android.view.TextureView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.my.target.Tracer;
import com.my.target.core.controllers.c;
import com.my.target.nativeads.models.VideoData;
import com.vkontakte.android.api.Order;
import java.lang.ref.WeakReference;
@TargetApi(14)
/* loaded from: classes2.dex */
public class VideoTextureView extends TextureView implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener {
    private static VideoTextureView a;
    private static WeakReference<c> b;
    private boolean c;
    private VideoData d;
    private a e;
    private float f;
    private int g;
    private MediaPlayer h;
    private boolean i;
    private int j;
    private int k;
    private Bitmap l;
    private int m;
    private final Runnable n;

    /* loaded from: classes2.dex */
    public interface a {
        void a(float f);

        void a(float f, float f2);

        void a(String str);

        void e();

        void f();

        void g();

        void h();

        void i();

        void j();
    }

    static /* synthetic */ int i(VideoTextureView videoTextureView) {
        int i = videoTextureView.g;
        videoTextureView.g = i + 1;
        return i;
    }

    public static VideoTextureView a(c cVar, Context context) {
        if (a == null) {
            a = new VideoTextureView(context);
            b = new WeakReference<>(cVar);
            return a;
        }
        if (b != null) {
            c cVar2 = b.get();
            b.clear();
            b = null;
            if (cVar2 != null) {
                cVar2.c();
            }
        }
        if (a.getContext() != context) {
            a.a();
            a = new VideoTextureView(context);
        }
        b = new WeakReference<>(cVar);
        return a;
    }

    public void setVolume(float f) {
        this.f = f;
        if (this.h != null) {
            this.h.setVolume(f, f);
            if (this.e != null) {
                this.e.a(f);
            }
        }
    }

    public final void a() {
        Tracer.d("VideoTextureView: call stop from controller state: " + l());
        b(true);
    }

    private String l() {
        switch (this.k) {
            case 1:
                return "preparing";
            case 2:
                return Order.STATUS_WAIT;
            case 3:
                return "playing";
            case 4:
                return "paused";
            case 5:
                return "stopped";
            default:
                return "idle";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(boolean z) {
        Tracer.d("VideoTextureView: call stop, state: " + l() + " show play " + z);
        if (this.e != null && z) {
            this.e.e();
        }
        this.j = 0;
        m();
        if (this.h != null) {
            this.h.stop();
            this.h.release();
            this.h = null;
        }
        this.k = 5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void m() {
        this.i = false;
        if (!this.c) {
            removeCallbacks(this.n);
        }
    }

    public static void a(c cVar) {
        if (b != null && b.get() == cVar) {
            b.clear();
            b = null;
        }
    }

    public final Bitmap b() {
        return this.l;
    }

    public final float c() {
        if (this.h == null || !this.h.isPlaying()) {
            return 0.0f;
        }
        return this.h.getCurrentPosition() / 1000.0f;
    }

    public final float d() {
        if (this.h == null || !this.h.isPlaying()) {
            return 0.0f;
        }
        return this.h.getDuration() / 1000.0f;
    }

    public final int e() {
        return this.k;
    }

    public final boolean f() {
        return this.f <= 0.0f;
    }

    public void setVideoListener(a aVar) {
        this.e = aVar;
    }

    public void setWaitingState() {
        this.k = 2;
    }

    public VideoTextureView(Context context) {
        super(context);
        this.n = new Runnable() { // from class: com.my.target.core.ui.views.video.VideoTextureView.1
            @Override // java.lang.Runnable
            public final void run() {
                if (VideoTextureView.this.h == null || !VideoTextureView.this.h.isPlaying()) {
                    if (VideoTextureView.this.k == 1) {
                        if (VideoTextureView.this.g >= 50) {
                            Tracer.d("VideoTextureView: lag on preparing");
                            VideoTextureView.this.b(true);
                        } else {
                            VideoTextureView.i(VideoTextureView.this);
                        }
                    }
                } else {
                    VideoTextureView.this.k = 3;
                    VideoTextureView.this.l = null;
                    if (VideoTextureView.this.g >= 50) {
                        if (VideoTextureView.this.e != null) {
                            Tracer.d("VideoTextureView: lag common");
                            VideoTextureView.this.b(true);
                        }
                    } else if (VideoTextureView.this.j != VideoTextureView.this.h.getCurrentPosition()) {
                        VideoTextureView.this.g = 0;
                        VideoTextureView.this.j = VideoTextureView.this.h.getCurrentPosition();
                        VideoTextureView.this.m = VideoTextureView.this.h.getDuration();
                        if (VideoTextureView.this.e != null) {
                            VideoTextureView.this.e.a(VideoTextureView.a(VideoTextureView.this.j), VideoTextureView.a(VideoTextureView.this.m));
                        }
                    } else {
                        VideoTextureView.i(VideoTextureView.this);
                    }
                }
                VideoTextureView.this.postDelayed(this, 200L);
            }
        };
    }

    public final void a(VideoData videoData, boolean z) {
        final Uri parse;
        if (this.e != null) {
            this.e.i();
        }
        if (!TextUtils.isEmpty(videoData.getData())) {
            parse = Uri.parse("file://" + videoData.getData());
        } else {
            parse = Uri.parse(videoData.getUrl());
        }
        if (this.d != null && videoData != this.d) {
            b(false);
            this.k = 0;
        }
        this.d = videoData;
        if (z) {
            this.k = 2;
        }
        Tracer.d("VideoTextureView: Playing video " + parse.toString() + "state: " + l() + " dims " + getMeasuredHeight() + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + getMeasuredWidth());
        if (isAvailable()) {
            a(n(), parse);
        }
        setSurfaceTextureListener(new TextureView.SurfaceTextureListener() { // from class: com.my.target.core.ui.views.video.VideoTextureView.2
            @Override // android.view.TextureView.SurfaceTextureListener
            public final void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
                Tracer.d("VideoTextureView: Surface available from callback, playing  force state " + VideoTextureView.this.k + " uri " + parse.toString() + " w= " + i + " h = " + i2);
                switch (VideoTextureView.this.k) {
                    case 1:
                    case 3:
                        if (VideoTextureView.this.f()) {
                            VideoTextureView.this.g();
                        } else {
                            VideoTextureView.this.h();
                        }
                        VideoTextureView.this.h.setSurface(new Surface(surfaceTexture));
                        if (VideoTextureView.this.k == 3) {
                            VideoTextureView.this.o();
                            VideoTextureView.this.h.start();
                            if (VideoTextureView.this.e != null) {
                                VideoTextureView.this.e.f();
                                return;
                            }
                            return;
                        }
                        return;
                    case 2:
                    case 4:
                    default:
                        if (VideoTextureView.l(VideoTextureView.this)) {
                            VideoTextureView.this.a(new Surface(surfaceTexture), parse);
                            return;
                        }
                        VideoTextureView.this.i();
                        if (VideoTextureView.this.e != null) {
                            VideoTextureView.this.e.h();
                            return;
                        }
                        return;
                    case 5:
                        return;
                }
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public final void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public final boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
                Tracer.d("VideoTextureView: Surface destroyed, state = " + VideoTextureView.this.k);
                if (VideoTextureView.this.h != null) {
                    VideoTextureView.this.h.setSurface(null);
                    switch (VideoTextureView.this.k) {
                        case 1:
                            if (VideoTextureView.this.h != null) {
                                Tracer.d("Release MediaPlayer");
                                VideoTextureView.this.h.release();
                                VideoTextureView.this.h = null;
                            }
                            VideoTextureView.this.k = 2;
                            return true;
                        case 2:
                        case 4:
                            return true;
                        case 3:
                            VideoTextureView.this.h.pause();
                            VideoTextureView.this.k = 4;
                            if (VideoTextureView.this.e != null) {
                                VideoTextureView.this.e.h();
                                return true;
                            }
                            return true;
                        default:
                            VideoTextureView.this.m();
                            if (VideoTextureView.this.h != null) {
                                Tracer.d("Release MediaPlayer");
                                VideoTextureView.this.h.release();
                                VideoTextureView.this.h = null;
                            }
                            VideoTextureView.this.k = 5;
                            return true;
                    }
                }
                return true;
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public final void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(Surface surface, Uri uri) {
        Tracer.d("VideoTextureView: call play state: " + l() + " url = " + uri.toString());
        if (surface != null) {
            o();
            switch (this.k) {
                case 1:
                    return;
                case 2:
                    if (this.h != null) {
                        Tracer.d("VideoTextureView: trying to start paused mediaplayer, state: " + l());
                        Tracer.d("VideoTextureView: Resume textureView");
                        if (this.h != null) {
                            o();
                            this.k = 3;
                            if (f()) {
                                g();
                            } else {
                                h();
                            }
                            this.h.setSurface(surface);
                            this.h.start();
                            this.h.seekTo(this.j);
                            if (this.e != null) {
                                this.e.g();
                                return;
                            }
                            return;
                        }
                        this.k = 0;
                        return;
                    }
                    break;
                case 3:
                    if (this.h != null && this.h.isPlaying()) {
                        this.h.setSurface(surface);
                        return;
                    }
                    break;
                case 4:
                    if (this.h != null) {
                        Tracer.d("VideoTextureView: trying to RESUMING mediaplayer, state: " + l());
                        this.h.setSurface(surface);
                        if (this.e != null) {
                            this.e.h();
                            return;
                        }
                        return;
                    }
                    break;
            }
            this.k = 1;
            this.g = 0;
            this.h = new MediaPlayer();
            this.h.setOnPreparedListener(this);
            this.h.setOnErrorListener(this);
            this.h.setOnCompletionListener(this);
            this.h.setSurface(surface);
            try {
                this.h.setDataSource(getContext(), uri);
                this.h.prepareAsync();
            } catch (Exception e) {
                if (this.e != null) {
                    this.e.a(e.getMessage());
                }
            }
        }
    }

    private Surface n() {
        if (isAvailable()) {
            return new Surface(getSurfaceTexture());
        }
        return null;
    }

    public final void g() {
        this.f = 0.0f;
        if (this.h != null) {
            this.h.setVolume(this.f, this.f);
        }
        if (this.e != null) {
            this.e.a(this.f);
        }
    }

    public final void h() {
        this.f = 1.0f;
        if (this.h != null) {
            this.h.setVolume(this.f, this.f);
        }
        if (this.e != null) {
            this.e.a(this.f);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void o() {
        if (!this.i && !this.c) {
            this.i = true;
            postDelayed(this.n, 200L);
        }
    }

    public final void i() {
        m();
        if (this.h != null && this.h.isPlaying()) {
            Tracer.d("VideoTextureView: Pause textureView until available");
            this.k = 2;
            this.h.pause();
        }
    }

    public final void a(boolean z) {
        m();
        if (this.h != null && this.h.isPlaying()) {
            if (z && this.d != null) {
                this.l = getBitmap(this.d.getWidth(), this.d.getHeight());
            }
            Tracer.d("VideoTextureView: Pause textureView, state: " + l());
            this.k = 4;
            this.h.pause();
            this.j = this.h.getCurrentPosition();
            if (this.e != null) {
                this.e.h();
            }
        }
    }

    public final void j() {
        if (this.h != null) {
            this.h.setVolume(0.3f, 0.3f);
        }
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    public void onPrepared(MediaPlayer mediaPlayer) {
        Tracer.d("VideoTextureView: call on prepared, state: " + l());
        if (this.k == 1) {
            if (isAvailable()) {
                Tracer.d("VideoTextureView: call mediaplayer to start visibility " + getVisibility() + " dims = " + getHeight() + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + getWidth());
                mediaPlayer.setSurface(n());
                if (f()) {
                    g();
                } else {
                    h();
                }
                mediaPlayer.start();
                if (this.j != 0) {
                    mediaPlayer.seekTo(this.j);
                }
                this.k = 3;
                if (this.e != null) {
                    this.e.f();
                    return;
                }
                return;
            }
            Tracer.d("VideoTextureView: mediaplayer is ready, but surface isn't available");
        }
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public void onCompletion(MediaPlayer mediaPlayer) {
        float duration = mediaPlayer.getDuration() / 1000.0f;
        if (this.e != null) {
            this.e.a(duration, duration);
            this.e.j();
        }
    }

    @Override // android.media.MediaPlayer.OnErrorListener
    public boolean onError(MediaPlayer mediaPlayer, int i, int i2) {
        if (this.e != null) {
            this.e.a("Video error: " + i + "," + i2);
        }
        b(true);
        return true;
    }

    public final void k() {
        this.c = true;
    }

    static /* synthetic */ float a(int i) {
        return i / 1000.0f;
    }

    static /* synthetic */ boolean l(VideoTextureView videoTextureView) {
        Rect rect = new Rect();
        if (videoTextureView.getGlobalVisibleRect(rect)) {
            if (rect.height() * rect.width() >= videoTextureView.getWidth() * videoTextureView.getHeight() * 0.6000000238418579d) {
                return true;
            }
        }
        return false;
    }
}
