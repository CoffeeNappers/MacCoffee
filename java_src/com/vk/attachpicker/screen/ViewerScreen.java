package com.vk.attachpicker.screen;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.IdRes;
import android.support.v4.view.ViewPager;
import android.util.Property;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import com.vk.attachpicker.AttachResulter;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.events.NotificationCenter;
import com.vk.attachpicker.events.NotificationListener;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.util.OrientationLocker;
import com.vk.attachpicker.util.Utils;
import com.vk.attachpicker.widget.AttachCounterView;
import com.vk.attachpicker.widget.ClippingView;
import com.vk.attachpicker.widget.EditButton;
import com.vk.attachpicker.widget.ImageViewerImageView;
import com.vk.attachpicker.widget.LocalImageView;
import com.vk.attachpicker.widget.PagerVideoPlayer;
import com.vk.attachpicker.widget.ViewPagerAdapter;
import com.vk.attachpicker.widget.ViewerToolbar;
import com.vk.attachpicker.widget.VkViewPager;
import com.vk.core.simplescreen.BaseScreen;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.CompatUtils;
import com.vk.core.util.Screen;
import com.vk.core.util.TimeoutLock;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes2.dex */
public class ViewerScreen extends BaseScreen {
    public static final int ANIMATION_DURATION = 250;
    private static final String TAG = "ImageViewer";
    private static final Handler handler = new Handler(Looper.getMainLooper());
    public static final Interpolator interpolator = new AccelerateDecelerateInterpolator();
    private ViewerToolbar actionBarView;
    private ClippingView animatingImageView;
    private AttachCounterView attachCounterView;
    private int bottomPadding;
    private View bottomPanel;
    private FrameLayout containerView;
    private float dragY;
    private EditButton editButton;
    private VkViewPager galleryViewPager;
    private int maximumVelocity;
    private int minimumVelocity;
    private float moveStartX;
    private final int openIndex;
    private Activity parentActivity;
    private PhotoViewerProvider photoViewerProvider;
    private final ArrayList<MediaStoreEntry> photos;
    private final boolean preventStyling;
    private final boolean preventStylingPhoto;
    private final boolean preventStylingVideo;
    private final PhotoViewerProvider provider;
    private final SelectionContext selectionContext;
    private final NotificationListener<Void> selectionUpdateListener;
    private final boolean singleMode;
    private final boolean thumb;
    private final int totalCount;
    private VelocityTracker velocityTracker;
    private long videoMaxLengthMs;
    private FrameLayoutTouchListener windowView;
    private final ColorDrawable backgroundDrawable = new ColorDrawable(Picker.color(R.color.picker_editor_bg));
    private final ColorDrawable backgroundDrawableAnimation = new ColorDrawable(Picker.color(R.color.picker_editor_bg)) { // from class: com.vk.attachpicker.screen.ViewerScreen.1
        {
            ViewerScreen.this = this;
        }

        @Override // android.graphics.drawable.Drawable
        public void setBounds(int left, int top, int right, int bottom) {
            super.setBounds(left, top, right, (int) (bottom - Picker.getContext().getResources().getDimension(R.dimen.picker_viewer_bottom_padding)));
        }
    };
    private final TimeoutLock actionLock = new TimeoutLock(500);
    private final OrientationLocker orientationLocker = new OrientationLocker();
    private int currentPosition = -1;
    private final AtomicBoolean animationInProgress = new AtomicBoolean(false);
    private final AtomicBoolean isVisible = new AtomicBoolean(false);
    private boolean draggingDown = false;
    private float translationY = 0.0f;

    /* loaded from: classes2.dex */
    public interface PhotoViewerProvider {
        PlaceProviderObject getPlaceForPhoto(int i);

        void onPhotoSelected(MediaStoreEntry mediaStoreEntry);

        void onPhotoSwitch(int i, int i2);
    }

    public ViewerScreen(ArrayList<MediaStoreEntry> photos, int openIndex, SelectionContext selectionContext, PhotoViewerProvider provider, boolean preventStyling, boolean preventStylingPhoto, boolean preventStylingVideo, long videoMaxLengthMs, boolean singleMode, boolean thumb) {
        this.openIndex = openIndex;
        this.photos = photos;
        this.totalCount = photos.size();
        this.provider = provider;
        this.selectionContext = selectionContext;
        this.preventStyling = preventStyling;
        this.preventStylingPhoto = preventStylingPhoto;
        this.preventStylingVideo = preventStylingVideo;
        this.singleMode = singleMode;
        this.thumb = thumb;
        this.videoMaxLengthMs = videoMaxLengthMs;
        this.selectionUpdateListener = ViewerScreen$$Lambda$1.lambdaFactory$(this, selectionContext);
    }

