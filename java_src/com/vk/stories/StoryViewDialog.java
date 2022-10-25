package com.vk.stories;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import com.vk.camera.Utils;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.CompatUtils;
import com.vk.core.util.Screen;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.stories.StoriesController;
import com.vk.stories.model.StoriesContainer;
import com.vk.stories.util.StoriesUtil;
import com.vk.stories.view.StoryView;
import com.vk.stories.view.StoryViewContainer;
import com.vkontakte.android.R;
import com.vkontakte.android.media.VideoPools;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class StoryViewDialog extends Dialog implements StoryViewContainer.ControlCallback {
    private final Activity activity;
    private final AnimationDataProvider animationDataProvider;
    private boolean animationInProgress;
    private final ColorDrawable backgroundDrawable;
    private View currentAnimationTargetView;
    private float dragY;
    private FrameLayoutTouchListener draggingContainer;
    private boolean draggingDown;
    private final Handler handler;
    private final LifecycleHandler lifecycleHandler;
    private final LifecycleListener lifecycleListener;
    private final int maximumVelocity;
    private final int minimumVelocity;
    private float moveStartX;
    private final int openStoryUid;
    private final ArrayList<StoriesContainer> storiesContainers;
    private StoryViewContainer storyViewContainer;
    private StoryView stubInstance;
    private float translationY;
    private VelocityTracker velocityTracker;

    /* loaded from: classes2.dex */
    public interface AnimationDataProvider {
        View getAnimationTargetView(int i);

        void scrollStoriesListToAuthorId(int i);
    }

    public StoryViewDialog(Activity context, ArrayList<StoriesContainer> storiesContainers, int openStoryUid, AnimationDataProvider animationDataProvider) {
        super(context, R.style.PickerFullScreenNoStatusDialog);
        this.handler = new Handler(Looper.getMainLooper());
        this.backgroundDrawable = new ColorDrawable(ViewCompat.MEASURED_STATE_MASK);
        this.draggingDown = false;
        this.translationY = 0.0f;
        this.lifecycleListener = new LifecycleListener() { // from class: com.vk.stories.StoryViewDialog.4
            {
                StoryViewDialog.this = this;
            }

            @Override // com.vk.core.widget.LifecycleListener
            public void onActivityResult(@NonNull String instanceId, int requestCode, int resultCode, @Nullable Intent data) {
                if (StoryViewDialog.this.storyViewContainer != null) {
                    StoryViewDialog.this.storyViewContainer.onActivityResult(requestCode, resultCode, data);
                }
            }

            @Override // com.vk.core.widget.LifecycleListener
            public void onActivityResumed(@NonNull Activity activity) {
                if (StoryViewDialog.this.storyViewContainer != null) {
                    StoryViewDialog.this.storyViewContainer.onResume();
                }
            }

            @Override // com.vk.core.widget.LifecycleListener
            public void onActivityPaused(@NonNull Activity activity) {
                if (StoryViewDialog.this.storyViewContainer != null) {
                    StoryViewDialog.this.storyViewContainer.onPause();
                }
            }

            @Override // com.vk.core.widget.LifecycleListener
            public void onActivityDestroyed(@NonNull Activity activity) {
                if (StoryViewDialog.this.storyViewContainer != null) {
                    StoryViewDialog.this.storyViewContainer.onDestroy();
                }
            }
        };
        getWindow().setWindowAnimations(R.style.PickerDialogNoAnimation);
        this.activity = context;
        this.animationDataProvider = animationDataProvider;
        this.storiesContainers = storiesContainers;
        this.openStoryUid = openStoryUid;
        this.stubInstance = new StoryView(context, true, StoriesController.SourceType.LIST, 0, null, StoriesUtil.findStoryByAuthorId(storiesContainers, openStoryUid), null);
        this.draggingContainer = new FrameLayoutTouchListener(this.activity);
        CompatUtils.setBackground(this.draggingContainer, this.backgroundDrawable);
        this.draggingContainer.addView(this.stubInstance);
        setContentView(this.draggingContainer);
        this.lifecycleHandler = LifecycleHandler.install(context);
        this.lifecycleHandler.setLifecycleListener(this.lifecycleListener);
        setOnDismissListener(StoryViewDialog$$Lambda$1.lambdaFactory$(this, context));
        ViewConfiguration configuration = ViewConfiguration.get(this.activity);
        this.minimumVelocity = configuration.getScaledMinimumFlingVelocity() * 16;
        this.maximumVelocity = configuration.getScaledMaximumFlingVelocity();
    }

    public /* synthetic */ void lambda$new$0(Activity context, DialogInterface dialogInterface) {
        if (this.storyViewContainer != null) {
            this.storyViewContainer.onPause();
            this.storyViewContainer.onDestroy();
        }
        this.activity.setRequestedOrientation(-1);
        VideoPools.setOverlayDialogVisible(false);
        VideoPools.onResume(this.activity);
        Utils.keepScreenOn(context, false);
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        VideoPools.setOverlayDialogVisible(true);
        VideoPools.onPause(this.activity);
        this.activity.setRequestedOrientation(1);
        startOpenAnimation(this.animationDataProvider.getAnimationTargetView(this.openStoryUid));
    }

    @Override // android.app.Dialog
    public void onBackPressed() {
        if (!this.animationInProgress) {
            dismiss();
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void cancel() {
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        startCloseAnimation(this.animationDataProvider.getAnimationTargetView(this.storyViewContainer.getCurrentStoryAuthorUid()));
    }

    private void startOpenAnimation(View view) {
        boolean isViewValid = isViewValid(view);
        AnimatorSet set = new AnimatorSet();
        if (isViewValid) {
            int viewCenterX = getViewCenterX(view);
            int viewCenterY = getViewCenterY(view);
            int finalW = Screen.realWidth();
            int finalH = Screen.realHeight();
            int finalCenterX = finalW / 2;
            int finalCenterY = finalH / 2;
            this.stubInstance.setScaleX(0.0f);
            this.stubInstance.setScaleY(0.0f);
            this.backgroundDrawable.setAlpha(0);
            set.playTogether(AnimationUtils.decelerate(ObjectAnimator.ofFloat(this.stubInstance, View.TRANSLATION_X, viewCenterX - finalCenterX, 0.0f)), AnimationUtils.decelerate(ObjectAnimator.ofFloat(this.stubInstance, View.TRANSLATION_Y, viewCenterY - finalCenterY, 0.0f)), AnimationUtils.decelerate(ObjectAnimator.ofFloat(this.stubInstance, View.SCALE_X, 0.0f, 1.0f)), AnimationUtils.decelerate(ObjectAnimator.ofFloat(this.stubInstance, View.SCALE_Y, 0.0f, 1.0f)), AnimationUtils.decelerate(ObjectAnimator.ofInt(this.backgroundDrawable, "alpha", 0, 255)));
        }
        set.setDuration(isViewValid ? 225L : 0L);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.StoryViewDialog.1
            {
                StoryViewDialog.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                StoryViewDialog.this.animationInProgress = false;
                StoryViewDialog.this.storyViewContainer = new StoryViewContainer(StoryViewDialog.this.activity, StoriesController.SourceType.LIST, false, StoryViewDialog.this, StoryViewDialog.this.storiesContainers, StoryViewDialog.this.openStoryUid, null);
                StoryViewDialog.this.draggingContainer.removeAllViews();
                StoryViewDialog.this.draggingContainer.addView(StoryViewDialog.this.storyViewContainer);
                StoryViewDialog.this.storyViewContainer.onResume();
                StoryViewDialog.this.stubInstance = null;
            }
        });
        this.animationInProgress = true;
        if (isViewValid) {
            this.handler.postDelayed(StoryViewDialog$$Lambda$2.lambdaFactory$(set), 120L);
        } else {
            set.start();
        }
    }

    private void startCloseAnimation(View view) {
        boolean isViewValid = isViewValid(view);
        AnimatorSet set = new AnimatorSet();
        if (isViewValid) {
            int viewCenterX = getViewCenterX(view);
            int viewCenterY = getViewCenterY(view);
            int finalW = Screen.realWidth();
            int finalH = Screen.realHeight();
            int finalCenterX = finalW / 2;
            int finalCenterY = finalH / 2;
            view.setScaleX(0.0f);
            view.setScaleY(0.0f);
            set.playTogether(AnimationUtils.decelerate(ObjectAnimator.ofFloat(this.storyViewContainer, View.TRANSLATION_X, viewCenterX - finalCenterX)), AnimationUtils.decelerate(ObjectAnimator.ofFloat(this.storyViewContainer, View.TRANSLATION_Y, viewCenterY - finalCenterY)), AnimationUtils.decelerate(ObjectAnimator.ofFloat(this.storyViewContainer, View.SCALE_X, 0.0f)), AnimationUtils.decelerate(ObjectAnimator.ofFloat(this.storyViewContainer, View.SCALE_Y, 0.0f)), AnimationUtils.decelerate(ObjectAnimator.ofInt(this.backgroundDrawable, "alpha", 0)), ObjectAnimator.ofFloat(view, View.SCALE_X, 1.0f), ObjectAnimator.ofFloat(view, View.SCALE_Y, 1.0f));
        }
        set.setDuration(isViewValid ? 225L : 0L);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.StoryViewDialog.2
            {
                StoryViewDialog.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                StoryViewDialog.this.animationInProgress = false;
                StoryViewDialog.super.dismiss();
            }
        });
        this.animationInProgress = true;
        this.storyViewContainer.pauseStory();
        set.start();
    }

    private void animateToDefaultPosition() {
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(ObjectAnimator.ofFloat(this.storyViewContainer, "translationY", 0.0f), ObjectAnimator.ofFloat(this.storyViewContainer, "scaleY", 1.0f), ObjectAnimator.ofFloat(this.storyViewContainer, "scaleX", 1.0f), ObjectAnimator.ofInt(this.backgroundDrawable, "alpha", this.backgroundDrawable.getAlpha(), 255));
        animatorSet.setDuration(225L);
        animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.StoryViewDialog.3
            {
                StoryViewDialog.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                StoryViewDialog.this.translationY = 0.0f;
                if (StoryViewDialog.this.currentAnimationTargetView != null) {
                    StoryViewDialog.this.currentAnimationTargetView.setScaleX(1.0f);
                    StoryViewDialog.this.currentAnimationTargetView.setScaleY(1.0f);
                }
                StoryViewDialog.this.currentAnimationTargetView = null;
                StoryViewDialog.this.storyViewContainer.playStory();
            }
        });
        animatorSet.start();
    }

    private int getViewCenterX(View v) {
        return v.getScaleX() > 0.9f ? com.vk.attachpicker.util.Utils.getXOnScreen(v) + (v.getWidth() / 2) : com.vk.attachpicker.util.Utils.getXOnScreen(v);
    }

    private int getViewCenterY(View v) {
        return v.getScaleX() > 0.9f ? com.vk.attachpicker.util.Utils.getYOnScreen(v) + (v.getHeight() / 2) : com.vk.attachpicker.util.Utils.getYOnScreen(v);
    }

    private boolean isViewValid(View v) {
        return v != null;
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (this.storyViewContainer == null || !this.storyViewContainer.doDispatchKeyEvent(event)) {
            return super.dispatchKeyEvent(event);
        }
        return true;
    }

    @Override // com.vk.stories.view.StoryViewContainer.ControlCallback
    public void startForResult(Intent intent, int requestCode) {
        this.lifecycleHandler.startActivityForResult(this.lifecycleListener.getUniqueId(), intent, requestCode);
    }

    @Override // com.vk.stories.view.StoryViewContainer.ControlCallback
    public void finish() {
        dismiss();
    }

    @Override // com.vk.stories.view.StoryViewContainer.ControlCallback
    public void scrollStoriesListToAuthorId(int uid) {
        this.animationDataProvider.scrollStoriesListToAuthorId(uid);
    }

    @Override // com.vk.stories.view.StoryViewContainer.ControlCallback
    public boolean noDragGestureInProgress() {
        return this.draggingDown;
    }

    public boolean _internalOnTouchEvent(MotionEvent ev) {
        float targetScale;
        if (this.animationInProgress || this.storyViewContainer == null) {
            return false;
        }
        if (ev.getActionMasked() == 0 || ev.getActionMasked() == 5) {
            if (this.draggingDown || ev.getPointerCount() != 1) {
                return false;
            }
            this.moveStartX = ev.getX();
            this.dragY = ev.getY();
            this.draggingDown = false;
            this.velocityTracker = VelocityTracker.obtain();
            this.velocityTracker.addMovement(ev);
            return false;
        } else if (ev.getActionMasked() == 2) {
            if (ev.getPointerCount() != 1) {
                return false;
            }
            if (this.velocityTracker != null) {
                this.velocityTracker.addMovement(ev);
            }
            float dx = Math.abs(ev.getX() - this.moveStartX);
            float dy = Math.abs(ev.getY() - this.dragY);
            if (!this.draggingDown && dy >= Screen.dp(30) && dy / 2.0f > dx) {
                this.draggingDown = true;
                this.dragY = ev.getY();
                this.currentAnimationTargetView = this.animationDataProvider.getAnimationTargetView(this.storyViewContainer.getCurrentStoryAuthorUid());
                if (this.currentAnimationTargetView != null) {
                    this.currentAnimationTargetView.setScaleX(0.0f);
                    this.currentAnimationTargetView.setScaleY(0.0f);
                }
                this.storyViewContainer.pauseStory();
                return true;
            } else if (this.draggingDown) {
                this.translationY = ev.getY() - this.dragY;
                float maxValue = this.draggingContainer.getHeight() / 2.0f;
                float dragScale = 1.0f - (Math.min(Math.abs(this.translationY), maxValue) / maxValue);
                this.backgroundDrawable.setAlpha((int) Math.max(127.0f, 255.0f * dragScale));
                this.storyViewContainer.setTranslationY(this.translationY);
                if (dragScale >= 0.5f && dragScale <= 1.0f) {
                    targetScale = 0.9f + (0.100000024f * ((dragScale - 0.5f) / 0.5f));
                } else {
                    targetScale = 0.9f;
                }
                this.storyViewContainer.setScaleX(targetScale);
                this.storyViewContainer.setScaleY(targetScale);
                this.storyViewContainer.pauseStory();
                return false;
            } else {
                this.moveStartX = ev.getX();
                return false;
            }
        } else if (ev.getActionMasked() != 3 && ev.getActionMasked() != 1 && ev.getActionMasked() != 6) {
            return false;
        } else {
            if ((ev.getActionMasked() == 1 || ev.getActionMasked() == 6) && this.velocityTracker != null) {
                this.velocityTracker.addMovement(ev);
                this.velocityTracker.computeCurrentVelocity(1000);
            }
            if (this.draggingDown) {
                boolean validVelocity = true;
                if (this.velocityTracker != null) {
                    validVelocity = Math.abs(this.velocityTracker.getYVelocity()) > ((float) this.minimumVelocity) && Math.abs(this.velocityTracker.getYVelocity()) < ((float) this.maximumVelocity);
                }
                if (Math.abs(this.dragY - ev.getY()) > this.draggingContainer.getHeight() / 6.0f || validVelocity) {
                    dismiss();
                } else {
                    animateToDefaultPosition();
                }
                this.draggingDown = false;
            }
            if (ev.getActionMasked() != 3 || this.velocityTracker == null) {
                return false;
            }
            this.velocityTracker.recycle();
            this.velocityTracker = null;
            return false;
        }
    }

    /* loaded from: classes2.dex */
    public class FrameLayoutTouchListener extends FrameLayout {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public FrameLayoutTouchListener(Context context) {
            super(context);
            StoryViewDialog.this = r1;
        }

        @Override // android.view.ViewGroup
        public boolean onInterceptTouchEvent(MotionEvent event) {
            return StoryViewDialog.this._internalOnTouchEvent(event);
        }

        @Override // android.view.View
        public boolean onTouchEvent(MotionEvent event) {
            return StoryViewDialog.this._internalOnTouchEvent(event);
        }
    }
}
