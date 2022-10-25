package com.vk.attachpicker.screen;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.graphics.RectF;
import android.media.MediaMetadataRetriever;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.attachpicker.AttachResulter;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.crop.CropUtils;
import com.vk.attachpicker.util.AsyncTask;
import com.vk.attachpicker.util.OrientationLocker;
import com.vk.attachpicker.util.Utils;
import com.vk.attachpicker.videotrim.VideoTimelineView;
import com.vk.attachpicker.videotrim.VideoTrimmer;
import com.vk.attachpicker.widget.LoadingDialog;
import com.vk.attachpicker.widget.TextureVideoView;
import com.vk.core.simplescreen.BaseScreen;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.FileUtils;
import com.vk.core.util.Screen;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.OnLoadCallback;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.L;
import java.io.File;
/* loaded from: classes2.dex */
public class TrimScreen extends BaseScreen {
    public static final int MIN_TIME_FRAME = 1000;
    private View bottomShadow;
    private View clickHandler;
    private View closeButton;
    private View closeButtonContainer;
    private FrameLayout container;
    private final Delegate delegate;
    private TextView leftProgressText;
    private final long maxLengthMs;
    private Toast maxLengthToast;
    private View playButton;
    private float prevProgress;
    private VKImageView previewView;
    private TextView rightProgressText;
    private boolean shouldPlayOpenAnimation;
    private VideoTimelineView timelineView;
    private View trimPanel;
    private int videoDuration;
    private final String videoPath;
    private final Uri videoUri;
    private TextureVideoView videoView;
    private final int UPDATE_STEP = 16;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final OrientationLocker locker = new OrientationLocker();
    private int seekOnNextStart = -1;
    private boolean controlsEnabled = true;
    private Runnable onEverySecond = new Runnable() { // from class: com.vk.attachpicker.screen.TrimScreen.6
        {
            TrimScreen.this = this;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (TrimScreen.this.videoView != null) {
                float videoPos = TrimScreen.this.videoView.getCurrentPosition() / TrimScreen.this.videoView.getDuration();
                if (TrimScreen.this.prevProgress < videoPos) {
                    TrimScreen.this.timelineView.setProgress(videoPos);
                    TrimScreen.this.prevProgress = videoPos;
                }
                int limit = (int) (TrimScreen.this.videoDuration * TrimScreen.this.timelineView.getRightProgress());
                if (TrimScreen.this.videoView.getCurrentPosition() >= limit - 16) {
                    TrimScreen.this.videoView.pause();
                    TrimScreen.this.playButton.setVisibility(0);
                    TrimScreen.this.progressOnNextStart((int) (TrimScreen.this.timelineView.getLeftProgress() * TrimScreen.this.videoDuration));
                } else if (TrimScreen.this.videoView.isPlaying()) {
                    TrimScreen.this.handler.postDelayed(TrimScreen.this.onEverySecond, 16L);
                }
            }
        }
    };

    /* loaded from: classes2.dex */
    public interface Delegate {
        void startEditorCloseAnimation();
    }

