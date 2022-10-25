package com.vkontakte.android.ui.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ArgbEvaluator;
import android.animation.ObjectAnimator;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import com.vk.core.util.AnimationUtils;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.OsUtil;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class VoiceRecordControlPopupWindow {
    private final int actionColor;
    private final View anchorView;
    private long animStartTime;
    private View cancelButton;
    private View content;
    private final Context context;
    private final int defaultColor;
    private View dismissArea;
    private View dismissButton;
    private final int height;
    private boolean isAnimate;
    private boolean isDragging;
    private final EventListener listener;
    private ObjectAnimator paintAnimator;
    private AnimatedPopupWindow popupWindow;
    private View recButton;
    private AnimatorSet scaleAnimator;
    private View sendButton;
    private final int shiftX;
    private final int shiftYHor;
    private final int shiftYVert;
    private View waveShadowView;
    private WaveRecordCircleView waveformRecordView;
    private final int width;
    private static final int PANEL_NAV_HEIGHT = V.dp(48.0f);
    private static final int DISTANCE_ACTION = V.dp(80.0f);

    /* loaded from: classes3.dex */
    public interface EventListener {
        void onCancel();

        void onMove(float f, int i);

        void onRelease();

        void onSendClick();
    }

    public VoiceRecordControlPopupWindow(Context context, View anchorView, View dismissButton, EventListener listener) {
        this.context = context;
        this.listener = listener;
        this.anchorView = anchorView;
        this.dismissButton = dismissButton;
        this.actionColor = context.getResources().getColor(R.color.red);
        this.defaultColor = context.getResources().getColor(R.color.brand_primary);
        this.width = context.getResources().getDimensionPixelSize(R.dimen.voice_rec_button_width);
        this.height = context.getResources().getDimensionPixelSize(R.dimen.voice_rec_button_height);
        this.shiftX = context.getResources().getDimensionPixelSize(R.dimen.voice_rec_button_shift_x);
        this.shiftYHor = context.getResources().getDimensionPixelSize(R.dimen.voice_rec_button_shift_y_hor);
        this.shiftYVert = context.getResources().getDimensionPixelSize(R.dimen.voice_rec_button_shift_y_vert);
    }

    private void init() {
        View layout = LayoutInflater.from(this.context).inflate(R.layout.voice_record_control, (ViewGroup) null);
        layout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        layout.setOnTouchListener(new OutsideTouchListener());
        this.content = layout.findViewById(R.id.content);
        this.recButton = layout.findViewById(R.id.button_rec);
        this.sendButton = layout.findViewById(R.id.button_send);
        this.cancelButton = layout.findViewById(R.id.button_cancel);
        this.waveShadowView = layout.findViewById(R.id.wave_shadow_view);
        this.dismissArea = layout.findViewById(R.id.button_dismiss_area);
        this.dismissArea.setOnTouchListener(new DismissTouchListener());
        this.sendButton.setOnClickListener(new OnSendClickListener());
        this.recButton.setOnTouchListener(new OnTouchListener());
        this.waveformRecordView = (WaveRecordCircleView) layout.findViewById(R.id.wave_record_circle_view);
        this.anchorView.getRootView().addOnLayoutChangeListener(new OnLayoutChangeListener());
        this.paintAnimator = ObjectAnimator.ofObject(this.waveformRecordView, "paintColor", new ArgbEvaluator(), Integer.valueOf(this.defaultColor), Integer.valueOf(this.actionColor));
        int width = ((ViewGroup) this.anchorView.getParent()).getWidth();
        this.popupWindow = new AnimatedPopupWindow(layout, width, this.height, true);
        this.popupWindow.setInputMethodMode(2);
        this.popupWindow.setBackgroundDrawable(new BitmapDrawable());
        this.popupWindow.setOutsideTouchable(false);
        this.popupWindow.setClippingEnabled(false);
        this.popupWindow.setTouchable(true);
        this.waveformRecordView.setScale(1.8f);
    }

    public void show() {
        if (this.popupWindow == null) {
            init();
        }
        this.dismissButton.getViewTreeObserver().addOnGlobalLayoutListener(VoiceRecordControlPopupWindow$$Lambda$1.lambdaFactory$(this));
        resetButtonView(this.recButton, true);
        resetButtonView(this.sendButton, false);
        resetButtonView(this.cancelButton, false);
        resetButtonView(this.waveShadowView, true);
        this.content.setTranslationX(0.0f);
        if (this.anchorView.getWindowToken() != null) {
            Point position = calcPopupPosition();
            ViewGroup parent = (ViewGroup) this.anchorView.getParent();
            int[] parentLocation = new int[2];
            parent.getLocationOnScreen(parentLocation);
            if (this.popupWindow.isShowing()) {
                this.popupWindow.update(parentLocation[0], position.y, parent.getWidth(), this.height);
                return;
            }
            this.popupWindow.showAtLocation(this.anchorView, 0, parentLocation[0], position.y);
            this.isDragging = true;
            animate(true);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$show$0() {
        if (this.dismissButton.getVisibility() == 0) {
            this.dismissArea.setVisibility(0);
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(this.dismissButton.getWidth(), this.dismissArea.getResources().getDimensionPixelSize(R.dimen.voice_rec_button_size));
            params.gravity = 16;
            this.dismissArea.setLayoutParams(params);
        }
    }

    public void hide() {
        if (this.popupWindow != null && this.popupWindow.isShowing()) {
            animate(false);
        }
    }

    public void dismiss() {
        if (this.popupWindow != null && this.popupWindow.isShowing()) {
            this.popupWindow.dismissSuper();
        }
    }

    public boolean isShowing() {
        return this.popupWindow != null && this.popupWindow.isShowing();
    }

    public View getRecButtonView() {
        return this.recButton;
    }

    private void animate(final boolean show) {
        float scaleStart;
        float shiftStartX;
        float shiftStartY;
        int scaleDelay;
        View curBtn;
        long time = this.isAnimate ? System.currentTimeMillis() - this.animStartTime : 0L;
        if (show) {
            scaleStart = 0.0f;
        } else {
            scaleStart = this.isAnimate ? this.waveformRecordView.getScaleX() : 1.0f;
        }
        float scaleEnd = show ? 1.0f : 0.0f;
        PointF shift = calcContentShift(this.content);
        if (show) {
            shiftStartX = shift.x;
        } else {
            shiftStartX = this.isAnimate ? this.waveformRecordView.getTranslationX() : 0.0f;
        }
        if (show) {
            shiftStartY = shift.y;
        } else {
            shiftStartY = this.isAnimate ? this.waveformRecordView.getTranslationY() : 0.0f;
        }
        float shiftEndX = show ? 0.0f : shift.x;
        float shiftEndY = show ? 0.0f : shift.y;
        long scaleDuration = time == 0 ? 200L : time;
        if (show) {
            scaleDelay = 0;
        } else {
            scaleDelay = time == 0 ? 100 : 0;
        }
        if (isViewVisible(this.recButton)) {
            curBtn = this.recButton;
        } else {
            curBtn = isViewVisible(this.sendButton) ? this.sendButton : this.cancelButton;
        }
        this.scaleAnimator = new AnimatorSet();
        this.scaleAnimator.playTogether(ObjectAnimator.ofFloat(curBtn, View.SCALE_X, scaleStart, scaleEnd), ObjectAnimator.ofFloat(curBtn, View.SCALE_Y, scaleStart, scaleEnd), ObjectAnimator.ofFloat(curBtn, View.TRANSLATION_X, shiftStartX, shiftEndX), ObjectAnimator.ofFloat(curBtn, View.TRANSLATION_Y, shiftStartY, shiftEndY), ObjectAnimator.ofFloat(this.waveShadowView, View.SCALE_X, scaleStart, scaleEnd), ObjectAnimator.ofFloat(this.waveShadowView, View.SCALE_Y, scaleStart, scaleEnd), ObjectAnimator.ofFloat(this.waveShadowView, View.TRANSLATION_X, shiftStartX, shiftEndX), ObjectAnimator.ofFloat(this.waveShadowView, View.TRANSLATION_Y, shiftStartY, shiftEndY), ObjectAnimator.ofFloat(this.waveformRecordView, View.SCALE_X, scaleStart, scaleEnd), ObjectAnimator.ofFloat(this.waveformRecordView, View.SCALE_Y, scaleStart, scaleEnd), ObjectAnimator.ofFloat(this.waveformRecordView, View.TRANSLATION_X, shiftStartX, shiftEndX), ObjectAnimator.ofFloat(this.waveformRecordView, View.TRANSLATION_Y, shiftStartY, shiftEndY));
        this.scaleAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.widget.VoiceRecordControlPopupWindow.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animation) {
                if (animation.equals(VoiceRecordControlPopupWindow.this.scaleAnimator)) {
                    VoiceRecordControlPopupWindow.this.animStartTime = System.currentTimeMillis();
                    VoiceRecordControlPopupWindow.this.isAnimate = true;
                }
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                if (animation.equals(VoiceRecordControlPopupWindow.this.scaleAnimator)) {
                    VoiceRecordControlPopupWindow.this.isAnimate = false;
                    VoiceRecordControlPopupWindow.this.animStartTime = 0L;
                    if (!show && VoiceRecordControlPopupWindow.this.popupWindow != null) {
                        VoiceRecordControlPopupWindow.this.popupWindow.dismissSuper();
                    }
                }
            }
        });
        this.scaleAnimator.setStartDelay(scaleDelay);
        this.scaleAnimator.setDuration(scaleDuration);
        this.scaleAnimator.start();
    }

    public void setAmplitude(Double amplitude) {
        if (this.waveformRecordView != null) {
            this.waveformRecordView.setAmplitude(amplitude);
        }
    }

    public void showSendIcon(boolean show) {
        View toHide = show ? this.recButton : this.sendButton;
        View toShow = show ? this.sendButton : this.recButton;
        V.setVisibilityAnimated(toHide, 8, true, AnimationUtils.DELAY_MID);
        V.setVisibilityAnimated(toShow, 0, true, AnimationUtils.DELAY_MID);
        this.cancelButton.setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Point calcPopupPosition() {
        int[] location = new int[2];
        this.anchorView.getLocationOnScreen(location);
        int screenHeight = getRealScreenSize(this.context).y;
        int bottom = location[1] + this.anchorView.getHeight();
        int shift = screenHeight - bottom >= PANEL_NAV_HEIGHT ? this.shiftYVert : this.shiftYHor;
        int y = (bottom - this.height) + shift;
        int x = location[0] - (this.anchorView.getWidth() / 2);
        return new Point(x, y);
    }

    private PointF calcContentShift(View view) {
        int i = 0;
        int[] location = new int[2];
        this.anchorView.getLocationOnScreen(location);
        int anchorCenterX = location[0] + (this.anchorView.getWidth() / 2);
        int anchorCenterY = location[1] + (this.anchorView.getHeight() / 2);
        Point popup = calcPopupPosition();
        int i2 = popup.x + (this.width / 2);
        if (view.getTranslationX() == 0.0f) {
            i = this.shiftX;
        }
        int viewCenterX = i2 - i;
        int viewCenterY = popup.y + (this.height / 2);
        return new PointF(anchorCenterX - viewCenterX, anchorCenterY - viewCenterY);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeSystemDialogs() {
        if (this.context != null) {
            this.context.sendBroadcast(new Intent("android.intent.action.CLOSE_SYSTEM_DIALOGS"));
        }
    }

    private static boolean isViewVisible(View view) {
        return view != null && view.getVisibility() == 0;
    }

    private static void resetButtonView(View view, boolean show) {
        float f = 1.0f;
        float f2 = 0.0f;
        view.setTranslationX(0.0f);
        view.setTranslationY(0.0f);
        if (show) {
            f2 = 1.0f;
        }
        view.setAlpha(f2);
        view.setScaleX(show ? 1.0f : 0.1f);
        if (!show) {
            f = 0.1f;
        }
        view.setScaleY(f);
        view.setVisibility(show ? 0 : 8);
    }

    private static Point getRealScreenSize(Context context) {
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        Display display = windowManager.getDefaultDisplay();
        if (OsUtil.isAtLeastJB_MR1()) {
            return getRealScreenSize(display);
        }
        try {
            Point size = new Point();
            size.x = ((Integer) Display.class.getMethod("getRawWidth", new Class[0]).invoke(display, new Object[0])).intValue();
            size.y = ((Integer) Display.class.getMethod("getRawHeight", new Class[0]).invoke(display, new Object[0])).intValue();
            return size;
        } catch (Exception e) {
            DisplayMetrics metrics = context.getResources().getDisplayMetrics();
            return new Point(metrics.widthPixels, metrics.heightPixels);
        }
    }

    @TargetApi(17)
    private static Point getRealScreenSize(Display display) {
        Point size = new Point();
        display.getRealSize(size);
        return size;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class OnLayoutChangeListener implements View.OnLayoutChangeListener {
        private long lastUpdateTime;

        private OnLayoutChangeListener() {
        }

        @Override // android.view.View.OnLayoutChangeListener
        public void onLayoutChange(View view, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
            long currentTime = System.currentTimeMillis();
            if (currentTime - this.lastUpdateTime > 100) {
                this.lastUpdateTime = currentTime;
                Point position = VoiceRecordControlPopupWindow.this.calcPopupPosition();
                ViewGroup parent = (ViewGroup) VoiceRecordControlPopupWindow.this.anchorView.getParent();
                int[] parentLocation = new int[2];
                parent.getLocationOnScreen(parentLocation);
                VoiceRecordControlPopupWindow.this.popupWindow.update(parentLocation[0], position.y, parent.getWidth(), VoiceRecordControlPopupWindow.this.height);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class OnSendClickListener implements View.OnClickListener {
        private OnSendClickListener() {
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            VoiceRecordControlPopupWindow.this.listener.onSendClick();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class OnTouchListener extends TouchInBoundsListener {
        private boolean actionState;
        private float dX;

        private OnTouchListener() {
            super();
            this.dX = -1.0f;
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent event) {
            float x = this.dX == -1.0f ? event.getX() : event.getRawX() - this.dX;
            int sftX = VoiceRecordControlPopupWindow.this.content.getLeft() + VoiceRecordControlPopupWindow.this.shiftX;
            float translateX = ((float) sftX) + x > 0.0f ? x : -sftX;
            boolean inBounds = isViewInActionBounds(VoiceRecordControlPopupWindow.this.content, event, ((int) Math.abs(translateX)) / 2);
            switch (event.getAction()) {
                case 0:
                    if (isViewInBounds(VoiceRecordControlPopupWindow.this.content, event)) {
                        Point position = VoiceRecordControlPopupWindow.this.calcPopupPosition();
                        this.dX = position.x + (VoiceRecordControlPopupWindow.this.content.getWidth() / 2);
                    }
                    VoiceRecordControlPopupWindow.this.isDragging = true;
                    return true;
                case 1:
                case 3:
                    if (inBounds) {
                        if (this.actionState) {
                            VoiceRecordControlPopupWindow.this.listener.onCancel();
                        } else {
                            VoiceRecordControlPopupWindow.this.listener.onSendClick();
                        }
                    } else {
                        VoiceRecordControlPopupWindow.this.showSendIcon(true);
                        VoiceRecordControlPopupWindow.this.listener.onRelease();
                    }
                    if (VoiceRecordControlPopupWindow.this.isDragging) {
                        if (!this.actionState || !inBounds) {
                            VoiceRecordControlPopupWindow.this.content.animate().translationX(0.0f).setDuration(100L).start();
                            VoiceRecordControlPopupWindow.this.listener.onMove(0.0f, 100);
                        }
                        if (this.actionState && !inBounds) {
                            VoiceRecordControlPopupWindow.this.paintAnimator.reverse();
                        }
                        VoiceRecordControlPopupWindow.this.isDragging = false;
                        this.dX = -1.0f;
                    }
                    view.setPressed(false);
                    this.actionState = false;
                    return true;
                case 2:
                    if (!VoiceRecordControlPopupWindow.this.isDragging || x >= 0.0f) {
                        return true;
                    }
                    VoiceRecordControlPopupWindow.this.content.animate().translationX(translateX).setDuration(0L).start();
                    VoiceRecordControlPopupWindow.this.listener.onMove(translateX, 0);
                    if (!this.actionState && inBounds && VoiceRecordControlPopupWindow.DISTANCE_ACTION + x <= 0.0f) {
                        changeActionState(true, true);
                        return true;
                    } else if (inBounds && (!this.actionState || VoiceRecordControlPopupWindow.DISTANCE_ACTION + x <= 0.0f)) {
                        return true;
                    } else {
                        changeActionState(false, true);
                        return true;
                    }
                default:
                    view.setPressed(false);
                    return false;
            }
        }

        private void changeActionState(boolean action, boolean visibility) {
            if (this.actionState != action) {
                this.actionState = action;
                if (visibility) {
                    View toShow = action ? VoiceRecordControlPopupWindow.this.cancelButton : VoiceRecordControlPopupWindow.this.recButton;
                    View toHide = action ? VoiceRecordControlPopupWindow.this.recButton : VoiceRecordControlPopupWindow.this.cancelButton;
                    V.setVisibilityAnimated(toHide, 8, true, AnimationUtils.DELAY_MID);
                    V.setVisibilityAnimated(toShow, 0, true, AnimationUtils.DELAY_MID);
                }
                if (action) {
                    VoiceRecordControlPopupWindow.this.paintAnimator.start();
                } else {
                    VoiceRecordControlPopupWindow.this.paintAnimator.reverse();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class DismissTouchListener extends TouchInBoundsListener {
        private DismissTouchListener() {
            super();
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            if (VoiceRecordControlPopupWindow.this.dismissButton.getVisibility() == 0) {
                switch (event.getAction()) {
                    case 0:
                        VoiceRecordControlPopupWindow.this.dismissButton.dispatchTouchEvent(event);
                        return true;
                    case 1:
                        if (isViewInBounds(VoiceRecordControlPopupWindow.this.dismissArea, event)) {
                            VoiceRecordControlPopupWindow.this.dismissButton.performClick();
                            VoiceRecordControlPopupWindow.this.closeSystemDialogs();
                            return true;
                        }
                        event.setAction(3);
                        VoiceRecordControlPopupWindow.this.dismissButton.dispatchTouchEvent(event);
                        return true;
                    default:
                        return true;
                }
            }
            return true;
        }
    }

    /* loaded from: classes3.dex */
    private abstract class TouchInBoundsListener implements View.OnTouchListener {
        private int[] location;
        private Rect outRect;

        private TouchInBoundsListener() {
            this.outRect = new Rect();
            this.location = new int[2];
        }

        protected boolean isViewInBounds(View view, MotionEvent motionEvent) {
            view.getDrawingRect(this.outRect);
            view.getLocationOnScreen(this.location);
            this.outRect.offset(this.location[0], this.location[1]);
            return this.outRect.contains((int) motionEvent.getRawX(), (int) motionEvent.getRawY());
        }

        protected boolean isViewInActionBounds(View view, MotionEvent motionEvent, int margin) {
            view.getLocationOnScreen(this.location);
            return this.location[1] - margin <= ((int) motionEvent.getRawY()) && (this.location[1] + view.getHeight()) + margin >= ((int) motionEvent.getRawY());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class OutsideTouchListener implements View.OnTouchListener {
        private OutsideTouchListener() {
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            VoiceRecordControlPopupWindow.this.popupWindow.dismiss();
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class AnimatedPopupWindow extends PopupWindow {
        public AnimatedPopupWindow(View contentView, int width, int height, boolean focusable) {
            super(contentView, width, height, focusable);
        }

        @Override // android.widget.PopupWindow
        public void dismiss() {
            VoiceRecordControlPopupWindow.this.closeSystemDialogs();
        }

        public void dismissSuper() {
            VoiceRecordControlPopupWindow.this.waveformRecordView.setPaintColor(VoiceRecordControlPopupWindow.this.defaultColor);
            super.dismiss();
        }
    }
}