    public /* synthetic */ void lambda$new$0(SelectionContext selectionContext, int eventType, int eventId, Void eventArgs) {
        if (this.attachCounterView != null && selectionContext != null) {
            this.attachCounterView.setCount(selectionContext.selectionCount());
        }
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onDestroy() {
        super.onDestroy();
        NotificationCenter.getInstance().removeListener(this.selectionUpdateListener);
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public View createView(LayoutInflater inflater) {
        this.parentActivity = getActivity();
        this.bottomPadding = (int) this.parentActivity.getResources().getDimension(R.dimen.picker_viewer_bottom_padding);
        NotificationCenter.getInstance().addListener(1, this.selectionUpdateListener);
        ViewConfiguration configuration = ViewConfiguration.get(this.parentActivity);
        this.minimumVelocity = configuration.getScaledMinimumFlingVelocity() * 16;
        this.maximumVelocity = configuration.getScaledMaximumFlingVelocity();
        this.windowView = new FrameLayoutTouchListener(this.parentActivity);
        CompatUtils.setBackground(this.windowView, this.backgroundDrawableAnimation);
        this.windowView.setFocusable(false);
        this.parentActivity.getLayoutInflater().inflate(R.layout.picker_layout_image_viewer, this.windowView);
        this.containerView = (FrameLayout) $(R.id.fl_container);
        this.galleryViewPager = (VkViewPager) $(R.id.vp_pager);
        this.actionBarView = (ViewerToolbar) $(R.id.fl_action_bar);
        this.animatingImageView = (ClippingView) $(R.id.cv_animating_view);
        this.editButton = (EditButton) $(R.id.eb_edit_button);
        this.bottomPanel = $(R.id.fl_bottom_button);
        this.attachCounterView = (AttachCounterView) $(R.id.acv_bottom_panel_counter);
        this.attachCounterView.setCount(this.selectionContext.selectionCount());
        this.actionBarView.setOnBackListener(ViewerScreen$$Lambda$2.lambdaFactory$(this));
        if (this.selectionContext != null) {
            if (this.singleMode) {
                this.actionBarView.setOnCheckListener(null);
            } else {
                this.actionBarView.setOnCheckListener(ViewerScreen$$Lambda$3.lambdaFactory$(this));
            }
            if (this.selectionContext.selectionCount() > 0) {
                this.editButton.setVisibility(8);
            } else {
                this.editButton.setVisibility(0);
            }
        } else {
            this.editButton.setVisibility(8);
            this.actionBarView.setOnCheckListener(null);
        }
        this.galleryViewPager.setPageMargin(Screen.dp(10));
        this.galleryViewPager.setOffscreenPageLimit(1);
        this.galleryViewPager.addOnPageChangeListener(new AnonymousClass2());
        if (this.preventStyling) {
            this.editButton.setVisibility(8);
        } else {
            this.editButton.setOnClickListener(ViewerScreen$$Lambda$4.lambdaFactory$(this));
        }
        this.attachCounterView.setOnClickListener(ViewerScreen$$Lambda$5.lambdaFactory$(this));
        return this.windowView;
    }

    public /* synthetic */ void lambda$createView$1(View v) {
        animateOut();
    }

    public /* synthetic */ void lambda$createView$2(View v) {
        if (!SelectionContext.globalCheckLock.isLocked()) {
            SelectionContext.globalCheckLock.lock();
            if (!this.actionLock.isLocked()) {
                this.actionLock.lock();
                MediaStoreEntry storeEntry = getCurrentMediaStoreEntry();
                if (storeEntry != null && !storeEntry.isCorrupted() && this.selectionContext != null && storeEntry != null) {
                    if (this.selectionContext.isSelected(storeEntry)) {
                        this.selectionContext.removeSelection(storeEntry);
                        this.actionBarView.setChecked(this.selectionContext.isSelected(storeEntry));
                    } else {
                        this.selectionContext.addSelection(storeEntry);
                        this.actionBarView.setChecked(this.selectionContext.isSelected(storeEntry));
                    }
                    if (this.preventStyling) {
                        this.editButton.setVisibility(8);
                    } else {
                        setEditButtonVisibility(this.selectionContext.selectionCount() == 0 && !storeEntry.isCorrupted(), true);
                    }
                }
            }
        }
    }

    /* renamed from: com.vk.attachpicker.screen.ViewerScreen$2 */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements ViewPager.OnPageChangeListener {
        AnonymousClass2() {
            ViewerScreen.this = this$0;
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrolled(int i, float v, int i2) {
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageSelected(int i) {
            NotificationCenter.getInstance().fireEvent(5);
            NotificationCenter.getInstance().fireEvent(2);
            ViewerScreen.this.actionBarView.setCurrentPagerPosition(i);
            ViewerScreen.this.onPhotoOpened(i, true);
            ViewerScreen.handler.postDelayed(ViewerScreen$2$$Lambda$1.lambdaFactory$(this, i), 350L);
        }

        public /* synthetic */ void lambda$onPageSelected$0(int i) {
            ViewerScreen.this.setUpPhotoViewAttachers(i);
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int i) {
        }
    }

    public /* synthetic */ void lambda$createView$7(View v) {
        if (!this.actionLock.isLocked()) {
            this.actionLock.lock();
            MediaStoreEntry storeEntry = getCurrentMediaStoreEntry();
            if (storeEntry != null && !storeEntry.isCorrupted()) {
                if (storeEntry.isVideo) {
                    NotificationCenter.getInstance().fireEvent(2);
                    openEditorAnimation(ViewerScreen$$Lambda$11.lambdaFactory$(this, storeEntry));
                    return;
                }
                openEditorAnimation(ViewerScreen$$Lambda$12.lambdaFactory$(this));
            }
        }
    }

    public /* synthetic */ void lambda$null$4(MediaStoreEntry storeEntry) {
        showScreen(new TrimScreen(storeEntry.path, this.videoMaxLengthMs, ViewerScreen$$Lambda$15.lambdaFactory$(this)));
    }

    public /* synthetic */ void lambda$null$3() {
        Picker.run(ViewerScreen$$Lambda$16.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$null$6() {
        showScreen(new EditorScreen(getCurrentMediaStoreEntry(), ViewerScreen$$Lambda$13.lambdaFactory$(this), this.thumb));
    }

    public /* synthetic */ void lambda$null$5() {
        Picker.run(ViewerScreen$$Lambda$14.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$createView$11(View v) {
        MediaStoreEntry entry = getCurrentMediaStoreEntry();
        if (entry != null) {
            if (this.thumb) {
                showScreen(new AvatarAreaSelectionScreen(entry));
            } else if (this.selectionContext.selectionCount() == 0) {
                if (!entry.isCorrupted()) {
                    if (entry.isVideo && this.videoMaxLengthMs > 0 && entry.duration * 1000 > this.videoMaxLengthMs) {
                        openEditorAnimation(ViewerScreen$$Lambda$7.lambdaFactory$(this, entry));
                    } else {
                        ((AttachResulter) this.parentActivity).setResultAndFinish(SelectionContext.packSingleEntry(entry));
                    }
                }
            } else {
                this.selectionContext.addSelection(entry);
                ((AttachResulter) this.parentActivity).setResultAndFinish(this.selectionContext.getPackedSelection());
            }
        }
    }

    public /* synthetic */ void lambda$null$10(MediaStoreEntry entry) {
        TrimScreen trimScreen = new TrimScreen(entry.path, this.videoMaxLengthMs, ViewerScreen$$Lambda$8.lambdaFactory$(this));
        showScreen(trimScreen);
        postDelayed(ViewerScreen$$Lambda$9.lambdaFactory$(trimScreen), 300L);
    }

    public /* synthetic */ void lambda$null$8() {
        Picker.run(ViewerScreen$$Lambda$10.lambdaFactory$(this));
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onTopPaddingChanged(int topPadding) {
        this.actionBarView.setPadding(this.actionBarView.getPaddingLeft(), topPadding, this.actionBarView.getPaddingRight(), this.actionBarView.getPaddingBottom());
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public boolean onBackPressed() {
        if (isAnimationInProgress()) {
            return true;
        }
        if (isVisible()) {
            animateOut();
            return true;
        }
        return false;
    }

    public void realDismiss() {
        super.finish();
    }

    private void setEditButtonVisibility(boolean visible, boolean animated) {
        if (animated) {
            if (visible) {
                this.editButton.setVisibility(0);
                this.editButton.animate().alpha(1.0f).setListener(null).setDuration(200L).start();
                return;
            }
            this.editButton.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.ViewerScreen.3
                {
                    ViewerScreen.this = this;
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ViewerScreen.this.editButton.setVisibility(8);
                }
            }).setDuration(200L).start();
        } else if (visible) {
            this.editButton.setAlpha(1.0f);
            this.editButton.setVisibility(0);
        } else {
            this.editButton.setAlpha(0.0f);
            this.editButton.setVisibility(8);
        }
    }

    private void openEditorAnimation(final Runnable runAfter) {
        this.orientationLocker.lockOrientation(getActivity());
        setAnimationInProgress(true);
        setControlsEnabled(false);
        if (getCurrentZoomableImageView() != null) {
            getCurrentZoomableImageView().setScale(1.0f, true);
        }
        AnimatorSet set = new AnimatorSet();
        set.setInterpolator(AnimationUtils.accelerateInterpolator);
        set.playTogether(ObjectAnimator.ofFloat(this.actionBarView, "alpha", 1.0f, 0.0f), ObjectAnimator.ofFloat(this.editButton, "alpha", 1.0f, 0.0f), ObjectAnimator.ofFloat(this.bottomPanel, "translationY", 0.0f, this.bottomPanel.getHeight()));
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.ViewerScreen.4
            {
                ViewerScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                runAfter.run();
                ViewerScreen.this.setAnimationInProgress(false);
                ViewerScreen.this.setControlsEnabled(true);
            }
        });
        set.setDuration(175L);
        set.start();
    }

    public void closeEditorAnimation() {
        this.orientationLocker.lockOrientation(getActivity());
        setAnimationInProgress(true);
        setControlsEnabled(false);
        AnimatorSet set = new AnimatorSet();
        set.setInterpolator(AnimationUtils.decelerateInterpolator);
        set.playTogether(ObjectAnimator.ofFloat(this.actionBarView, "alpha", 0.0f, 1.0f), ObjectAnimator.ofFloat(this.editButton, "alpha", 0.0f, 1.0f), ObjectAnimator.ofFloat(this.bottomPanel, "translationY", this.bottomPanel.getHeight(), 0.0f));
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.ViewerScreen.5
            {
                ViewerScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                ViewerScreen.this.orientationLocker.unlockOrientation(ViewerScreen.this.getActivity());
                ViewerScreen.this.setAnimationInProgress(false);
                ViewerScreen.this.setControlsEnabled(true);
            }
        });
        set.setDuration(175L);
        set.start();
    }

    public void animateIn() {
        if (!isAnimationInProgress()) {
            onPhotoOpened(this.openIndex, false);
            try {
                if (this.provider != null && this.provider.getPlaceForPhoto(this.openIndex) != null && this.provider.getPlaceForPhoto(this.openIndex).hasImage()) {
                    PlaceProviderObject object = this.provider.getPlaceForPhoto(this.openIndex);
                    this.photoViewerProvider = this.provider;
                    CompatUtils.setBackground(this.windowView, this.backgroundDrawableAnimation);
                    this.backgroundDrawableAnimation.setAlpha(0);
                    this.bottomPanel.setAlpha(0.0f);
                    this.editButton.setAlpha(0.0f);
                    this.actionBarView.setAlpha(0.0f);
                    this.animatingImageView.setAlpha(0.0f);
                    this.containerView.getViewTreeObserver().addOnPreDrawListener(new AnonymousClass6(object));
                } else {
                    this.photoViewerProvider = null;
                    this.backgroundDrawableAnimation.setAlpha(255);
                    this.actionBarView.setAlpha(1.0f);
                    this.bottomPanel.setAlpha(1.0f);
                    this.editButton.setAlpha(1.0f);
                    initPagerAdapter(this.photos);
                    this.galleryViewPager.setCurrentItem(this.openIndex);
                    this.galleryViewPager.setVisibility(0);
                    this.animatingImageView.setVisibility(8);
                    handler.post(new Runnable() { // from class: com.vk.attachpicker.screen.ViewerScreen.7
                        {
                            ViewerScreen.this = this;
                        }

                        @Override // java.lang.Runnable
                        public void run() {
                            ViewerScreen.this.onPhotoOpened(ViewerScreen.this.openIndex, false);
                        }
                    });
                    setControlsEnabled(true);
                    setIsVisible(true);
                }
            } catch (Exception e) {
                L.e(TAG, e);
                closeImageViewerInternal();
                setIsVisible(false);
                setAnimationInProgress(false);
            }
        }
    }

    /* renamed from: com.vk.attachpicker.screen.ViewerScreen$6 */
    /* loaded from: classes2.dex */
    public class AnonymousClass6 implements ViewTreeObserver.OnPreDrawListener {
        final /* synthetic */ PlaceProviderObject val$object;

        AnonymousClass6(PlaceProviderObject placeProviderObject) {
            ViewerScreen.this = this$0;
            this.val$object = placeProviderObject;
        }

        @Override // android.view.ViewTreeObserver.OnPreDrawListener
        public boolean onPreDraw() {
            ViewerScreen.this.containerView.getViewTreeObserver().removeOnPreDrawListener(this);
            ViewerScreen.this.setAnimationInProgress(true);
            ViewerScreen.this.orientationLocker.lockOrientation(ViewerScreen.this.parentActivity);
            ViewerScreen.this.setControlsEnabled(false);
            ViewerScreen.this.galleryViewPager.setVisibility(4);
            ViewerScreen.handler.postDelayed(new AnonymousClass1(), 70L);
            return true;
        }

        /* renamed from: com.vk.attachpicker.screen.ViewerScreen$6$1 */
        /* loaded from: classes2.dex */
        public class AnonymousClass1 implements Runnable {
            AnonymousClass1() {
                AnonymousClass6.this = this$1;
            }

            @Override // java.lang.Runnable
            public void run() {
                int viewX = Utils.getXOnScreen(AnonymousClass6.this.val$object.imageView);
                int viewY = Utils.getYOnScreen(AnonymousClass6.this.val$object.imageView) - ViewerScreen.getStatusBarHeight();
                RectF drawRegion = LocalImageView.computeBounds(AnonymousClass6.this.val$object.imageView.getWidth(), AnonymousClass6.this.val$object.imageView.getHeight(), AnonymousClass6.this.val$object.thumbImageWidth, AnonymousClass6.this.val$object.thumbImageHeight, false);
                ViewerScreen.this.animatingImageView.setVisibility(0);
                ViewerScreen.this.animatingImageView.setImage(AnonymousClass6.this.val$object.entry, false);
                ViewerScreen.this.animatingImageView.setAlpha(1.0f);
                ViewerScreen.this.animatingImageView.setPivotX(0.0f);
                ViewerScreen.this.animatingImageView.setPivotY(0.0f);
                ViewerScreen.this.animatingImageView.setScaleX(1.0f);
                ViewerScreen.this.animatingImageView.setScaleY(1.0f);
                ViewerScreen.this.animatingImageView.setTranslationX(viewX + drawRegion.left);
                ViewerScreen.this.animatingImageView.setTranslationY(viewY + drawRegion.top);
                ViewGroup.LayoutParams layoutParams = ViewerScreen.this.animatingImageView.getLayoutParams();
                layoutParams.width = (int) (drawRegion.right - drawRegion.left);
                layoutParams.height = (int) (drawRegion.bottom - drawRegion.top);
                ViewerScreen.this.animatingImageView.setLayoutParams(layoutParams);
                float scaleX = Screen.width() / layoutParams.width;
                float scaleY = ((Screen.height() - ViewerScreen.getStatusBarHeight()) - ViewerScreen.this.bottomPadding) / layoutParams.height;
                float scale = Math.min(scaleX, scaleY);
                float width = layoutParams.width * scale;
                float height = layoutParams.height * scale;
                float xPos = (Screen.width() - width) / 2.0f;
                float yPos = (((Screen.height() - ViewerScreen.getStatusBarHeight()) - height) - ViewerScreen.this.bottomPadding) / 2.0f;
                int clipHorizontal = (int) Math.abs(drawRegion.left);
                int clipVertical = (int) Math.abs(drawRegion.top);
                ViewerScreen.this.animatingImageView.setClipHorizontal(clipHorizontal);
                ViewerScreen.this.animatingImageView.setClipVertical(clipVertical);
                int[] coords2 = new int[2];
                AnonymousClass6.this.val$object.parentView.getLocationOnScreen(coords2);
                int clipTop = (int) ((coords2[1] - ViewerScreen.getStatusBarHeight()) - (viewY + drawRegion.top));
                if (clipTop < 0) {
                    clipTop = 0;
                }
                int clipBottom = (int) (((viewY + drawRegion.top) + layoutParams.height) - ((coords2[1] + AnonymousClass6.this.val$object.parentView.getHeight()) - ViewerScreen.getStatusBarHeight()));
                if (clipBottom < 0) {
                    clipBottom = 0;
                }
                int clipTop2 = Math.max(clipTop, clipVertical);
                int clipBottom2 = Math.max(clipBottom, clipVertical);
                AnimatorSet animatorSet = new AnimatorSet();
                animatorSet.playTogether(ObjectAnimator.ofFloat(ViewerScreen.this.animatingImageView, View.SCALE_X, scale), ObjectAnimator.ofFloat(ViewerScreen.this.animatingImageView, View.SCALE_Y, scale), ObjectAnimator.ofFloat(ViewerScreen.this.animatingImageView, View.TRANSLATION_X, xPos), ObjectAnimator.ofFloat(ViewerScreen.this.animatingImageView, View.TRANSLATION_Y, yPos), ObjectAnimator.ofInt(ViewerScreen.this.backgroundDrawableAnimation, "alpha", 0, 255), ObjectAnimator.ofInt(ViewerScreen.this.animatingImageView, ClippingView.CLIP_HORIZONTAL, clipHorizontal, 0), ObjectAnimator.ofInt(ViewerScreen.this.animatingImageView, ClippingView.CLIP_TOP, clipTop2, 0), ObjectAnimator.ofInt(ViewerScreen.this.animatingImageView, ClippingView.CLIP_BOTTOM, clipBottom2, 0), ObjectAnimator.ofFloat(ViewerScreen.this.bottomPanel, View.ALPHA, 0.0f, 1.0f), ObjectAnimator.ofFloat(ViewerScreen.this.editButton, View.ALPHA, 0.0f, 1.0f), ObjectAnimator.ofFloat(ViewerScreen.this.actionBarView, View.ALPHA, 0.0f, 1.0f));
                animatorSet.setInterpolator(ViewerScreen.interpolator);
                animatorSet.setDuration(250L);
                animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.ViewerScreen.6.1.1
                    {
                        AnonymousClass1.this = this;
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationStart(Animator animation) {
                        ViewerScreen.handler.postDelayed(new Runnable() { // from class: com.vk.attachpicker.screen.ViewerScreen.6.1.1.1
                            {
                                C02421.this = this;
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                AnonymousClass6.this.val$object.containerView.setVisibility(4);
                            }
                        }, 70L);
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        CompatUtils.setBackground(ViewerScreen.this.windowView, ViewerScreen.this.backgroundDrawable);
                        ViewerScreen.this.initPagerAdapter(ViewerScreen.this.photos);
                        ViewerScreen.this.galleryViewPager.setCurrentItem(ViewerScreen.this.openIndex, false);
                        ViewerScreen.this.galleryViewPager.setVisibility(0);
                        ViewerScreen.this.animatingImageView.setVisibility(8);
                        ViewerScreen.handler.post(new Runnable() { // from class: com.vk.attachpicker.screen.ViewerScreen.6.1.1.2
                            {
                                C02421.this = this;
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                ViewerScreen.this.onPhotoOpened(ViewerScreen.this.openIndex, false);
                            }
                        });
                        ViewerScreen.this.orientationLocker.unlockOrientation(ViewerScreen.this.parentActivity);
                        ViewerScreen.this.setControlsEnabled(true);
                        ViewerScreen.this.setAnimationInProgress(false);
                        ViewerScreen.this.setIsVisible(true);
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationCancel(Animator animation) {
                        onAnimationEnd(animation);
                    }
                });
                animatorSet.setStartDelay(16L);
                animatorSet.start();
            }
        }
    }

    public void animateOut() {
        if (this.parentActivity != null && !isAnimationInProgress()) {
            PlaceProviderObject placeProviderObject = null;
            try {
                if (this.photoViewerProvider != null) {
                    final PlaceProviderObject placeProviderObject2 = this.photoViewerProvider.getPlaceForPhoto(this.currentPosition);
                    float currentZoom = getCurrentZoom();
                    RectF zoomDisplayRect = null;
                    ImageViewerImageView centerImage = getCurrentZoomableImageView();
                    if (centerImage != null) {
                        zoomDisplayRect = centerImage.getDisplayRect();
                    }
                    CompatUtils.setBackground(this.windowView, this.backgroundDrawableAnimation);
                    this.orientationLocker.lockOrientation(this.parentActivity);
                    setAnimationInProgress(true);
                    this.animatingImageView.setVisibility(0);
                    this.galleryViewPager.setVisibility(4);
                    this.galleryViewPager.setAdapter(null);
                    setControlsEnabled(false);
                    RectF drawRegion = null;
                    ViewGroup.LayoutParams layoutParams = this.animatingImageView.getLayoutParams();
                    if (placeProviderObject2 != null && placeProviderObject2.hasImage()) {
                        drawRegion = LocalImageView.computeBounds(placeProviderObject2.imageView.getWidth(), placeProviderObject2.imageView.getHeight(), placeProviderObject2.thumbImageWidth, placeProviderObject2.thumbImageHeight, false);
                        layoutParams.width = (int) (drawRegion.right - drawRegion.left);
                        layoutParams.height = (int) (drawRegion.bottom - drawRegion.top);
                        if (centerImage.hasImage() && Math.abs(centerImage.getImageAspectRatio() - (drawRegion.width() / drawRegion.height())) < 0.001f) {
                            this.animatingImageView.setImage(centerImage.getEntry(), true);
                            drawRegion.set(LocalImageView.computeBounds(placeProviderObject2.imageView.getWidth(), placeProviderObject2.imageView.getHeight(), centerImage.getImageWidth(), centerImage.getImageHeight(), false));
                        } else {
                            this.animatingImageView.setImage(centerImage.getEntry(), false);
                        }
                    } else if (centerImage != null && centerImage.hasImage()) {
                        this.animatingImageView.setImage(centerImage.getEntry(), true);
                        drawRegion = LocalImageView.computeBounds(centerImage.getWidth(), centerImage.getHeight(), centerImage.getImageWidth(), centerImage.getImageHeight(), false);
                    }
                    this.animatingImageView.setLayoutParams(layoutParams);
                    float scaleX = Screen.width() / layoutParams.width;
                    float scaleY = ((Screen.height() - getStatusBarHeight()) - this.bottomPadding) / layoutParams.height;
                    float scale2 = scaleX > scaleY ? scaleY : scaleX;
                    float width = layoutParams.width * currentZoom * scale2 * this.galleryViewPager.getScaleX();
                    float height = layoutParams.height * currentZoom * scale2 * this.galleryViewPager.getScaleY();
                    float xPos = (Screen.width() - width) / 2.0f;
                    float yPos = ((Screen.height() - getStatusBarHeight()) - height) / 2.0f;
                    if (currentZoom == 1.0f || zoomDisplayRect == null) {
                        this.animatingImageView.setTranslationX(xPos);
                        this.animatingImageView.setTranslationY((this.translationY + yPos) - (this.bottomPadding / 2));
                    } else if (zoomDisplayRect != null) {
                        RectF normalizedAnimRect = new RectF(xPos, yPos, xPos + width, yPos + height);
                        float _translationX = zoomDisplayRect.centerX() - normalizedAnimRect.centerX();
                        float _translationY = (zoomDisplayRect.centerY() - normalizedAnimRect.centerY()) + getStatusBarHeight();
                        this.animatingImageView.setTranslationX(xPos + _translationX);
                        this.animatingImageView.setTranslationY((yPos + _translationY) - (this.bottomPadding / 2));
                    }
                    this.animatingImageView.setScaleX(currentZoom * scale2 * this.galleryViewPager.getScaleX());
                    this.animatingImageView.setScaleY(currentZoom * scale2 * this.galleryViewPager.getScaleY());
                    AnimatorSet animatorSet = new AnimatorSet();
                    if (placeProviderObject2 != null) {
                        int clipHorizontal = (int) Math.abs(drawRegion.left);
                        int clipVertical = (int) Math.abs(drawRegion.top);
                        int viewX = Utils.getXOnScreen(placeProviderObject2.imageView);
                        int viewY = Utils.getYOnScreen(placeProviderObject2.imageView) - getStatusBarHeight();
                        int[] coords2 = new int[2];
                        placeProviderObject2.parentView.getLocationOnScreen(coords2);
                        int clipTop = (int) ((coords2[1] - getStatusBarHeight()) - (viewY + drawRegion.top));
                        if (clipTop < 0) {
                            clipTop = 0;
                        }
                        int clipBottom = (int) (((viewY + drawRegion.top) + (drawRegion.bottom - drawRegion.top)) - ((coords2[1] + placeProviderObject2.parentView.getHeight()) - getStatusBarHeight()));
                        if (clipBottom < 0) {
                            clipBottom = 0;
                        }
                        animatorSet.playTogether(ObjectAnimator.ofFloat(this.animatingImageView, View.SCALE_X, 1.0f), ObjectAnimator.ofFloat(this.animatingImageView, View.SCALE_Y, 1.0f), ObjectAnimator.ofFloat(this.animatingImageView, View.TRANSLATION_X, viewX + drawRegion.left), ObjectAnimator.ofFloat(this.animatingImageView, View.TRANSLATION_Y, viewY + drawRegion.top), ObjectAnimator.ofInt(this.backgroundDrawableAnimation, "alpha", 0), ObjectAnimator.ofInt(this.animatingImageView, ClippingView.CLIP_HORIZONTAL, clipHorizontal), ObjectAnimator.ofInt(this.animatingImageView, ClippingView.CLIP_TOP, Math.max(clipTop, clipVertical)), ObjectAnimator.ofInt(this.animatingImageView, ClippingView.CLIP_BOTTOM, Math.max(clipBottom, clipVertical)), ObjectAnimator.ofFloat(this.bottomPanel, View.ALPHA, 1.0f, 0.0f), ObjectAnimator.ofFloat(this.editButton, View.ALPHA, 1.0f, 0.0f), ObjectAnimator.ofFloat(this.actionBarView, View.ALPHA, 1.0f, 0.0f));
                    } else {
                        Animator[] animatorArr = new Animator[6];
                        animatorArr[0] = ObjectAnimator.ofInt(this.backgroundDrawableAnimation, "alpha", 0);
                        animatorArr[1] = ObjectAnimator.ofFloat(this.animatingImageView, View.ALPHA, 0.0f);
                        ClippingView clippingView = this.animatingImageView;
                        Property property = View.TRANSLATION_Y;
                        float[] fArr = new float[1];
                        fArr[0] = this.translationY >= 0.0f ? Screen.height() : -Screen.height();
                        animatorArr[2] = ObjectAnimator.ofFloat(clippingView, property, fArr);
                        animatorArr[3] = ObjectAnimator.ofFloat(this.bottomPanel, View.ALPHA, 1.0f, 0.0f);
                        animatorArr[4] = ObjectAnimator.ofFloat(this.editButton, View.ALPHA, 1.0f, 0.0f);
                        animatorArr[5] = ObjectAnimator.ofFloat(this.actionBarView, View.ALPHA, 1.0f, 0.0f);
                        animatorSet.playTogether(animatorArr);
                    }
                    animatorSet.setDuration(250L);
                    animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.ViewerScreen.8
                        {
                            ViewerScreen.this = this;
                        }

                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationEnd(Animator animation) {
                            ViewerScreen.this.translationY = 0.0f;
                            ViewerScreen.this.galleryViewPager.setTranslationY(0.0f);
                            ViewerScreen.this.galleryViewPager.setScaleX(1.0f);
                            ViewerScreen.this.galleryViewPager.setScaleY(1.0f);
                            ViewerScreen.this.onPhotoClosed(placeProviderObject2);
                            ViewerScreen.this.orientationLocker.unlockOrientation(ViewerScreen.this.parentActivity);
                            ViewerScreen.this.setAnimationInProgress(false);
                            ViewerScreen.this.setIsVisible(false);
                        }

                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationCancel(Animator animation) {
                            onAnimationEnd(animation);
                        }
                    });
                    animatorSet.setInterpolator(interpolator);
                    animatorSet.setStartDelay(16L);
                    animatorSet.start();
                    return;
                }
                this.translationY = 0.0f;
                this.galleryViewPager.setTranslationY(0.0f);
                this.galleryViewPager.setScaleX(1.0f);
                this.galleryViewPager.setScaleY(1.0f);
                this.galleryViewPager.setVisibility(4);
                this.galleryViewPager.setAdapter(null);
                setControlsEnabled(false);
                onPhotoClosed(null);
                this.orientationLocker.unlockOrientation(this.parentActivity);
                setIsVisible(false);
            } catch (Exception e) {
                L.e(TAG, e);
                this.translationY = 0.0f;
                this.galleryViewPager.setTranslationY(0.0f);
                this.galleryViewPager.setScaleX(1.0f);
                this.galleryViewPager.setScaleY(1.0f);
                if (0 != 0) {
                    placeProviderObject.containerView.setVisibility(0);
                }
                closeImageViewerInternal();
                this.orientationLocker.unlockOrientation(this.parentActivity);
                setIsVisible(false);
                setAnimationInProgress(false);
            }
        }
    }

    public void setAnimationInProgress(boolean isAnimationInProgress) {
        this.animationInProgress.set(isAnimationInProgress);
    }

    public boolean isAnimationInProgress() {
        return this.animationInProgress.get();
    }

    public void setIsVisible(boolean isVisible) {
        this.isVisible.set(isVisible);
    }

    public boolean isVisible() {
        return this.isVisible.get();
    }

    /* loaded from: classes2.dex */
    public static class PlaceProviderObject {
        public View containerView;
        public MediaStoreEntry entry;
        public LocalImageView imageView;
        public int index;
        public View parentView;
        public int thumbImageHeight;
        public int thumbImageWidth;

        public boolean hasImage() {
            return this.thumbImageWidth > 0 && this.thumbImageHeight > 0;
        }
    }

    public void setControlsEnabled(boolean enabled) {
    }

    public void onPhotoOpened(int index, boolean animated) {
        if (this.photoViewerProvider != null) {
            this.photoViewerProvider.onPhotoSwitch(this.currentPosition, index);
        }
        this.actionBarView.setTitle(this.parentActivity.getString(R.string.picker_d_of_d, new Object[]{Integer.valueOf(index + 1), Integer.valueOf(this.totalCount)}));
        this.actionBarView.setChecked(this.selectionContext.isSelected(this.photos.get(index)));
        this.editButton.setTrimMode(this.photos.get(index).isVideo);
        if (this.preventStyling || ((this.preventStylingPhoto && !this.photos.get(index).isVideo) || (this.preventStylingVideo && this.photos.get(index).isVideo))) {
            setEditButtonVisibility(false, animated);
        } else {
            setEditButtonVisibility(this.selectionContext.selectionCount() == 0 && !this.photos.get(index).isCorrupted(), animated);
        }
        this.currentPosition = index;
    }

    public void onPhotoClosed(PlaceProviderObject object) {
        if (object != null) {
            object.containerView.setVisibility(0);
        }
        this.currentPosition = -1;
        this.windowView.post(new Runnable() { // from class: com.vk.attachpicker.screen.ViewerScreen.9
            {
                ViewerScreen.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                ViewerScreen.this.closeImageViewer();
            }
        });
    }

    public void initPagerAdapter(final ArrayList<MediaStoreEntry> photos) {
        this.galleryViewPager.setAdapter(new ViewPagerAdapter() { // from class: com.vk.attachpicker.screen.ViewerScreen.10
            final Activity activity;

            {
                ViewerScreen.this = this;
                this.activity = ViewerScreen.this.parentActivity;
            }

            @Override // com.vk.attachpicker.widget.ViewPagerAdapter
            public View getView(int position, ViewPager pager) {
                FrameLayout fl = new FrameLayout(this.activity);
                MediaStoreEntry entry = (MediaStoreEntry) photos.get(position);
                ImageViewerImageView iv = new ImageViewerImageView(this.activity, position);
                iv.displayImage((MediaStoreEntry) photos.get(position));
                fl.addView(iv);
                if (entry.isCorrupted()) {
                    iv.setZoomable(false);
                }
                if (entry.isVideo && !entry.isCorrupted()) {
                    iv.setZoomable(false);
                    PagerVideoPlayer videoPlayer = new PagerVideoPlayer(this.activity, entry.path, position);
                    fl.addView(videoPlayer);
                }
                return fl;
            }

            @Override // android.support.v4.view.PagerAdapter
            public int getCount() {
                return photos.size();
            }
        });
    }

    private ImageViewerImageView getCurrentZoomableImageView() {
        if (this.galleryViewPager != null) {
            ImageViewerImageView[] array = new ImageViewerImageView[1];
            Screen.iterateOverViews(this.galleryViewPager, ViewerScreen$$Lambda$6.lambdaFactory$(this, array));
            return array[0];
        }
        return null;
    }

    public /* synthetic */ void lambda$getCurrentZoomableImageView$12(ImageViewerImageView[] array, View view) {
        if ((view instanceof ImageViewerImageView) && ((ImageViewerImageView) view).getPosition() == this.currentPosition) {
            array[0] = (ImageViewerImageView) view;
        }
    }

    private float getCurrentZoom() {
        ImageViewerImageView currentImageView = getCurrentZoomableImageView();
        if (currentImageView != null) {
            return currentImageView.getScale();
        }
        return 1.0f;
    }

    private MediaStoreEntry getCurrentMediaStoreEntry() {
        return this.photos.get(this.galleryViewPager.getCurrentItem());
    }

    public void setUpPhotoViewAttachers(final int currentPosition) {
        if (this.galleryViewPager != null) {
            Screen.iterateOverViews(this.galleryViewPager, new Screen.ViewCallback() { // from class: com.vk.attachpicker.screen.ViewerScreen.11
                {
                    ViewerScreen.this = this;
                }

                @Override // com.vk.core.util.Screen.ViewCallback
                public void view(View view) {
                    if (view instanceof ImageViewerImageView) {
                        ImageViewerImageView biv = (ImageViewerImageView) view;
                        biv.updatePhotoViewAttacher();
                        biv.setCurrentPositionInImageViewer(currentPosition);
                    }
                }
            });
        }
    }

    private void animateViewPagerToDefaultPosition() {
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(ObjectAnimator.ofFloat(this.galleryViewPager, "translationY", 0.0f), ObjectAnimator.ofFloat(this.galleryViewPager, "scaleY", 1.0f), ObjectAnimator.ofFloat(this.galleryViewPager, "scaleX", 1.0f), ObjectAnimator.ofInt(this.backgroundDrawableAnimation, "alpha", this.backgroundDrawableAnimation.getAlpha(), 255), ObjectAnimator.ofInt(this.backgroundDrawable, "alpha", this.backgroundDrawable.getAlpha(), 255));
        animatorSet.setDuration(250L);
        animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.ViewerScreen.12
            {
                ViewerScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                ViewerScreen.this.translationY = 0.0f;
                ViewerScreen.this.orientationLocker.unlockOrientation(ViewerScreen.this.parentActivity);
            }
        });
        animatorSet.start();
    }