    public TrimScreen(Uri videoUri, long maxLengthMs, Delegate delegate) {
        this.maxLengthMs = maxLengthMs;
        this.videoUri = videoUri;
        this.videoPath = videoUri.getEncodedPath();
        this.delegate = delegate;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public View createView(LayoutInflater inflater) {
        View v = inflater.inflate(R.layout.picker_video_trim_screen, (ViewGroup) null);
        this.previewView = (VKImageView) v.findViewById(R.id.iv_preview);
        this.timelineView = (VideoTimelineView) v.findViewById(R.id.vtv_timeline);
        this.leftProgressText = (TextView) v.findViewById(R.id.tv_left_offset);
        this.rightProgressText = (TextView) v.findViewById(R.id.tv_right_offset);
        this.leftProgressText.setVisibility(4);
        this.rightProgressText.setVisibility(4);
        this.trimPanel = v.findViewById(R.id.fl_trim_panel);
        this.bottomShadow = v.findViewById(R.id.view_shadow);
        this.container = (FrameLayout) v.findViewById(R.id.fl_container);
        this.videoView = (TextureVideoView) v.findViewById(R.id.vv_video);
        this.videoView.setVideoPath(this.videoPath);
        this.videoView.setOnPreparedListener(TrimScreen$$Lambda$1.lambdaFactory$(this));
        this.videoView.setOnCompletionListener(TrimScreen$$Lambda$2.lambdaFactory$(this));
        this.playButton = v.findViewById(R.id.iv_play);
        this.clickHandler = v.findViewById(R.id.click_handler);
        this.clickHandler.setOnClickListener(TrimScreen$$Lambda$3.lambdaFactory$(this));
        this.timelineView.setVideoPath(this.videoPath);
        this.timelineView.setDelegate(new VideoTimelineView.VideoTimelineViewDelegate() { // from class: com.vk.attachpicker.screen.TrimScreen.1
            {
                TrimScreen.this = this;
            }

            @Override // com.vk.attachpicker.videotrim.VideoTimelineView.VideoTimelineViewDelegate
            public void onLeftProgressChanged(float progress) {
                if (TrimScreen.this.videoView != null) {
                    TrimScreen.this.handler.removeCallbacks(TrimScreen.this.onEverySecond);
                    try {
                        TrimScreen.this.prevProgress = 0.0f;
                        if (TrimScreen.this.videoView.isPlaying()) {
                            TrimScreen.this.videoView.pause();
                            TrimScreen.this.playButton.setVisibility(0);
                        }
                        TrimScreen.this.videoView.seekTo((int) (TrimScreen.this.videoDuration * progress));
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                    if (TrimScreen.this.timelineView.getProgress() < TrimScreen.this.timelineView.getLeftProgress()) {
                        TrimScreen.this.timelineView.setProgress(TrimScreen.this.timelineView.getLeftProgress());
                        TrimScreen.this.progressOnNextStart((int) (TrimScreen.this.timelineView.getLeftProgress() * TrimScreen.this.videoDuration));
                    } else if (TrimScreen.this.timelineView.getProgress() > TrimScreen.this.timelineView.getRightProgress()) {
                        TrimScreen.this.timelineView.setProgress(TrimScreen.this.timelineView.getRightProgress());
                        TrimScreen.this.progressOnNextStart((int) (TrimScreen.this.timelineView.getRightProgress() * TrimScreen.this.videoDuration));
                    }
                    TrimScreen.this.updateTrimText();
                }
            }

            @Override // com.vk.attachpicker.videotrim.VideoTimelineView.VideoTimelineViewDelegate
            public void onRightProgressChanged(float progress) {
                if (TrimScreen.this.videoView != null) {
                    TrimScreen.this.handler.removeCallbacks(TrimScreen.this.onEverySecond);
                    try {
                        TrimScreen.this.prevProgress = 0.0f;
                        if (TrimScreen.this.videoView.isPlaying()) {
                            TrimScreen.this.videoView.pause();
                            TrimScreen.this.playButton.setVisibility(0);
                        }
                        TrimScreen.this.videoView.seekTo((int) (TrimScreen.this.videoDuration * progress));
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                    if (TrimScreen.this.timelineView.getProgress() < TrimScreen.this.timelineView.getLeftProgress()) {
                        TrimScreen.this.timelineView.setProgress(TrimScreen.this.timelineView.getLeftProgress());
                        TrimScreen.this.progressOnNextStart((int) (TrimScreen.this.timelineView.getLeftProgress() * TrimScreen.this.videoDuration));
                    } else if (TrimScreen.this.timelineView.getProgress() > TrimScreen.this.timelineView.getRightProgress()) {
                        TrimScreen.this.timelineView.setProgress(TrimScreen.this.timelineView.getRightProgress());
                        TrimScreen.this.progressOnNextStart((int) (TrimScreen.this.timelineView.getRightProgress() * TrimScreen.this.videoDuration));
                    }
                    TrimScreen.this.updateTrimText();
                }
            }

            @Override // com.vk.attachpicker.videotrim.VideoTimelineView.VideoTimelineViewDelegate
            public void onSeekBarDrag(float progress) {
                if (progress < TrimScreen.this.timelineView.getLeftProgress()) {
                    progress = TrimScreen.this.timelineView.getLeftProgress();
                    TrimScreen.this.timelineView.setProgress(progress);
                } else if (progress > TrimScreen.this.timelineView.getRightProgress()) {
                    progress = TrimScreen.this.timelineView.getRightProgress();
                    TrimScreen.this.timelineView.setProgress(progress);
                }
                if (TrimScreen.this.videoView != null) {
                    TrimScreen.this.prevProgress = 0.0f;
                    try {
                        TrimScreen.this.videoView.seekTo((int) (TrimScreen.this.videoView.getDuration() * progress));
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                    TrimScreen.this.progressOnNextStart((int) (TrimScreen.this.videoDuration * progress));
                }
            }
        });
        this.closeButtonContainer = v.findViewById(R.id.fl_close_btn_container);
        this.closeButton = v.findViewById(R.id.iv_close);
        this.closeButton.setOnClickListener(TrimScreen$$Lambda$4.lambdaFactory$(this));
        v.findViewById(R.id.tv_attach).setOnClickListener(TrimScreen$$Lambda$5.lambdaFactory$(this));
        this.previewView.load(this.videoUri, ImageSize.VERY_BIG);
        this.previewView.setOnLoadCallback(new OnLoadCallback() { // from class: com.vk.attachpicker.screen.TrimScreen.2
            {
                TrimScreen.this = this;
            }

            @Override // com.vk.imageloader.OnLoadCallback
            public void onSuccess(int width, int height) {
                TrimScreen.this.shouldPlayOpenAnimation = true;
            }

            @Override // com.vk.imageloader.OnLoadCallback
            public void onFailure() {
            }
        });
        return v;
    }

    public /* synthetic */ void lambda$createView$2(MediaPlayer mp) {
        this.videoDuration = mp.getDuration();
        this.timelineView.setDuration(this.videoDuration);
        onStart();
        this.leftProgressText.setVisibility(0);
        this.rightProgressText.setVisibility(0);
        updateTrimText();
        Picker.run(TrimScreen$$Lambda$8.lambdaFactory$(this));
        Picker.runDelayed(TrimScreen$$Lambda$9.lambdaFactory$(this), 300L);
    }

    public /* synthetic */ void lambda$null$0() {
        this.videoView.seekTo(0);
    }

    public /* synthetic */ void lambda$null$1() {
        this.previewView.setVisibility(8);
    }

    public /* synthetic */ void lambda$createView$3(MediaPlayer mp) {
        progressOnNextStart((int) (this.timelineView.getLeftProgress() * this.videoDuration));
    }

    public /* synthetic */ void lambda$createView$4(View v1) {
        playPause();
    }

    public /* synthetic */ void lambda$createView$5(View v1) {
        finish();
    }

    public /* synthetic */ void lambda$createView$6(View v1) {
        onSaveClicked();
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onResume() {
        super.onResume();
        if (this.shouldPlayOpenAnimation) {
            Utils.runOnPreDraw(this.timelineView, TrimScreen$$Lambda$6.lambdaFactory$(this));
            return;
        }
        try {
            this.videoView.seekTo(this.videoView.getCurrentPosition());
        } catch (Throwable th) {
        }
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public boolean onBackPressed() {
        if (this.controlsEnabled) {
            finish();
        }
        return true;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void finish() {
        if (this.delegate != null && this.previewView.hasImage()) {
            closeAnimation();
            return;
        }
        super.finish();
        if (this.delegate != null) {
            this.delegate.startEditorCloseAnimation();
        }
    }

    public void showMaxLengthToast() {
        this.handler.post(TrimScreen$$Lambda$7.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$showMaxLengthToast$7() {
        try {
            if (this.maxLengthToast != null) {
                this.maxLengthToast.cancel();
            }
            this.maxLengthToast = null;
            this.maxLengthToast = Toast.makeText(getActivity(), String.format(getString(R.string.picker_trim_video_length), Long.valueOf(this.maxLengthMs / 1000)), 0);
            this.maxLengthToast.show();
        } catch (Throwable th) {
        }
    }

    public void setControlsEnabled(boolean enabled) {
        this.controlsEnabled = enabled;
        this.closeButton.setEnabled(enabled);
    }

    public void openAnimation() {
        final Activity activity = getActivity();
        this.locker.lockOrientation(activity);
        setControlsEnabled(false);
        float ar = this.previewView.getImageAspectRatio();
        RectF editorRect = CropUtils.calculatePosition(ar, this.container.getMeasuredWidth(), this.container.getMeasuredHeight(), 0.0f, 0.0f, 0.0f, 0.0f);
        RectF viewerRect = CropUtils.calculatePosition(ar, this.container.getMeasuredWidth(), this.container.getMeasuredHeight() + Screen.dp(108), 0.0f, 0.0f, 0.0f, 0.0f);
        float scaleBefore = viewerRect.width() / editorRect.width();
        float translationYBefore = viewerRect.top - editorRect.top;
        float translationXBefore = (-((this.container.getMeasuredWidth() * scaleBefore) - this.container.getMeasuredWidth())) / 2.0f;
        AnimatorSet set = new AnimatorSet();
        set.setInterpolator(AnimationUtils.decelerateInterpolator);
        set.playTogether(ObjectAnimator.ofFloat(this.closeButtonContainer, "alpha", 0.0f, 1.0f), ObjectAnimator.ofFloat(this.container, "translationX", translationXBefore, 0.0f), ObjectAnimator.ofFloat(this.container, "translationY", translationYBefore, 0.0f), ObjectAnimator.ofFloat(this.container, "scaleX", scaleBefore, 1.0f), ObjectAnimator.ofFloat(this.container, "scaleY", scaleBefore, 1.0f), ObjectAnimator.ofFloat(this.playButton, "scaleX", 1.0f / scaleBefore, 1.0f), ObjectAnimator.ofFloat(this.playButton, "scaleY", 1.0f / scaleBefore, 1.0f), ObjectAnimator.ofFloat(this.trimPanel, "translationY", this.trimPanel.getHeight(), 0.0f), ObjectAnimator.ofFloat(this.bottomShadow, "translationY", this.trimPanel.getHeight(), 0.0f));
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.TrimScreen.3
            {
                TrimScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                TrimScreen.this.locker.unlockOrientation(activity);
                TrimScreen.this.setControlsEnabled(true);
            }
        });
        set.setDuration(175L);
        set.start();
        this.shouldPlayOpenAnimation = false;
    }

    private void closeAnimation() {
        Activity activity = getActivity();
        this.locker.lockOrientation(activity);
        setControlsEnabled(false);
        this.previewView.setVisibility(0);
        float ar = this.previewView.getImageAspectRatio();
        RectF editorRect = CropUtils.calculatePosition(ar, this.container.getMeasuredWidth(), this.container.getMeasuredHeight(), 0.0f, 0.0f, 0.0f, 0.0f);
        RectF viewerRect = CropUtils.calculatePosition(ar, this.container.getMeasuredWidth(), this.container.getMeasuredHeight() + Screen.dp(108), 0.0f, 0.0f, 0.0f, 0.0f);
        float scaleBefore = viewerRect.width() / editorRect.width();
        float translationYBefore = viewerRect.top - editorRect.top;
        float translationXBefore = (-((this.container.getMeasuredWidth() * scaleBefore) - this.container.getMeasuredWidth())) / 2.0f;
        AnimatorSet set = new AnimatorSet();
        set.setInterpolator(AnimationUtils.accelerateInterpolator);
        set.playTogether(ObjectAnimator.ofFloat(this.closeButtonContainer, "alpha", 1.0f, 0.0f), ObjectAnimator.ofFloat(this.container, "translationX", 0.0f, translationXBefore), ObjectAnimator.ofFloat(this.container, "translationY", 0.0f, translationYBefore), ObjectAnimator.ofFloat(this.container, "scaleX", 1.0f, scaleBefore), ObjectAnimator.ofFloat(this.container, "scaleY", 1.0f, scaleBefore), ObjectAnimator.ofFloat(this.playButton, "scaleX", 1.0f, 1.0f / scaleBefore), ObjectAnimator.ofFloat(this.playButton, "scaleY", 1.0f, 1.0f / scaleBefore), ObjectAnimator.ofFloat(this.trimPanel, "translationY", 0.0f, this.trimPanel.getHeight()), ObjectAnimator.ofFloat(this.bottomShadow, "translationY", 0.0f, this.trimPanel.getHeight()));
        set.addListener(new AnonymousClass4());
        set.setDuration(175L);
        set.start();
        this.shouldPlayOpenAnimation = false;
    }

    /* renamed from: com.vk.attachpicker.screen.TrimScreen$4 */
    /* loaded from: classes2.dex */
    public class AnonymousClass4 extends AnimatorListenerAdapter {
        AnonymousClass4() {
            TrimScreen.this = this$0;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            Picker.runDelayed(TrimScreen$4$$Lambda$1.lambdaFactory$(this), 16L);
        }

        public /* synthetic */ void lambda$onAnimationEnd$0() {
            TrimScreen.super.finish();
            if (TrimScreen.this.delegate != null) {
                TrimScreen.this.delegate.startEditorCloseAnimation();
            }
        }
    }

    private void onSaveClicked() {
        final Activity a = getActivity();
        if (a != null) {
            int startPosition = (int) (this.videoDuration * this.timelineView.getLeftProgress());
            int endPosition = (int) (this.videoDuration * this.timelineView.getRightProgress());
            int timeVideo = endPosition - startPosition;
            if (this.maxLengthMs > 0 && timeVideo > this.maxLengthMs) {
                showMaxLengthToast();
            } else if (this.timelineView.getLeftProgress() <= 0.01f && this.timelineView.getRightProgress() >= 0.99f) {
                ((AttachResulter) a).setResultAndFinish(SelectionContext.packSingleVideo(this.videoUri));
            } else if (startPosition < 0 || endPosition > this.videoDuration) {
                ((AttachResulter) a).setResultAndFinish(SelectionContext.packSingleVideo(this.videoUri));
            } else {
                MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
                mediaMetadataRetriever.setDataSource(this.videoPath);
                long METADATA_KEY_DURATION = Long.parseLong(mediaMetadataRetriever.extractMetadata(9));
                final File file = new File(this.videoPath);
                if (timeVideo < 1000) {
                    if (METADATA_KEY_DURATION - endPosition > 1000 - timeVideo) {
                        endPosition += 1000 - timeVideo;
                    } else if (startPosition > 1000 - timeVideo) {
                        startPosition -= 1000 - timeVideo;
                    }
                }
                final int finalStartPosition = startPosition;
                final int finalEndPosition = endPosition;
                new AsyncTask<Void, Void, File>() { // from class: com.vk.attachpicker.screen.TrimScreen.5
                    private Dialog dialog;

                    {
                        TrimScreen.this = this;
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    protected void onPreExecute() {
                        this.dialog = LoadingDialog.getInstance(a, Integer.valueOf((int) R.string.picker_video_processing_progress));
                        this.dialog.setCancelable(false);
                        this.dialog.show();
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    public File doInBackground(Void... args) throws Throwable {
                        File dst = FileUtils.getTempTrimVideoFile();
                        try {
                            VideoTrimmer.trimVideo(file, dst, finalStartPosition, finalEndPosition);
                            return dst;
                        } catch (Exception e) {
                            Log.d("tmp", "", e);
                            FileUtils.deleteFile(dst);
                            return null;
                        }
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    public void onPostExecute(File file2) {
                        LoadingDialog.dismissLoadingDialog(this.dialog);
                        if (file2 == null) {
                            Toast.makeText(a, (int) R.string.picker_video_processing_error, 0).show();
                        } else {
                            ((AttachResulter) a).setResultAndFinish(SelectionContext.packSingleVideo(Uri.fromFile(file2)));
                        }
                    }
                }.execPool(new Void[0]);
            }
        }
    }

    private void playPause() {
        if (this.videoView.isPlaying()) {
            this.videoView.pause();
            this.playButton.setVisibility(0);
            return;
        }
        if (this.seekOnNextStart >= 0) {
            this.videoView.seekTo(this.seekOnNextStart);
            this.seekOnNextStart = -1;
        }
        this.videoView.start();
        this.playButton.setVisibility(4);
        onStart();
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onPause() {
        super.onPause();
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onDestroy() {
        super.onDestroy();
        this.videoView.pause();
        this.videoView.suspend();
        this.timelineView.destroy();
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onTopPaddingChanged(int topPadding) {
        super.onTopPaddingChanged(topPadding);
        this.closeButtonContainer.setPadding(0, topPadding, 0, 0);
    }

    private void onStart() {
        this.handler.post(this.onEverySecond);
    }

    public void progressOnNextStart(int progress) {
        this.prevProgress = 0.0f;
        this.seekOnNextStart = progress;
    }

    public void updateTrimText() {
        this.leftProgressText.setText(millisToText((int) (this.videoDuration * this.timelineView.getLeftProgress())));
        this.rightProgressText.setText(millisToText((int) (this.videoDuration * this.timelineView.getRightProgress())));
    }

    private String millisToText(int millis) {
        long seconds = millis / 1000;
        long absSeconds = Math.abs(seconds);
        String positive = String.format("%01d:%02d", Long.valueOf((absSeconds % 3600) / 60), Long.valueOf(absSeconds % 60));
        return positive;
    }
}
