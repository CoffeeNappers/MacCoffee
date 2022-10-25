package com.vk.attachpicker.widget;

import android.content.Context;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.events.NotificationCenter;
import com.vk.attachpicker.events.NotificationListener;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class PagerVideoPlayer extends FrameLayout implements NotificationListener {
    private final Handler handler;
    private Runnable onEverySecond;
    private ImageView playButton;
    private FrameLayout playerContainer;
    private final int position;
    private final NotificationListener tempPauseListener;
    private final NotificationListener tempPlayListener;
    private final NotificationListener<Float> tempProgressListener;
    private final String videoPath;
    private TextureVideoView videoView;

    public PagerVideoPlayer(Context context, Uri uri, int position) {
        super(context);
        this.handler = new Handler(Looper.getMainLooper());
        this.onEverySecond = new Runnable() { // from class: com.vk.attachpicker.widget.PagerVideoPlayer.1
            @Override // java.lang.Runnable
            public void run() {
                if (PagerVideoPlayer.this.videoView != null) {
                    float videoPos = PagerVideoPlayer.this.videoView.getCurrentPosition() / PagerVideoPlayer.this.videoView.getDuration();
                    NotificationCenter.getInstance().fireEvent(3, (int) new VideoProgress(PagerVideoPlayer.this.videoView.getCurrentPosition(), PagerVideoPlayer.this.videoView.getDuration(), videoPos, PagerVideoPlayer.this.position));
                    if (PagerVideoPlayer.this.videoView.isPlaying()) {
                        PagerVideoPlayer.this.handler.postDelayed(PagerVideoPlayer.this.onEverySecond, 16L);
                    }
                }
            }
        };
        this.tempPauseListener = PagerVideoPlayer$$Lambda$1.lambdaFactory$(this);
        this.tempPlayListener = PagerVideoPlayer$$Lambda$2.lambdaFactory$(this);
        this.tempProgressListener = PagerVideoPlayer$$Lambda$3.lambdaFactory$(this);
        this.videoPath = uri.getEncodedPath();
        this.position = position;
        init(context);
    }

    private void init(Context context) {
        this.playerContainer = new FrameLayout(context);
        addView(this.playerContainer);
        this.playButton = new ImageView(context);
        this.playButton.setImageResource(R.drawable.picker_ic_gallery_video_play_56dp);
        FrameLayout.LayoutParams playLp = new FrameLayout.LayoutParams(-2, -2);
        playLp.gravity = 17;
        addView(this.playButton, playLp);
        View clickOverlay = new View(getContext());
        addView(clickOverlay);
        clickOverlay.setOnClickListener(PagerVideoPlayer$$Lambda$4.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$0(View v) {
        playPause();
    }

    private void checkVideoView() {
        if (this.videoView == null) {
            this.videoView = new TextureVideoView(getContext());
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-1, -1);
            lp.gravity = 17;
            this.playerContainer.addView(this.videoView, lp);
            this.videoView.setVideoPath(this.videoPath);
            this.videoView.setOnPreparedListener(PagerVideoPlayer$$Lambda$5.lambdaFactory$(this));
            this.videoView.setOnCompletionListener(PagerVideoPlayer$$Lambda$6.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$checkVideoView$2(MediaPlayer mp) {
        onStart();
        Picker.run(PagerVideoPlayer$$Lambda$7.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$1() {
        this.videoView.seekTo(1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$checkVideoView$3(MediaPlayer mp) {
        this.playButton.setVisibility(0);
        NotificationCenter.getInstance().fireEvent(5, (int) Integer.valueOf(this.position));
    }

    private void playPause() {
        checkVideoView();
        if (this.videoView != null) {
            if (this.videoView.isPlaying()) {
                this.videoView.pause();
                this.playButton.setVisibility(0);
                NotificationCenter.getInstance().fireEvent(5, (int) Integer.valueOf(this.position));
                return;
            }
            this.videoView.start();
            this.playButton.setVisibility(4);
            onStart();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        onVisible();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        onInvisible();
        NotificationCenter.getInstance().removeListener(this);
        NotificationCenter.getInstance().removeListener(this.tempPauseListener);
        NotificationCenter.getInstance().removeListener(this.tempPlayListener);
        NotificationCenter.getInstance().removeListener(this.tempProgressListener);
        super.onDetachedFromWindow();
    }

    private void onVisible() {
        NotificationCenter.getInstance().addListener(2, this);
        NotificationCenter.getInstance().addListener(6, this.position, this.tempPauseListener);
        NotificationCenter.getInstance().addListener(7, this.position, this.tempPlayListener);
        NotificationCenter.getInstance().addListener(8, this.position, this.tempProgressListener);
        this.playButton.setVisibility(0);
    }

    private void onInvisible() {
        NotificationCenter.getInstance().fireEvent(5, (int) Integer.valueOf(this.position));
        if (this.videoView != null) {
            this.videoView.pause();
            this.videoView.suspend();
            this.videoView = null;
            this.playerContainer.removeAllViews();
        }
        this.playButton.setVisibility(0);
    }

    @Override // com.vk.attachpicker.events.NotificationListener
    public void onNotification(int eventType, int eventId, Object eventArgs) {
        onInvisible();
    }

    private void onStart() {
        NotificationCenter.getInstance().fireEvent(4, (int) Integer.valueOf(this.position));
        this.handler.post(this.onEverySecond);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$4(int eventType, int eventId, Object eventArgs) {
        if (this.videoView != null) {
            this.videoView.pause();
            this.handler.removeCallbacks(this.onEverySecond);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$5(int eventType, int eventId, Object eventArgs) {
        if (this.videoView != null) {
            this.videoView.start();
            onStart();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$6(int eventType, int eventId, Float eventArgs) {
        if (this.videoView != null) {
            this.videoView.seekTo((int) (eventArgs.floatValue() * this.videoView.getDuration()));
        }
    }

    /* loaded from: classes2.dex */
    public static class VideoProgress {
        public final int currentSecond;
        public final int pagerPosition;
        public final float progress;
        public final int totalSeconds;

        public VideoProgress(int currentSecond, int totalSeconds, float progress, int pagerPosition) {
            this.currentSecond = currentSecond;
            this.totalSeconds = totalSeconds;
            this.progress = progress;
            this.pagerPosition = pagerPosition;
        }
    }
}
