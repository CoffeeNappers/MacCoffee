package com.google.android.exoplayer2.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.R;
import com.google.android.exoplayer2.SimpleExoPlayer;
import com.google.android.exoplayer2.Timeline;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.id3.ApicFrame;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.text.Cue;
import com.google.android.exoplayer2.text.TextRenderer;
import com.google.android.exoplayer2.trackselection.TrackSelection;
import com.google.android.exoplayer2.trackselection.TrackSelectionArray;
import com.google.android.exoplayer2.ui.PlaybackControlView;
import com.google.android.exoplayer2.util.Assertions;
import java.util.List;
@TargetApi(16)
/* loaded from: classes.dex */
public final class SimpleExoPlayerView extends FrameLayout {
    private static final int SURFACE_TYPE_NONE = 0;
    private static final int SURFACE_TYPE_SURFACE_VIEW = 1;
    private static final int SURFACE_TYPE_TEXTURE_VIEW = 2;
    private final ImageView artworkView;
    private final ComponentListener componentListener;
    private final AspectRatioFrameLayout contentFrame;
    private final PlaybackControlView controller;
    private int controllerShowTimeoutMs;
    private Bitmap defaultArtwork;
    private final FrameLayout overlayFrameLayout;
    private SimpleExoPlayer player;
    private final View shutterView;
    private final SubtitleView subtitleView;
    private final View surfaceView;
    private boolean useArtwork;
    private boolean useController;

    public SimpleExoPlayerView(Context context) {
        this(context, null);
    }

