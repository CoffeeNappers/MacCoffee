package com.google.android.gms.ads.internal.overlay;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.view.TextureView;
import android.view.View;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.vkontakte.android.api.VKAPIRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
@zzji
@TargetApi(14)
/* loaded from: classes.dex */
public class zzc extends zzi implements MediaPlayer.OnBufferingUpdateListener, MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnInfoListener, MediaPlayer.OnPreparedListener, MediaPlayer.OnVideoSizeChangedListener, TextureView.SurfaceTextureListener {
    private static final Map<Integer, String> zzbzp = new HashMap();
    private final zzy zzbzq;
    private final boolean zzbzr;
    private int zzbzs;
    private int zzbzt;
    private MediaPlayer zzbzu;
    private Uri zzbzv;
    private int zzbzw;
    private int zzbzx;
    private int zzbzy;
    private int zzbzz;
    private int zzcaa;
    private zzx zzcab;
    private boolean zzcac;
    private int zzcad;
    private zzh zzcae;

    static {
        if (Build.VERSION.SDK_INT >= 17) {
            zzbzp.put(-1004, "MEDIA_ERROR_IO");
            zzbzp.put(-1007, "MEDIA_ERROR_MALFORMED");
            zzbzp.put(-1010, "MEDIA_ERROR_UNSUPPORTED");
            zzbzp.put(-110, "MEDIA_ERROR_TIMED_OUT");
            zzbzp.put(3, "MEDIA_INFO_VIDEO_RENDERING_START");
        }
        zzbzp.put(100, "MEDIA_ERROR_SERVER_DIED");
        zzbzp.put(1, "MEDIA_ERROR_UNKNOWN");
        zzbzp.put(1, "MEDIA_INFO_UNKNOWN");
        zzbzp.put(700, "MEDIA_INFO_VIDEO_TRACK_LAGGING");
        zzbzp.put(701, "MEDIA_INFO_BUFFERING_START");
        zzbzp.put(702, "MEDIA_INFO_BUFFERING_END");
        zzbzp.put(Integer.valueOf((int) VKAPIRequest.ERROR_VIDEO_ALREADY_ADDED), "MEDIA_INFO_BAD_INTERLEAVING");
        zzbzp.put(801, "MEDIA_INFO_NOT_SEEKABLE");
        zzbzp.put(802, "MEDIA_INFO_METADATA_UPDATE");
        if (Build.VERSION.SDK_INT >= 19) {
            zzbzp.put(901, "MEDIA_INFO_UNSUPPORTED_SUBTITLE");
            zzbzp.put(902, "MEDIA_INFO_SUBTITLE_TIMED_OUT");
        }
    }

    public zzc(Context context, boolean z, boolean z2, zzy zzyVar) {
        super(context);
        this.zzbzs = 0;
        this.zzbzt = 0;
        setSurfaceTextureListener(this);
        this.zzbzq = zzyVar;
        this.zzcac = z;
        this.zzbzr = z2;
        this.zzbzq.zza((zzi) this);
    }

    private void zza(float f) {
        if (this.zzbzu == null) {
            zzkx.zzdi("AdMediaPlayerView setMediaPlayerVolume() called before onPrepared().");
            return;
        }
        try {
            this.zzbzu.setVolume(f, f);
        } catch (IllegalStateException e) {
        }
    }

    private void zzai(int i) {
        if (i == 3) {
            this.zzbzq.zzre();
            this.zzcbx.zzre();
        } else if (this.zzbzs == 3) {
            this.zzbzq.zzrf();
            this.zzcbx.zzrf();
        }
        this.zzbzs = i;
    }

    private void zzaj(int i) {
        this.zzbzt = i;
    }