    public void closeImageViewer() {
        try {
            AnimatorSet set = new AnimatorSet();
            set.playTogether(ObjectAnimator.ofFloat(this.animatingImageView, "alpha", 1.0f, 0.0f));
            set.setDuration(83L);
            set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.ViewerScreen.13
                {
                    ViewerScreen.this = this;
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    super.onAnimationEnd(animation);
                    ViewerScreen.this.closeImageViewerInternal();
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation) {
                    super.onAnimationCancel(animation);
                    onAnimationEnd(animation);
                }
            });
            set.start();
        } catch (Exception e) {
            L.e(TAG, e);
        }
    }

    public void closeImageViewerInternal() {
        try {
            this.translationY = 0.0f;
            this.galleryViewPager.setTranslationY(0.0f);
            this.galleryViewPager.setScaleX(1.0f);
            this.galleryViewPager.setScaleY(1.0f);
            this.animatingImageView.setImageBitmap(null);
            realDismiss();
            if (this.animatingImageView != null) {
                this.animatingImageView.setAlpha(1.0f);
            }
        } catch (Exception e) {
            L.e(TAG, e);
        }
    }

    public final <T extends View> T $(@IdRes int id) {
        return (T) this.windowView.findViewById(id);
    }

    public boolean _internalOnTouchEvent(MotionEvent ev) {
        float targetScale;
        if (isAnimationInProgress() || this.photoViewerProvider == null) {
            return false;
        }
        if (ev.getActionMasked() == 0 || ev.getActionMasked() == 5) {
            if (this.draggingDown || ev.getPointerCount() != 1) {
                return false;
            }
            this.moveStartX = ev.getX();
            this.dragY = ev.getY();
            this.draggingDown = false;
            this.orientationLocker.lockOrientation(this.parentActivity);
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
            if (!this.draggingDown && getCurrentZoom() == 1.0f && dy >= Screen.dp(30) && dy / 2.0f > dx) {
                this.draggingDown = true;
                this.dragY = ev.getY();
                return true;
            } else if (this.draggingDown) {
                this.translationY = ev.getY() - this.dragY;
                float maxValue = this.windowView.getHeight() / 2.0f;
                float dragScale = 1.0f - (Math.min(Math.abs(this.translationY), maxValue) / maxValue);
                this.backgroundDrawableAnimation.setAlpha((int) Math.max(127.0f, 255.0f * dragScale));
                this.backgroundDrawable.setAlpha((int) Math.max(127.0f, 255.0f * dragScale));
                this.galleryViewPager.setTranslationY(this.translationY);
                if (dragScale >= 0.5f && dragScale <= 1.0f) {
                    targetScale = 0.9f + (0.100000024f * ((dragScale - 0.5f) / 0.5f));
                } else {
                    targetScale = 0.9f;
                }
                this.galleryViewPager.setScaleX(targetScale);
                this.galleryViewPager.setScaleY(targetScale);
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
                if (Math.abs(this.dragY - ev.getY()) > this.windowView.getHeight() / 6.0f || validVelocity) {
                    animateOut();
                } else {
                    animateViewPagerToDefaultPosition();
                }
                this.draggingDown = false;
            } else {
                this.orientationLocker.unlockOrientation(this.parentActivity);
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
            ViewerScreen.this = r1;
        }

        @Override // android.view.ViewGroup
        public boolean onInterceptTouchEvent(MotionEvent event) {
            return ViewerScreen.this._internalOnTouchEvent(event);
        }

        @Override // android.view.View
        public boolean onTouchEvent(MotionEvent event) {
            return ViewerScreen.this._internalOnTouchEvent(event);
        }
    }

    public static int getStatusBarHeight() {
        if (VKApplication.context.getResources().getBoolean(R.bool.picker_transparent_status_bar)) {
            return 0;
        }
        int result = Screen.dp(24);
        int resourceId = VKApplication.context.getResources().getIdentifier("status_bar_height", "dimen", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        if (resourceId > 0) {
            int result2 = VKApplication.context.getResources().getDimensionPixelSize(resourceId);
            return result2;
        }
        return result;
    }
}