    public SimpleExoPlayerView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SimpleExoPlayerView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        int playerLayoutId = R.layout.exo_simple_player_view;
        boolean useArtwork = true;
        int defaultArtworkId = 0;
        boolean useController = true;
        int surfaceType = 1;
        int resizeMode = 0;
        int controllerShowTimeoutMs = 5000;
        if (attrs != null) {
            TypedArray a = context.getTheme().obtainStyledAttributes(attrs, R.styleable.SimpleExoPlayerView, 0, 0);
            try {
                playerLayoutId = a.getResourceId(R.styleable.SimpleExoPlayerView_player_layout_id, playerLayoutId);
                useArtwork = a.getBoolean(R.styleable.SimpleExoPlayerView_use_artwork, true);
                defaultArtworkId = a.getResourceId(R.styleable.SimpleExoPlayerView_default_artwork, 0);
                useController = a.getBoolean(R.styleable.SimpleExoPlayerView_use_controller, true);
                surfaceType = a.getInt(R.styleable.SimpleExoPlayerView_surface_type, 1);
                resizeMode = a.getInt(R.styleable.SimpleExoPlayerView_resize_mode, 0);
                controllerShowTimeoutMs = a.getInt(R.styleable.SimpleExoPlayerView_show_timeout, 5000);
            } finally {
                a.recycle();
            }
        }
        LayoutInflater.from(context).inflate(playerLayoutId, this);
        this.componentListener = new ComponentListener();
        setDescendantFocusability(262144);
        this.contentFrame = (AspectRatioFrameLayout) findViewById(R.id.exo_content_frame);
        if (this.contentFrame != null) {
            setResizeModeRaw(this.contentFrame, resizeMode);
        }
        this.shutterView = findViewById(R.id.exo_shutter);
        if (this.contentFrame != null && surfaceType != 0) {
            ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(-1, -1);
            this.surfaceView = surfaceType == 2 ? new TextureView(context) : new SurfaceView(context);
            this.surfaceView.setLayoutParams(params);
            this.contentFrame.addView(this.surfaceView, 0);
        } else {
            this.surfaceView = null;
        }
        this.overlayFrameLayout = (FrameLayout) findViewById(R.id.exo_overlay);
        this.artworkView = (ImageView) findViewById(R.id.exo_artwork);
        this.useArtwork = useArtwork && this.artworkView != null;
        if (defaultArtworkId != 0) {
            this.defaultArtwork = BitmapFactory.decodeResource(context.getResources(), defaultArtworkId);
        }
        this.subtitleView = (SubtitleView) findViewById(R.id.exo_subtitles);
        if (this.subtitleView != null) {
            this.subtitleView.setUserDefaultStyle();
            this.subtitleView.setUserDefaultTextSize();
        }
        View controllerPlaceholder = findViewById(R.id.exo_controller_placeholder);
        if (controllerPlaceholder != null) {
            this.controller = new PlaybackControlView(context, attrs);
            this.controller.setLayoutParams(controllerPlaceholder.getLayoutParams());
            ViewGroup parent = (ViewGroup) controllerPlaceholder.getParent();
            int controllerIndex = parent.indexOfChild(controllerPlaceholder);
            parent.removeView(controllerPlaceholder);
            parent.addView(this.controller, controllerIndex);
        } else {
            this.controller = null;
        }
        this.controllerShowTimeoutMs = this.controller == null ? 0 : controllerShowTimeoutMs;
        this.useController = useController && this.controller != null;
        hideController();
    }

    public SimpleExoPlayer getPlayer() {
        return this.player;
    }

    public void setPlayer(SimpleExoPlayer player) {
        if (this.player != player) {
            if (this.player != null) {
                this.player.setTextOutput(null);
                this.player.setVideoListener(null);
                this.player.removeListener(this.componentListener);
                this.player.setVideoSurface(null);
            }
            this.player = player;
            if (this.useController) {
                this.controller.setPlayer(player);
            }
            if (this.shutterView != null) {
                this.shutterView.setVisibility(0);
            }
            if (player != null) {
                if (this.surfaceView instanceof TextureView) {
                    player.setVideoTextureView((TextureView) this.surfaceView);
                } else if (this.surfaceView instanceof SurfaceView) {
                    player.setVideoSurfaceView((SurfaceView) this.surfaceView);
                }
                player.setVideoListener(this.componentListener);
                player.addListener(this.componentListener);
                player.setTextOutput(this.componentListener);
                maybeShowController(false);
                updateForCurrentTrackSelections();
                return;
            }
            hideController();
            hideArtwork();
        }
    }

    public void setResizeMode(int resizeMode) {
        Assertions.checkState(this.contentFrame != null);
        this.contentFrame.setResizeMode(resizeMode);
    }

    public boolean getUseArtwork() {
        return this.useArtwork;
    }

    public void setUseArtwork(boolean useArtwork) {
        Assertions.checkState(!useArtwork || this.artworkView != null);
        if (this.useArtwork != useArtwork) {
            this.useArtwork = useArtwork;
            updateForCurrentTrackSelections();
        }
    }

    public Bitmap getDefaultArtwork() {
        return this.defaultArtwork;
    }

    public void setDefaultArtwork(Bitmap defaultArtwork) {
        if (this.defaultArtwork != defaultArtwork) {
            this.defaultArtwork = defaultArtwork;
            updateForCurrentTrackSelections();
        }
    }

    public boolean getUseController() {
        return this.useController;
    }

    public void setUseController(boolean useController) {
        Assertions.checkState(!useController || this.controller != null);
        if (this.useController != useController) {
            this.useController = useController;
            if (useController) {
                this.controller.setPlayer(this.player);
            } else if (this.controller != null) {
                this.controller.hide();
                this.controller.setPlayer(null);
            }
        }
    }

    public boolean dispatchMediaKeyEvent(KeyEvent event) {
        return this.useController && this.controller.dispatchMediaKeyEvent(event);
    }

    public void showController() {
        if (this.useController) {
            maybeShowController(true);
        }
    }

    public void hideController() {
        if (this.controller != null) {
            this.controller.hide();
        }
    }

    public int getControllerShowTimeoutMs() {
        return this.controllerShowTimeoutMs;
    }

    public void setControllerShowTimeoutMs(int controllerShowTimeoutMs) {
        Assertions.checkState(this.controller != null);
        this.controllerShowTimeoutMs = controllerShowTimeoutMs;
    }

    public void setControllerVisibilityListener(PlaybackControlView.VisibilityListener listener) {
        Assertions.checkState(this.controller != null);
        this.controller.setVisibilityListener(listener);
    }

    public void setSeekDispatcher(PlaybackControlView.SeekDispatcher seekDispatcher) {
        Assertions.checkState(this.controller != null);
        this.controller.setSeekDispatcher(seekDispatcher);
    }

    public void setRewindIncrementMs(int rewindMs) {
        Assertions.checkState(this.controller != null);
        this.controller.setRewindIncrementMs(rewindMs);
    }

    public void setFastForwardIncrementMs(int fastForwardMs) {
        Assertions.checkState(this.controller != null);
        this.controller.setFastForwardIncrementMs(fastForwardMs);
    }

    public View getVideoSurfaceView() {
        return this.surfaceView;
    }

    public FrameLayout getOverlayFrameLayout() {
        return this.overlayFrameLayout;
    }

    public SubtitleView getSubtitleView() {
        return this.subtitleView;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (!this.useController || this.player == null || ev.getActionMasked() != 0) {
            return false;
        }
        if (this.controller.isVisible()) {
            this.controller.hide();
            return true;
        }
        maybeShowController(true);
        return true;
    }

    @Override // android.view.View
    public boolean onTrackballEvent(MotionEvent ev) {
        if (!this.useController || this.player == null) {
            return false;
        }
        maybeShowController(true);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void maybeShowController(boolean isForced) {
        int i = 0;
        if (this.useController && this.player != null) {
            int playbackState = this.player.getPlaybackState();
            boolean showIndefinitely = playbackState == 1 || playbackState == 4 || !this.player.getPlayWhenReady();
            boolean wasShowingIndefinitely = this.controller.isVisible() && this.controller.getShowTimeoutMs() <= 0;
            PlaybackControlView playbackControlView = this.controller;
            if (!showIndefinitely) {
                i = this.controllerShowTimeoutMs;
            }
            playbackControlView.setShowTimeoutMs(i);
            if (isForced || showIndefinitely || wasShowingIndefinitely) {
                this.controller.show();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateForCurrentTrackSelections() {
        if (this.player != null) {
            TrackSelectionArray selections = this.player.getCurrentTrackSelections();
            for (int i = 0; i < selections.length; i++) {
                if (this.player.getRendererType(i) == 2 && selections.get(i) != null) {
                    hideArtwork();
                    return;
                }
            }
            if (this.shutterView != null) {
                this.shutterView.setVisibility(0);
            }
            if (this.useArtwork) {
                for (int i2 = 0; i2 < selections.length; i2++) {
                    TrackSelection selection = selections.get(i2);
                    if (selection != null) {
                        for (int j = 0; j < selection.length(); j++) {
                            Metadata metadata = selection.getFormat(j).metadata;
                            if (metadata != null && setArtworkFromMetadata(metadata)) {
                                return;
                            }
                        }
                        continue;
                    }
                }
                if (setArtworkFromBitmap(this.defaultArtwork)) {
                    return;
                }
            }
            hideArtwork();
        }
    }

    private boolean setArtworkFromMetadata(Metadata metadata) {
        for (int i = 0; i < metadata.length(); i++) {
            Metadata.Entry metadataEntry = metadata.get(i);
            if (metadataEntry instanceof ApicFrame) {
                byte[] bitmapData = ((ApicFrame) metadataEntry).pictureData;
                Bitmap bitmap = BitmapFactory.decodeByteArray(bitmapData, 0, bitmapData.length);
                return setArtworkFromBitmap(bitmap);
            }
        }
        return false;
    }

    private boolean setArtworkFromBitmap(Bitmap bitmap) {
        if (bitmap != null) {
            int bitmapWidth = bitmap.getWidth();
            int bitmapHeight = bitmap.getHeight();
            if (bitmapWidth <= 0 || bitmapHeight <= 0) {
                return false;
            }
            if (this.contentFrame != null) {
                this.contentFrame.setAspectRatio(bitmapWidth / bitmapHeight);
            }
            this.artworkView.setImageBitmap(bitmap);
            this.artworkView.setVisibility(0);
            return true;
        }
        return false;
    }

    private void hideArtwork() {
        if (this.artworkView != null) {
            this.artworkView.setImageResource(17170445);
            this.artworkView.setVisibility(4);
        }
    }

    private static void setResizeModeRaw(AspectRatioFrameLayout aspectRatioFrame, int resizeMode) {
        aspectRatioFrame.setResizeMode(resizeMode);
    }

    /* loaded from: classes.dex */
    private final class ComponentListener implements SimpleExoPlayer.VideoListener, TextRenderer.Output, ExoPlayer.EventListener {
        private ComponentListener() {
        }

        @Override // com.google.android.exoplayer2.text.TextRenderer.Output
        public void onCues(List<Cue> cues) {
            if (SimpleExoPlayerView.this.subtitleView != null) {
                SimpleExoPlayerView.this.subtitleView.onCues(cues);
            }
        }

        @Override // com.google.android.exoplayer2.SimpleExoPlayer.VideoListener
        public void onVideoSizeChanged(int width, int height, int unappliedRotationDegrees, float pixelWidthHeightRatio) {
            if (SimpleExoPlayerView.this.contentFrame != null) {
                float aspectRatio = height == 0 ? 1.0f : (width * pixelWidthHeightRatio) / height;
                SimpleExoPlayerView.this.contentFrame.setAspectRatio(aspectRatio);
            }
        }

        @Override // com.google.android.exoplayer2.SimpleExoPlayer.VideoListener
        public void onRenderedFirstFrame() {
            if (SimpleExoPlayerView.this.shutterView != null) {
                SimpleExoPlayerView.this.shutterView.setVisibility(4);
            }
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onTracksChanged(TrackGroupArray tracks, TrackSelectionArray selections) {
            SimpleExoPlayerView.this.updateForCurrentTrackSelections();
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onLoadingChanged(boolean isLoading) {
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPlayerStateChanged(boolean playWhenReady, int playbackState) {
            SimpleExoPlayerView.this.maybeShowController(false);
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPlayerError(ExoPlaybackException e) {
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onPositionDiscontinuity() {
        }

        @Override // com.google.android.exoplayer2.ExoPlayer.EventListener
        public void onTimelineChanged(Timeline timeline, Object manifest) {
        }
    }
}
