package com.my.target.core.ui;

import android.content.Context;
import android.media.AudioManager;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RelativeLayout;
import com.google.android.exoplayer2.util.MimeTypes;
import com.my.target.Tracer;
import com.my.target.ads.instream.InstreamAdPlayer;
import com.my.target.core.ui.views.video.VideoTextureView;
import com.my.target.nativeads.models.VideoData;
/* loaded from: classes2.dex */
public class InstreamAdVideoPlayer extends RelativeLayout implements InstreamAdPlayer {
    private InstreamAdPlayer.AdPlayerListener adPlayerListener;
    private final AudioManager.OnAudioFocusChangeListener afChangeListener;
    private boolean pauseCalled;
    private int placeholderHeight;
    private int placeholderWidth;
    private boolean startCalled;
    private final VideoTextureView.a textureVideoListener;
    private VideoData videoData;
    private final VideoTextureView videoTextureView;

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public InstreamAdPlayer.AdPlayerListener getAdPlayerListener() {
        return this.adPlayerListener;
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public float getAdVideoDuration() {
        return this.videoTextureView.d();
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public float getAdVideoTimeElapsed() {
        return this.videoTextureView.c();
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public View getView() {
        return this;
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public void setAdPlayerListener(InstreamAdPlayer.AdPlayerListener adPlayerListener) {
        this.adPlayerListener = adPlayerListener;
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public void playAdVideo(Uri uri, int i, int i2) {
        setPlaceHolderDimension(i, i2);
        this.startCalled = false;
        requestLayout();
        this.videoData = new VideoData(uri.toString());
        requestAudioFocus(getContext());
        this.videoTextureView.a(this.videoData, true);
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public void pauseAdVideo() {
        abandonAudioFocus(getContext());
        this.videoTextureView.a(false);
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public void resumeAdVideo() {
        requestAudioFocus(getContext());
        this.videoTextureView.a(this.videoData, true);
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public void stopAdVideo() {
        abandonAudioFocus(getContext());
        if (this.adPlayerListener != null) {
            this.adPlayerListener.onAdVideoStopped();
        }
        destroy();
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public void destroy() {
        this.videoTextureView.a();
    }

    @Override // com.my.target.ads.instream.InstreamAdPlayer
    public void setVolume(float f) {
        this.videoTextureView.setVolume(f);
    }

    private void abandonAudioFocus(Context context) {
        ((AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO)).abandonAudioFocus(this.afChangeListener);
    }

    private void setPlaceHolderDimension(int i, int i2) {
        this.placeholderWidth = i;
        this.placeholderHeight = i2;
    }

    private void requestAudioFocus(Context context) {
        ((AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO)).requestAudioFocus(this.afChangeListener, 3, 2);
    }

    public InstreamAdVideoPlayer(Context context) {
        this(context, null);
    }

    public InstreamAdVideoPlayer(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public InstreamAdVideoPlayer(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.afChangeListener = new AudioManager.OnAudioFocusChangeListener() { // from class: com.my.target.core.ui.InstreamAdVideoPlayer.1
            @Override // android.media.AudioManager.OnAudioFocusChangeListener
            public final void onAudioFocusChange(int i2) {
                switch (i2) {
                    case -3:
                        Tracer.d("audiofocus loss can duck, set volume to 0.3");
                        InstreamAdVideoPlayer.this.videoTextureView.j();
                        return;
                    case -2:
                    case -1:
                        InstreamAdVideoPlayer.this.pauseAdVideo();
                        Tracer.d("audiofocus loss, pausing");
                        return;
                    case 0:
                    case 3:
                    default:
                        return;
                    case 1:
                    case 2:
                    case 4:
                        Tracer.d("audiofocus gain, unmuting");
                        InstreamAdVideoPlayer.this.videoTextureView.h();
                        return;
                }
            }
        };
        this.textureVideoListener = new VideoTextureView.a() { // from class: com.my.target.core.ui.InstreamAdVideoPlayer.2
            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void e() {
                InstreamAdVideoPlayer.this.pauseCalled = false;
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void a(float f) {
                if (InstreamAdVideoPlayer.this.adPlayerListener != null) {
                    InstreamAdVideoPlayer.this.adPlayerListener.onVolumeChanged(f);
                }
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void f() {
                if (!InstreamAdVideoPlayer.this.startCalled && InstreamAdVideoPlayer.this.adPlayerListener != null) {
                    InstreamAdVideoPlayer.this.adPlayerListener.onAdVideoStarted();
                    InstreamAdVideoPlayer.this.startCalled = true;
                }
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void g() {
                if (InstreamAdVideoPlayer.this.pauseCalled) {
                    if (InstreamAdVideoPlayer.this.adPlayerListener != null) {
                        InstreamAdVideoPlayer.this.adPlayerListener.onAdVideoResumed();
                    }
                    InstreamAdVideoPlayer.this.pauseCalled = false;
                }
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void h() {
                InstreamAdVideoPlayer.this.pauseCalled = true;
                if (InstreamAdVideoPlayer.this.adPlayerListener != null) {
                    InstreamAdVideoPlayer.this.adPlayerListener.onAdVideoPaused();
                }
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void i() {
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void a(float f, float f2) {
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void a(String str) {
                InstreamAdVideoPlayer.this.pauseCalled = false;
                if (InstreamAdVideoPlayer.this.adPlayerListener != null) {
                    InstreamAdVideoPlayer.this.adPlayerListener.onAdVideoError(str);
                }
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void j() {
                InstreamAdVideoPlayer.this.pauseCalled = false;
                if (InstreamAdVideoPlayer.this.adPlayerListener != null) {
                    InstreamAdVideoPlayer.this.adPlayerListener.onAdVideoCompleted();
                }
            }
        };
        this.videoTextureView = new VideoTextureView(context);
        this.videoTextureView.setVideoListener(this.textureVideoListener);
        this.videoTextureView.k();
        addView(this.videoTextureView, new RelativeLayout.LayoutParams(-1, -2));
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        int i3;
        int i4 = 0;
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        int i5 = mode == 0 ? Integer.MIN_VALUE : mode;
        if (mode2 == 0) {
            mode2 = Integer.MIN_VALUE;
        }
        if (this.placeholderHeight == 0 || this.placeholderWidth == 0) {
            super.onMeasure(i, i2);
            return;
        }
        float f = this.placeholderWidth / this.placeholderHeight;
        float f2 = 0.0f;
        if (size2 != 0) {
            f2 = size / size2;
        }
        if (i5 == 1073741824 && mode2 == 1073741824) {
            i3 = size;
            i4 = size2;
        } else if (i5 == Integer.MIN_VALUE && mode2 == Integer.MIN_VALUE) {
            if (f < f2) {
                i3 = Math.round(size2 * f);
                if (size <= 0 || i3 <= size) {
                    i4 = size2;
                } else {
                    i4 = Math.round(size / f);
                    i3 = size;
                }
            } else {
                i4 = Math.round(size / f);
                if (size2 <= 0 || i4 <= size2) {
                    i3 = size;
                } else {
                    i3 = Math.round(size2 * f);
                    i4 = size2;
                }
            }
        } else if (i5 == Integer.MIN_VALUE && mode2 == 1073741824) {
            i3 = Math.round(size2 * f);
            if (size <= 0 || i3 <= size) {
                i4 = size2;
            } else {
                i4 = Math.round(size / f);
                i3 = size;
            }
        } else if (i5 == 1073741824 && mode2 == Integer.MIN_VALUE) {
            i4 = Math.round(size / f);
            if (size2 <= 0 || i4 <= size2) {
                i3 = size;
            } else {
                i3 = Math.round(size2 * f);
                i4 = size2;
            }
        } else {
            i3 = 0;
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(i3, 1073741824), View.MeasureSpec.makeMeasureSpec(i4, 1073741824));
    }
}
