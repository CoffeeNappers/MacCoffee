package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class PaginationView extends View {
    private Drawable background;
    private int currentPage;
    private int innerWidth;
    private Drawable leftArrow;
    private Listener listener;
    private int numPages;
    private int[] pageMap;
    private Drawable rightArrow;
    private int selectColor;
    private Paint textSecondPaint;
    private Paint textSelectPaint;
    private int[] widths;
    static final int DP_2 = V.dp(2.0f);
    static final int DP_3 = V.dp(3.0f);
    static final int DP_4 = DP_2 << 1;
    static final int DP_8 = DP_4 << 1;
    static final int DP_10 = V.dp(10.0f);
    static final int DP_32 = DP_8 << 2;
    static final int DP_4_24_4 = V.dp(32.0f);

    /* loaded from: classes3.dex */
    public interface Listener {
        void onPageSelected(int i);
    }

    public PaginationView(Context context) {
        super(context);
        this.numPages = 20;
        this.currentPage = 3;
        this.widths = new int[6];
        this.pageMap = new int[6];
        init();
    }

    public PaginationView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.numPages = 20;
        this.currentPage = 3;
        this.widths = new int[6];
        this.pageMap = new int[6];
        init();
    }

    private void init() {
        this.selectColor = getResources().getColor(R.color.brand_primary);
        this.background = getResources().getDrawable(R.drawable.bg_discussions_paginator);
        this.leftArrow = getResources().getDrawable(R.drawable.ic_discussions_jump_left);
        this.rightArrow = getResources().getDrawable(R.drawable.ic_discussions_jump_right);
        this.textSelectPaint = new Paint(1);
        this.textSelectPaint.setTypeface(Font.Medium.typeface);
        this.textSelectPaint.setTextSize(Global.scale(14.0f));
        this.textSelectPaint.setColor(this.selectColor);
        this.textSecondPaint = new Paint(this.textSelectPaint);
        this.textSecondPaint.setColor(getResources().getColor(R.color.gray));
    }

    public void setPageCount(int c) {
        this.numPages = c;
        invalidate();
    }

    public void setCurrentPage(int p) {
        this.currentPage = p;
        invalidate();
    }

    public int getCurrentPage() {
        return this.currentPage;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (getVisibility() != 0 || !isEnabled()) {
            return false;
        }
        int x = (int) ((ev.getX() - getWidth()) + this.innerWidth);
        if (x < 0 || x > this.innerWidth) {
            return false;
        }
        if ((ev.getAction() & 255) != 1) {
            return true;
        }
        int w = 0;
        for (int i = 0; i < this.widths.length; i++) {
            if (x >= w && x <= this.widths[i] + w) {
                if (this.listener != null) {
                    this.listener.onPageSelected(this.pageMap[i]);
                }
                invalidate();
                return true;
            }
            w += this.widths[i];
        }
        return true;
    }

    @Override // android.view.View
    public void onDraw(Canvas c) {
        int i;
        int currentX;
        for (int i2 = 0; i2 < this.widths.length; i2++) {
            this.widths[i2] = 0;
            this.pageMap[i2] = -1;
        }
        int i3 = 0;
        int numberAdd = 0;
        this.innerWidth = DP_3;
        if (this.currentPage > 2) {
            int i4 = this.innerWidth;
            int[] iArr = this.widths;
            int i5 = DP_4_24_4;
            iArr[0] = i5;
            this.innerWidth = i4 + i5;
            int i6 = 0 + 1;
            this.pageMap[0] = 1;
            i3 = i6;
        } else {
            int i7 = this.innerWidth;
            numberAdd = DP_8;
            this.innerWidth = i7 + numberAdd;
        }
        if (this.currentPage > 1) {
            this.innerWidth += getNumberSize(this.currentPage - 1);
            this.widths[i3] = getNumberSize(this.currentPage - 1) + numberAdd;
            numberAdd = 0;
            this.pageMap[i3] = this.currentPage - 1;
            i3++;
        }
        this.innerWidth += getNumberSize(this.currentPage);
        this.widths[i3] = getNumberSize(this.currentPage) + numberAdd;
        int i8 = i3 + 1;
        this.pageMap[i3] = -1;
        if (this.currentPage < this.numPages) {
            this.innerWidth += getNumberSize(this.currentPage + 1);
            this.widths[i8] = getNumberSize(this.currentPage + 1) + 0;
            i = i8 + 1;
            this.pageMap[i8] = this.currentPage + 1;
        } else {
            i = i8;
        }
        if (this.currentPage < this.numPages - 1) {
            int i9 = this.innerWidth;
            int[] iArr2 = this.widths;
            int i10 = DP_4_24_4;
            iArr2[i] = i10;
            this.innerWidth = i9 + i10;
            this.pageMap[i] = this.numPages;
        } else {
            this.innerWidth += DP_8;
            int[] iArr3 = this.widths;
            int i11 = i - 1;
            iArr3[i11] = iArr3[i11] + DP_8;
        }
        this.innerWidth += DP_3;
        c.save();
        c.translate(getWidth() - this.innerWidth, 0.0f);
        this.background.setBounds(0, 0, this.innerWidth, getHeight());
        this.background.draw(c);
        int currentX2 = DP_3;
        if (this.currentPage > 2) {
            int top = (getHeight() - this.leftArrow.getIntrinsicHeight()) / 2;
            this.leftArrow.setBounds(DP_4 + currentX2, top, DP_4 + currentX2 + this.leftArrow.getIntrinsicWidth(), this.leftArrow.getIntrinsicHeight() + top);
            this.leftArrow.draw(c);
            currentX = currentX2 + DP_4_24_4;
        } else {
            currentX = currentX2 + DP_8;
        }
        if (this.currentPage > 1) {
            drawNumber(c, String.valueOf(this.currentPage - 1), currentX, DP_2, getNumberSize(this.currentPage - 1), getHeight() - DP_8, this.textSecondPaint, 1, 637534208, (getHeight() - DP_10) - DP_4);
            currentX += getNumberSize(this.currentPage - 1);
        }
        drawNumber(c, String.valueOf(this.currentPage), currentX, DP_2, getNumberSize(this.currentPage), getHeight() - DP_8, this.textSelectPaint, DP_2, this.selectColor, (getHeight() - DP_10) - DP_4);
        int currentX3 = currentX + getNumberSize(this.currentPage);
        if (this.currentPage < this.numPages) {
            drawNumber(c, String.valueOf(this.currentPage + 1), currentX3, DP_2, getNumberSize(this.currentPage + 1), getHeight() - DP_8, this.textSecondPaint, 1, 637534208, (getHeight() - DP_10) - DP_4);
            currentX3 += getNumberSize(this.currentPage + 1);
        }
        if (this.currentPage < this.numPages - 1) {
            int top2 = (getHeight() - this.rightArrow.getIntrinsicHeight()) / 2;
            this.rightArrow.setBounds(DP_4 + currentX3, top2, DP_4 + currentX3 + this.rightArrow.getIntrinsicWidth(), this.rightArrow.getIntrinsicHeight() + top2);
            this.rightArrow.draw(c);
        }
        c.restore();
    }

    static int getNumberSize(int value) {
        return Math.max((String.valueOf(value).length() + 2) * DP_8, DP_32);
    }

    static void drawNumber(Canvas c, String text, int x, int y, int width, int height, Paint paint, int lineSize, int lineColor, int lineY) {
        float w = paint.measureText(text);
        int color = paint.getColor();
        c.drawText(text, x + ((width - w) / 2.0f), y + paint.getTextSize() + ((height - paint.getTextSize()) / 2.0f), paint);
        paint.setColor(lineColor);
        c.drawRect(x, lineY, x + width, lineY + lineSize, paint);
        paint.setColor(color);
    }

    public void setListener(Listener l) {
        this.listener = l;
    }

    public int getPageCount() {
        return this.numPages;
    }
}
