package com.vk.stories.view;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.PorterDuff;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.google.android.exoplayer2.SimpleExoPlayer;
import com.vk.attachpicker.widget.LoadingDialog;
import com.vk.core.util.AlertDialogs;
import com.vk.core.util.DownloadUtils;
import com.vk.core.util.ElapsedTimeCounter;
import com.vk.core.util.ToastUtils;
import com.vk.core.view.SimpleVideoView;
import com.vk.core.widget.ViewShower;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.OnLoadCallback;
import com.vk.imageloader.VKImageLoader;
import com.vk.imageloader.transform.StoryPreviewPostProcessor;
import com.vk.imageloader.view.VKImageView;
import com.vk.stories.StoriesController;
import com.vk.stories.StorySettingsActivity;
import com.vk.stories.StoryVideoCache;
import com.vk.stories.StoryViewersFragment;
import com.vk.stories.dialog.StorySendMessageDialog;
import com.vk.stories.model.GetStoriesResponse;
import com.vk.stories.model.StoriesContainer;
import com.vk.stories.model.StoryEntry;
import com.vk.stories.util.StoriesUtil;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.WebViewFragment;
import com.vkontakte.android.media.AbsVideoPlayer;
/* loaded from: classes2.dex */
public class StoryView extends FrameLayout implements DialogInterface.OnDismissListener {
    private static final long PHOTO_STORY_DURATION = 3000;
    private static final int PRELOAD_COUNT = 3;
    private static final ImageSize STORY_IMAGE_SIZE = ImageSize.BIG;
    private static final int UPLOAD_FAILURE_VIEW_BG_COLOR = -13421773;
    private VKImageView avatarImageView;
    private View backGradient;
    private ViewShower backGradientShower;
    private final StoryViewCallback callback;
    private Dialog currentDialog;
    private int currentIndex;
    private StoryEntry currentStory;
    private TextView dateView;
    private final ElapsedTimeCounter elapsedTimeCounter;
    private View errorView;
    private View gestureHandler;
    private View.OnTouchListener gestureTouchListener;
    private final Runnable hideErrorRunnable;
    private final Runnable hideProgressRunnable;
    private VKImageView imagePreview;
    private boolean isActivityPaused;
    private boolean isCurrentStoryPhoto;
    private boolean isDestroyed;
    private ProgressBar loadingProgress;
    private View myStoryBottom;
    private View myStoryUploadFailure;
    private View myStoryUploadRetryButton;
    private View myStoryUploadingView;
    private View myStoryViewersView;
    private TextView nameView;
    private boolean photoLoaded;
    private int position;
    private final Handler progressHandler;
    private final Handler progressShowHandler;
    private StoryProgressView progressView;
    private View retryButton;
    private View sendMessageView;
    private View shareButton;
    private View shareButtonMy;
    private final Runnable showErrorRunnable;
    private final Runnable showProgressRunnable;
    private final StoriesController.SourceType sourceType;
    private final Runnable startProgressUpdatesRunnable;
    private final Runnable stopProgressUpdatesRunnable;
    private View storyActions;
    private View storyBottom;
    private final StoriesContainer storyContainer;
    private final boolean stubInstance;
    private final Handler uiHandler;
    private StoryUploadProgressView uploadProgressView;
    private TextView uploadText;
    private SimpleVideoView videoView;
    private View viewsCountIcon;
    private TextView viewsCountText;

    /* loaded from: classes2.dex */
    public interface StoryViewCallback {
        void deleteStory(StoriesContainer storiesContainer);

        void finish();

        int getCurrentIdlePagerPosition();

        void nextStory();

        void prevStory();

        void shareStory(String str, String str2, StoryEntry storyEntry);
    }