    private void zzph() {
        SurfaceTexture surfaceTexture;
        zzkx.v("AdMediaPlayerView init MediaPlayer");
        SurfaceTexture surfaceTexture2 = getSurfaceTexture();
        if (this.zzbzv == null || surfaceTexture2 == null) {
            return;
        }
        zzz(false);
        try {
            this.zzbzu = com.google.android.gms.ads.internal.zzu.zzhd().zzqr();
            this.zzbzu.setOnBufferingUpdateListener(this);
            this.zzbzu.setOnCompletionListener(this);
            this.zzbzu.setOnErrorListener(this);
            this.zzbzu.setOnInfoListener(this);
            this.zzbzu.setOnPreparedListener(this);
            this.zzbzu.setOnVideoSizeChangedListener(this);
            this.zzbzy = 0;
            if (this.zzcac) {
                this.zzcab = new zzx(getContext());
                this.zzcab.zza(surfaceTexture2, getWidth(), getHeight());
                this.zzcab.start();
                surfaceTexture = this.zzcab.zzqt();
                if (surfaceTexture == null) {
                    this.zzcab.zzqs();
                    this.zzcab = null;
                }
                this.zzbzu.setDataSource(getContext(), this.zzbzv);
                this.zzbzu.setSurface(com.google.android.gms.ads.internal.zzu.zzhe().zza(surfaceTexture));
                this.zzbzu.setAudioStreamType(3);
                this.zzbzu.setScreenOnWhilePlaying(true);
                this.zzbzu.prepareAsync();
                zzai(1);
            }
            surfaceTexture = surfaceTexture2;
            this.zzbzu.setDataSource(getContext(), this.zzbzv);
            this.zzbzu.setSurface(com.google.android.gms.ads.internal.zzu.zzhe().zza(surfaceTexture));
            this.zzbzu.setAudioStreamType(3);
            this.zzbzu.setScreenOnWhilePlaying(true);
            this.zzbzu.prepareAsync();
            zzai(1);
        } catch (IOException | IllegalArgumentException | IllegalStateException e) {
            String valueOf = String.valueOf(this.zzbzv);
            zzkx.zzc(new StringBuilder(String.valueOf(valueOf).length() + 36).append("Failed to initialize MediaPlayer at ").append(valueOf).toString(), e);
            onError(this.zzbzu, 1, 0);
        }
    }

    private void zzpi() {
        if (this.zzbzr && zzpj() && this.zzbzu.getCurrentPosition() > 0 && this.zzbzt != 3) {
            zzkx.v("AdMediaPlayerView nudging MediaPlayer");
            zza(0.0f);
            this.zzbzu.start();
            int currentPosition = this.zzbzu.getCurrentPosition();
            long currentTimeMillis = com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis();
            while (zzpj() && this.zzbzu.getCurrentPosition() == currentPosition && com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis() - currentTimeMillis <= 250) {
            }
            this.zzbzu.pause();
            zzpk();
        }
    }

    private boolean zzpj() {
        return (this.zzbzu == null || this.zzbzs == -1 || this.zzbzs == 0 || this.zzbzs == 1) ? false : true;
    }

