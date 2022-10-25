package com.vk.stories.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.vk.core.util.Device;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class StoryProgressView extends View {
    private final int DP1;
    private final int DP2;
    private final int DP20;
    private final int DP8;
    private final int LINE_HEGIHT;
    private final int VIEW_HEIGHT;
    private int currentSection;
    private float progress;
    private int sectionCount;
    private final Paint whitePaint;
    private final RectF whiteRect;

    public StoryProgressView(Context context) {
        super(context);
        this.DP1 = Screen.dp(1);
        this.DP2 = Screen.dp(2);
        this.LINE_HEGIHT = Screen.dp(3);
        this.DP8 = Screen.dp(8);
        this.DP20 = Screen.dp(20);
        this.VIEW_HEIGHT = Screen.dp(20);
        this.whitePaint = new Paint(1);
        this.whiteRect = new RectF();
        this.sectionCount = 1;
        this.currentSection = 0;
        this.progress = 0.0f;
        init();
    }

    public StoryProgressView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.DP1 = Screen.dp(1);
        this.DP2 = Screen.dp(2);
        this.LINE_HEGIHT = Screen.dp(3);
        this.DP8 = Screen.dp(8);
        this.DP20 = Screen.dp(20);
        this.VIEW_HEIGHT = Screen.dp(20);
        this.whitePaint = new Paint(1);
        this.whiteRect = new RectF();
        this.sectionCount = 1;
        this.currentSection = 0;
        this.progress = 0.0f;
        init();
    }

    public StoryProgressView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.DP1 = Screen.dp(1);
        this.DP2 = Screen.dp(2);
        this.LINE_HEGIHT = Screen.dp(3);
        this.DP8 = Screen.dp(8);
        this.DP20 = Screen.dp(20);
        this.VIEW_HEIGHT = Screen.dp(20);
        this.whitePaint = new Paint(1);
        this.whiteRect = new RectF();
        this.sectionCount = 1;
        this.currentSection = 0;
        this.progress = 0.0f;
        init();
    }

    private void init() {
        setBackgroundResource(R.drawable.bg_story_progress_shadow);
        this.whitePaint.setColor(-1);
        this.whitePaint.setStyle(Paint.Style.FILL);
    }

    private int getHorizontalPadding() {
        return (Device.isGalaxyS8() || Device.isGalaxyS8Plus()) ? this.DP20 : this.DP8;
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, View.MeasureSpec.makeMeasureSpec(this.VIEW_HEIGHT, 1073741824));
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        int startX;
        int endX;
        super.onDraw(canvas);
        if (this.sectionCount != 0) {
            int availableWidth = canvas.getWidth() - (getHorizontalPadding() * 2);
            int partWidth = availableWidth / this.sectionCount;
            for (int i = 0; i < this.sectionCount; i++) {
                if (i == 0) {
                    startX = getHorizontalPadding();
                } else {
                    startX = getHorizontalPadding() + (partWidth * i);
                }
                if (i == this.sectionCount - 1) {
                    endX = canvas.getWidth() - getHorizontalPadding();
                } else {
                    endX = startX + partWidth;
                }
                int startX2 = startX + this.DP1;
                int endX2 = endX - this.DP1;
                if (i < this.currentSection) {
                    this.whiteRect.set(startX2, this.DP8, endX2, this.DP8 + this.LINE_HEGIHT);
                    this.whitePaint.setAlpha(255);
                    canvas.drawRoundRect(this.whiteRect, this.LINE_HEGIHT / 2, this.LINE_HEGIHT / 2, this.whitePaint);
                } else if (this.currentSection == i) {
                    this.whiteRect.set(startX2, this.DP8, endX2, this.DP8 + this.LINE_HEGIHT);
                    this.whitePaint.setAlpha(76);
                    canvas.drawRoundRect(this.whiteRect, this.LINE_HEGIHT / 2, this.LINE_HEGIHT / 2, this.whitePaint);
                    this.whiteRect.set(startX2, this.DP8, startX2 + ((endX2 - startX2) * this.progress), this.DP8 + this.LINE_HEGIHT);
                    this.whitePaint.setAlpha(255);
                    canvas.drawRoundRect(this.whiteRect, this.LINE_HEGIHT / 2, this.LINE_HEGIHT / 2, this.whitePaint);
                } else {
                    this.whiteRect.set(startX2, this.DP8, endX2, this.DP8 + this.LINE_HEGIHT);
                    this.whitePaint.setAlpha(76);
                    canvas.drawRoundRect(this.whiteRect, this.LINE_HEGIHT / 2, this.LINE_HEGIHT / 2, this.whitePaint);
                }
            }
        }
    }

    public float getProgress() {
        return this.progress;
    }

    public void setProgress(float progress) {
        if (progress < 0.0f) {
            progress = 0.0f;
        } else if (progress > 1.0f) {
            progress = 1.0f;
        }
        this.progress = progress;
        invalidate();
    }

    public int getSectionCount() {
        return this.sectionCount;
    }

    public void setSectionCount(int sectionCount) {
        this.sectionCount = sectionCount;
        invalidate();
    }

    public int getCurrentSection() {
        return this.currentSection;
    }

    public void setCurrentSection(int currentSection) {
        this.currentSection = currentSection;
        invalidate();
    }
}
