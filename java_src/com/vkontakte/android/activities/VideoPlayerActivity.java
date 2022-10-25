package com.vkontakte.android.activities;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.provider.Settings;
import android.support.annotation.RequiresApi;
import android.support.annotation.UiThread;
import android.support.v7.widget.PopupMenu;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuItem;
import android.view.OrientationEventListener;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.TextView;
import com.facebook.common.util.UriUtil;
import com.facebook.imagepipeline.common.RotationOptions;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.auth.api.proxy.AuthApiStatusCodes;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.cache.Videos;
import com.vkontakte.android.media.AbsVideoPlayer;
import com.vkontakte.android.media.VideoPools;
import com.vkontakte.android.media.VideoTracker;
import com.vkontakte.android.media.VigoDelegate;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.widget.VideoPlayerAdsPanel;
import com.vkontakte.android.ui.widget.VideoTextureView;
import com.vkontakte.android.utils.Utils;
import com.vkontakte.android.utils.VKLiveUtils;
import java.util.concurrent.atomic.AtomicBoolean;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class VideoPlayerActivity extends BaseVideoActivity implements VideoPools.PlayerContext {
    VideoPlayerAdsPanel adsPanel;
    View bottomAnchor;
    private boolean buffering;
    private boolean completed;
    View content;
    View controlBar;
    View endMenu;
    View endMenuScrim;
    boolean fill;
    private boolean fullscreenTracked;
    ScrimInsetsView insetsView;
    private boolean isAutoplay;
    private boolean isMute;
    private boolean isResumed;
    Runnable mHideUiAction;
    Orientier mOrientier;
    private boolean mRecallReady;
    VideoTracker mTracker;
    ImageView playButton;
    AbsVideoPlayer player;
    boolean playing;
    ProgressBar progress;
    PopupMenu qualityMenu;
    TextView qualitySelector;
    private boolean ready;
    Animator resizeAnim;
    ImageView resizeButton;
    SeekBar seekbar;
    private boolean seeking;
    private ShitAttachment shitAttachment;
    VideoTextureView texView;
    TextView time1;
    TextView time2;
    private boolean uiHidden;
    Animator visibilityAnim;
    final AtomicBoolean useVigo = new AtomicBoolean(true);
    final FocusListener focusListener = new FocusListener();
    final ContentObserver volumeObserver = new SettingsContentObserver(null);
    volatile int curQuality = -1;
    private int needSeekTo = -1;
    private boolean uiVisible = true;
    float texScaleFit = 1.0f;
    float texScaleCrop = 1.0f;
    float translationControlsFit = 0.0f;
    float translationControlsCrop = 0.0f;

    public boolean isInShitMode() {
        return this.shitAttachment != null;
    }

    public boolean keepNavigationBarShownInFullScreen() {
        return isInShitMode() && Build.VERSION.SDK_INT < 19;
    }

    public int getUIFlagsForFullScreenMode() {
        if (!isInShitMode()) {
            return 6;
        }
        if (keepNavigationBarShownInFullScreen()) {
            return 4;
        }
        return 2054;
    }

    public int getSystemLayoutFlags() {
        if (!keepNavigationBarShownInFullScreen()) {
            return 1792;
        }
        return 1280;
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        initShitIfNeeded();
        super.onCreate(b);
    }

    private void initShitIfNeeded() {
        this.shitAttachment = (ShitAttachment) getIntent().getParcelableExtra("ads");
        if (this.shitAttachment != null) {
            this.systemUILayoutFlag = getSystemLayoutFlags();
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void createUI(Bundle savedInstanceState) {
        View inflate = View.inflate(this, R.layout.video_player, null);
        this.content = inflate;
        setContentView(inflate);
        this.content.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.1
            @Override // android.view.View.OnLayoutChangeListener
            public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
                VideoPlayerActivity.this.updateTextureViewScale();
            }
        });
        findViewById(R.id.video_end_like).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                VideoPlayerActivity.this.toggleLike();
            }
        });
        findViewById(R.id.video_end_replay).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                VideoPlayerActivity.this.replay(0);
            }
        });
        findViewById(R.id.video_end_add).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                VideoPlayerActivity.this.addToAlbum();
            }
        });
        this.progress = (ProgressBar) findViewById(R.id.progress);
        this.playButton = (ImageView) findViewById(R.id.play_pause);
        this.resizeButton = (ImageView) findViewById(R.id.resize);
        this.qualitySelector = (TextView) findViewById(R.id.quality);
        this.time1 = (TextView) findViewById(R.id.time1);
        this.time2 = (TextView) findViewById(R.id.time2);
        this.seekbar = (SeekBar) findViewById(R.id.seekbar);
        this.controlBar = findViewById(R.id.controlbar);
        this.endMenu = findViewById(R.id.video_end_menu);
        this.endMenuScrim = findViewById(R.id.video_end_menu_scrim);
        this.texView = (VideoTextureView) findViewById(R.id.video_display);
        this.bottomAnchor = findViewById(R.id.bottom_anchor);
        this.adsPanel = (VideoPlayerAdsPanel) findViewById(R.id.ads_panel);
        findViewById(R.id.video_end_like).setVisibility(!isInShitMode() ? 0 : 8);
        findViewById(R.id.video_end_add).setVisibility(!isInShitMode() ? 0 : 8);
        this.mOrientier = new Orientier(this);
        this.mOrientier.enable();
        findViewById(R.id.fullscreen).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                VideoPlayerActivity.this.hideUIDelayed(VideoPlayerActivity.this.getHideDelay());
                VideoPlayerActivity.this.mOrientier.force(VideoPlayerActivity.this.landscape ? 1 : 0);
            }
        });
        this.qualityMenu = new PopupMenu(this, this.qualitySelector);
        this.qualityMenu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.6
            @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
            public boolean onMenuItemClick(MenuItem item) {
                String netType = Utils.getNetworkType();
                int itemId = item.getItemId();
                Videos.saveUsersChoice(itemId, netType);
                VideoPlayerActivity.this.switchQuality(itemId);
                return true;
            }
        });
        this.insetsView = (ScrimInsetsView) findViewById(R.id.scrim);
        this.qualitySelector.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.7
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                VideoPlayerActivity.this.qualityMenu.show();
            }
        });
        findViewById(R.id.video_content_wrap).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.8
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (!VideoPlayerActivity.this.completed) {
                    VideoPlayerActivity.this.setUIVisibility(!VideoPlayerActivity.this.uiVisible);
                    if (VideoPlayerActivity.this.uiVisible) {
                        VideoPlayerActivity.this.hideUIDelayed(VideoPlayerActivity.this.getHideDelay());
                    }
                }
            }
        });
        this.changingSysUiVisibility = true;
        this.playButton.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.9
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (VideoPlayerActivity.this.player != null && VideoPlayerActivity.this.ready) {
                    if (VideoPlayerActivity.this.completed) {
                        VideoPlayerActivity.this.replay(0);
                        return;
                    }
                    VideoPlayerActivity.this.hideUIDelayed(VideoPlayerActivity.this.getHideDelay());
                    VideoPlayerActivity.this.togglePlay();
                }
            }
        });
        this.resizeButton.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.10
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                VideoPlayerActivity.this.hideUIDelayed(AuthApiStatusCodes.AUTH_API_INVALID_CREDENTIALS);
                VideoPlayerActivity.this.resize();
            }
        });
        this.seekbar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.11
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
                if (VideoPlayerActivity.this.player != null) {
                    VideoPlayerActivity.this.player.userStartSeeking();
                }
                VideoPlayerActivity.this.seeking = true;
                VideoPlayerActivity.this.cancelHideUI();
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
                if (VideoPlayerActivity.this.player != null) {
                    VideoPlayerActivity.this.player.userStopSeeking();
                    int position = seekBar.getProgress();
                    if (!VideoPlayerActivity.this.completed) {
                        VideoPlayerActivity.this.player.seek(position);
                        VideoPlayerActivity.this.updateTimings(position);
                    } else {
                        VideoPlayerActivity.this.replay(position);
                    }
                }
                VideoPlayerActivity.this.seeking = false;
                VideoPlayerActivity.this.hideUIDelayed(VideoPlayerActivity.this.getHideDelay());
            }
        });
        final VideoFile file = getVideo();
        this.isMute = isSoundIsMute();
        Intent intent = getIntent();
        this.isAutoplay = intent.getBooleanExtra("autoplay", false);
        this.mTracker = new VideoTracker(file, (Statistic) intent.getParcelableExtra("statistic"), file.vid, file.oid, this.referrer, this.isAutoplay, intent.getStringExtra("context"));
        if (!this.isMute) {
            this.mTracker.trackVolumeOn();
        }
        if (file.width > 0 && file.height > 0) {
            this.texView.setVideoSize(file.width, file.height);
        } else {
            this.controlBar.setVisibility(8);
            this.texView.setAlpha(0.0f);
        }
        View dividerView = findViewById(R.id.divider);
        View gotoVKLiveButton = findViewById(R.id.goto_vklive);
        TextView titleView = (TextView) findViewById(R.id.title);
        if (file.isLive()) {
            this.seekbar.setVisibility(8);
            this.time1.setVisibility(8);
            this.time2.setVisibility(8);
            dividerView.setVisibility(8);
            gotoVKLiveButton.setVisibility(0);
            gotoVKLiveButton.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.12
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    VKLiveUtils.goToTranslation(VideoPlayerActivity.this, file.vid, file.oid);
                }
            });
            titleView.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, VKLiveUtils.createLiveDrawable(getResources()), (Drawable) null);
            titleView.setCompoundDrawablePadding(Global.scale(8.0f));
            return;
        }
        this.seekbar.setVisibility(0);
        this.time1.setVisibility(0);
        this.time2.setVisibility(0);
        dividerView.setVisibility(0);
        gotoVKLiveButton.setVisibility(8);
        titleView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
    }

    @Override // android.app.Activity
    public boolean onNavigateUp() {
        finish();
        return true;
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        this.isResumed = false;
        if (this.playing) {
            pause();
            setUIVisibility(true);
        }
        getContentResolver().unregisterContentObserver(this.volumeObserver);
        super.onPause();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (this.player != null) {
            outState.putInt("needSeekTo", this.player.getPosition());
        }
    }

    @Override // android.app.Activity
    protected void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        if (savedInstanceState != null) {
            this.needSeekTo = savedInstanceState.getInt("needSeekTo");
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity, com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        this.isResumed = true;
        if (this.mRecallReady && this.player != null) {
            this.mRecallReady = false;
            this.player.recallReady();
        }
        getContentResolver().registerContentObserver(Settings.System.CONTENT_URI, true, this.volumeObserver);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);
        finish();
    }

    @Override // android.app.Activity
    public void finish() {
        super.finish();
        if (this.player != null) {
            pause();
            VideoPools.detachAndReleasePlayer(getVideo(), getVideoIndex());
        }
        this.mOrientier.disable();
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        if (this.mTracker != null) {
            if (this.fullscreenTracked) {
                this.mTracker.trackFullscreenOff();
            }
            if (!this.isMute) {
                this.mTracker.trackVolumeOff();
            }
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onPlayerReady(AbsVideoPlayer player, int videoW, int videoH) {
        VideoFile file = getVideo();
        if (!this.isResumed) {
            this.mRecallReady = true;
            return;
        }
        if (videoW == -1 || videoH == -1) {
            videoW = file.width;
            videoH = file.height;
        }
        if (videoW == 0 || videoH == 0) {
            videoW = 320;
            videoH = RotationOptions.ROTATE_180;
        }
        if (this.needSeekTo != -1) {
            if (this.needSeekTo / 1000 == file.duration) {
                this.needSeekTo -= 100;
            }
            player.seek(this.needSeekTo);
            ViewUtils.post(new Runnable() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.13
                @Override // java.lang.Runnable
                public void run() {
                    VideoPlayerActivity.this.updateTimings(VideoPlayerActivity.this.needSeekTo);
                }
            });
            this.needSeekTo = -1;
        }
        final int width = videoW;
        final int height = videoH;
        this.completed = false;
        Log.i("vk", "VIDEO SIZE = " + width + "x" + height);
        ViewUtils.post(new Runnable() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.14
            @Override // java.lang.Runnable
            public void run() {
                VideoPlayerActivity.this.texView.setAlpha(1.0f);
                VideoPlayerActivity.this.texView.setVideoSize(width, height);
                VideoPlayerActivity.this.updateTextureViewScale();
                VideoPlayerActivity.this.progress.setVisibility(8);
                VideoPlayerActivity.this.setBottomPanelVisible(true);
            }
        });
        if (player.isCompleted()) {
            this.playButton.setVisibility(4);
            this.progress.setVisibility(8);
        } else {
            play(false);
        }
        if (!this.uiHidden) {
            this.uiHidden = true;
            hideUIDelayed(1000);
        }
        trackIsMute();
        trackFullscreenOn();
        this.ready = true;
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onUpdatePlaybackPosition(AbsVideoPlayer player, int msec) {
        if (!this.seeking) {
            this.seekbar.setProgress(msec);
        }
        updateTimings(msec);
        int sec = msec / 1000;
        if (this.mTracker != null) {
            this.mTracker.track(sec, this.curQuality);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onPlaybackCompleted(AbsVideoPlayer player) {
        if (getVideo().repeat) {
            player.seek(0);
            updateTimings(0);
            play(true);
            return;
        }
        this.playing = false;
        this.completed = true;
        updatePlayButton();
        setUIVisibility(true);
        updateEndMenuIcons();
        setEndMenuVisible(true);
        setKeepScreenOn(false);
        abandonAudioFocus();
        this.qualitySelector.setEnabled(false);
        this.qualitySelector.setAlpha(0.39f);
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onError(AbsVideoPlayer player, int errCode) {
        displayError(errCode);
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onRenderedFirstFrame(AbsVideoPlayer player) {
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onUpdateBuffered(AbsVideoPlayer player, int percent) {
        this.seekbar.setSecondaryProgress(Math.round((percent / 100.0f) * this.seekbar.getMax()));
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onEndOfBuffer(AbsVideoPlayer player) {
        if (!player.isCompleted()) {
            this.progress.setVisibility(0);
            this.playButton.setVisibility(4);
            this.buffering = true;
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onPlaybackResumed(AbsVideoPlayer player) {
        if (!player.isCompleted()) {
            this.progress.setVisibility(8);
            this.playButton.setVisibility(0);
            this.buffering = false;
        }
    }

    @Override // com.vkontakte.android.media.VideoPools.PlayerContext
    public void onPlayerAttached(AbsVideoPlayer player) {
        int sec;
        this.player = player;
        player.setView(this.texView);
        if (this.mTracker != null && (sec = player.getPosition() / 1000) != 0) {
            this.mTracker.reset(sec);
        }
    }

    @Override // com.vkontakte.android.media.VideoPools.PlayerContext
    public void onPlayerDetached(AbsVideoPlayer player) {
        this.player = null;
        this.playing = false;
        player.setView(null);
    }

    @Override // com.vkontakte.android.media.VideoPools.PlayerContext
    public void onPause(Activity activity) {
    }

    @Override // com.vkontakte.android.media.VideoPools.PlayerContext
    public void onResume(Activity activity) {
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void onAddedStateChanged() {
        updateEndMenuIcons();
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void onLikeStateChanged() {
        updateEndMenuIcons();
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void addVideo() {
        addVideo(this.completed);
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void hideUIDelayed(int delay) {
        if (this.mHideUiAction != null) {
            cancelRunnable(this.mHideUiAction);
        }
        Runnable runnable = new Runnable() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.15
            @Override // java.lang.Runnable
            public void run() {
                VideoPlayerActivity.this.setUIVisibility(false);
                VideoPlayerActivity.this.mHideUiAction = null;
            }
        };
        this.mHideUiAction = runnable;
        postRunnable(runnable, delay);
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void cancelHideUI() {
        if (this.mHideUiAction != null) {
            cancelRunnable(this.mHideUiAction);
            this.mHideUiAction = null;
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    @UiThread
    void startFile(final VideoFile file) {
        this.seekbar.setMax(file.duration * 1000);
        if (file.seekToMs > 0) {
            this.needSeekTo = (int) file.seekToMs;
        }
        if (file.isExternal()) {
            if (file.urlExternal == null) {
                finish();
                return;
            }
            Log.i("vk", "ext=" + file.urlExternal + "; embed=" + file.urlEmbed);
            if (file.urlEmbed != null) {
                if ("YouTube".equalsIgnoreCase(file.platform)) {
                    Intent intent = new Intent(this, YouTubeVideoPlayerActivity.class);
                    intent.putExtras(getIntent());
                    intent.putExtra(UriUtil.LOCAL_FILE_SCHEME, file);
                    startActivity(intent);
                    finish();
                    return;
                } else if (file.processing) {
                    displayError(4);
                    return;
                } else if (file.contentRestricted) {
                    displayError(6);
                    return;
                } else {
                    playEmbed();
                    return;
                }
            }
            try {
                startActivity(new Intent("android.intent.action.VIEW", Uri.parse(file.urlExternal)));
                finish();
                return;
            } catch (Exception e) {
                return;
            }
        }
        int mq = Videos.getMaxSupportedQuality();
        this.qualityMenu.getMenu().clear();
        if (file.isHLSSupported() && !file.isFlv()) {
            this.qualityMenu.getMenu().add(0, -2, 0, Videos.formatQuality(-2));
        }
        if (!TextUtils.isEmpty(file.url240) && mq >= 2) {
            this.qualityMenu.getMenu().add(0, 2, 2, Videos.formatQuality(2));
        }
        if (!TextUtils.isEmpty(file.url360) && mq >= 3 && !file.isFlv()) {
            this.qualityMenu.getMenu().add(0, 3, 3, Videos.formatQuality(3));
        }
        if (!TextUtils.isEmpty(file.url480) && mq >= 4 && !file.isFlv()) {
            this.qualityMenu.getMenu().add(0, 4, 4, Videos.formatQuality(4));
        }
        if (!TextUtils.isEmpty(file.url720) && mq >= 5 && !file.isFlv()) {
            this.qualityMenu.getMenu().add(0, 5, 5, Videos.formatQuality(5));
        }
        if (!TextUtils.isEmpty(file.url1080) && mq >= 6 && !file.isFlv()) {
            this.qualityMenu.getMenu().add(0, 6, 6, Videos.formatQuality(6));
        }
        this.qualitySelector.setVisibility(this.qualityMenu.getMenu().size() > 1 ? 0 : 8);
        int quality = getIntent().getIntExtra("quality", this.curQuality);
        if (quality != -1) {
            switchQuality(quality);
        } else {
            new AsyncTask<Void, Void, Integer>() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.16
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // com.vkontakte.android.background.AsyncTask
                public Integer doInBackground(Void... args) throws Throwable {
                    return Integer.valueOf(Videos.getQuality(file, VideoPlayerActivity.this.useVigo, VigoDelegate.getSVCid(VideoPlayerActivity.this.player != null && VideoPlayerActivity.this.player.isAutoplay())));
                }

                /* JADX INFO: Access modifiers changed from: protected */
                @Override // com.vkontakte.android.background.AsyncTask
                public void onPostExecute(Integer quality2) {
                    VideoPlayerActivity.this.switchQuality(quality2.intValue());
                }
            }.execPool(new Void[0]);
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void blockingSetUIVisibility(boolean visible) {
        if (visible) {
            setUIVisibility(true);
            return;
        }
        this.toolbar.setVisibility(8);
        this.controlBar.setVisibility(8);
        this.endMenu.setVisibility(8);
        setBottomPanelVisible(false);
        this.texView.setAlpha(0.0f);
        this.uiVisible = false;
    }

    @UiThread
    void switchQuality(int quality) {
        if (quality != this.curQuality && quality != -1 && !this.completed) {
            this.curQuality = quality;
            if (this.player != null) {
                this.needSeekTo = this.player.getPosition();
                VideoPools.detachAndReleasePlayer(getVideo(), getVideoIndex());
                this.player = null;
            }
            SpannableStringBuilder bldr = new SpannableStringBuilder(Videos.formatQuality(quality));
            Spannable sp = Spannable.Factory.getInstance().newSpannable("F");
            Drawable d = getResources().getDrawable(R.drawable.ic_profile_btn_arrow);
            d.setColorFilter(-1, PorterDuff.Mode.SRC_IN);
            d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
            d.setLevel(10000);
            sp.setSpan(new ImageSpan(d, 1), 0, 1, 0);
            bldr.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            bldr.append((CharSequence) sp);
            this.qualitySelector.setText(bldr);
            setUIVisibility(false);
            this.playButton.setVisibility(4);
            this.playButton.setClickable(false);
            VideoFile file = getVideo();
            if (file.isFlv()) {
                displayError(7);
            } else if (file.isLiveUpcoming()) {
                displayError(5);
            } else if (file.liveStatus == 4) {
                displayError(2);
            } else {
                VideoPools.obtainAndAttachPlayer(file, getVideoIndex(), Videos.getUrl(file, quality), this.curQuality, this.useVigo.get(), this.isAutoplay, this.referrer, this);
            }
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void bindInfo(VideoFile file) {
        int i = 8;
        if (!file.isExternal()) {
            setBottomPanelVisible(true);
            findViewById(R.id.likes).setSelected(file.liked);
            findViewById(R.id.shares).setVisibility(!file.canRepost ? 8 : 0);
            View findViewById = findViewById(R.id.video_end_add);
            if (file.canAdd && !isInShitMode()) {
                i = 0;
            }
            findViewById.setVisibility(i);
            ((TextView) findViewById(R.id.title)).setText(file.getTitle());
            ((TextView) findViewById(R.id.subtitle)).setText(getResources().getQuantityString(R.plurals.video_views, file.views, Integer.valueOf(file.views)));
            ((TextView) findViewById(R.id.likes)).setText(file.likes > 0 ? Global.formatNumber(file.likes) : null);
            ((TextView) findViewById(R.id.comments)).setText(file.comments > 0 ? Global.formatNumber(file.comments) : null);
            ((TextView) findViewById(R.id.shares)).setText(file.reposts > 0 ? Global.formatNumber(file.reposts) : null);
            ((ImageView) findViewById(R.id.fullscreen)).setImageResource(this.landscape ? R.drawable.ic_fullscreen_exit_24dp : R.drawable.ic_fullscreen_24dp);
            this.adsPanel.bind(this.shitAttachment, file.getTitle());
            invalidateOptionsMenu();
            if (!this.landscape) {
                getSupportActionBar().setTitle((CharSequence) null);
                return;
            } else {
                getSupportActionBar().setTitle(file.getTitle());
                return;
            }
        }
        setBottomPanelVisible(false);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.activities.BaseVideoActivity
    public void setBottomPanelVisible(boolean visible) {
        if (!isInShitMode()) {
            super.setBottomPanelVisible(visible);
            return;
        }
        this.bottomPanel.setVisibility(8);
        this.adsPanel.setVisibility(0);
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity, android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        return isInShitMode() || super.onCreateOptionsMenu(menu);
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    int getHideDelay() {
        return 5000;
    }

    void updateEndMenuIcons() {
        int i = -1;
        VideoFile file = getVideo();
        ((ImageView) this.endMenu.findViewById(R.id.video_end_like)).setImageDrawable(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_like_36dp), file.liked ? -7225358 : -1));
        ImageView imageView = (ImageView) this.endMenu.findViewById(R.id.video_end_add);
        Drawable drawable = getResources().getDrawable(R.drawable.ic_add_36dp);
        if (this.addedID != 0 || file.oid == VKAccountManager.getCurrent().getUid()) {
            i = -7225358;
        }
        imageView.setImageDrawable(new RecoloredDrawable(drawable, i));
    }

    void setEndMenuVisible(boolean visible) {
        int i = 4;
        V.setVisibilityAnimated(this.endMenu, visible ? 0 : 4);
        V.setVisibilityAnimated(this.endMenuScrim, visible ? 0 : 4);
        ImageView imageView = this.playButton;
        if (!visible) {
            i = 0;
        }
        V.setVisibilityAnimated(imageView, i);
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void setUIVisibility(boolean visible) {
        if (this.uiVisible != visible) {
            this.uiVisible = visible;
            cancelHideUI();
            if (this.visibilityAnim != null) {
                this.visibilityAnim.cancel();
            }
            this.changingSysUiVisibility = true;
            if (visible) {
                getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() & (getUIFlagsForFullScreenMode() ^ (-1)));
                AnimatorSet set = new AnimatorSet();
                set.playTogether(ObjectAnimator.ofFloat(this.toolbar, "alpha", 1.0f), ObjectAnimator.ofFloat(this.bottomPanel, "alpha", 1.0f), ObjectAnimator.ofFloat(this.controlBar, "alpha", 1.0f), ObjectAnimator.ofFloat(this.insetsView, "alpha", 1.0f), ObjectAnimator.ofFloat(this.playButton, "alpha", 1.0f));
                set.setDuration(300L);
                set.setInterpolator(interpolatorOut);
                this.visibilityAnim = set;
                set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.17
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationStart(Animator animation) {
                        int i = 8;
                        int i2 = 0;
                        VideoPlayerActivity.this.toolbar.setVisibility(0);
                        VideoPlayerActivity.this.insetsView.setVisibility(0);
                        VideoPlayerActivity.this.controlBar.setVisibility(!VideoPlayerActivity.this.isInShitMode() ? 0 : 8);
                        View view = VideoPlayerActivity.this.bottomPanel;
                        if (!VideoPlayerActivity.this.landscape && !VideoPlayerActivity.this.isInShitMode()) {
                            i = 0;
                        }
                        view.setVisibility(i);
                        ImageView imageView = VideoPlayerActivity.this.playButton;
                        if (VideoPlayerActivity.this.completed || VideoPlayerActivity.this.buffering) {
                            i2 = 4;
                        }
                        imageView.setVisibility(i2);
                        VideoPlayerActivity.this.playButton.setClickable(true);
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        VideoPlayerActivity.this.visibilityAnim = null;
                    }
                });
                set.start();
                return;
            }
            getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | getUIFlagsForFullScreenMode());
            AnimatorSet set2 = new AnimatorSet();
            set2.playTogether(ObjectAnimator.ofFloat(this.toolbar, "alpha", 0.0f), ObjectAnimator.ofFloat(this.bottomPanel, "alpha", 0.0f), ObjectAnimator.ofFloat(this.controlBar, "alpha", 0.0f), ObjectAnimator.ofFloat(this.insetsView, "alpha", 0.0f), ObjectAnimator.ofFloat(this.playButton, "alpha", 0.0f));
            set2.setDuration(300L);
            set2.setInterpolator(interpolatorIn);
            this.visibilityAnim = set2;
            set2.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.18
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    VideoPlayerActivity.this.toolbar.setVisibility(4);
                    VideoPlayerActivity.this.controlBar.setVisibility(4);
                    VideoPlayerActivity.this.playButton.setVisibility(4);
                    VideoPlayerActivity.this.insetsView.setVisibility(4);
                    VideoPlayerActivity.this.bottomPanel.setVisibility(4);
                    VideoPlayerActivity.this.playButton.setClickable(false);
                    VideoPlayerActivity.this.visibilityAnim = null;
                    ViewUtils.dismissDialogSafety(VideoPlayerActivity.this.qualityMenu);
                    ViewUtils.dismissDialogSafety(VideoPlayerActivity.this.addMenu);
                    VideoPlayerActivity.this.toolbar.dismissPopupMenus();
                }
            });
            set2.start();
        }
    }

    void play(boolean replay) {
        if (this.player != null && !this.playing) {
            this.player.play(replay);
            this.playing = true;
            updatePlayButton();
            requestAudioFocus();
            setKeepScreenOn(true);
            this.qualitySelector.setEnabled(true);
            this.qualitySelector.setAlpha(1.0f);
        }
    }

    void pause() {
        if (this.player != null && this.playing) {
            this.player.pause();
            this.playing = false;
            updatePlayButton();
            abandonAudioFocus();
            setKeepScreenOn(false);
        }
    }

    void togglePlay() {
        if (this.playing) {
            pause();
            if (this.mTracker != null) {
                this.mTracker.trackPause();
                return;
            }
            return;
        }
        play(false);
        if (this.mTracker != null) {
            this.mTracker.trackResume();
        }
    }

    void setKeepScreenOn(final boolean keepScreenOn) {
        getWindow().getDecorView().post(new Runnable() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.19
            @Override // java.lang.Runnable
            public void run() {
                if (keepScreenOn) {
                    VideoPlayerActivity.this.getWindow().addFlags(128);
                } else {
                    VideoPlayerActivity.this.getWindow().clearFlags(128);
                }
            }
        });
    }

    void updatePlayButton() {
        ViewUtils.runOnUiThread(new Runnable() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.20
            @Override // java.lang.Runnable
            public void run() {
                VideoPlayerActivity.this.playButton.setImageResource(!VideoPlayerActivity.this.playing ? R.drawable.ic_play_shadow_96dp : R.drawable.ic_pause_shadow_96dp);
            }
        });
    }

    void replay(int position) {
        this.completed = false;
        setEndMenuVisible(false);
        V.cancelVisibilityAnimation(this.playButton);
        if (this.player != null && this.ready) {
            this.player.replay(position);
            hideUIDelayed(getHideDelay());
            this.seekbar.setProgress(position);
            this.player.seek(position);
            updateTimings(position);
            if (this.mTracker != null) {
                this.mTracker.reset();
            }
            play(true);
        }
    }

    void updateTimings(int msec) {
        VideoFile file = getVideo();
        int sec = Math.min(file.duration, msec / 1000);
        this.time1.setText(Videos.formatDuration(sec));
        int eta = file.duration - sec;
        this.time2.setText(eta == 0 ? Videos.formatDuration(eta) : "-" + Videos.formatDuration(eta));
    }

    void resize() {
        this.fill = !this.fill;
        if (this.resizeAnim != null) {
            this.resizeAnim.cancel();
        }
        this.resizeButton.setImageResource(this.fill ? R.drawable.ic_video_fill_none_24dp : R.drawable.ic_video_fill_24dp);
        AnimatorSet set = new AnimatorSet();
        float diff = this.translationControlsCrop - this.translationControlsFit;
        Animator[] animatorArr = new Animator[5];
        VideoTextureView videoTextureView = this.texView;
        float[] fArr = new float[1];
        fArr[0] = this.fill ? this.texScaleCrop : this.texScaleFit;
        animatorArr[0] = ObjectAnimator.ofFloat(videoTextureView, "scaleX", fArr);
        VideoTextureView videoTextureView2 = this.texView;
        float[] fArr2 = new float[1];
        fArr2[0] = this.fill ? this.texScaleCrop : this.texScaleFit;
        animatorArr[1] = ObjectAnimator.ofFloat(videoTextureView2, "scaleY", fArr2);
        ScrimInsetsView scrimInsetsView = this.insetsView;
        float[] fArr3 = new float[1];
        fArr3[0] = this.fill ? this.texScaleCrop : this.texScaleFit;
        animatorArr[2] = ObjectAnimator.ofFloat(scrimInsetsView, "scaleX", fArr3);
        ScrimInsetsView scrimInsetsView2 = this.insetsView;
        float[] fArr4 = new float[1];
        fArr4[0] = this.fill ? this.texScaleCrop : this.texScaleFit;
        animatorArr[3] = ObjectAnimator.ofFloat(scrimInsetsView2, "scaleY", fArr4);
        View view = this.controlBar;
        float[] fArr5 = new float[1];
        float translationY = this.controlBar.getTranslationY();
        if (!this.fill) {
            diff = -diff;
        }
        fArr5[0] = translationY + diff;
        animatorArr[4] = ObjectAnimator.ofFloat(view, "translationY", fArr5);
        set.playTogether(animatorArr);
        set.setInterpolator(interpolatorIn);
        set.setDuration(300L);
        this.resizeAnim = set;
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.21
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                VideoPlayerActivity.this.resizeAnim = null;
                VideoPlayerActivity.this.hideUIDelayed(AuthApiStatusCodes.AUTH_API_INVALID_CREDENTIALS);
            }
        });
        set.start();
    }

    void updateTextureViewScale() {
        if (this.texView != null) {
            this.texView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.22
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    VideoPlayerActivity.this.texView.getViewTreeObserver().removeOnPreDrawListener(this);
                    float sratio = VideoPlayerActivity.this.content.getWidth() / VideoPlayerActivity.this.content.getHeight();
                    float vratio = VideoPlayerActivity.this.texView.getWidth() / VideoPlayerActivity.this.texView.getHeight();
                    if (sratio > vratio) {
                        VideoPlayerActivity.this.texScaleFit = VideoPlayerActivity.this.content.getHeight() / VideoPlayerActivity.this.texView.getHeight();
                        VideoPlayerActivity.this.texScaleCrop = VideoPlayerActivity.this.content.getWidth() / VideoPlayerActivity.this.texView.getWidth();
                    } else {
                        VideoPlayerActivity.this.texScaleFit = VideoPlayerActivity.this.content.getWidth() / VideoPlayerActivity.this.texView.getWidth();
                        VideoPlayerActivity.this.texScaleCrop = VideoPlayerActivity.this.content.getHeight() / VideoPlayerActivity.this.texView.getHeight();
                    }
                    float textureCenter = VideoPlayerActivity.this.content.getTop() + (VideoPlayerActivity.this.content.getHeight() / 2);
                    float maxBottom = (VideoPlayerActivity.this.bottomPanel.getVisibility() != 8 ? VideoPlayerActivity.this.bottomPanel.getTop() : VideoPlayerActivity.this.bottomAnchor.getTop()) - textureCenter;
                    VideoPlayerActivity.this.translationControlsFit = Math.min((VideoPlayerActivity.this.texView.getHeight() * VideoPlayerActivity.this.texScaleFit) / 2.0f, maxBottom) - (VideoPlayerActivity.this.controlBar.getHeight() >> 1);
                    VideoPlayerActivity.this.translationControlsCrop = Math.min((VideoPlayerActivity.this.texView.getHeight() * VideoPlayerActivity.this.texScaleCrop) / 2.0f, maxBottom) - (VideoPlayerActivity.this.controlBar.getHeight() >> 1);
                    float scale = VideoPlayerActivity.this.fill ? VideoPlayerActivity.this.texScaleCrop : VideoPlayerActivity.this.texScaleFit;
                    VideoPlayerActivity.this.texView.setScaleX(scale);
                    VideoPlayerActivity.this.texView.setScaleY(scale);
                    VideoPlayerActivity.this.insetsView.setScaleX(scale);
                    VideoPlayerActivity.this.insetsView.setScaleY(scale);
                    VideoPlayerActivity.this.controlBar.setTranslationY(VideoPlayerActivity.this.fill ? VideoPlayerActivity.this.translationControlsCrop : VideoPlayerActivity.this.translationControlsFit);
                    VideoPlayerActivity.this.resizeButton.setVisibility((Math.abs(VideoPlayerActivity.this.texScaleFit - VideoPlayerActivity.this.texScaleCrop) < 0.01f || !VideoPlayerActivity.this.landscape) ? 8 : 0);
                    return false;
                }
            });
        }
    }

    void requestAudioFocus() {
        AudioManager am = com.vkontakte.android.audio.utils.Utils.getAudioManager(this);
        if (am != null) {
            int result = am.requestAudioFocus(this.focusListener, 3, 1);
            if (result == 1) {
                this.focusListener.onAudioFocusChange(1);
            } else {
                this.focusListener.onAudioFocusChange(-1);
            }
        }
    }

    void abandonAudioFocus() {
        AudioManager am = com.vkontakte.android.audio.utils.Utils.getAudioManager(this);
        if (am != null) {
            am.abandonAudioFocus(this.focusListener);
        }
    }

    private boolean isSoundIsMute() {
        AudioManager am = com.vkontakte.android.audio.utils.Utils.getAudioManager(this);
        return am != null && am.getStreamVolume(3) == 0;
    }

    private void trackFullscreenOn() {
        if (this.mTracker != null && !this.fullscreenTracked) {
            this.fullscreenTracked = true;
            this.mTracker.trackFullscreenOn();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void trackIsMute() {
        boolean isMute = isSoundIsMute();
        if (this.isMute != isMute) {
            this.isMute = isMute;
            if (this.mTracker != null) {
                if (isMute) {
                    this.mTracker.trackVolumeOff();
                } else {
                    this.mTracker.trackVolumeOn();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class Orientier extends OrientationEventListener {
        final boolean landscapeDefault;
        boolean lockOrientation;
        int mForcedFrom;
        int mLastOrientation;
        final Runnable mWorker;
        boolean reverse;

        public Orientier(Context context) {
            super(context);
            this.mForcedFrom = -1;
            this.mLastOrientation = -1;
            this.mWorker = new Runnable() { // from class: com.vkontakte.android.activities.VideoPlayerActivity.Orientier.1
                @Override // java.lang.Runnable
                public void run() {
                    VideoPlayerActivity.this.setRequestedOrientation(Orientier.this.mLastOrientation);
                }
            };
            this.landscapeDefault = ViewUtils.getDeviceDefaultOrientation(VideoPlayerActivity.this) == 2;
        }

        @Override // android.view.OrientationEventListener
        public void onOrientationChanged(int degrees) {
            if (degrees != -1) {
                double rads = Math.toRadians(degrees - 45);
                double sin = Math.sin(rads);
                double cos = Math.cos(rads);
                boolean left = sin < 0.0d && cos < 0.0d;
                boolean top = sin > 0.0d && cos < 0.0d;
                boolean right = sin > 0.0d && cos > 0.0d;
                boolean bottom = sin < 0.0d && cos > 0.0d;
                int newOrientation = -1;
                if (this.landscapeDefault) {
                    if (bottom) {
                        this.reverse = false;
                        newOrientation = 0;
                    } else if (right) {
                        this.reverse = false;
                        newOrientation = 1;
                    } else if (top) {
                        this.reverse = true;
                        newOrientation = 8;
                    } else if (left) {
                        this.reverse = true;
                        newOrientation = 9;
                    }
                } else if (bottom) {
                    this.reverse = false;
                    newOrientation = 1;
                } else if (left) {
                    this.reverse = false;
                    newOrientation = 0;
                } else if (right) {
                    this.reverse = true;
                    newOrientation = 8;
                } else if (top) {
                    this.reverse = false;
                    return;
                }
                boolean isScreenLocked = Settings.System.getInt(VideoPlayerActivity.this.getContentResolver(), "accelerometer_rotation", 1) == 0;
                if (newOrientation != this.mForcedFrom && !isScreenLocked) {
                    this.lockOrientation = false;
                }
                if (!this.lockOrientation) {
                    this.mForcedFrom = -1;
                    if (isScreenLocked) {
                        setRequestedOrientation(VideoPlayerActivity.this.getResources().getConfiguration().orientation, 250);
                    } else {
                        setRequestedOrientation(newOrientation, 250);
                    }
                }
            }
        }

        public void force(int orientation) {
            this.mForcedFrom = VideoPlayerActivity.this.getRequestedOrientation();
            this.lockOrientation = true;
            if (this.reverse && orientation == 0) {
                orientation = 8;
            }
            setRequestedOrientation(orientation, 0);
        }

        public void setRequestedOrientation(int requestedOrientation, int delay) {
            if (this.mLastOrientation != requestedOrientation) {
                this.mLastOrientation = requestedOrientation;
                VideoPlayerActivity.this.cancelRunnable(this.mWorker);
                if (delay == 0) {
                    this.mWorker.run();
                } else {
                    VideoPlayerActivity.this.postRunnable(this.mWorker, 500);
                }
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class InsetsFrameLayout extends FrameLayout {
        ScrimInsetsView insetsView;

        public InsetsFrameLayout(Context context) {
            super(context);
            setWillNotDraw(false);
        }

        public InsetsFrameLayout(Context context, AttributeSet attrs) {
            super(context, attrs);
        }

        public InsetsFrameLayout(Context context, AttributeSet attrs, int defStyleAttr) {
            super(context, attrs, defStyleAttr);
        }

        @TargetApi(21)
        public InsetsFrameLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            super(context, attrs, defStyleAttr, defStyleRes);
        }

        @Override // android.view.View
        @SuppressLint({"WrongViewCast"})
        protected void onFinishInflate() {
            super.onFinishInflate();
            this.insetsView = (ScrimInsetsView) findViewById(R.id.scrim);
        }

        @Override // android.view.View
        protected boolean fitSystemWindows(Rect insets) {
            if (this.insetsView != null) {
                this.insetsView.setInsets(insets);
            }
            return super.fitSystemWindows(insets);
        }
    }

    /* loaded from: classes2.dex */
    public static class ScrimInsetsView extends View {
        Drawable bottomGradient;
        final Paint edgePaint;
        final Rect insets;
        Drawable topGradient;

        public ScrimInsetsView(Context context) {
            super(context);
            this.insets = new Rect();
            this.edgePaint = new Paint();
            this.edgePaint.setColor(1073741824);
            this.topGradient = getResources().getDrawable(R.drawable.scrim_top);
            this.bottomGradient = getResources().getDrawable(R.drawable.scrim_bottom);
            this.topGradient.setAlpha(128);
            this.bottomGradient.setAlpha(128);
        }

        public ScrimInsetsView(Context context, AttributeSet attrs) {
            super(context, attrs);
            this.insets = new Rect();
            this.edgePaint = new Paint();
            this.edgePaint.setColor(1073741824);
            this.topGradient = getResources().getDrawable(R.drawable.scrim_top);
            this.bottomGradient = getResources().getDrawable(R.drawable.scrim_bottom);
            this.topGradient.setAlpha(128);
            this.bottomGradient.setAlpha(128);
        }

        public ScrimInsetsView(Context context, AttributeSet attrs, int defStyleAttr) {
            super(context, attrs, defStyleAttr);
            this.insets = new Rect();
            this.edgePaint = new Paint();
            this.edgePaint.setColor(1073741824);
            this.topGradient = getResources().getDrawable(R.drawable.scrim_top);
            this.bottomGradient = getResources().getDrawable(R.drawable.scrim_bottom);
            this.topGradient.setAlpha(128);
            this.bottomGradient.setAlpha(128);
        }

        @RequiresApi(api = 21)
        public ScrimInsetsView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            super(context, attrs, defStyleAttr, defStyleRes);
            this.insets = new Rect();
            this.edgePaint = new Paint();
            this.edgePaint.setColor(1073741824);
            this.topGradient = getResources().getDrawable(R.drawable.scrim_top);
            this.bottomGradient = getResources().getDrawable(R.drawable.scrim_bottom);
            this.topGradient.setAlpha(128);
            this.bottomGradient.setAlpha(128);
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            int helpHeight = getHeight() / 2;
            this.topGradient.setBounds(0, 0, getWidth(), helpHeight);
            this.bottomGradient.setBounds(0, helpHeight, getWidth(), getHeight());
            this.topGradient.draw(canvas);
            this.bottomGradient.draw(canvas);
        }

        public void setInsets(Rect insets) {
            this.insets.set(insets);
            invalidate();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class FocusListener implements AudioManager.OnAudioFocusChangeListener {
        private FocusListener() {
        }

        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public void onAudioFocusChange(int focusChange) {
            switch (focusChange) {
                case -3:
                    if (VideoPlayerActivity.this.player != null) {
                        VideoPlayerActivity.this.player.setVolume(0.2f);
                        return;
                    }
                    return;
                case -2:
                case -1:
                    if (VideoPlayerActivity.this.player != null) {
                        VideoPlayerActivity.this.player.setVolume(0.0f);
                    }
                    VideoPlayerActivity.this.pause();
                    return;
                case 0:
                default:
                    return;
                case 1:
                    if (VideoPlayerActivity.this.player != null) {
                        VideoPlayerActivity.this.player.setVolume(1.0f);
                    }
                    VideoPlayerActivity.this.play(false);
                    return;
            }
        }
    }

    /* loaded from: classes2.dex */
    public class SettingsContentObserver extends ContentObserver {
        public SettingsContentObserver(Handler handler) {
            super(handler);
        }

        @Override // android.database.ContentObserver
        public void onChange(boolean selfChange) {
            VideoPlayerActivity.this.trackIsMute();
        }
    }
}
