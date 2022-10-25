package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.attachpicker.events.NotificationCenter;
import com.vk.attachpicker.events.NotificationListener;
import com.vk.attachpicker.widget.PagerVideoPlayer;
import com.vk.attachpicker.widget.VkSeekBar;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class ViewerToolbar extends LinearLayout {
    private static final int MAX_WIDTH = Screen.realWidth() + Screen.dp(16);
    private final int SHADOW_HEIGHT;
    private TextView actionBarTitle;
    private View back;
    private final Paint bgPaint;
    private ImageButton buttonCheck;
    private int currentPagerPosition;
    private TextView currentProgress;
    private int currentVideoDuration;
    private final NotificationListener hideProgressListener;
    private float prevProgress;
    private Drawable shadowDrawable;
    private final NotificationListener showProgressListener;
    private TextView totalDuration;
    private VkSeekBar videoProgress;
    private FrameLayout videoProgressContainer;
    private final NotificationListener<PagerVideoPlayer.VideoProgress> videoProgressUpdate;

    public ViewerToolbar(Context context) {
        super(context);
        this.SHADOW_HEIGHT = Screen.dp(8);
        this.bgPaint = new Paint();
        this.showProgressListener = ViewerToolbar$$Lambda$1.lambdaFactory$(this);
        this.hideProgressListener = ViewerToolbar$$Lambda$2.lambdaFactory$(this);
        this.videoProgressUpdate = ViewerToolbar$$Lambda$3.lambdaFactory$(this);
        init();
    }

    public ViewerToolbar(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.SHADOW_HEIGHT = Screen.dp(8);
        this.bgPaint = new Paint();
        this.showProgressListener = ViewerToolbar$$Lambda$4.lambdaFactory$(this);
        this.hideProgressListener = ViewerToolbar$$Lambda$5.lambdaFactory$(this);
        this.videoProgressUpdate = ViewerToolbar$$Lambda$6.lambdaFactory$(this);
        init();
    }

    public ViewerToolbar(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.SHADOW_HEIGHT = Screen.dp(8);
        this.bgPaint = new Paint();
        this.showProgressListener = ViewerToolbar$$Lambda$7.lambdaFactory$(this);
        this.hideProgressListener = ViewerToolbar$$Lambda$8.lambdaFactory$(this);
        this.videoProgressUpdate = ViewerToolbar$$Lambda$9.lambdaFactory$(this);
        init();
    }

    private void init() {
        setWillNotDraw(false);
        setPadding(0, 0, 0, Screen.dp(8));
        setOrientation(0);
        LayoutInflater.from(getContext()).inflate(R.layout.picker_layout_viewer_toolbar, this);
        this.bgPaint.setColor(-218103809);
        this.shadowDrawable = ContextCompat.getDrawable(getContext(), R.drawable.picker_bg_attach_toolbar);
        this.shadowDrawable.setCallback(this);
        this.back = findViewById(R.id.ll_back);
        this.actionBarTitle = (TextView) findViewById(R.id.tv_title);
        this.buttonCheck = (ImageButton) findViewById(R.id.button_check);
        this.videoProgressContainer = (FrameLayout) findViewById(R.id.fl_video_progress);
        this.currentProgress = (TextView) this.videoProgressContainer.findViewById(R.id.tv_current_progress);
        this.totalDuration = (TextView) this.videoProgressContainer.findViewById(R.id.tv_duration);
        this.videoProgress = (VkSeekBar) this.videoProgressContainer.findViewById(R.id.vsb_video_progress);
        this.videoProgress.setLimitWidth(false);
        this.videoProgress.setOnSeekBarChangeListener(ViewerToolbar$$Lambda$10.lambdaFactory$(this));
        this.videoProgress.setStateListener(new VkSeekBar.OnSeekBarStateListener() { // from class: com.vk.attachpicker.widget.ViewerToolbar.1
            long moveStartTime;

            @Override // com.vk.attachpicker.widget.VkSeekBar.OnSeekBarStateListener
            public void onMoveBegin() {
                ViewerToolbar.this.prevProgress = 0.0f;
                this.moveStartTime = System.currentTimeMillis();
                NotificationCenter.getInstance().fireEvent(6, ViewerToolbar.this.currentPagerPosition);
            }

            @Override // com.vk.attachpicker.widget.VkSeekBar.OnSeekBarStateListener
            public void onMoveEnd(float currentValue) {
                ViewerToolbar.this.prevProgress = 0.0f;
                if (System.currentTimeMillis() - this.moveStartTime > 200) {
                    NotificationCenter.getInstance().fireEvent(8, ViewerToolbar.this.currentPagerPosition, Float.valueOf(currentValue));
                }
                NotificationCenter.getInstance().fireEvent(7, ViewerToolbar.this.currentPagerPosition);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$0(VkSeekBar bar, float value) {
        if (this.currentVideoDuration > 0) {
            this.currentProgress.setText(millisToText((int) (this.currentVideoDuration * value)));
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.videoProgressContainer.setAlpha(0.0f);
        this.actionBarTitle.setAlpha(1.0f);
        NotificationCenter.getInstance().addListener(4, this.showProgressListener);
        NotificationCenter.getInstance().addListener(5, this.hideProgressListener);
        NotificationCenter.getInstance().addListener(3, this.videoProgressUpdate);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        NotificationCenter.getInstance().removeListener(this.showProgressListener);
        NotificationCenter.getInstance().removeListener(this.hideProgressListener);
        NotificationCenter.getInstance().removeListener(this.videoProgressUpdate);
        super.onDetachedFromWindow();
    }

    public void setOnBackListener(View.OnClickListener listener) {
        this.back.setOnClickListener(listener);
    }

    public void setOnCheckListener(View.OnClickListener listener) {
        if (listener == null) {
            this.buttonCheck.setVisibility(8);
            this.buttonCheck.setOnClickListener(null);
            return;
        }
        this.buttonCheck.setVisibility(0);
        this.buttonCheck.setOnClickListener(listener);
    }

    public void setTitle(String title) {
        this.actionBarTitle.setText(title);
    }

    public void setChecked(boolean checked) {
        if (checked) {
            this.buttonCheck.setImageResource(R.drawable.picker_ic_check_fill_24dp);
            this.buttonCheck.setColorFilter(ContextCompat.getColor(getContext(), R.color.picker_selection_blue));
            return;
        }
        this.buttonCheck.setImageResource(R.drawable.picker_ic_check_outline_24dp);
        this.buttonCheck.setColorFilter(ContextCompat.getColor(getContext(), R.color.picker_dark_icon));
    }

    public void setCurrentPagerPosition(int currentPagerPosition) {
        this.currentPagerPosition = currentPagerPosition;
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, View.MeasureSpec.makeMeasureSpec(((int) getResources().getDimension(R.dimen.picker_toolbar_height)) + getPaddingTop() + getPaddingBottom(), 1073741824));
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w > MAX_WIDTH) {
            this.actionBarTitle.setTextSize(16.0f);
        } else {
            this.actionBarTitle.setTextSize(20.0f);
        }
        if (this.shadowDrawable != null) {
            this.shadowDrawable.setBounds(0, h - this.SHADOW_HEIGHT, w, h);
        }
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        canvas.drawRect(0.0f, 0.0f, canvas.getWidth(), canvas.getHeight() - getPaddingBottom(), this.bgPaint);
        super.draw(canvas);
        if (this.shadowDrawable != null) {
            this.shadowDrawable.draw(canvas);
        }
    }

    private String millisToText(int millis) {
        long seconds = millis / 1000;
        long absSeconds = Math.abs(seconds);
        String positive = String.format("%01d:%02d", Long.valueOf((absSeconds % 3600) / 60), Long.valueOf(absSeconds % 60));
        return positive;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(int eventType, int eventId, Object eventArgs) {
        if (eventArgs != null && (eventArgs instanceof Integer) && ((Integer) eventArgs).intValue() == this.currentPagerPosition) {
            this.actionBarTitle.animate().alpha(0.0f).setDuration(200L).start();
            this.videoProgressContainer.animate().alpha(1.0f).setDuration(200L).start();
        }
        this.prevProgress = 0.0f;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$2(int eventType, int eventId, Object eventArgs) {
        if (eventArgs != null && (eventArgs instanceof Integer) && ((Integer) eventArgs).intValue() == this.currentPagerPosition) {
            this.actionBarTitle.animate().alpha(1.0f).setDuration(200L).start();
            this.videoProgressContainer.animate().alpha(0.0f).setDuration(200L).start();
        }
        this.prevProgress = 0.0f;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$3(int eventType, int eventId, PagerVideoPlayer.VideoProgress eventArgs) {
        if (eventArgs.pagerPosition == this.currentPagerPosition) {
            this.currentVideoDuration = eventArgs.totalSeconds;
            if (eventArgs.progress > this.prevProgress) {
                this.videoProgress.setValue(eventArgs.progress);
                this.currentProgress.setText(millisToText(eventArgs.currentSecond));
                this.totalDuration.setText(millisToText(eventArgs.totalSeconds));
            }
            if (eventArgs.pagerPosition > 0.9f) {
                this.prevProgress = 0.0f;
            }
        }
    }
}
