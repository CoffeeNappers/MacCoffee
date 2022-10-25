package com.google.android.exoplayer2.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.SystemClock;
import android.support.v4.media.TransportMediator;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.R;
import com.google.android.exoplayer2.Timeline;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.trackselection.TrackSelectionArray;
import com.google.android.exoplayer2.util.Util;
import java.util.Formatter;
import java.util.Locale;
/* loaded from: classes.dex */
public class PlaybackControlView extends FrameLayout {
    public static final int DEFAULT_FAST_FORWARD_MS = 15000;
    public static final int DEFAULT_REWIND_MS = 5000;
    public static final SeekDispatcher DEFAULT_SEEK_DISPATCHER = new SeekDispatcher() { // from class: com.google.android.exoplayer2.ui.PlaybackControlView.1
        @Override // com.google.android.exoplayer2.ui.PlaybackControlView.SeekDispatcher
        public boolean dispatchSeek(ExoPlayer player, int windowIndex, long positionMs) {
            player.seekTo(windowIndex, positionMs);
            return true;
        }
    };
    public static final int DEFAULT_SHOW_TIMEOUT_MS = 5000;
    private static final long MAX_POSITION_FOR_SEEK_TO_PREVIOUS = 3000;
    private static final int PROGRESS_BAR_MAX = 1000;
    private final ComponentListener componentListener;
    private final Timeline.Window currentWindow;
    private boolean dragging;
    private final TextView durationView;
    private final View fastForwardButton;
    private int fastForwardMs;
    private final StringBuilder formatBuilder;
    private final Formatter formatter;
    private final Runnable hideAction;
    private long hideAtMs;
    private boolean isAttachedToWindow;
    private final View nextButton;
    private final View pauseButton;
    private final View playButton;
    private ExoPlayer player;
    private final TextView positionView;
    private final View previousButton;
    private final SeekBar progressBar;
    private final View rewindButton;
    private int rewindMs;
    private SeekDispatcher seekDispatcher;
    private int showTimeoutMs;
    private final Runnable updateProgressAction;
    private VisibilityListener visibilityListener;

    /* loaded from: classes.dex */
    public interface SeekDispatcher {
        boolean dispatchSeek(ExoPlayer exoPlayer, int i, long j);
    }

    /* loaded from: classes.dex */
    public interface VisibilityListener {
        void onVisibilityChange(int i);
    }

    public PlaybackControlView(Context context) {
        this(context, null);
    }

