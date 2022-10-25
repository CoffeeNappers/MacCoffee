package com.vk.attachpicker.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class EditButton extends FrameLayout {
    private static final long ANIMATION_DURATION = 300;
    private static final long CHANGE_PERIOD = 1500;
    private static final int[] ICONS = {R.drawable.picker_ic_smiles_24dp, R.drawable.picker_ic_text_24dp, R.drawable.picker_ic_drawing_24dp, R.drawable.picker_ic_crop_rotate_24dp, R.drawable.picker_ic_magic_24dp};
    private static final int TRIM_ICON = 2130838399;
    private int currentIconIndex;
    private final Handler handler;
    private ImageView icon1;
    private ImageView icon2;
    private final Runnable iconChangeRunnable;
    private boolean isAttachedToWindow;
    private boolean trimMode;
    private boolean trimModeSetDone;

    public EditButton(Context context) {
        super(context);
        this.handler = new Handler(Looper.getMainLooper());
        this.iconChangeRunnable = new Runnable() { // from class: com.vk.attachpicker.widget.EditButton.1
            @Override // java.lang.Runnable
            public void run() {
                int resId;
                if (EditButton.this.isAttachedToWindow && EditButton.this.getVisibility() == 0) {
                    if (!EditButton.this.trimMode || !EditButton.this.trimModeSetDone) {
                        if (!EditButton.this.trimMode) {
                            EditButton.this.currentIconIndex = (EditButton.this.currentIconIndex + 1) % EditButton.ICONS.length;
                            resId = EditButton.ICONS[EditButton.this.currentIconIndex];
                        } else {
                            resId = R.drawable.picker_ic_video_trim_24dp;
                        }
                        AnimatorSet set = EditButton.this.icon1.getVisibility() == 0 ? EditButton.createImageChangeSet(EditButton.this.icon1, EditButton.this.icon2, resId) : EditButton.createImageChangeSet(EditButton.this.icon2, EditButton.this.icon1, resId);
                        set.start();
                        EditButton.this.trimModeSetDone = EditButton.this.trimMode;
                        if (!EditButton.this.trimMode) {
                            EditButton.this.handler.postDelayed(EditButton.this.iconChangeRunnable, 1800L);
                        }
                    }
                }
            }
        };
        init();
    }

    public EditButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.handler = new Handler(Looper.getMainLooper());
        this.iconChangeRunnable = new Runnable() { // from class: com.vk.attachpicker.widget.EditButton.1
            @Override // java.lang.Runnable
            public void run() {
                int resId;
                if (EditButton.this.isAttachedToWindow && EditButton.this.getVisibility() == 0) {
                    if (!EditButton.this.trimMode || !EditButton.this.trimModeSetDone) {
                        if (!EditButton.this.trimMode) {
                            EditButton.this.currentIconIndex = (EditButton.this.currentIconIndex + 1) % EditButton.ICONS.length;
                            resId = EditButton.ICONS[EditButton.this.currentIconIndex];
                        } else {
                            resId = R.drawable.picker_ic_video_trim_24dp;
                        }
                        AnimatorSet set = EditButton.this.icon1.getVisibility() == 0 ? EditButton.createImageChangeSet(EditButton.this.icon1, EditButton.this.icon2, resId) : EditButton.createImageChangeSet(EditButton.this.icon2, EditButton.this.icon1, resId);
                        set.start();
                        EditButton.this.trimModeSetDone = EditButton.this.trimMode;
                        if (!EditButton.this.trimMode) {
                            EditButton.this.handler.postDelayed(EditButton.this.iconChangeRunnable, 1800L);
                        }
                    }
                }
            }
        };
        init();
    }

    public EditButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.handler = new Handler(Looper.getMainLooper());
        this.iconChangeRunnable = new Runnable() { // from class: com.vk.attachpicker.widget.EditButton.1
            @Override // java.lang.Runnable
            public void run() {
                int resId;
                if (EditButton.this.isAttachedToWindow && EditButton.this.getVisibility() == 0) {
                    if (!EditButton.this.trimMode || !EditButton.this.trimModeSetDone) {
                        if (!EditButton.this.trimMode) {
                            EditButton.this.currentIconIndex = (EditButton.this.currentIconIndex + 1) % EditButton.ICONS.length;
                            resId = EditButton.ICONS[EditButton.this.currentIconIndex];
                        } else {
                            resId = R.drawable.picker_ic_video_trim_24dp;
                        }
                        AnimatorSet set = EditButton.this.icon1.getVisibility() == 0 ? EditButton.createImageChangeSet(EditButton.this.icon1, EditButton.this.icon2, resId) : EditButton.createImageChangeSet(EditButton.this.icon2, EditButton.this.icon1, resId);
                        set.start();
                        EditButton.this.trimModeSetDone = EditButton.this.trimMode;
                        if (!EditButton.this.trimMode) {
                            EditButton.this.handler.postDelayed(EditButton.this.iconChangeRunnable, 1800L);
                        }
                    }
                }
            }
        };
        init();
    }

    private void init() {
        setPadding(Screen.dp(12), 0, Screen.dp(20), 0);
        LayoutInflater.from(getContext()).inflate(R.layout.picker_layout_edit_button, this);
        this.icon1 = (ImageView) findViewById(R.id.iv_icon_1);
        this.icon2 = (ImageView) findViewById(R.id.iv_icon_2);
    }

    public boolean isTrimMode() {
        return this.trimMode;
    }

    public void setTrimMode(boolean trimMode) {
        if (this.trimMode != trimMode) {
            this.trimMode = trimMode;
            this.trimModeSetDone = false;
            this.handler.removeCallbacks(this.iconChangeRunnable);
            this.handler.postDelayed(this.iconChangeRunnable, 0L);
        }
    }

    @Override // android.view.View
    public void setVisibility(int visibility) {
        int prevVisibility = getVisibility();
        super.setVisibility(visibility);
        if (visibility == 0) {
            if (prevVisibility != 0) {
                start();
                return;
            }
            return;
        }
        stop();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.isAttachedToWindow = true;
        start();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.isAttachedToWindow = false;
        stop();
    }

    private void start() {
        if (getVisibility() == 0) {
            this.icon1.setVisibility(0);
            this.icon1.setAlpha(1.0f);
            this.icon1.setScaleX(1.0f);
            this.icon1.setScaleY(1.0f);
            this.icon1.setImageResource(this.trimMode ? R.drawable.picker_ic_video_trim_24dp : ICONS[0]);
            this.icon2.setVisibility(4);
            this.currentIconIndex = 0;
            this.handler.removeCallbacks(this.iconChangeRunnable);
            this.handler.postDelayed(this.iconChangeRunnable, this.trimMode ? 0L : CHANGE_PERIOD);
            return;
        }
        this.handler.removeCallbacks(this.iconChangeRunnable);
    }

    private void stop() {
        this.handler.removeCallbacks(this.iconChangeRunnable);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static AnimatorSet createImageChangeSet(final ImageView icon1, ImageView icon2, final int resId) {
        icon2.setImageResource(resId);
        icon2.setAlpha(1.0f);
        icon2.setVisibility(0);
        AnimatorSet set = new AnimatorSet();
        set.playTogether(ObjectAnimator.ofFloat(icon2, "scaleX", 0.0f, 1.0f), ObjectAnimator.ofFloat(icon2, "scaleY", 0.0f, 1.0f), ObjectAnimator.ofFloat(icon1, "scaleX", 1.0f, 0.0f), ObjectAnimator.ofFloat(icon1, "scaleY", 1.0f, 0.0f), ObjectAnimator.ofFloat(icon1, "alpha", 1.0f, 0.0f));
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.widget.EditButton.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                icon1.setVisibility(4);
                if (resId == R.drawable.picker_ic_video_trim_24dp) {
                    icon1.setImageResource(resId);
                    icon1.setVisibility(0);
                    icon1.setScaleX(1.0f);
                    icon1.setScaleY(1.0f);
                    icon1.setAlpha(1.0f);
                    icon1.setVisibility(4);
                }
            }
        });
        set.setDuration(ANIMATION_DURATION);
        return set;
    }
}