    private void zzz(boolean z) {
        zzkx.v("AdMediaPlayerView release");
        if (this.zzcab != null) {
            this.zzcab.zzqs();
            this.zzcab = null;
        }
        if (this.zzbzu != null) {
            this.zzbzu.reset();
            this.zzbzu.release();
            this.zzbzu = null;
            zzai(0);
            if (!z) {
                return;
            }
            this.zzbzt = 0;
            zzaj(0);
        }
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public int getCurrentPosition() {
        if (zzpj()) {
            return this.zzbzu.getCurrentPosition();
        }
        return 0;
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public int getDuration() {
        if (zzpj()) {
            return this.zzbzu.getDuration();
        }
        return -1;
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public int getVideoHeight() {
        if (this.zzbzu != null) {
            return this.zzbzu.getVideoHeight();
        }
        return 0;
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public int getVideoWidth() {
        if (this.zzbzu != null) {
            return this.zzbzu.getVideoWidth();
        }
        return 0;
    }

    @Override // android.media.MediaPlayer.OnBufferingUpdateListener
    public void onBufferingUpdate(MediaPlayer mediaPlayer, int i) {
        this.zzbzy = i;
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public void onCompletion(MediaPlayer mediaPlayer) {
        zzkx.v("AdMediaPlayerView completion");
        zzai(5);
        zzaj(5);
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzc.2
            @Override // java.lang.Runnable
            public void run() {
                if (zzc.this.zzcae != null) {
                    zzc.this.zzcae.zzqe();
                }
            }
        });
    }

    @Override // android.media.MediaPlayer.OnErrorListener
    public boolean onError(MediaPlayer mediaPlayer, int i, int i2) {
        final String str = zzbzp.get(Integer.valueOf(i));
        final String str2 = zzbzp.get(Integer.valueOf(i2));
        zzkx.zzdi(new StringBuilder(String.valueOf(str).length() + 38 + String.valueOf(str2).length()).append("AdMediaPlayerView MediaPlayer error: ").append(str).append(":").append(str2).toString());
        zzai(-1);
        zzaj(-1);
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzc.3
            @Override // java.lang.Runnable
            public void run() {
                if (zzc.this.zzcae != null) {
                    zzc.this.zzcae.zzk(str, str2);
                }
            }
        });
        return true;
    }

    @Override // android.media.MediaPlayer.OnInfoListener
    public boolean onInfo(MediaPlayer mediaPlayer, int i, int i2) {
        String str = zzbzp.get(Integer.valueOf(i));
        String str2 = zzbzp.get(Integer.valueOf(i2));
        zzkx.v(new StringBuilder(String.valueOf(str).length() + 37 + String.valueOf(str2).length()).append("AdMediaPlayerView MediaPlayer info: ").append(str).append(":").append(str2).toString());
        return true;
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        int defaultSize = getDefaultSize(this.zzbzw, i);
        int defaultSize2 = getDefaultSize(this.zzbzx, i2);
        if (this.zzbzw > 0 && this.zzbzx > 0 && this.zzcab == null) {
            int mode = View.MeasureSpec.getMode(i);
            int size = View.MeasureSpec.getSize(i);
            int mode2 = View.MeasureSpec.getMode(i2);
            defaultSize2 = View.MeasureSpec.getSize(i2);
            if (mode == 1073741824 && mode2 == 1073741824) {
                if (this.zzbzw * defaultSize2 < this.zzbzx * size) {
                    defaultSize = (this.zzbzw * defaultSize2) / this.zzbzx;
                } else if (this.zzbzw * defaultSize2 > this.zzbzx * size) {
                    defaultSize2 = (this.zzbzx * size) / this.zzbzw;
                    defaultSize = size;
                } else {
                    defaultSize = size;
                }
            } else if (mode == 1073741824) {
                int i3 = (this.zzbzx * size) / this.zzbzw;
                if (mode2 != Integer.MIN_VALUE || i3 <= defaultSize2) {
                    defaultSize2 = i3;
                    defaultSize = size;
                } else {
                    defaultSize = size;
                }
            } else if (mode2 == 1073741824) {
                defaultSize = (this.zzbzw * defaultSize2) / this.zzbzx;
                if (mode == Integer.MIN_VALUE && defaultSize > size) {
                    defaultSize = size;
                }
            } else {
                int i4 = this.zzbzw;
                int i5 = this.zzbzx;
                if (mode2 != Integer.MIN_VALUE || i5 <= defaultSize2) {
                    defaultSize2 = i5;
                    defaultSize = i4;
                } else {
                    defaultSize = (this.zzbzw * defaultSize2) / this.zzbzx;
                }
                if (mode == Integer.MIN_VALUE && defaultSize > size) {
                    defaultSize2 = (this.zzbzx * size) / this.zzbzw;
                    defaultSize = size;
                }
            }
        }
        setMeasuredDimension(defaultSize, defaultSize2);
        if (this.zzcab != null) {
            this.zzcab.zzi(defaultSize, defaultSize2);
        }
        if (Build.VERSION.SDK_INT == 16) {
            if ((this.zzbzz > 0 && this.zzbzz != defaultSize) || (this.zzcaa > 0 && this.zzcaa != defaultSize2)) {
                zzpi();
            }
            this.zzbzz = defaultSize;
            this.zzcaa = defaultSize2;
        }
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    public void onPrepared(MediaPlayer mediaPlayer) {
        zzkx.v("AdMediaPlayerView prepared");
        zzai(2);
        this.zzbzq.zzqc();
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzc.1
            @Override // java.lang.Runnable
            public void run() {
                if (zzc.this.zzcae != null) {
                    zzc.this.zzcae.zzqc();
                }
            }
        });
        this.zzbzw = mediaPlayer.getVideoWidth();
        this.zzbzx = mediaPlayer.getVideoHeight();
        if (this.zzcad != 0) {
            seekTo(this.zzcad);
        }
        zzpi();
        int i = this.zzbzw;
        zzkx.zzdh(new StringBuilder(62).append("AdMediaPlayerView stream dimensions: ").append(i).append(" x ").append(this.zzbzx).toString());
        if (this.zzbzt == 3) {
            play();
        }
        zzpk();
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
        zzkx.v("AdMediaPlayerView surface created");
        zzph();
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzc.4
            @Override // java.lang.Runnable
            public void run() {
                if (zzc.this.zzcae != null) {
                    zzc.this.zzcae.zzqb();
                }
            }
        });
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        zzkx.v("AdMediaPlayerView surface destroyed");
        if (this.zzbzu != null && this.zzcad == 0) {
            this.zzcad = this.zzbzu.getCurrentPosition();
        }
        if (this.zzcab != null) {
            this.zzcab.zzqs();
        }
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzc.6
            @Override // java.lang.Runnable
            public void run() {
                if (zzc.this.zzcae != null) {
                    zzc.this.zzcae.onPaused();
                    zzc.this.zzcae.zzqf();
                }
            }
        });
        zzz(true);
        return true;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, final int i, final int i2) {
        boolean z = true;
        zzkx.v("AdMediaPlayerView surface changed");
        boolean z2 = this.zzbzt == 3;
        if (this.zzbzw != i || this.zzbzx != i2) {
            z = false;
        }
        if (this.zzbzu != null && z2 && z) {
            if (this.zzcad != 0) {
                seekTo(this.zzcad);
            }
            play();
        }
        if (this.zzcab != null) {
            this.zzcab.zzi(i, i2);
        }
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzc.5
            @Override // java.lang.Runnable
            public void run() {
                if (zzc.this.zzcae != null) {
                    zzc.this.zzcae.zzf(i, i2);
                }
            }
        });
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
        this.zzbzq.zzb(this);
        this.zzcbw.zza(surfaceTexture, this.zzcae);
    }

    @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
    public void onVideoSizeChanged(MediaPlayer mediaPlayer, int i, int i2) {
        zzkx.v(new StringBuilder(57).append("AdMediaPlayerView size changed: ").append(i).append(" x ").append(i2).toString());
        this.zzbzw = mediaPlayer.getVideoWidth();
        this.zzbzx = mediaPlayer.getVideoHeight();
        if (this.zzbzw == 0 || this.zzbzx == 0) {
            return;
        }
        requestLayout();
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public void pause() {
        zzkx.v("AdMediaPlayerView pause");
        if (zzpj() && this.zzbzu.isPlaying()) {
            this.zzbzu.pause();
            zzai(4);
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzc.8
                @Override // java.lang.Runnable
                public void run() {
                    if (zzc.this.zzcae != null) {
                        zzc.this.zzcae.onPaused();
                    }
                }
            });
        }
        zzaj(4);
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public void play() {
        zzkx.v("AdMediaPlayerView play");
        if (zzpj()) {
            this.zzbzu.start();
            zzai(3);
            this.zzcbw.zzqd();
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzc.7
                @Override // java.lang.Runnable
                public void run() {
                    if (zzc.this.zzcae != null) {
                        zzc.this.zzcae.zzqd();
                    }
                }
            });
        }
        zzaj(3);
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public void seekTo(int i) {
        zzkx.v(new StringBuilder(34).append("AdMediaPlayerView seek ").append(i).toString());
        if (!zzpj()) {
            this.zzcad = i;
            return;
        }
        this.zzbzu.seekTo(i);
        this.zzcad = 0;
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public void setVideoPath(String str) {
        setVideoURI(Uri.parse(str));
    }

    public void setVideoURI(Uri uri) {
        this.zzbzv = uri;
        this.zzcad = 0;
        zzph();
        requestLayout();
        invalidate();
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public void stop() {
        zzkx.v("AdMediaPlayerView stop");
        if (this.zzbzu != null) {
            this.zzbzu.stop();
            this.zzbzu.release();
            this.zzbzu = null;
            zzai(0);
            zzaj(0);
        }
        this.zzbzq.onStop();
    }

    @Override // android.view.View
    public String toString() {
        String valueOf = String.valueOf(getClass().getName());
        String valueOf2 = String.valueOf(Integer.toHexString(hashCode()));
        return new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length()).append(valueOf).append("@").append(valueOf2).toString();
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public void zza(float f, float f2) {
        if (this.zzcab != null) {
            this.zzcab.zzb(f, f2);
        }
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public void zza(zzh zzhVar) {
        this.zzcae = zzhVar;
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi
    public String zzpg() {
        String valueOf = String.valueOf(this.zzcac ? " spherical" : "");
        return valueOf.length() != 0 ? "MediaPlayer".concat(valueOf) : new String("MediaPlayer");
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzi, com.google.android.gms.ads.internal.overlay.zzaa.zza
    public void zzpk() {
        zza(this.zzcbx.zzrh());
    }
}
