package com.vkontakte.android.attachments;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.facebook.common.util.UriUtil;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.activities.VideoPlayerActivity;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.cache.Videos;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.fragments.PostListFragment;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.media.AbsVideoPlayer;
import com.vkontakte.android.media.AutoPlay;
import com.vkontakte.android.media.VideoPools;
import com.vkontakte.android.media.VideoTracker;
import com.vkontakte.android.media.VigoDelegate;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.ui.FragmentHelper;
import com.vkontakte.android.ui.animation.ResizeAnimation;
import com.vkontakte.android.ui.drawable.AudioVisualizerDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.widget.RatioFrameLayout;
import com.vkontakte.android.ui.widget.VideoTextureView;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import com.vkontakte.android.utils.Utils;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.concurrent.atomic.AtomicBoolean;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes.dex */
public class VideoAttachment extends Attachment implements ThumbAttachment, ImageAttachment, AutoPlay, VideoPools.PlayerContext, View.OnClickListener {
    public static final Serializer.Creator<VideoAttachment> CREATOR = new Serializer.CreatorAdapter<VideoAttachment>() { // from class: com.vkontakte.android.attachments.VideoAttachment.2
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public VideoAttachment mo1087createFromSerializer(Serializer s) {
            return new VideoAttachment(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public VideoAttachment[] mo1088newArray(int size) {
            return new VideoAttachment[size];
        }
    };
    public static final String HOLDER_TYPE_ADS = "video_ads";
    public static final String HOLDER_TYPE_SINGLE = "video_single";
    public static final String HOLDER_TYPE_VIDEO = "video";
    private static final long PLAY_DELAY = 250;
    private AutoPlay.Listener autoPlayListener;
    transient boolean autoplay;
    private String context;
    boolean hasPlayer;
    private ViewHolder holder;
    transient boolean isSingle;
    boolean mActivityOnPause;
    boolean mBuffering;
    boolean mFailed;
    boolean mPlaybackCompleted;
    boolean mPlaying;
    boolean mPrepared;
    private AsyncTask<?, ?, ?> mTask;
    private VideoTracker mTracker;
    private boolean mWasAutoPlay;
    private AbsVideoPlayer player;
    private int postId;
    @Nullable
    public transient PostInteract postInteract;
    private int postOwnerId;
    public String referer;
    private ShitAttachment shitAttachment;
    transient Statistic statistic;
    public final VideoFile video;
    transient boolean wasPlayed;
    volatile int mQuality = -1;
    final FlowLayout.LayoutParams lp = FlowLayout.LayoutParams.CreateLayoutParamsForZhukovsLayout();
    final AtomicBoolean useVigo = new AtomicBoolean(true);
    private final boolean mAutoPlay = Videos.allowAutoPlayVideo();
    private String layoutTag = HOLDER_TYPE_SINGLE;

    public VideoAttachment(@NonNull VideoFile vf) {
        this.video = vf;
        checkAutoPlay();
    }

    public VideoAttachment(@NonNull Serializer s) {
        this.video = (VideoFile) s.readSerializable(VideoFile.class.getClassLoader());
        this.referer = s.readString();
        checkAutoPlay();
    }

    private void checkAutoPlay() {
        boolean z = true;
        boolean hasLink = !TextUtils.isEmpty(this.video.url240) || this.video.isHLSSupported();
        if (!hasLink || !this.isSingle || this.video.noAutoplay || this.video.isFlv() || this.video.isLiveUpcoming()) {
            z = false;
        }
        this.autoplay = z;
    }

    public void setLayoutTag(String layoutTag) {
        this.layoutTag = layoutTag;
    }

    public void setSingle(boolean isSingle) {
        this.isSingle = isSingle;
        checkAutoPlay();
    }

    public void setReferData(String refer, @Nullable PostInteract postInteract) {
        setReferData(refer, postInteract, null);
    }

    public void setReferData(String refer, @Nullable PostInteract postInteract, @Nullable String context) {
        this.referer = refer;
        this.postInteract = postInteract;
        this.context = context;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public void setPostOwnerId(int postOwnerId) {
        this.postOwnerId = postOwnerId;
    }

    public void setStatistic(Statistic statistic) {
        this.statistic = statistic;
    }

    public void setShitAttachment(ShitAttachment attachment) {
        this.shitAttachment = attachment;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public AutoPlay.Type getType() {
        return AutoPlay.Type.VIDEO;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void detachSurface() {
        if (this.player != null) {
            this.player.setView(null);
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public boolean canAutoPlay() {
        return this.autoplay;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public boolean isPrepared() {
        return this.mPrepared;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public boolean isPlaying() {
        return this.mPlaying;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public boolean isComplete() {
        return this.mPlaybackCompleted;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void waiting() {
        ViewUtils.post(VideoAttachment$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$waiting$0() {
        if (this.holder == null || this.holder.autoPlayHolder == null) {
            return;
        }
        this.holder.autoPlayHolder.animateWrap(false, false);
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void prepare() {
        start(true);
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void play(boolean delay) {
        if (isAttached() && this.player != null && !this.mPlaying && !this.mActivityOnPause) {
            this.mPlaying = true;
            this.mFailed = false;
            this.mPlaybackCompleted = false;
            this.wasPlayed = true;
            ViewUtils.post(VideoAttachment$$Lambda$2.lambdaFactory$(this));
            if (delay) {
                VideoPools.handler.postDelayed(VideoAttachment$$Lambda$3.lambdaFactory$(this), PLAY_DELAY);
            } else {
                this.player.setView(this.holder.autoPlayHolder.videoDisplay);
            }
            VideoPools.handler.post(VideoAttachment$$Lambda$4.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$play$1() {
        this.holder.autoPlayHolder.showPlayer();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$play$2() {
        if (!isAttached() || this.player == null) {
            return;
        }
        this.player.setView(this.holder.autoPlayHolder.videoDisplay);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$play$3() {
        if (this.player != null) {
            onUpdatePlaybackPosition(this.player, this.player.getPosition());
            this.player.setVolume(0.0f);
            this.player.play(false);
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void pause() {
        if (this.mPlaying && this.player != null) {
            this.mPlaying = false;
            if (this.holder != null && this.holder.autoPlayHolder != null) {
                this.holder.autoPlayHolder.animateWrap(false, false);
                this.holder.autoPlayHolder.mState = 6;
            }
            VideoPools.handler.post(VideoAttachment$$Lambda$5.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$pause$4() {
        if (this.player != null) {
            this.player.pause();
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void stop() {
        stopInternal();
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void setListener(AutoPlay.Listener listener) {
        this.autoPlayListener = listener;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void removeListener(AutoPlay.Listener listener) {
        if (this.autoPlayListener == listener) {
            this.autoPlayListener = null;
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public int getScreenCenterDistance() {
        if (this.holder == null || this.holder.autoPlayHolder == null || this.holder.autoPlayHolder.getItem() != this) {
            return -1;
        }
        return this.holder.autoPlayHolder.getScreenCenterDistance();
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public float getPercentageOnScreen() {
        if (this.holder == null || this.holder.autoPlayHolder == null || this.holder.autoPlayHolder.getItem() != this) {
            return 0.0f;
        }
        return this.holder.autoPlayHolder.getPercentageOnScreen();
    }

    private void stopInternal() {
        stopAndReleasePlayer();
        this.mFailed = false;
        this.mPlaybackCompleted = false;
        this.mActivityOnPause = false;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.video);
        s.writeString(this.referer);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        if (this.mTracker == null) {
            this.mTracker = new VideoTracker(this.video, this.statistic, this.postId, this.postOwnerId, this.referer, this.mWasAutoPlay, this.context);
        } else if (this.player == null) {
            this.mTracker.reset();
        } else {
            this.mTracker.reset(this.player.getPosition() / 1000);
        }
        View vav = this.isSingle ? getReusableView(context, this.layoutTag) : getReusableView(context, "video");
        if (vav.getTag() instanceof ViewHolder) {
            this.holder = (ViewHolder) vav.getTag();
        } else {
            this.holder = new ViewHolder(vav, vav.getTag().toString());
            if (this.holder.isNewsScreen == null) {
                try {
                    this.holder.isNewsScreen = Boolean.valueOf(FragmentHelper.findFragment(Utils.castToActivity(context)) instanceof PostListFragment);
                } catch (Throwable th) {
                    this.holder.isNewsScreen = false;
                }
            }
            vav.setTag(this.holder);
        }
        boolean isNewsScreen = this.holder.isNewsScreen == null || this.holder.isNewsScreen.booleanValue();
        if (isNewsScreen && this.autoplay) {
            vav.setOnClickListener(null);
        } else {
            vav.setOnClickListener(this);
        }
        if (this.isSingle) {
            String usedTitle = this.shitAttachment == null ? this.video.getTitle() : "";
            this.holder.title.setText(usedTitle);
            this.holder.title.setVisibility(TextUtils.isEmpty(usedTitle) ? 8 : 0);
            this.holder.title.setOnClickListener(this);
            this.holder.title.setSingleLine(this.holder.isNewsScreen());
            this.holder.subtitle.setVisibility(this.video.views == 0 ? 8 : 0);
            this.holder.subtitle.setText(context.getResources().getQuantityString(R.plurals.video_views, this.video.views, Integer.valueOf(this.video.views)));
            this.holder.subtitle.setOnClickListener(this);
            this.holder.autoPlayHolder.bind(this);
        } else {
            ViewGroup.LayoutParams params = this.holder.preview.getLayoutParams();
            params.width = this.lp.width;
            params.height = this.lp.height;
            if (this.holder.playIcon != null) {
                if (this.lp.width < Global.scale(100.0f) || this.lp.height < Global.scale(100.0f)) {
                    this.holder.durationWrap.setPadding(V.dp(4.0f), V.dp(3.0f), V.dp(4.0f), V.dp(2.0f));
                    this.holder.duration.setTextSize(1, 10.0f);
                    this.holder.playIcon.setVisibility(8);
                    if (this.lp.width < Global.scale(50.0f)) {
                        this.holder.durationWrap.setVisibility(4);
                    } else {
                        this.holder.durationWrap.setVisibility(0);
                    }
                } else {
                    this.holder.duration.setTextSize(1, 12.0f);
                    this.holder.durationWrap.setPadding(V.dp(4.0f), V.dp(2.0f), V.dp(4.0f), V.dp(2.0f));
                    this.holder.durationWrap.setVisibility(0);
                    this.holder.playIcon.setVisibility(0);
                }
            }
        }
        if (!this.autoplay || !this.mAutoPlay) {
            this.holder.duration.setText(getDurationString(context, this.video, this.lp.width));
            this.holder.durationWrap.setVisibility(TextUtils.isEmpty(this.holder.duration.getText()) ? 4 : 0);
            this.holder.durationWrap.setBackgroundResource((!this.video.isLive() || this.video.isLiveUpcoming()) ? R.drawable.bg_doc_label : R.drawable.bg_video_live);
        }
        return vav;
    }

    private static String getDurationString(Context context, VideoFile video, int width) {
        boolean fullWidth = width >= V.dp(100.0f);
        String platform = (TextUtils.isEmpty(video.platform) || !fullWidth) ? "" : video.platform;
        if (video.isLiveUpcoming()) {
            return context.getString(R.string.video_live_upcoming);
        }
        if (video.isLive()) {
            return context.getString(R.string.video_live).toUpperCase();
        }
        if (video.duration <= 0) {
            return platform;
        }
        String durationString = Videos.formatDuration(video.duration);
        return !TextUtils.isEmpty(platform) ? platform + " · " + durationString : durationString;
    }

    public void openVideo(View view, boolean autoplay, int quality) {
        Context context = view.getContext();
        if ((view.getId() == R.id.attach_title || view.getId() == R.id.attach_subtitle) && this.holder != null && this.holder.isNewsScreen()) {
            new PostViewFragment.Builder(this.video.convertToPost()).setRefer(this.referer).resetScroll(true).go(context);
        } else if ((context instanceof Activity) && this.video.toString().equals(((Activity) context).getIntent().getStringExtra("from_video"))) {
            ((Activity) context).finish();
        } else {
            Intent intent = new Intent(context, VideoPlayerActivity.class);
            intent.putExtra(UriUtil.LOCAL_FILE_SCHEME, this.video);
            intent.putExtra("file_index", hashCode());
            intent.putExtra(ArgKeys.REFERRER, this.referer);
            intent.putExtra("load_likes", this.video.likes == 0);
            intent.putExtra("hide_ui", "news".equals(this.referer));
            intent.putExtra("autoplay", autoplay);
            intent.putExtra("ads", this.shitAttachment);
            intent.putExtra("quality", quality);
            intent.putExtra("context", this.context);
            intent.putExtra("statistic", this.statistic);
            context.startActivity(intent);
            if (context instanceof Activity) {
                ((Activity) context).overridePendingTransition(17432576, 17432577);
            }
        }
        if (this.postInteract != null) {
            this.postInteract.commit(PostInteract.Type.video_start);
        }
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public final float getRatio() {
        return 1.7777778f;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        if (this.isSingle) {
            return null;
        }
        return this.lp;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public final void setViewSize(float width, float height, boolean breakAfter, boolean floating) {
        this.lp.breakAfter = breakAfter;
        this.lp.floating = floating;
        this.lp.width = Math.round(width);
        this.lp.height = Math.round(height);
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public final int getWidth() {
        return 6400;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public final int getHeight() {
        return 3600;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public final String getThumbURL() {
        return getImageURL();
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public final int getWidth(char size) {
        return 6400;
    }

    public final String toString() {
        return this.video.toString();
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        if (this.autoplay && this.mAutoPlay && this.holder != null && this.holder.isNewsScreen()) {
            String firstFrame = this.video.getFirstFrame();
            if (!TextUtils.isEmpty(firstFrame)) {
                return firstFrame;
            }
        }
        return this.video.urlBigThumb;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        if (this.holder != null) {
            boolean scale = !this.autoplay || !this.mAutoPlay || this.video.isExternal() || !TextUtils.isEmpty(this.video.platform);
            this.holder.preview.getHierarchy().setActualImageScaleType(scale ? ScalingUtils.ScaleType.CENTER_CROP : ScalingUtils.ScaleType.FIT_CENTER);
            this.holder.preview.load(getImageURL());
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        openVideo(v, false, -1);
    }

    @Override // com.vkontakte.android.media.VideoPools.PlayerContext
    public void onPlayerAttached(AbsVideoPlayer player) {
        this.player = player;
        this.mQuality = player.getQuality();
        this.mPlaybackCompleted = player.isCompleted();
        if (isAttached()) {
            L.d("AUTOPLAY", "onPlayerAttached " + this.video.toString());
            onUpdatePlaybackPosition(player, player.getPosition());
            if (isPrepared()) {
                VideoPools.handler.post(VideoAttachment$$Lambda$6.lambdaFactory$(this));
            } else {
                ViewUtils.post(VideoAttachment$$Lambda$7.lambdaFactory$(this));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onPlayerAttached$6() {
        if (this.autoPlayListener != null) {
            this.autoPlayListener.onReady(this);
        }
        ViewUtils.post(VideoAttachment$$Lambda$10.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$5() {
        if (!isAttached() || !this.mPlaybackCompleted) {
            return;
        }
        this.holder.autoPlayHolder.showReplay();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onPlayerAttached$7() {
        if (this.autoPlayListener != null) {
            AutoPlay playingNow = this.autoPlayListener.getPlayingNow();
            boolean canWrap = playingNow == null || playingNow == this;
            if (!canWrap || !isAttached() || this.holder.autoPlayHolder.getItem() != this) {
                return;
            }
            this.holder.autoPlayHolder.showProgressDelayed();
        }
    }

    @Override // com.vkontakte.android.media.VideoPools.PlayerContext
    public void onPlayerDetached(AbsVideoPlayer player) {
        if (this.player == player) {
            L.d("AUTOPLAY", "onPlayerDetached " + this.video.toString());
            this.player.setView(null);
            this.player = null;
            this.mPlaying = false;
        }
    }

    @Override // com.vkontakte.android.media.VideoPools.PlayerContext
    public void onPause(Activity activity) {
        this.mActivityOnPause = true;
        if (this.autoPlayListener != null) {
            this.autoPlayListener.onPause(activity);
        }
    }

    @Override // com.vkontakte.android.media.VideoPools.PlayerContext
    public void onResume(Activity activity) {
        this.mActivityOnPause = false;
        if (this.autoPlayListener != null) {
            this.autoPlayListener.onResume(activity);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onPlayerReady(AbsVideoPlayer player, int videoW, int videoH) {
        this.player = player;
        ViewUtils.post(VideoAttachment$$Lambda$8.lambdaFactory$(this));
        this.mPrepared = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onPlayerReady$8() {
        AutoPlay.Listener listener;
        if (!this.mActivityOnPause && isAttached() && (listener = this.autoPlayListener) != null) {
            L.d("AUTOPLAY", "On Ready " + toString());
            listener.onReady(this);
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onPlaybackCompleted(AbsVideoPlayer player) {
        if (this.player == player) {
            if (this.video.repeat) {
                replay(player);
                return;
            }
            this.mPlaying = false;
            this.mPlaybackCompleted = true;
            if (this.holder != null && this.holder.autoPlayHolder != null) {
                this.holder.autoPlayHolder.showReplay();
            }
            if (this.autoPlayListener != null) {
                this.autoPlayListener.onComplete(this);
            }
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onUpdatePlaybackPosition(AbsVideoPlayer player, int msec) {
        if (this.player == player) {
            int sec = Math.max(0, msec / 1000);
            if (this.mPlaying && !this.video.isLive() && !this.video.isLiveUpcoming()) {
                ViewUtils.post(VideoAttachment$$Lambda$9.lambdaFactory$(this, sec));
            }
            if (this.mTracker != null) {
                this.mTracker.track(sec, this.mQuality);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onUpdatePlaybackPosition$9(int sec) {
        if (this.holder == null || this.holder.autoPlayHolder == null || this.holder.autoPlayHolder.getItem().video != this.video) {
            return;
        }
        this.holder.autoPlayHolder.mDuration.setText(Videos.formatDuration(this.video.duration - sec));
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onUpdateBuffered(AbsVideoPlayer player, int percent) {
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onPlaybackResumed(AbsVideoPlayer player) {
        if (this.player == player) {
            if (!this.mFailed && this.holder != null && this.holder.autoPlayHolder != null) {
                this.holder.autoPlayHolder.cancelProgressDelayed();
                if (isPlaying()) {
                    this.holder.autoPlayHolder.showPlayer();
                } else if (this.holder.autoPlayHolder.mProgress.getVisibility() == 0) {
                    this.holder.autoPlayHolder.animateWrap(false, false);
                }
            }
            this.mBuffering = false;
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onEndOfBuffer(AbsVideoPlayer player) {
        if (this.player == player) {
            if (this.holder != null && this.holder.autoPlayHolder != null) {
                this.holder.autoPlayHolder.showProgressDelayed();
            }
            this.mBuffering = true;
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onError(AbsVideoPlayer player, int errCode) {
        if (this.player == player) {
            if (this.autoPlayListener != null) {
                this.autoPlayListener.onError(this);
            }
            this.mFailed = true;
            this.mPlaying = false;
            this.mPlaybackCompleted = false;
            stopInternal();
            if (isAttached()) {
                int errorString = -1;
                switch (errCode) {
                    case -1:
                        errorString = R.string.video_err_network;
                        break;
                    case 2:
                        errorString = R.string.err_internal;
                        break;
                    case 4:
                        errorString = R.string.err_video_not_processed;
                        break;
                    case 5:
                        errorString = R.string.video_err_live_not_ready;
                        break;
                    case 6:
                        errorString = R.string.video_restricted_withdrawn;
                        break;
                }
                if (errorString == -1) {
                    return;
                }
                this.holder.autoPlayHolder.showError(errorString);
            }
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
    public void onRenderedFirstFrame(AbsVideoPlayer player) {
        if (this.player != player || this.holder == null || this.holder.autoPlayHolder == null) {
            return;
        }
        this.holder.autoPlayHolder.mPreview.setVisibility(4);
    }

    private boolean isAttached() {
        return (this.holder == null || this.holder.autoPlayHolder == null || !this.holder.autoPlayHolder.mAttachedToWindow) ? false : true;
    }

    void start(boolean autoplay) {
        if ((this.mTask == null || !this.mTask.isRunning()) && !this.hasPlayer) {
            this.mWasAutoPlay = autoplay;
            if (!this.video.isHLSSupported()) {
                this.mTask = new AsyncTask<String, Integer, String>() { // from class: com.vkontakte.android.attachments.VideoAttachment.1
                    @Override // com.vkontakte.android.background.AsyncTask
                    protected void onPreExecute() {
                        if (VideoAttachment.this.holder == null || VideoAttachment.this.holder.autoPlayHolder == null || VideoAttachment.this.holder.autoPlayHolder.getItem() != VideoAttachment.this) {
                            return;
                        }
                        VideoAttachment.this.holder.autoPlayHolder.showProgress();
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.vkontakte.android.background.AsyncTask
                    public String doInBackground(String... args) throws Throwable {
                        VideoFile file = VideoAttachment.this.video;
                        if (file.isHLSSupported()) {
                            return file.urlHls;
                        }
                        VideoAttachment.this.mQuality = Videos.getQuality(file, VideoAttachment.this.useVigo, VigoDelegate.getSVCid(VideoAttachment.this.mWasAutoPlay));
                        return Videos.getUrl(file, VideoAttachment.this.mQuality);
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.vkontakte.android.background.AsyncTask
                    public void onError(Throwable t) {
                        VideoAttachment.this.onError(null, 0);
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.vkontakte.android.background.AsyncTask
                    public void onPostExecute(String s) {
                        VideoAttachment.this.mFailed = false;
                        VideoAttachment.this.requestPlayer(s);
                    }
                }.execPool(new String[0]);
                return;
            }
            this.mFailed = false;
            this.mQuality = -2;
            requestPlayer(this.video.urlHls);
        }
    }

    void requestPlayer(String s) {
        if (!this.hasPlayer) {
            this.hasPlayer = true;
            VideoPools.obtainAndAttachPlayer(this.video, hashCode(), s, this.mQuality, this.useVigo.get(), this.mWasAutoPlay, this.referer, this);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void replay(AbsVideoPlayer player) {
        player.replay(0);
        player.seek(0);
        player.play(true);
        this.mPlaying = true;
        this.mPlaybackCompleted = false;
        if (this.mTracker != null) {
            this.mTracker.reset();
        }
    }

    void stopAndReleasePlayer() {
        if (this.mTask != null) {
            this.mTask.cancel();
        }
        if (this.hasPlayer) {
            VideoPools.detachAndReleasePlayer(this.video, hashCode());
            this.mTracker = null;
            this.hasPlayer = false;
        }
        this.mPrepared = false;
        this.mPlaying = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class ViewHolder extends AttachmentViewHolder {
        private AutoPlayHolder autoPlayHolder;
        private final TextView duration;
        private final View durationWrap;
        private Boolean isNewsScreen;
        private final View playIcon;
        private final VKImageView preview;
        private final TextView subtitle;
        private final TextView title;

        public ViewHolder(View view, String tag) {
            super(tag);
            this.duration = (TextView) view.findViewById(R.id.attach_duration);
            this.subtitle = (TextView) view.findViewById(R.id.attach_subtitle);
            this.preview = (VKImageView) view.findViewById(R.id.video_preview);
            this.title = (TextView) view.findViewById(R.id.attach_title);
            this.durationWrap = view.findViewById(R.id.duration_wrap);
            this.playIcon = view.findViewById(R.id.video_play_icon);
            if (VideoAttachment.HOLDER_TYPE_SINGLE.equals(tag) || VideoAttachment.HOLDER_TYPE_ADS.equals(tag)) {
                this.autoPlayHolder = new AutoPlayHolder(view);
            }
        }

        public boolean isNewsScreen() {
            return this.isNewsScreen != null && this.isNewsScreen.booleanValue();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class AutoPlayHolder extends RecyclerHolder<VideoAttachment> implements View.OnAttachStateChangeListener, View.OnClickListener {
        static final float DEFAULT_IMAGE_RATIO = 0.5625f;
        static final int STATE_DONE = 3;
        static final int STATE_ERROR = 4;
        static final int STATE_INITIAL = 1;
        static final int STATE_NONE = 0;
        static final int STATE_PAUSE = 6;
        static final int STATE_PROGRESS = 2;
        static final int STATE_REPLAY = 5;
        UsableRecyclerView listView;
        private boolean mAttachedToWindow;
        final AudioVisualizerDrawable mAudioDrawable;
        final TextView mDuration;
        final ImageView mDurationIcon;
        final View mDurationWrap;
        final View mError;
        final TextView mErrorText;
        final View mIconWrap;
        final View mOverlay;
        final View mPlayButton;
        final ImageView mPreview;
        final ProgressBar mProgress;
        final View mReplayButton;
        int mState;
        final RatioFrameLayout mVideoWrap;
        Animation resize;
        ShowProgressRunnable showProgressRunnable;
        final VideoTextureView videoDisplay;
        final Rect viewBounds;

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: classes.dex */
        private @interface State {
        }

        public AutoPlayHolder(View view) {
            super(view);
            this.mAudioDrawable = new AudioVisualizerDrawable();
            this.viewBounds = new Rect();
            this.mState = 0;
            this.mPreview = (ImageView) $(R.id.video_preview);
            this.mProgress = (ProgressBar) $(R.id.progress);
            this.mPlayButton = $(R.id.play);
            this.mIconWrap = $(R.id.icon_wrap);
            this.mDuration = (TextView) $(R.id.attach_duration);
            this.mDurationWrap = $(R.id.duration_wrap);
            this.mDurationIcon = (ImageView) $(R.id.duration_icon);
            this.videoDisplay = (VideoTextureView) $(R.id.video_display);
            this.mVideoWrap = (RatioFrameLayout) $(R.id.video_wrap);
            this.mOverlay = $(R.id.overlay);
            this.mError = $(R.id.video_error);
            this.mErrorText = (TextView) $(R.id.video_error_text);
            this.mReplayButton = $(R.id.replay);
            $(R.id.video_error_retry).setOnClickListener(this);
            $(R.id.replay).setOnClickListener(this);
            this.itemView.addOnAttachStateChangeListener(this);
            this.itemView.setOnClickListener(this);
            this.mVideoWrap.setOnClickListener(this);
            this.mAudioDrawable.setColor(-1);
            this.mDurationIcon.setImageDrawable(this.mAudioDrawable);
            this.mProgress.getIndeterminateDrawable().setColorFilter(-1, PorterDuff.Mode.SRC_IN);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(VideoAttachment item) {
            boolean z = true;
            L.d("AUTOPLAY", "Bind " + item.video + "is playing " + item.isPlaying());
            setInitDurationView();
            this.mPreview.setVisibility(0);
            this.mDurationWrap.setBackgroundResource((!item.video.isLive() || item.video.isLiveUpcoming()) ? R.drawable.bg_doc_label : R.drawable.bg_video_live);
            if (!item.autoplay || !item.mAutoPlay) {
                this.mState = 0;
            }
            if (!item.isComplete()) {
                boolean newsScreen = item.holder != null && item.holder.isNewsScreen();
                if (item.video.isLiveUpcoming() || (item.autoplay && item.mAutoPlay && newsScreen)) {
                    z = false;
                }
                showInitialLayout(z);
                return;
            }
            showReplay();
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            VideoAttachment item = getItem();
            if (!item.video.isLiveUpcoming()) {
                if (this.mState == 5) {
                    if (view.getId() == R.id.replay) {
                        setInitDurationView();
                        if (item.player != null) {
                            item.replay(item.player);
                            if (item.autoPlayListener != null) {
                                item.autoPlayListener.playPrepared(item);
                            }
                        }
                    }
                } else if (this.mState != 4) {
                    boolean cantPlay = (item.holder != null && !item.holder.isNewsScreen.booleanValue()) || getPercentageOnScreen() < 0.5f || !item.canAutoPlay() || !item.mAutoPlay;
                    if (cantPlay || item.mPlaying || item.mBuffering) {
                        item.openVideo(view, item.mWasAutoPlay, item.mQuality);
                    } else if (item.isPrepared() && item.autoPlayListener != null) {
                        item.autoPlayListener.playPrepared(item);
                    } else {
                        item.start(false);
                    }
                } else if (view.getId() == R.id.video_error_retry) {
                    setInitDurationView();
                    item.start(false);
                }
            }
        }

        private void setInitDurationView() {
            String formatDuration;
            VideoFile video = getItem().video;
            TextView textView = this.mDuration;
            if (video.isLiveUpcoming()) {
                formatDuration = getString(R.string.video_live_upcoming);
            } else if (video.isLive()) {
                formatDuration = getString(R.string.video_live).toUpperCase();
            } else {
                formatDuration = Videos.formatDuration(video.duration);
            }
            textView.setText(formatDuration);
        }

        public int getScreenCenterDistance() {
            if (this.listView == null || this.mVideoWrap == null) {
                return -1;
            }
            int[] location = new int[2];
            this.listView.getLocationOnScreen(location);
            int parentTop = location[1];
            int parentBottom = parentTop + this.listView.getHeight();
            this.mVideoWrap.getLocationOnScreen(location);
            int childTop = location[1];
            int childHeight = this.mVideoWrap.getHeight();
            int childBottom = childTop + childHeight;
            int parentCenter = parentTop + ((parentBottom - parentTop) / 2);
            int childCenter = childTop + ((childBottom - childTop) / 2);
            return Math.abs(childCenter - parentCenter);
        }

        public float getPercentageOnScreen() {
            if (this.listView == null || this.mVideoWrap == null) {
                return 0.0f;
            }
            this.mVideoWrap.getLocalVisibleRect(this.viewBounds);
            int top = this.viewBounds.top;
            int bottom = this.viewBounds.bottom;
            if ((top < 0 && bottom < 0 && top < bottom) || this.viewBounds.top >= this.listView.getBottom()) {
                return 0.0f;
            }
            float height = Math.abs(top - bottom);
            return Math.min(1.0f, Math.round((height / this.mVideoWrap.getHeight()) * 100.0f) / 100.0f);
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewAttachedToWindow(View view) {
            L.d("AUTOPLAY", "onViewAttachedToWindow");
            this.mAttachedToWindow = true;
            if (this.listView == null) {
                this.listView = (UsableRecyclerView) view.getRootView().findViewById(R.id.list);
            }
            VideoFile video = getItem().video;
            this.videoDisplay.setVideoSize(video.width, video.height);
            if (video.width > 0 && video.height > 0 && getItem().holder != null && getItem().holder.isNewsScreen()) {
                float listWidth = Math.min(this.listView.getWidth(), this.listView.getHeight());
                float listHeight = Math.max(this.listView.getWidth(), this.listView.getHeight());
                float maxRatio = (0.6666667f * listHeight) / listWidth;
                float videoRatio = video.height / video.width;
                this.mVideoWrap.setImageRatio(Math.min(videoRatio, maxRatio));
            } else {
                this.mVideoWrap.setImageRatio(DEFAULT_IMAGE_RATIO);
            }
            if (getItem().isPlaying()) {
                showPlayer();
            }
            VideoPools.handler.postDelayed(VideoAttachment$AutoPlayHolder$$Lambda$1.lambdaFactory$(this), VideoAttachment.PLAY_DELAY);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onViewAttachedToWindow$0() {
            if (this.mAttachedToWindow && getItem().isPlaying()) {
                getItem().player.setView(this.videoDisplay);
            }
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewDetachedFromWindow(View view) {
            L.d("AUTOPLAY", "onViewDetachedFromWindow " + view);
            if (getItem().player != null) {
                getItem().player.setView(null);
            }
            this.mAttachedToWindow = false;
            if (getPercentageOnScreen() < 0.1f) {
                getItem().mPlaybackCompleted = false;
                this.mIconWrap.setVisibility(8);
            }
            this.mPreview.setVisibility(0);
        }

        void showInitialLayout(boolean showPlayButton) {
            int i = 0;
            this.mState = 1;
            this.mIconWrap.clearAnimation();
            setIconWrapWidth(Global.scale(14.0f));
            this.mIconWrap.setVisibility(8);
            animateWrap(false, false);
            this.mPlayButton.setVisibility(showPlayButton ? 0 : 4);
            V.setVisibilityAnimated(this.mOverlay, 4, false, 0);
            V.setVisibilityAnimated(this.mReplayButton, 4, false, 0);
            V.setVisibilityAnimated(this.mError, 4, false, 0);
            VideoFile video = getItem().video;
            View view = this.mDurationWrap;
            if (video.duration <= 0 && !video.isLive() && !video.isLiveUpcoming()) {
                i = 8;
            }
            view.setVisibility(i);
        }

        void showProgress() {
            if (this.mState != 2) {
                this.mState = 2;
                if (this.mAttachedToWindow) {
                    V.setVisibilityAnimated(this.mOverlay, 4);
                    V.setVisibilityAnimated(this.mReplayButton, 4);
                    V.setVisibilityAnimated(this.mError, 4);
                    animateWrap(true, false);
                    this.mPlayButton.setVisibility(4);
                    VideoFile video = getItem().video;
                    this.mDurationWrap.setVisibility((video.duration > 0 || video.isLive() || video.isLiveUpcoming()) ? 0 : 8);
                }
            }
        }

        void showPlayer() {
            if (this.mState != 3) {
                this.mState = 3;
                this.mDurationWrap.setVisibility(0);
                animateWrap(false, true);
                this.mPlayButton.setVisibility(4);
                this.mDurationIcon.setSelected(true);
                V.setVisibilityAnimated(this.mOverlay, 4);
                V.setVisibilityAnimated(this.mReplayButton, 4);
                V.setVisibilityAnimated(this.mError, 4);
            }
        }

        void showError(int stringResId) {
            if (this.mState != 4) {
                this.mState = 4;
                this.mPreview.setVisibility(0);
                animateWrap(false, false);
                this.mReplayButton.setVisibility(4);
                V.setVisibilityAnimated(this.mOverlay, 0);
                V.setVisibilityAnimated(this.mError, 0);
                this.mPlayButton.setVisibility(4);
                this.mDurationWrap.setVisibility(4);
                this.mErrorText.setText(stringResId);
            }
        }

        void showReplay() {
            if (this.mState != 5) {
                this.mState = 5;
                V.setVisibilityAnimated(this.mPreview, 0);
                V.setVisibilityAnimated(this.mDurationWrap, 4);
                V.setVisibilityAnimated(this.mOverlay, 0);
                V.setVisibilityAnimated(this.mReplayButton, 0);
                V.setVisibilityAnimated(this.mError, 4);
                this.mPlayButton.setVisibility(4);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void showProgressDelayed() {
            cancelProgressDelayed();
            this.showProgressRunnable = new ShowProgressRunnable(getItem().video);
            ViewUtils.postDelayed(this.showProgressRunnable, 500L);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void cancelProgressDelayed() {
            if (this.showProgressRunnable != null) {
                ViewUtils.removeCallbacks(this.showProgressRunnable);
                this.showProgressRunnable = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIconWrapWidth(int width) {
            ViewGroup.LayoutParams params = this.mIconWrap.getLayoutParams();
            params.width = width;
            this.mIconWrap.setLayoutParams(params);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void animateWrap(final boolean showProgress, final boolean showPlay) {
            int i = 8;
            float f = 0.0f;
            if (!showProgress) {
                cancelProgressDelayed();
            }
            final int size = Global.scale(14.0f);
            Animation.AnimationListener listener = new Animation.AnimationListener() { // from class: com.vkontakte.android.attachments.VideoAttachment.AutoPlayHolder.1
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                    int i2 = 0;
                    if (showPlay || showProgress) {
                        AutoPlayHolder.this.mIconWrap.setVisibility(0);
                    }
                    AutoPlayHolder autoPlayHolder = AutoPlayHolder.this;
                    if (!showPlay && !showProgress) {
                        i2 = size;
                    }
                    autoPlayHolder.setIconWrapWidth(i2);
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    if (!showPlay && !showProgress) {
                        AutoPlayHolder.this.mIconWrap.setVisibility(8);
                    }
                    AutoPlayHolder.this.setIconWrapWidth((showPlay || showProgress) ? size : 0);
                    AutoPlayHolder.this.resize = null;
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }
            };
            boolean show = showProgress || showPlay;
            View view = this.mIconWrap;
            float f2 = show ? 0.0f : size;
            float f3 = size;
            if (show) {
                f = size;
            }
            Animation resize = new ResizeAnimation(view, f2, f3, f, size);
            if (!resize.equals(this.resize)) {
                resize.setAnimationListener(listener);
                this.mIconWrap.clearAnimation();
                this.mIconWrap.startAnimation(resize);
                this.resize = resize;
            }
            V.setVisibilityAnimated(this.mDurationIcon, showPlay ? 0 : 8, false, 300);
            ProgressBar progressBar = this.mProgress;
            if (showProgress) {
                i = 0;
            }
            V.setVisibilityAnimated(progressBar, i, false, 300);
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes2.dex */
        public class ShowProgressRunnable implements Runnable {
            private final VideoFile video;

            public ShowProgressRunnable(VideoFile video) {
                this.video = video;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (AutoPlayHolder.this.getItem().video == this.video) {
                    AutoPlayHolder.this.showProgress();
                }
            }
        }
    }
}