    public StoryView(Context context, boolean stubInstance, StoriesController.SourceType sourceType, int position, View.OnTouchListener gestureTouchListener, StoriesContainer storiesContainer, StoryViewCallback callback) {
        super(context);
        this.elapsedTimeCounter = new ElapsedTimeCounter();
        this.uiHandler = new Handler(Looper.getMainLooper());
        this.progressHandler = new Handler(Looper.getMainLooper()) { // from class: com.vk.stories.view.StoryView.1
            {
                StoryView.this = this;
            }

            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                float progress;
                if (StoryView.this.canStartProgressUpdates()) {
                    try {
                        progress = StoryView.this.getCurrentProgress();
                        if (progress > 0.0f) {
                            StoryView.this.hideProgress();
                            StoryView.this.hideError();
                            StoriesController.markAsSeen(StoryView.this.currentStory, StoryView.this.sourceType);
                        }
                    } catch (Exception e) {
                    }
                    if (progress < 0.99f || !StoryView.this.isCurrentStoryPhoto) {
                        if (StoryView.this.progressView.getProgress() < progress || progress < 0.05f) {
                            StoryView.this.progressView.setProgress(progress);
                        }
                        sendMessageDelayed(Message.obtain(this, 0), 16L);
                        return;
                    }
                    StoryView.this.progressView.setProgress(1.0f);
                    StoryView.this.onNextClick();
                    return;
                }
                StoryView.this.pause();
            }
        };
        this.startProgressUpdatesRunnable = new Runnable() { // from class: com.vk.stories.view.StoryView.2
            {
                StoryView.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (StoryView.this.canStartProgressUpdates()) {
                    StoryView.this.elapsedTimeCounter.start();
                    StoryView.this.progressHandler.sendMessageDelayed(Message.obtain(StoryView.this.progressHandler, 0), 16L);
                    StoryView.this.videoView.setPlayWhenReady(StoryView.this.isCurrentPage());
                }
            }
        };
        this.stopProgressUpdatesRunnable = new Runnable() { // from class: com.vk.stories.view.StoryView.3
            {
                StoryView.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                StoryView.this.elapsedTimeCounter.stop();
                StoryView.this.progressHandler.removeMessages(0);
                StoryView.this.videoView.setPlayWhenReady(false);
            }
        };
        this.progressShowHandler = new Handler(Looper.getMainLooper());
        this.showProgressRunnable = new Runnable() { // from class: com.vk.stories.view.StoryView.4
            {
                StoryView.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                StoryView.this.progressShowHandler.removeCallbacksAndMessages(null);
                StoryView.this.loadingProgress.setVisibility(0);
                StoryView.this.errorView.setVisibility(8);
            }
        };
        this.hideProgressRunnable = new Runnable() { // from class: com.vk.stories.view.StoryView.5
            {
                StoryView.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                StoryView.this.progressShowHandler.removeCallbacksAndMessages(null);
                StoryView.this.loadingProgress.setVisibility(8);
            }
        };
        this.showErrorRunnable = new Runnable() { // from class: com.vk.stories.view.StoryView.6
            {
                StoryView.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                StoryView.this.progressShowHandler.removeCallbacksAndMessages(null);
                StoryView.this.errorView.setVisibility(0);
                StoryView.this.loadingProgress.setVisibility(8);
            }
        };
        this.hideErrorRunnable = new Runnable() { // from class: com.vk.stories.view.StoryView.7
            {
                StoryView.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                StoryView.this.progressShowHandler.removeCallbacksAndMessages(null);
                StoryView.this.errorView.setVisibility(8);
            }
        };
        this.sourceType = sourceType;
        this.stubInstance = stubInstance;
        this.position = position;
        this.gestureTouchListener = gestureTouchListener;
        this.storyContainer = storiesContainer;
        this.callback = callback;
        init();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!this.stubInstance) {
            this.progressHandler.postDelayed(StoryView$$Lambda$1.lambdaFactory$(this), 500L);
        }
    }

    public /* synthetic */ void lambda$onAttachedToWindow$0() {
        startProgressUpdates(true);
    }

    public boolean isCurrentPage() {
        return this.callback != null && this.callback.getCurrentIdlePagerPosition() == getPosition();
    }

    public int getPosition() {
        return this.position;
    }

    public void setUploadProgress(StoriesController.StoryUpload storyUpload) {
        if (this.currentStory != null && this.currentStory.local && this.currentStory.id == storyUpload.localId()) {
            this.uploadProgressView.setProgress(storyUpload.storyUploadProgress());
        }
    }

    public void setUploadDone(StoriesController.StoryUpload storyUpload) {
        if (this.currentStory != null && this.currentStory.local && this.currentStory.id == storyUpload.localId() && storyUpload.resultStory() != null) {
            this.currentStory.setFullFile(storyUpload.fullFile());
            this.currentStory.setStory(storyUpload.resultStory());
            openStory(this.currentIndex);
        }
    }

    public void setUploadFailed(StoriesController.StoryUpload storyUpload) {
        if (this.currentStory != null && this.currentStory.local && this.currentStory.id == storyUpload.localId()) {
            openStory(this.currentIndex);
        }
    }

    public float getCurrentProgress() {
        if (this.isCurrentStoryPhoto) {
            return ((float) this.elapsedTimeCounter.elapsedTime()) / 3000.0f;
        }
        float currentPosition = (float) this.videoView.getCurrentPosition();
        float videoDuration = (float) this.videoView.getDuration();
        if (currentPosition > 0.0f && videoDuration > 0.0f) {
            return currentPosition / videoDuration;
        }
        return 0.0f;
    }

    public boolean canStartProgressUpdates() {
        return !this.isActivityPaused && !this.isDestroyed && !this.stubInstance && isCurrentPage() && this.currentDialog == null && (!this.isCurrentStoryPhoto || (this.isCurrentStoryPhoto && this.photoLoaded)) && !StoriesController.isCurrentlyUploading(this.currentStory);
    }

    public void startProgressUpdates(boolean withDelay) {
        if (!this.stubInstance && !this.isDestroyed && canStartProgressUpdates()) {
            this.progressHandler.removeCallbacksAndMessages(null);
            this.progressHandler.postDelayed(this.startProgressUpdatesRunnable, withDelay ? 300L : 0L);
        }
    }

    public void stopProgressUpdates() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.progressHandler.removeCallbacksAndMessages(null);
            this.stopProgressUpdatesRunnable.run();
        }
    }

    public void showProgress() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.progressShowHandler.removeCallbacksAndMessages(null);
            this.progressShowHandler.postDelayed(this.showProgressRunnable, 700L);
        }
    }

    public void hideProgress() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.progressShowHandler.removeCallbacksAndMessages(null);
            this.hideProgressRunnable.run();
        }
    }

    public void showError() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.progressShowHandler.removeCallbacksAndMessages(null);
            this.progressShowHandler.postDelayed(this.showErrorRunnable, 0L);
        }
    }

    public void hideError() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.progressShowHandler.removeCallbacksAndMessages(null);
            this.hideErrorRunnable.run();
        }
    }

    public void resetProgress() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.elapsedTimeCounter.reset();
            this.videoView.seekTo(0L);
            this.progressView.setProgress(0.0f);
        }
    }

    public void onResume() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.isActivityPaused = false;
            if (isCurrentPage() && this.currentDialog == null) {
                this.videoView.setPlayWhenReady(true);
                startProgressUpdates(true);
            }
            if (this.currentDialog != null && (this.currentDialog instanceof StorySendMessageDialog)) {
                ((StorySendMessageDialog) this.currentDialog).openKeyboard();
            }
        }
    }

    public void onPause() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.isActivityPaused = true;
            this.videoView.setPlayWhenReady(false);
            stopProgressUpdates();
        }
    }

    public void play() {
        if (!this.stubInstance && !this.isDestroyed) {
            startProgressUpdates(false);
        }
    }

    public void pause() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.videoView.setPlayWhenReady(false);
            stopProgressUpdates();
        }
    }

    public void destroy() {
        if (!this.stubInstance && !this.isDestroyed) {
            this.isDestroyed = true;
            stopProgressUpdates();
            this.videoView.setPlayWhenReady(false);
            this.videoView.releasePlayer();
            this.progressHandler.removeCallbacksAndMessages(null);
        }
    }

    public void externalNextClick() {
        if (!this.stubInstance && !this.isDestroyed && isCurrentPage()) {
            onNextClick();
        }
    }

    public void externalPrevClick() {
        if (!this.stubInstance && !this.isDestroyed && isCurrentPage()) {
            onPrevClick();
        }
    }

    public void showBackGradient() {
        if (isCurrentPage()) {
            this.backGradientShower.show();
        }
    }

    public void hideBackGradient() {
        this.backGradientShower.hide(false);
    }

    private void init() {
        View.OnClickListener onClickListener;
        LayoutInflater.from(getContext()).inflate(R.layout.layout_story_view, this);
        setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        onClickListener = StoryView$$Lambda$2.instance;
        setOnClickListener(onClickListener);
        this.gestureHandler = findViewById(R.id.gesture_handler);
        this.gestureHandler.setOnTouchListener(this.gestureTouchListener);
        this.backGradient = findViewById(R.id.back_gradient);
        this.backGradientShower = new ViewShower(this.backGradient);
        this.loadingProgress = (ProgressBar) findViewById(R.id.pb_loading);
        this.loadingProgress.getIndeterminateDrawable().setColorFilter(-1, PorterDuff.Mode.MULTIPLY);
        this.errorView = findViewById(R.id.fl_error);
        this.retryButton = findViewById(R.id.tv_retry);
        this.retryButton.setOnClickListener(StoryView$$Lambda$3.lambdaFactory$(this));
        this.storyBottom = findViewById(R.id.ll_story_bottom);
        this.myStoryBottom = findViewById(R.id.ll_my_story_bottom);
        this.viewsCountIcon = this.myStoryBottom.findViewById(R.id.iv_viewers_icon);
        this.viewsCountText = (TextView) this.myStoryBottom.findViewById(R.id.tv_viewers_count);
        this.myStoryUploadingView = this.myStoryBottom.findViewById(R.id.fl_uploading_view);
        this.myStoryViewersView = this.myStoryBottom.findViewById(R.id.fl_viewers_view);
        this.myStoryUploadFailure = this.myStoryBottom.findViewById(R.id.fl_upload_failure);
        this.myStoryUploadRetryButton = this.myStoryUploadFailure.findViewById(R.id.tv_upload_retry);
        this.uploadProgressView = (StoryUploadProgressView) findViewById(R.id.pv_progress);
        this.uploadText = (TextView) findViewById(R.id.tv_upload_text);
        View.OnClickListener openViewersClickListener = StoryView$$Lambda$4.lambdaFactory$(this);
        this.viewsCountIcon.setOnClickListener(openViewersClickListener);
        this.viewsCountText.setOnClickListener(openViewersClickListener);
        this.myStoryUploadRetryButton.setOnClickListener(StoryView$$Lambda$5.lambdaFactory$(this));
        this.imagePreview = (VKImageView) findViewById(R.id.iv_image_preview);
        this.videoView = (SimpleVideoView) findViewById(R.id.vv_video_preview);
        if (this.stubInstance) {
            removeView(this.videoView);
        } else {
            this.videoView.setFitVideo(false);
            this.videoView.setLoop(false);
            this.videoView.setBufferForPlaybackMs(1000);
            this.videoView.setOnEndListener(StoryView$$Lambda$6.lambdaFactory$(this));
            this.videoView.setOnFirstFrameRenderedListener(StoryView$$Lambda$7.lambdaFactory$(this));
            this.videoView.setOnErrorListener(new SimpleVideoView.OnErrorListener() { // from class: com.vk.stories.view.StoryView.8
                {
                    StoryView.this = this;
                }

                @Override // com.vk.core.view.SimpleVideoView.OnErrorListener
                public void onErrorListener(int what) {
                    StoryView.this.showError();
                    if (what > -1) {
                        String msg = StoryView.this.getContext().getResources().getString(AbsVideoPlayer.getErrorString(what));
                        Toast.makeText(StoryView.this.getContext(), msg, 1).show();
                    }
                }
            });
            this.videoView.setOnBufferingEventsListener(new SimpleVideoView.OnBufferingEventsListener() { // from class: com.vk.stories.view.StoryView.9
                {
                    StoryView.this = this;
                }

                @Override // com.vk.core.view.SimpleVideoView.OnBufferingEventsListener
                public void onBufferingStart(SimpleExoPlayer player) {
                    if (!StoryView.this.isCurrentStoryPhoto) {
                        StoryView.this.stopProgressUpdates();
                        StoryView.this.showProgress();
                    }
                }

                @Override // com.vk.core.view.SimpleVideoView.OnBufferingEventsListener
                public void onBufferingEnd(SimpleExoPlayer player) {
                    if (!StoryView.this.isCurrentStoryPhoto) {
                        StoryView.this.startProgressUpdates(false);
                    }
                }
            });
        }
        this.progressView = (StoryProgressView) findViewById(R.id.vrpv_progress);
        this.avatarImageView = (VKImageView) findViewById(R.id.iv_avatar);
        this.nameView = (TextView) findViewById(R.id.tv_name);
        this.dateView = (TextView) findViewById(R.id.tv_date);
        this.sendMessageView = findViewById(R.id.tv_send_message);
        this.sendMessageView.setOnClickListener(StoryView$$Lambda$8.lambdaFactory$(this));
        findViewById(R.id.iv_close).setOnClickListener(StoryView$$Lambda$9.lambdaFactory$(this));
        this.shareButton = findViewById(R.id.iv_share);
        this.shareButton.setOnClickListener(StoryView$$Lambda$10.lambdaFactory$(this));
        this.storyActions = findViewById(R.id.iv_story_actions);
        this.storyActions.setOnClickListener(StoryView$$Lambda$11.lambdaFactory$(this));
        this.shareButtonMy = this.myStoryViewersView.findViewById(R.id.iv_share_my);
        this.shareButtonMy.setOnClickListener(StoryView$$Lambda$12.lambdaFactory$(this));
        this.progressView.setSectionCount(this.storyContainer.storyEntries.size());
        this.progressView.setCurrentSection(this.storyContainer.getStartIndex());
        this.avatarImageView.load(this.storyContainer.getAuthorAvatarUrl());
        this.nameView.setText(this.storyContainer.getAuthorFullName());
        if (!this.storyContainer.canComment() || this.storyContainer.myStory()) {
            this.sendMessageView.setVisibility(4);
        }
        if (this.storyContainer.myStory()) {
            this.myStoryBottom.setVisibility(0);
            this.storyBottom.setVisibility(8);
            this.myStoryBottom.findViewById(R.id.iv_my_story_actions).setOnClickListener(StoryView$$Lambda$13.lambdaFactory$(this));
        } else {
            this.myStoryBottom.setVisibility(8);
            this.storyBottom.setVisibility(0);
        }
        View.OnClickListener openProfileListener = StoryView$$Lambda$14.lambdaFactory$(this);
        this.avatarImageView.setOnClickListener(openProfileListener);
        this.nameView.setOnClickListener(openProfileListener);
        this.dateView.setOnClickListener(openProfileListener);
        openStory(this.storyContainer.getStartIndex());
    }

    public static /* synthetic */ void lambda$init$1(View view) {
    }

    public /* synthetic */ void lambda$init$2(View v) {
        openStory(this.currentIndex);
    }

    public /* synthetic */ void lambda$init$3(View view) {
        if (this.currentStory != null && this.currentStory.viewsCount > 0) {
            new StoryViewersFragment.Builder().setStory(this.currentStory).go(getContext());
        }
    }

    public /* synthetic */ void lambda$init$4(View view) {
        StoriesController.retryUpload(this.currentStory);
        openStory(this.currentIndex);
    }

    public /* synthetic */ void lambda$init$5(SimpleExoPlayer mediaPlayer) {
        stopProgressUpdates();
        onNextClick();
    }

    public /* synthetic */ void lambda$init$6(SimpleExoPlayer player) {
        this.videoView.setAlpha(1.0f);
        startProgressUpdates(false);
    }

    public /* synthetic */ void lambda$init$7(View view) {
        if (!this.stubInstance && this.storyContainer != null && this.currentStory != null) {
            showDialog(new StorySendMessageDialog(getContext(), this.storyContainer.getAuthorId(), this.currentStory));
        }
    }

    public /* synthetic */ void lambda$init$8(View view) {
        if (!this.stubInstance && this.callback != null) {
            this.callback.finish();
        }
    }

    public /* synthetic */ void lambda$init$9(View view) {
        if (!this.stubInstance && this.callback != null) {
            this.callback.shareStory(this.storyContainer.getAuthorFirstName(), this.storyContainer.getAuthorAvatarUrl(), this.currentStory);
        }
    }

    public /* synthetic */ void lambda$init$12(View v) {
        AlertDialogs.AlertDialogBuilder builder = AlertDialogs.buildListActionDialog(getContext());
        builder.action(R.string.menu_settings, StoryView$$Lambda$20.lambdaFactory$(this));
        if (!this.currentStory.isPromo) {
            int currentStoryId = this.currentStory.ownerId;
            builder.action(R.string.hide_from_stories, StoryView$$Lambda$21.lambdaFactory$(this, currentStoryId));
        }
        showDialog(builder.show());
    }

    public /* synthetic */ void lambda$null$10() {
        getContext().startActivity(new Intent(getContext(), StorySettingsActivity.class));
    }

    public /* synthetic */ void lambda$null$11(final int currentStoryId) {
        StoriesController.banUser(currentStoryId, getContext(), new Callback<GetStoriesResponse>() { // from class: com.vk.stories.view.StoryView.10
            {
                StoryView.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(GetStoriesResponse result) {
                ToastUtils.showToast(currentStoryId > 0 ? R.string.user_has_been_hidden_from_stories : R.string.community_has_been_hidden_from_stories);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                ToastUtils.showToast((int) R.string.error_hide_from_stories);
            }
        });
    }

    public /* synthetic */ void lambda$init$13(View view) {
        if (!this.stubInstance && this.callback != null) {
            this.callback.shareStory(this.storyContainer.getAuthorFirstName(), this.storyContainer.getAuthorAvatarUrl(), this.currentStory);
        }
    }

    public /* synthetic */ void lambda$init$16(View view) {
        AlertDialogs.AlertDialogBuilder builder = AlertDialogs.buildListActionDialog(getContext());
        builder.action(R.string.menu_settings, StoryView$$Lambda$17.lambdaFactory$(this));
        if (this.currentStory != null && !this.currentStory.local && (this.currentStory.getServerImageUrl() != null || this.currentStory.getServerVideoUrl() != null)) {
            builder.action(R.string.save, StoryView$$Lambda$18.lambdaFactory$(this));
        }
        builder.action(R.string.delete_story, StoryView$$Lambda$19.lambdaFactory$(this));
        showDialog(builder.show());
    }

    public /* synthetic */ void lambda$null$14() {
        getContext().startActivity(new Intent(getContext(), StorySettingsActivity.class));
    }

    public /* synthetic */ void lambda$null$15() {
        String downloadUrl;
        if (this.currentStory.isPhotoStory()) {
            downloadUrl = this.currentStory.getServerImageUrl();
        } else {
            downloadUrl = this.currentStory.getServerVideoUrl();
        }
        DownloadUtils.downloadFile(getContext(), null, downloadUrl);
    }

    public /* synthetic */ void lambda$init$17(View view) {
        Analytics.EventBuilder eventBuilder;
        if (this.currentStory != null && !TextUtils.isEmpty(this.currentStory.openUrl)) {
            new WebViewFragment.Builder(this.currentStory.openUrl).openInternally().setTheme(R.style.StoryActivityTheme).go(getContext());
        } else if (!this.storyContainer.isPromo()) {
            int uid = this.storyContainer.getAuthorId();
            if (uid > 0) {
                eventBuilder = Analytics.track("open_user");
                eventBuilder.addParam(ServerKeys.USER_IDS, "[" + uid + "]");
            } else {
                eventBuilder = Analytics.track("open_group");
                eventBuilder.addParam("group_ids", "[" + (-uid) + "]");
            }
            eventBuilder.addParam(ShareConstants.FEED_SOURCE_PARAM, "story");
            eventBuilder.sendNow();
            new ProfileFragment.Builder(uid).go(getContext());
        }
    }

    public void deleteStory() {
        int idx = this.currentIndex;
        StoryEntry se = this.currentStory;
        if (se != null) {
            if (StoriesController.isCurrentlyUploading(se)) {
                StoriesController.cancelUpload(se);
                doDeleteCurrentStory(idx);
                return;
            }
            this.uiHandler.postDelayed(StoryView$$Lambda$15.lambdaFactory$(this, se, idx), 50L);
        }
    }

    public /* synthetic */ void lambda$deleteStory$18(StoryEntry se, final int idx) {
        final Dialog dialog = LoadingDialog.getInstance(getContext(), Integer.valueOf((int) R.string.deleting_story));
        dialog.setCancelable(false);
        showDialog(dialog);
        StoriesController.deleteStory(se, new Callback<GetStoriesResponse>() { // from class: com.vk.stories.view.StoryView.11
            {
                StoryView.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(GetStoriesResponse result) {
                StoryView.this.doDeleteCurrentStory(idx);
                LoadingDialog.dismissLoadingDialog(dialog);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                LoadingDialog.dismissLoadingDialog(dialog);
            }
        });
    }

    public void doDeleteCurrentStory(int idx) {
        int indexDelta;
        if (!this.storyContainer.hasValidStories() || this.storyContainer.storyEntries.size() == 1) {
            indexDelta = 0;
            if (this.callback != null) {
                this.position = -1;
                pause();
                this.callback.deleteStory(this.storyContainer);
            }
        } else if (idx < this.storyContainer.storyEntries.size() - 1) {
            onNextClick();
            this.storyContainer.storyEntries.remove(idx);
            indexDelta = -1;
        } else {
            onPrevClick();
            this.storyContainer.storyEntries.remove(idx);
            indexDelta = 0;
        }
        this.currentIndex += indexDelta;
        this.progressView.setSectionCount(this.storyContainer.storyEntries.size());
        this.progressView.setCurrentSection(this.currentIndex);
        ToastUtils.showToast((int) R.string.story_deleted);
    }

    private void openStory(int index) {
        int i = 0;
        if (!this.isDestroyed && index >= 0 && index < this.storyContainer.storyEntries.size()) {
            boolean isBrokenEntry = false;
            StoryEntry entry = this.storyContainer.storyEntries.get(index);
            this.currentStory = entry;
            this.currentIndex = index;
            this.isCurrentStoryPhoto = entry.isPhotoStory();
            this.dateView.setText(TimeUtils.langDateRelative((int) entry.date, getResources()));
            this.progressView.setCurrentSection(index);
            String smallUrl = entry.getImageSmall(false);
            String bigUrl = entry.getImageBig();
            if (!TextUtils.isEmpty(smallUrl) && TextUtils.isEmpty(bigUrl)) {
                this.imagePreview.setOnLoadCallback(null);
                this.imagePreview.setPostprocessor(StoryPreviewPostProcessor.INSTANCE_5);
                this.imagePreview.load(smallUrl, STORY_IMAGE_SIZE);
            } else if (!TextUtils.isEmpty(bigUrl)) {
                if (entry.isPhotoStory()) {
                    this.photoLoaded = false;
                    this.imagePreview.setOnLoadCallback(new OnLoadCallback() { // from class: com.vk.stories.view.StoryView.12
                        {
                            StoryView.this = this;
                        }

                        @Override // com.vk.imageloader.OnLoadCallback
                        public void onSuccess(int width, int height) {
                            StoryView.this.photoLoaded = true;
                            StoryView.this.resetProgress();
                            StoryView.this.startProgressUpdates(true);
                            StoryView.this.hideProgress();
                            StoryView.this.hideError();
                        }

                        @Override // com.vk.imageloader.OnLoadCallback
                        public void onFailure() {
                            StoryView.this.hideProgress();
                            StoryView.this.showError();
                        }
                    });
                } else {
                    this.imagePreview.setOnLoadCallback(null);
                }
                if (!TextUtils.isEmpty(smallUrl)) {
                    this.imagePreview.setPostprocessor(StoryPreviewPostProcessor.INSTANCE_5, null);
                    this.imagePreview.load(Uri.parse(smallUrl), STORY_IMAGE_SIZE, Uri.parse(bigUrl), STORY_IMAGE_SIZE);
                } else {
                    this.imagePreview.setPostprocessor(null);
                    this.imagePreview.load(bigUrl, STORY_IMAGE_SIZE);
                }
            } else {
                this.imagePreview.clear();
            }
            if (!this.stubInstance) {
                if (entry.isPhotoStory()) {
                    this.videoView.setVisibility(8);
                    this.videoView.releasePlayer();
                } else if (TextUtils.isEmpty(entry.getVideoUrl())) {
                    this.videoView.setVisibility(8);
                    this.videoView.releasePlayer();
                    if (!entry.local) {
                        isBrokenEntry = true;
                    }
                } else {
                    this.videoView.setVisibility(0);
                    this.videoView.setAlpha(0.0f);
                    this.videoView.stop();
                    if (entry.localVideoPath()) {
                        this.videoView.setVideoUri(Uri.parse(entry.getVideoUrl()));
                    } else {
                        StoryVideoCache.getVideoUrl(entry, StoryView$$Lambda$16.lambdaFactory$(this, entry));
                    }
                }
            }
            if (this.currentStory.isMyStory()) {
                StoriesController.StoryUpload su = StoriesController.getUploadState(this.currentStory);
                if (su != null) {
                    if (su.uploadFailed()) {
                        this.myStoryUploadFailure.setVisibility(0);
                        this.myStoryUploadingView.setVisibility(8);
                        this.myStoryBottom.setBackgroundColor(UPLOAD_FAILURE_VIEW_BG_COLOR);
                    } else {
                        this.uploadProgressView.setProgress(su.storyUploadProgress());
                        if (this.currentStory.isPhotoStory()) {
                            this.uploadText.setText(R.string.story_sending_photo);
                        } else {
                            this.uploadText.setText(R.string.story_sending_video);
                        }
                        this.myStoryUploadFailure.setVisibility(8);
                        this.myStoryUploadingView.setVisibility(0);
                        this.myStoryBottom.setBackgroundColor(0);
                    }
                    this.myStoryViewersView.setVisibility(8);
                } else {
                    this.myStoryBottom.setBackgroundColor(0);
                    this.myStoryUploadingView.setVisibility(8);
                    this.myStoryUploadFailure.setVisibility(8);
                    this.myStoryViewersView.setVisibility(0);
                    this.viewsCountText.setText(StoriesUtil.getCounterText(this.currentStory.viewsCount));
                }
            }
            this.shareButtonMy.setVisibility(this.currentStory.canShare ? 0 : 8);
            View view = this.shareButton;
            if (!this.currentStory.canShare) {
                i = 8;
            }
            view.setVisibility(i);
            if (!this.stubInstance) {
                resetProgress();
                startProgressUpdates(true);
                preloadNextStories();
                if (isBrokenEntry) {
                    showError();
                    StoriesController.markAsSeen(this.currentStory, this.sourceType);
                } else if (!this.currentStory.local) {
                    hideError();
                    showProgress();
                } else {
                    hideError();
                }
            }
        }
    }

    public /* synthetic */ void lambda$openStory$19(StoryEntry tmpStory, String link) {
        if (this.currentStory == tmpStory) {
            this.videoView.setVideoUri(Uri.parse(link));
        }
    }

    public void onNextClick() {
        if (isCurrentPage()) {
            StoriesController.markAsSeen(this.currentStory, this.sourceType);
            if (this.currentIndex == this.storyContainer.storyEntries.size() - 1) {
                if (this.callback != null) {
                    this.callback.nextStory();
                    return;
                }
                return;
            }
            openStory(this.currentIndex + 1);
            startProgressUpdates(true);
        }
    }

    private void onPrevClick() {
        if (isCurrentPage()) {
            StoriesController.markAsSeen(this.currentStory, this.sourceType);
            if (this.currentIndex == 0) {
                if (this.callback != null) {
                    this.callback.prevStory();
                    return;
                }
                return;
            }
            openStory(this.currentIndex - 1);
            startProgressUpdates(true);
        }
    }

    private void preloadNextStories() {
        if (isCurrentPage()) {
            for (int i = 1; i <= 3; i++) {
                int idx = this.currentIndex + i;
                if (idx >= 0 && idx < this.storyContainer.storyEntries.size()) {
                    StoryEntry se = this.storyContainer.storyEntries.get(idx);
                    if (!TextUtils.isEmpty(se.getImageBig())) {
                        VKImageLoader.prefetchToMemory(Uri.parse(se.getImageBig()), STORY_IMAGE_SIZE);
                    }
                    if (!se.local && se.isVideoStory() && !TextUtils.isEmpty(se.getVideoUrl())) {
                        StoryVideoCache.prefetchVideo(se);
                    }
                }
            }
        }
    }

    private void showDialog(Dialog dialog) {
        if (this.currentDialog != null) {
            this.currentDialog.dismiss();
        }
        this.currentDialog = dialog;
        this.currentDialog.setOnDismissListener(this);
        pause();
        this.currentDialog.show();
        hideProgress();
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialogInterface) {
        this.currentDialog = null;
        play();
    }
}
