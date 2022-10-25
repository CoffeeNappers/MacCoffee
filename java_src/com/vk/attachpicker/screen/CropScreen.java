package com.vk.attachpicker.screen;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.PopupMenu;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.crop.CropAspectRatio;
import com.vk.attachpicker.crop.CropImageView;
import com.vk.attachpicker.crop.CropUtils;
import com.vk.attachpicker.crop.GeometryState;
import com.vk.attachpicker.crop.RectCropOverlayView;
import com.vk.attachpicker.editor.ImageState;
import com.vk.attachpicker.util.OrientationLocker;
import com.vk.attachpicker.widget.AdjusterView;
import com.vk.core.simplescreen.BaseScreen;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.TimeoutLock;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class CropScreen extends BaseScreen {
    private AdjusterView adjusterView;
    private ImageView aspectRatio;
    private ImageView bgView;
    private View bottomBar;
    private View bottomPanel;
    private View cancel;
    private View controlsPanel;
    private CropImageView cropView;
    private CropAspectRatio currentCropAspectRatio;
    private ObjectAnimator currentResetAnimator;
    private Delegate delegate;
    private View done;
    private boolean exitAnimationStarted;
    private final ImageState imageState;
    private final CropAspectRatio openCropAspectRatio;
    private View reset;
    private View resetContainer;
    private View rotate;
    private TextView rotationLabel;
    private int topPadding;
    private final OrientationLocker orientationLocker = new OrientationLocker();
    private final TimeoutLock buttonLock = new TimeoutLock(1000);
    private boolean controlsEnabled = true;

    /* loaded from: classes2.dex */
    public interface Delegate {
        RectF getDrawingRect(float f);

        void onCrop(Bitmap bitmap, Matrix matrix);

        void onFixedAspectRatioChanged(CropAspectRatio cropAspectRatio);

        void startCropCloseAnimation(RectF rectF);
    }

    public CropScreen(ImageState imageState, Delegate delegate, CropAspectRatio startCropAspectRatio) {
        this.currentCropAspectRatio = CropAspectRatio.CROP_NOT_SELECTED;
        this.imageState = imageState;
        this.delegate = delegate;
        this.openCropAspectRatio = startCropAspectRatio;
        this.currentCropAspectRatio = startCropAspectRatio == null ? CropAspectRatio.CROP_NOT_SELECTED : startCropAspectRatio;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public View createView(LayoutInflater inflater) {
        View view = inflater.inflate(R.layout.picker_screen_crop, (ViewGroup) null);
        this.bgView = (ImageView) view.findViewById(R.id.iv_bg);
        this.cropView = (CropImageView) view.findViewById(R.id.cv_crop);
        this.rotationLabel = (TextView) view.findViewById(R.id.tv_rotation);
        this.adjusterView = (AdjusterView) view.findViewById(R.id.av_adjuster);
        this.aspectRatio = (ImageView) view.findViewById(R.id.iv_aspect_ratio);
        this.rotate = view.findViewById(R.id.iv_rotate);
        this.cancel = view.findViewById(R.id.iv_cancel);
        this.reset = view.findViewById(R.id.tv_reset);
        this.resetContainer = view.findViewById(R.id.fl_reset);
        this.done = view.findViewById(R.id.iv_done);
        this.bottomBar = view.findViewById(R.id.rl_bottom_bar);
        this.controlsPanel = view.findViewById(R.id.fl_controls_panel);
        this.bottomPanel = view.findViewById(R.id.ll_bottom_panel);
        if (this.imageState.getGeometryState() == null || this.imageState.getGeometryState().isDefaultState()) {
            hideResetButton(false);
            resetAdjusterView();
        } else {
            showResetButton(false);
            this.adjusterView.setCurrentScroll(this.imageState.getGeometryState().getRotation());
            this.rotationLabel.setText(String.format("%.1f°", Float.valueOf(this.adjusterView.getCurrentRotation())));
        }
        this.aspectRatio.setOnClickListener(CropScreen$$Lambda$1.lambdaFactory$(this));
        this.cancel.setOnClickListener(CropScreen$$Lambda$2.lambdaFactory$(this));
        this.done.setOnClickListener(CropScreen$$Lambda$3.lambdaFactory$(this));
        this.reset.setOnClickListener(CropScreen$$Lambda$4.lambdaFactory$(this));
        this.adjusterView.setScrollListener(CropScreen$$Lambda$5.lambdaFactory$(this));
        this.adjusterView.setTransparentTouchListener(CropScreen$$Lambda$6.lambdaFactory$(this));
        this.rotate.setOnClickListener(CropScreen$$Lambda$7.lambdaFactory$(this));
        this.cropView.setDelegate(new CropImageView.Delegate() { // from class: com.vk.attachpicker.screen.CropScreen.1
            @Override // com.vk.attachpicker.crop.CropImageView.Delegate
            public void setAdjusterViewTouchEnabled(boolean enabled) {
                CropScreen.this.adjusterView.setTouchEnabled(enabled);
            }

            @Override // com.vk.attachpicker.crop.CropImageView.Delegate
            public void onImageGeometryChange() {
                CropScreen.this.showResetButton(true);
            }

            @Override // com.vk.attachpicker.crop.CropImageView.Delegate
            public void setControlsTouchEnabled(boolean enabled) {
                CropScreen.this.setControlsEnabled(enabled);
            }
        });
        updateAspectRatioIcon();
        this.cropView.setBitmap(this.imageState.getBigBitmap(), this.imageState.getGeometryState(), this.currentCropAspectRatio, false, true);
        this.bgView.setImageBitmap(this.imageState.getCroppedBitmap());
        animateIn();
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$0(View v) {
        showAspectRatioMenu();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$1(View v) {
        if (!checkButtonLock()) {
            resetStateToOpen();
            finish();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$2(View v) {
        if (!checkButtonLock()) {
            this.cropView.cancelPendingAnimations();
            Matrix cropMatrixBefore = new Matrix(this.imageState.getCroppedBitmapMatrix(this.delegate.getDrawingRect(this.imageState.getCroppedBitmapAspectRatio())));
            this.imageState.setGeometryState(this.cropView.getCropController().getGeometryState());
            CropUtils.convertGeometryStateForPreview(this.imageState.getGeometryState(), this.cropView.overlayView().getCropWidth(), this.cropView.overlayView().getX0(), this.cropView.overlayView().getY0());
            this.imageState.getAutoFixedBitmap();
            this.bgView.setImageBitmap(this.imageState.getCroppedBitmap());
            this.delegate.onCrop(this.imageState.getCroppedBitmap(), cropMatrixBefore);
            Picker.runDelayed(CropScreen$$Lambda$11.lambdaFactory$(this), 16L);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$3(View v) {
        this.cropView.reset();
        this.cropView.cancelPendingAnimations();
        this.cropView.enableAll();
        resetAdjusterView();
        hideResetButton(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$4(float scrollAmount) {
        if (Math.abs(scrollAmount) < 0.1d) {
            this.rotationLabel.setText("0°");
        } else {
            this.rotationLabel.setText(String.format("%.1f°", Float.valueOf(this.adjusterView.getCurrentRotation())));
        }
        this.cropView.rotate(scrollAmount);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$createView$5(View v, MotionEvent ev) {
        if (ev.getAction() == 2) {
            this.cropView.enableRotate();
            this.cropView.setLinesVisible(true);
        } else {
            this.cropView.enableAll();
            this.cropView.setLinesVisible(false);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$6(View v) {
        resetAdjusterView();
        this.cropView.rotate90();
        this.cropView.cancelPendingAnimations();
        this.cropView.enableAll();
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onTopPaddingChanged(int topPadding) {
        this.topPadding = topPadding;
        this.cropView.overlayView().setTopSidePadding(RectCropOverlayView.SIDE_PADDING + topPadding);
        if (!this.exitAnimationStarted) {
            this.bgView.setPadding(RectCropOverlayView.SIDE_PADDING, RectCropOverlayView.SIDE_PADDING + topPadding, RectCropOverlayView.SIDE_PADDING, RectCropOverlayView.SIDE_PADDING);
        }
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public boolean onBackPressed() {
        if (this.controlsEnabled) {
            resetStateToOpen();
            Picker.runDelayed(CropScreen$$Lambda$8.lambdaFactory$(this), 16L);
            return true;
        }
        return true;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void finish() {
        this.cropView.cancelPendingAnimations();
        this.cropView.disableAll();
        setControlsEnabled(false);
        animateOut();
    }

    private void resetStateToOpen() {
        this.cropView.cancelPendingAnimations();
        this.cropView.setForcedAspectRatio(CropAspectRatio.CROP_NOT_SELECTED.ar, false);
        RectF newPosition = this.cropView.overlayView().calculatePosition(this.imageState.getCroppedBitmapAspectRatio());
        this.cropView.overlayView().setX0(newPosition.left);
        this.cropView.overlayView().setY0(newPosition.top);
        this.cropView.overlayView().setX1(newPosition.right);
        this.cropView.overlayView().setY1(newPosition.bottom);
        GeometryState gs = this.cropView.getCropController().getGeometryState();
        gs.set(this.imageState.getGeometryState());
        CropUtils.convertGeometryStateForCrop(this.cropView.getCropController().getGeometryState(), this.cropView.overlayView().getCropWidth(), this.cropView.overlayView().getX0(), this.cropView.overlayView().getY0());
        this.cropView.getCropController().updateMatrix();
        this.delegate.onFixedAspectRatioChanged(this.openCropAspectRatio);
    }

    private boolean checkButtonLock() {
        if (this.buttonLock.isLocked()) {
            return true;
        }
        this.buttonLock.lock();
        return false;
    }

    private void animateIn() {
        final Activity activity = getActivity();
        this.cropView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.attachpicker.screen.CropScreen.2
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                CropScreen.this.cropView.getViewTreeObserver().removeOnPreDrawListener(this);
                CropScreen.this.setControlsEnabled(false);
                CropScreen.this.cropView.disableAll();
                AnimatorSet set = new AnimatorSet();
                CropScreen.this.cropView.setAlpha(0.0f);
                CropScreen.this.bottomPanel.setTranslationY(CropScreen.this.bottomPanel.getHeight());
                set.playTogether(AnimationUtils.accelerate(ObjectAnimator.ofFloat(CropScreen.this.cropView, View.ALPHA, 0.0f, 1.0f)), AnimationUtils.decelerate(ObjectAnimator.ofFloat(CropScreen.this.bottomPanel, View.TRANSLATION_Y, CropScreen.this.bottomPanel.getHeight(), 0.0f)));
                set.setDuration(175L);
                set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.CropScreen.2.1
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        CropScreen.this.orientationLocker.unlockOrientation(activity);
                        CropScreen.this.setControlsEnabled(true);
                        CropScreen.this.cropView.enableAll();
                        CropScreen.this.bgView.setVisibility(8);
                    }
                });
                set.setStartDelay(16L);
                set.start();
                return false;
            }
        });
    }

    private void animateOut() {
        setControlsEnabled(false);
        this.cropView.disableAll();
        this.exitAnimationStarted = true;
        final RectF cropRect = this.cropView.overlayView().getCropRect();
        this.bgView.setPadding((int) cropRect.left, (int) cropRect.top, (int) (this.cropView.getMeasuredWidth() - cropRect.right), (int) (this.cropView.getMeasuredHeight() - cropRect.bottom));
        Activity activity = getActivity();
        this.orientationLocker.lockOrientation(activity);
        this.bgView.setVisibility(0);
        AnimatorSet set = new AnimatorSet();
        set.playTogether(AnimationUtils.accelerate(ObjectAnimator.ofFloat(this.cropView, View.ALPHA, 0.0f)), AnimationUtils.accelerate(ObjectAnimator.ofFloat(this.bottomPanel, View.TRANSLATION_Y, this.bottomPanel.getHeight())));
        set.setDuration(175L);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.CropScreen.3
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CropScreen.this.setControlsEnabled(true);
                CropScreen.this.cropView.enableAll();
                CropScreen.super.finish();
                CropScreen.this.delegate.startCropCloseAnimation(cropRect);
            }
        });
        set.start();
    }

    private void updateAspectRatioIcon() {
        if (this.currentCropAspectRatio == CropAspectRatio.CROP_NOT_SELECTED) {
            this.aspectRatio.setColorFilter(ContextCompat.getColor(getActivity(), R.color.picker_dark_icon));
        } else {
            this.aspectRatio.setColorFilter(ContextCompat.getColor(getActivity(), R.color.picker_blue));
        }
    }

    private CharSequence getAspectString(CropAspectRatio aspectRatio) {
        if (this.currentCropAspectRatio == aspectRatio) {
            SpannableString s = new SpannableString(getString(aspectRatio.titleResId));
            s.setSpan(new ForegroundColorSpan(ContextCompat.getColor(getActivity(), R.color.picker_blue)), 0, s.length(), 0);
            return s;
        }
        return getString(aspectRatio.titleResId);
    }

    private void addMenuItem(PopupMenu popupMenu, CropAspectRatio aspectRatio) {
        popupMenu.getMenu().add(0, aspectRatio.id, aspectRatio.id, getAspectString(aspectRatio));
    }

    private void showAspectRatioMenu() {
        PopupMenu popupMenu = new PopupMenu(getActivity(), this.aspectRatio);
        addMenuItem(popupMenu, CropAspectRatio.CROP_NOT_SELECTED);
        addMenuItem(popupMenu, CropAspectRatio.CROP_SQUARE);
        addMenuItem(popupMenu, CropAspectRatio.CROP_3X4);
        addMenuItem(popupMenu, CropAspectRatio.CROP_4X3);
        popupMenu.setOnMenuItemClickListener(CropScreen$$Lambda$9.lambdaFactory$(this));
        popupMenu.show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$showAspectRatioMenu$8(MenuItem item) {
        if (item.getItemId() == CropAspectRatio.CROP_NOT_SELECTED.id) {
            this.currentCropAspectRatio = CropAspectRatio.CROP_NOT_SELECTED;
        } else if (item.getItemId() == CropAspectRatio.CROP_SQUARE.id) {
            this.currentCropAspectRatio = CropAspectRatio.CROP_SQUARE;
        } else if (item.getItemId() == CropAspectRatio.CROP_3X4.id) {
            this.currentCropAspectRatio = CropAspectRatio.CROP_3X4;
        } else if (item.getItemId() == CropAspectRatio.CROP_4X3.id) {
            this.currentCropAspectRatio = CropAspectRatio.CROP_4X3;
        }
        if (this.delegate != null) {
            this.delegate.onFixedAspectRatioChanged(this.currentCropAspectRatio);
        }
        Picker.runDelayed(CropScreen$$Lambda$10.lambdaFactory$(this), 32L);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$7() {
        this.cropView.setForcedAspectRatio(this.currentCropAspectRatio.ar, true);
        updateAspectRatioIcon();
    }

    public void setControlsEnabled(boolean enabled) {
        this.rotate.setEnabled(enabled);
        this.cancel.setEnabled(enabled);
        this.reset.setEnabled(enabled);
        this.done.setEnabled(enabled);
        this.controlsEnabled = enabled;
    }

    private void resetAdjusterView() {
        this.rotationLabel.setText("0°");
        this.adjusterView.setCurrentScroll(0.0f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showResetButton(boolean animated) {
        if (this.currentResetAnimator == null) {
            if (animated) {
                this.resetContainer.setVisibility(0);
                ObjectAnimator anim = ObjectAnimator.ofFloat(this.resetContainer, "alpha", 1.0f);
                anim.setDuration(200L);
                anim.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.CropScreen.4
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        CropScreen.this.currentResetAnimator = null;
                    }
                });
                anim.start();
                this.currentResetAnimator = anim;
                return;
            }
            this.resetContainer.setAlpha(1.0f);
            this.resetContainer.setVisibility(0);
            this.currentResetAnimator = null;
        }
    }

    private void hideResetButton(boolean animated) {
        if (this.currentResetAnimator == null) {
            if (animated) {
                this.resetContainer.setVisibility(0);
                ObjectAnimator anim = ObjectAnimator.ofFloat(this.resetContainer, "alpha", 0.0f);
                anim.setDuration(200L);
                anim.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.CropScreen.5
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        CropScreen.this.resetContainer.setVisibility(4);
                        CropScreen.this.currentResetAnimator = null;
                    }
                });
                anim.start();
                this.currentResetAnimator = anim;
                return;
            }
            this.resetContainer.setAlpha(0.0f);
            this.resetContainer.setVisibility(4);
            this.currentResetAnimator = null;
        }
    }
}