    public PlaybackControlView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public PlaybackControlView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.updateProgressAction = new Runnable() { // from class: com.google.android.exoplayer2.ui.PlaybackControlView.2
            @Override // java.lang.Runnable
            public void run() {
                PlaybackControlView.this.updateProgress();
            }
        };
        this.hideAction = new Runnable() { // from class: com.google.android.exoplayer2.ui.PlaybackControlView.3
            @Override // java.lang.Runnable
            public void run() {
                PlaybackControlView.this.hide();
            }
        };
        int controllerLayoutId = R.layout.exo_playback_control_view;
        this.rewindMs = 5000;
        this.fastForwardMs = 15000;
        this.showTimeoutMs = 5000;
        if (attrs != null) {
            TypedArray a = context.getTheme().obtainStyledAttributes(attrs, R.styleable.PlaybackControlView, 0, 0);
            try {
                this.rewindMs = a.getInt(R.styleable.PlaybackControlView_rewind_increment, this.rewindMs);
                this.fastForwardMs = a.getInt(R.styleable.PlaybackControlView_fastforward_increment, this.fastForwardMs);
                this.showTimeoutMs = a.getInt(R.styleable.PlaybackControlView_show_timeout, this.showTimeoutMs);
                controllerLayoutId = a.getResourceId(R.styleable.PlaybackControlView_controller_layout_id, controllerLayoutId);
            } finally {
                a.recycle();
            }
        }
        this.currentWindow = new Timeline.Window();
        this.formatBuilder = new StringBuilder();
        this.formatter = new Formatter(this.formatBuilder, Locale.getDefault());
        this.componentListener = new ComponentListener();
        this.seekDispatcher = DEFAULT_SEEK_DISPATCHER;
        LayoutInflater.from(context).inflate(controllerLayoutId, this);
        setDescendantFocusability(262144);
        this.durationView = (TextView) findViewById(R.id.exo_duration);
        this.positionView = (TextView) findViewById(R.id.exo_position);
        this.progressBar = (SeekBar) findViewById(R.id.exo_progress);
        if (this.progressBar != null) {
            this.progressBar.setOnSeekBarChangeListener(this.componentListener);
            this.progressBar.setMax(1000);
        }
        this.playButton = findViewById(R.id.exo_play);
        if (this.playButton != null) {
            this.playButton.setOnClickListener(this.componentListener);
        }
        this.pauseButton = findViewById(R.id.exo_pause);
        if (this.pauseButton != null) {
            this.pauseButton.setOnClickListener(this.componentListener);
        }
        this.previousButton = findViewById(R.id.exo_prev);
        if (this.previousButton != null) {
            this.previousButton.setOnClickListener(this.componentListener);
        }
        this.nextButton = findViewById(R.id.exo_next);
        if (this.nextButton != null) {
            this.nextButton.setOnClickListener(this.componentListener);
        }
        this.rewindButton = findViewById(R.id.exo_rew);
        if (this.rewindButton != null) {
            this.rewindButton.setOnClickListener(this.componentListener);
        }
        this.fastForwardButton = findViewById(R.id.exo_ffwd);
        if (this.fastForwardButton != null) {
            this.fastForwardButton.setOnClickListener(this.componentListener);
        }
    }

    public ExoPlayer getPlayer() {
        return this.player;
    }

    public void setPlayer(ExoPlayer player) {
        if (this.player != player) {
            if (this.player != null) {
                this.player.removeListener(this.componentListener);
            }
            this.player = player;
            if (player != null) {
                player.addListener(this.componentListener);
            }
            updateAll();
        }
    }

    public void setVisibilityListener(VisibilityListener listener) {
        this.visibilityListener = listener;
    }

    public void setSeekDispatcher(SeekDispatcher seekDispatcher) {
        if (seekDispatcher == null) {
            seekDispatcher = DEFAULT_SEEK_DISPATCHER;
        }
        this.seekDispatcher = seekDispatcher;
    }

    public void setRewindIncrementMs(int rewindMs) {
        this.rewindMs = rewindMs;
        updateNavigation();
    }

    public void setFastForwardIncrementMs(int fastForwardMs) {
        this.fastForwardMs = fastForwardMs;
        updateNavigation();
    }

    public int getShowTimeoutMs() {
        return this.showTimeoutMs;
    }

    public void setShowTimeoutMs(int showTimeoutMs) {
        this.showTimeoutMs = showTimeoutMs;
    }

    public void show() {
        if (!isVisible()) {
            setVisibility(0);
            if (this.visibilityListener != null) {
                this.visibilityListener.onVisibilityChange(getVisibility());
            }
            updateAll();
            requestPlayPauseFocus();
        }
        hideAfterTimeout();
    }

    public void hide() {
        if (isVisible()) {
            setVisibility(8);
            if (this.visibilityListener != null) {
                this.visibilityListener.onVisibilityChange(getVisibility());
            }
            removeCallbacks(this.updateProgressAction);
            removeCallbacks(this.hideAction);
            this.hideAtMs = C.TIME_UNSET;
        }
    }

    public boolean isVisible() {
        return getVisibility() == 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideAfterTimeout() {
        removeCallbacks(this.hideAction);
        if (this.showTimeoutMs > 0) {
            this.hideAtMs = SystemClock.uptimeMillis() + this.showTimeoutMs;
            if (this.isAttachedToWindow) {
                postDelayed(this.hideAction, this.showTimeoutMs);
                return;
            }
            return;
        }
        this.hideAtMs = C.TIME_UNSET;
    }

    private void updateAll() {
        updatePlayPauseButton();
        updateNavigation();
        updateProgress();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updatePlayPauseButton() {
        int i = 8;
        boolean z = true;
        if (isVisible() && this.isAttachedToWindow) {
            boolean requestPlayPauseFocus = false;
            boolean playing = this.player != null && this.player.getPlayWhenReady();
            if (this.playButton != null) {
                requestPlayPauseFocus = false | (playing && this.playButton.isFocused());
                this.playButton.setVisibility(playing ? 8 : 0);
            }
            if (this.pauseButton != null) {
                if (playing || !this.pauseButton.isFocused()) {
                    z = false;
                }
                requestPlayPauseFocus |= z;
                View view = this.pauseButton;
                if (playing) {
                    i = 0;
                }
                view.setVisibility(i);
            }
            if (requestPlayPauseFocus) {
                requestPlayPauseFocus();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateNavigation() {
        boolean z = true;
        if (isVisible() && this.isAttachedToWindow) {
            Timeline currentTimeline = this.player != null ? this.player.getCurrentTimeline() : null;
            boolean haveNonEmptyTimeline = currentTimeline != null && !currentTimeline.isEmpty();
            boolean isSeekable = false;
            boolean enablePrevious = false;
            boolean enableNext = false;
            if (haveNonEmptyTimeline) {
                int currentWindowIndex = this.player.getCurrentWindowIndex();
                currentTimeline.getWindow(currentWindowIndex, this.currentWindow);
                isSeekable = this.currentWindow.isSeekable;
                enablePrevious = currentWindowIndex > 0 || isSeekable || !this.currentWindow.isDynamic;
                enableNext = currentWindowIndex < currentTimeline.getWindowCount() + (-1) || this.currentWindow.isDynamic;
            }
            setButtonEnabled(enablePrevious, this.previousButton);
            setButtonEnabled(enableNext, this.nextButton);
            setButtonEnabled(this.fastForwardMs > 0 && isSeekable, this.fastForwardButton);
            if (this.rewindMs <= 0 || !isSeekable) {
                z = false;
            }
            setButtonEnabled(z, this.rewindButton);
            if (this.progressBar != null) {
                this.progressBar.setEnabled(isSeekable);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateProgress() {
        long delayMs;
        if (isVisible() && this.isAttachedToWindow) {
            long duration = this.player == null ? 0L : this.player.getDuration();
            long position = this.player == null ? 0L : this.player.getCurrentPosition();
            if (this.durationView != null) {
                this.durationView.setText(stringForTime(duration));
            }
            if (this.positionView != null && !this.dragging) {
                this.positionView.setText(stringForTime(position));
            }
            if (this.progressBar != null) {
                if (!this.dragging) {
                    this.progressBar.setProgress(progressBarValue(position));
                }
                long bufferedPosition = this.player == null ? 0L : this.player.getBufferedPosition();
                this.progressBar.setSecondaryProgress(progressBarValue(bufferedPosition));
            }
            removeCallbacks(this.updateProgressAction);
            int playbackState = this.player == null ? 1 : this.player.getPlaybackState();
            if (playbackState != 1 && playbackState != 4) {
                if (this.player.getPlayWhenReady() && playbackState == 3) {
                    delayMs = 1000 - (position % 1000);
                    if (delayMs < 200) {
                        delayMs += 1000;
                    }
                } else {
                    delayMs = 1000;
                }
                postDelayed(this.updateProgressAction, delayMs);
            }
        }
    }

    private void requestPlayPauseFocus() {
        boolean playing = this.player != null && this.player.getPlayWhenReady();
        if (!playing && this.playButton != null) {
            this.playButton.requestFocus();
        } else if (playing && this.pauseButton != null) {
            this.pauseButton.requestFocus();
        }
    }

    private void setButtonEnabled(boolean enabled, View view) {
        if (view != null) {
            view.setEnabled(enabled);
            if (Util.SDK_INT >= 11) {
                setViewAlphaV11(view, enabled ? 1.0f : 0.3f);
                view.setVisibility(0);
                return;
            }
            view.setVisibility(enabled ? 0 : 4);
        }
    }

    @TargetApi(11)
    private void setViewAlphaV11(View view, float alpha) {
        view.setAlpha(alpha);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String stringForTime(long timeMs) {
        if (timeMs == C.TIME_UNSET) {
            timeMs = 0;
        }
        long totalSeconds = (500 + timeMs) / 1000;
        long seconds = totalSeconds % 60;
        long minutes = (totalSeconds / 60) % 60;
        long hours = totalSeconds / 3600;
        this.formatBuilder.setLength(0);
        return hours > 0 ? this.formatter.format("%d:%02d:%02d", Long.valueOf(hours), Long.valueOf(minutes), Long.valueOf(seconds)).toString() : this.formatter.format("%02d:%02d", Long.valueOf(minutes), Long.valueOf(seconds)).toString();
    }

    private int progressBarValue(long position) {
        long duration = this.player == null ? -9223372036854775807L : this.player.getDuration();
        if (duration == C.TIME_UNSET || duration == 0) {
            return 0;
        }
        return (int) ((1000 * position) / duration);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long positionValue(int progress) {
        long duration = this.player == null ? -9223372036854775807L : this.player.getDuration();
        if (duration == C.TIME_UNSET) {
            return 0L;
        }
        return (progress * duration) / 1000;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void previous() {
        Timeline currentTimeline = this.player.getCurrentTimeline();
        if (!currentTimeline.isEmpty()) {
            int currentWindowIndex = this.player.getCurrentWindowIndex();
            currentTimeline.getWindow(currentWindowIndex, this.currentWindow);
            if (currentWindowIndex > 0 && (this.player.getCurrentPosition() <= MAX_POSITION_FOR_SEEK_TO_PREVIOUS || (this.currentWindow.isDynamic && !this.currentWindow.isSeekable))) {
                seekTo(currentWindowIndex - 1, C.TIME_UNSET);
            } else {
                seekTo(0L);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void next() {
        Timeline currentTimeline = this.player.getCurrentTimeline();
        if (!currentTimeline.isEmpty()) {
            int currentWindowIndex = this.player.getCurrentWindowIndex();
            if (currentWindowIndex < currentTimeline.getWindowCount() - 1) {
                seekTo(currentWindowIndex + 1, C.TIME_UNSET);
            } else if (currentTimeline.getWindow(currentWindowIndex, this.currentWindow, false).isDynamic) {
                seekTo(currentWindowIndex, C.TIME_UNSET);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void rewind() {
        if (this.rewindMs > 0) {
            seekTo(Math.max(this.player.getCurrentPosition() - this.rewindMs, 0L));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fastForward() {
        if (this.fastForwardMs > 0) {
            seekTo(Math.min(this.player.getCurrentPosition() + this.fastForwardMs, this.player.getDuration()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void seekTo(long positionMs) {
        seekTo(this.player.getCurrentWindowIndex(), positionMs);
    }

    private void seekTo(int windowIndex, long positionMs) {
        boolean dispatched = this.seekDispatcher.dispatchSeek(this.player, windowIndex, positionMs);
        if (!dispatched) {
            updateProgress();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.isAttachedToWindow = true;
        if (this.hideAtMs != C.TIME_UNSET) {
            long delayMs = this.hideAtMs - SystemClock.uptimeMillis();
            if (delayMs <= 0) {
                hide();
            } else {
                postDelayed(this.hideAction, delayMs);
            }
        }
        updateAll();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.isAttachedToWindow = false;
        removeCallbacks(this.updateProgressAction);
        removeCallbacks(this.hideAction);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent event) {
        boolean handled = dispatchMediaKeyEvent(event) || super.dispatchKeyEvent(event);
        if (handled) {
            show();
        }
        return handled;
    }

    public boolean dispatchMediaKeyEvent(KeyEvent event) {
        boolean z = false;
        int keyCode = event.getKeyCode();
        if (this.player == null || !isHandledMediaKey(keyCode)) {
            return false;
        }
        if (event.getAction() == 0) {
            switch (keyCode) {
                case 85:
                    ExoPlayer exoPlayer = this.player;
                    if (!this.player.getPlayWhenReady()) {
                        z = true;
                    }
                    exoPlayer.setPlayWhenReady(z);
                    break;
                case 87:
                    next();
                    break;
                case 88:
                    previous();
                    break;
                case 89:
                    rewind();
                    break;
                case 90:
                    fastForward();
                    break;
                case TransportMediator.KEYCODE_MEDIA_PLAY /* 126 */:
                    this.player.setPlayWhenReady(true);
                    break;
                case TransportMediator.KEYCODE_MEDIA_PAUSE /* 127 */:
                    this.player.setPlayWhenReady(false);
                    break;
            }
        }
        show();
        return true;
    }

    private static boolean isHandledMediaKey(int keyCode) {
        return keyCode == 90 || keyCode == 89 || keyCode == 85 || keyCode == 126 || keyCode == 127 || keyCode == 87 || keyCode == 88;
    }

    /* loaded from: classes.dex */
    private final class ComponentListener implements ExoPlayer.EventListener, SeekBar.OnSeekBarChangeListener, View.OnClickListener {
        private ComponentListener() {
        }

        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onStartTrackingTouch(SeekBar seekBar) {
            PlaybackControlView.this.removeCallbacks(PlaybackControlView.this.hideAction);
            PlaybackControlView.this.dragging = true;
        }

        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            if (fromUser) {
                long position = PlaybackControlView.this.positionValue(progress);
                if (PlaybackControlView.this.positionView != null) {
                    PlaybackControlView.this.positionView.setText(PlaybackControlView.this.stringForTime(position));
                }
                if (PlaybackControlView.this.player != null && !PlaybackControlView.this.dragging) {
                    PlaybackControlView.this.seekTo(position);
                }
            }
        }

        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onStopTrackingTouch(SeekBar seekBar) {
            PlaybackControlView.this.dragging = false;
            if (PlaybackControlView.this.player != null) {
                PlaybackControlView.this.seekTo(PlaybackControlView.this.positionValue(seekBar.getProgress()));
            }
            PlaybackControlView.this.hideAfterTimeout();
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPlayerStateChanged(boolean playWhenReady, int playbackState) {
            PlaybackControlView.this.updatePlayPauseButton();
            PlaybackControlView.this.updateProgress();
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPositionDiscontinuity() {
            PlaybackControlView.this.updateNavigation();
            PlaybackControlView.this.updateProgress();
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onTimelineChanged(Timeline timeline, Object manifest) {
            PlaybackControlView.this.updateNavigation();
            PlaybackControlView.this.updateProgress();
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onLoadingChanged(boolean isLoading) {
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onTracksChanged(TrackGroupArray tracks, TrackSelectionArray selections) {
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPlayerError(ExoPlaybackException error) {
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            if (PlaybackControlView.this.player != null) {
                if (PlaybackControlView.this.nextButton == view) {
                    PlaybackControlView.this.next();
                } else if (PlaybackControlView.this.previousButton == view) {
                    PlaybackControlView.this.previous();
                } else if (PlaybackControlView.this.fastForwardButton == view) {
                    PlaybackControlView.this.fastForward();
                } else if (PlaybackControlView.this.rewindButton == view) {
                    PlaybackControlView.this.rewind();
                } else if (PlaybackControlView.this.playButton == view) {
                    PlaybackControlView.this.player.setPlayWhenReady(true);
                } else if (PlaybackControlView.this.pauseButton == view) {
                    PlaybackControlView.this.player.setPlayWhenReady(false);
                }
            }
            PlaybackControlView.this.hideAfterTimeout();
        }
    }
}
