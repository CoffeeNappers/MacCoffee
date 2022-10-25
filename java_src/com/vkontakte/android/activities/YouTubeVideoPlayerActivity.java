package com.vkontakte.android.activities;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.UiThread;
import android.support.v7.app.ActionBar;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.google.android.exoplayer2.DefaultLoadControl;
import com.google.android.youtube.player.YouTubeInitializationResult;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.YouTubePlayerFragment;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.VideoFile;
/* loaded from: classes2.dex */
public class YouTubeVideoPlayerActivity extends BaseVideoActivity {
    private YouTubePlayerFragment fragment;
    private Runnable mHideUiAction;
    private YouTubePlayer player;
    private boolean uiVisible;
    private Animator visibilityAnim;

    @Override // com.vkontakte.android.activities.BaseVideoActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        if (b != null) {
            b.remove("android:fragments");
        }
        super.onCreate(b);
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.player != null) {
            if (isLandscape()) {
                this.player.setFullscreen(true);
            } else {
                this.player.setFullscreen(false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.activities.BaseVideoActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        releasePlayer();
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity, com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        VideoFile file = getVideo();
        if (this.fragment == null && this.player == null && file != null) {
            initPlayer(file);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onSaveInstanceState(Bundle outState) {
        try {
            super.onSaveInstanceState(outState);
        } catch (Throwable th) {
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void hideUIDelayed(int delay) {
        if (this.mHideUiAction != null) {
            cancelRunnable(this.mHideUiAction);
        }
        Runnable lambdaFactory$ = YouTubeVideoPlayerActivity$$Lambda$1.lambdaFactory$(this);
        this.mHideUiAction = lambdaFactory$;
        postRunnable(lambdaFactory$, delay);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$hideUIDelayed$0() {
        setUIVisibility(false);
        this.mHideUiAction = null;
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
    void startFile(VideoFile file) {
        initPlayer(file);
    }

    private void initPlayer(final VideoFile file) {
        this.fragment = new YouTubePlayerFragment();
        getFragmentManager().beginTransaction().replace(R.id.video_display, this.fragment).commit();
        this.fragment.initialize("AIzaSyCxCklrOsCwTiBbmrT38Q0Wl-buN_uuz54", new YouTubePlayer.OnInitializedListener() { // from class: com.vkontakte.android.activities.YouTubeVideoPlayerActivity.1
            @Override // com.google.android.youtube.player.YouTubePlayer.OnInitializedListener
            public void onInitializationSuccess(YouTubePlayer.Provider provider, YouTubePlayer youTubePlayer, boolean b) {
                Uri uri = Uri.parse(file.urlExternal);
                YouTubeVideoPlayerActivity.this.player = youTubePlayer;
                youTubePlayer.addFullscreenControlFlag(8);
                youTubePlayer.setPlayerStateChangeListener(new PlayerStateListener());
                youTubePlayer.loadVideo(uri.getQueryParameter("v"));
                youTubePlayer.play();
                YouTubeVideoPlayerActivity.hideAdsText(YouTubeVideoPlayerActivity.this.fragment);
                if (YouTubeVideoPlayerActivity.this.isLandscape()) {
                    youTubePlayer.setFullscreen(true);
                }
            }

            @Override // com.google.android.youtube.player.YouTubePlayer.OnInitializedListener
            public void onInitializationFailure(YouTubePlayer.Provider provider, YouTubeInitializationResult youTubeInitializationResult) {
                YouTubeVideoPlayerActivity.this.player = null;
                YouTubeVideoPlayerActivity.this.playEmbed();
            }
        });
        setUIVisibility(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void releasePlayer() {
        if (this.player != null) {
            this.player.release();
            this.player = null;
            this.fragment = null;
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void blockingSetUIVisibility(boolean visible) {
        if (visible) {
            this.toolbar.setVisibility(0);
            setUIVisibility(true);
            setBottomPanelVisible(true);
            return;
        }
        this.toolbar.setVisibility(8);
        setBottomPanelVisible(false);
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void addVideo() {
        addVideo(false);
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void setUIVisibility(boolean visible) {
        if (this.uiVisible != visible && !isLandscape()) {
            this.uiVisible = visible;
            cancelHideUI();
            if (this.visibilityAnim != null) {
                this.visibilityAnim.cancel();
            }
            this.changingSysUiVisibility = true;
            if (visible) {
                getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() & (-7));
                AnimatorSet set = new AnimatorSet();
                set.playTogether(ObjectAnimator.ofFloat(this.toolbar, "alpha", 1.0f), ObjectAnimator.ofFloat(this.bottomPanel, "alpha", 1.0f));
                set.setDuration(300L);
                set.setInterpolator(interpolatorOut);
                this.visibilityAnim = set;
                set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.activities.YouTubeVideoPlayerActivity.2
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationStart(Animator animation) {
                        int i = 0;
                        YouTubeVideoPlayerActivity.this.toolbar.setVisibility(0);
                        View view = YouTubeVideoPlayerActivity.this.bottomPanel;
                        if (YouTubeVideoPlayerActivity.this.landscape) {
                            i = 8;
                        }
                        view.setVisibility(i);
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        YouTubeVideoPlayerActivity.this.visibilityAnim = null;
                    }
                });
                set.start();
                return;
            }
            getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | 4 | 2);
            AnimatorSet set2 = new AnimatorSet();
            set2.playTogether(ObjectAnimator.ofFloat(this.toolbar, "alpha", 0.0f), ObjectAnimator.ofFloat(this.bottomPanel, "alpha", 0.0f));
            set2.setDuration(300L);
            set2.setInterpolator(interpolatorIn);
            this.visibilityAnim = set2;
            set2.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.activities.YouTubeVideoPlayerActivity.3
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    YouTubeVideoPlayerActivity.this.toolbar.setVisibility(4);
                    YouTubeVideoPlayerActivity.this.bottomPanel.setVisibility(4);
                    YouTubeVideoPlayerActivity.this.visibilityAnim = null;
                    ViewUtils.dismissDialogSafety(YouTubeVideoPlayerActivity.this.addMenu);
                    YouTubeVideoPlayerActivity.this.toolbar.dismissPopupMenus();
                }
            });
            set2.start();
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void createUI(Bundle savedInstanceState) {
        setContentView(R.layout.video_player_youtube);
        this.changingSysUiVisibility = true;
        findViewById(R.id.video_background).setOnClickListener(YouTubeVideoPlayerActivity$$Lambda$2.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createUI$1(View v) {
        setUIVisibility(!this.uiVisible);
        if (this.uiVisible) {
            hideUIDelayed(getHideDelay());
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void onAddedStateChanged() {
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void onLikeStateChanged() {
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    void bindInfo(VideoFile file) {
        setBottomPanelVisible(true);
        findViewById(R.id.likes).setSelected(file.liked);
        findViewById(R.id.shares).setVisibility(!file.canRepost ? 8 : 0);
        ((TextView) findViewById(R.id.title)).setText(file.getTitle());
        ((TextView) findViewById(R.id.subtitle)).setText(getResources().getQuantityString(R.plurals.video_views, file.views, Integer.valueOf(file.views)));
        ((TextView) findViewById(R.id.likes)).setText(file.likes > 0 ? Global.formatNumber(file.likes) : null);
        ((TextView) findViewById(R.id.comments)).setText(file.comments > 0 ? Global.formatNumber(file.comments) : null);
        ((TextView) findViewById(R.id.shares)).setText(file.reposts > 0 ? Global.formatNumber(file.reposts) : null);
        invalidateOptionsMenu();
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            if (!this.landscape) {
                getSupportActionBar().setTitle(file.getTitle());
            } else {
                getSupportActionBar().setTitle((CharSequence) null);
            }
        }
    }

    @Override // com.vkontakte.android.activities.BaseVideoActivity
    int getHideDelay() {
        return DefaultLoadControl.DEFAULT_BUFFER_FOR_PLAYBACK_MS;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isLandscape() {
        return getResources().getConfiguration().orientation == 2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void hideAdsText(YouTubePlayerFragment fragment) {
        try {
            ((ViewGroup) ((ViewGroup) ((ViewGroup) ((ViewGroup) ((ViewGroup) fragment.getView()).getChildAt(0)).getChildAt(0)).getChildAt(5)).getChildAt(0)).getChildAt(1).setVisibility(8);
        } catch (Exception e) {
        }
    }

    /* loaded from: classes2.dex */
    private class PlayerStateListener implements YouTubePlayer.PlayerStateChangeListener {
        private PlayerStateListener() {
        }

        @Override // com.google.android.youtube.player.YouTubePlayer.PlayerStateChangeListener
        public void onLoading() {
            YouTubeVideoPlayerActivity.hideAdsText(YouTubeVideoPlayerActivity.this.fragment);
        }

        @Override // com.google.android.youtube.player.YouTubePlayer.PlayerStateChangeListener
        public void onLoaded(String s) {
            YouTubeVideoPlayerActivity.hideAdsText(YouTubeVideoPlayerActivity.this.fragment);
        }

        @Override // com.google.android.youtube.player.YouTubePlayer.PlayerStateChangeListener
        public void onAdStarted() {
        }

        @Override // com.google.android.youtube.player.YouTubePlayer.PlayerStateChangeListener
        public void onVideoStarted() {
            YouTubeVideoPlayerActivity.hideAdsText(YouTubeVideoPlayerActivity.this.fragment);
            YouTubeVideoPlayerActivity.this.hideUIDelayed(YouTubeVideoPlayerActivity.this.getHideDelay());
        }

        @Override // com.google.android.youtube.player.YouTubePlayer.PlayerStateChangeListener
        public void onVideoEnded() {
            YouTubeVideoPlayerActivity.hideAdsText(YouTubeVideoPlayerActivity.this.fragment);
            YouTubeVideoPlayerActivity.this.setUIVisibility(true);
        }

        @Override // com.google.android.youtube.player.YouTubePlayer.PlayerStateChangeListener
        public void onError(YouTubePlayer.ErrorReason errorReason) {
            if (errorReason == YouTubePlayer.ErrorReason.UNEXPECTED_SERVICE_DISCONNECTION) {
                YouTubeVideoPlayerActivity.this.releasePlayer();
            } else {
                YouTubeVideoPlayerActivity.hideAdsText(YouTubeVideoPlayerActivity.this.fragment);
            }
        }
    }
}
