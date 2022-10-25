package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.Font;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class MessageFloatingDateView2 extends View {
    private Drawable mBgDrawable;
    private Rect mBgLayout;
    private Rect mBgPadding;
    private Paint.FontMetricsInt mFontMetricsInt;
    private boolean mInvalidateText;
    private CharSequence mText;
    private Rect mTextLayout;
    private int mTextMeasuredWidth;
    private TextPaint mTextPaint;
    private CharSequence mTextPrepared;
    private boolean mUseClip;

    public MessageFloatingDateView2(Context context) {
        super(context);
        init();
    }

    public MessageFloatingDateView2(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public MessageFloatingDateView2(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    @TargetApi(21)
    public MessageFloatingDateView2(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    private void init() {
        Context context = getContext();
        Resources r = context.getResources();
        this.mTextPaint = new TextPaint();
        this.mTextPaint.setAntiAlias(true);
        this.mTextPaint.setTextSize(V.dp(13.0f));
        this.mTextPaint.setTypeface(Font.Medium.typeface);
        this.mTextPaint.setColor(Color.parseColor("#78838F"));
        this.mFontMetricsInt = new Paint.FontMetricsInt();
        this.mTextPaint.getFontMetricsInt(this.mFontMetricsInt);
        this.mBgDrawable = r.getDrawable(R.drawable.bg_date_badge);
        this.mBgDrawable.setCallback(this);
        this.mBgPadding = new Rect(V.dp(16.0f), V.dp(11.0f), V.dp(16.0f), V.dp(12.0f));
        this.mTextPrepared = null;
        this.mInvalidateText = true;
        this.mTextMeasuredWidth = 0;
        this.mTextLayout = new Rect();
        this.mBgLayout = new Rect();
        this.mUseClip = false;
        this.mText = null;
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return who == this.mBgDrawable || super.verifyDrawable(who);
    }

    public void setText(CharSequence text) {
        if (this.mText != null || text != null) {
            this.mText = text;
            this.mInvalidateText = true;
            invalidate();
        }
    }

    public CharSequence getText() {
        return this.mText;
    }

    public int getTextLocationFromTop() {
        return getPaddingTop() + this.mBgPadding.top;
    }

    public int getTextLocationFromBottom() {
        return getPaddingBottom() + this.mBgPadding.bottom;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        this.mInvalidateText = true;
        int usedWidth = getPaddingLeft() + getPaddingRight();
        int usedHeight = getPaddingTop() + getPaddingBottom();
        int minWidth = getSuggestedMinimumWidth();
        int minHeight = getSuggestedMinimumHeight();
        int availWidth = ViewUtils.getSuggestedAvailableSizeFromSpec(widthMeasureSpec, minWidth, Integer.MAX_VALUE, usedWidth);
        ViewUtils.getSuggestedAvailableSizeFromSpec(heightMeasureSpec, minHeight, Integer.MAX_VALUE, usedHeight);
        int rWidth = usedWidth + availWidth;
        int rHeight = this.mBgPadding.top + usedHeight + this.mBgPadding.bottom + getTextHeight();
        int finalWidth = ViewUtils.getMeasurement(widthMeasureSpec, minWidth, Integer.MAX_VALUE, rWidth);
        int finalHeight = ViewUtils.getMeasurement(heightMeasureSpec, minHeight, Integer.MAX_VALUE, rHeight);
        this.mUseClip = rWidth > finalWidth || rHeight > finalHeight;
        setMeasuredDimension(finalWidth, finalHeight);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mInvalidateText) {
            invalidateInnerMeasureLayout();
            this.mInvalidateText = false;
        }
        if (this.mUseClip) {
            canvas.save();
            canvas.clipRect(getLeft(), getTop(), getRight(), getBottom());
        }
        drawInner(canvas);
        if (this.mUseClip) {
            canvas.restore();
        }
    }

    private void invalidateInnerMeasureLayout() {
        int availWidth = (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childLeft = getPaddingLeft();
        int childTop = getPaddingTop();
        int childRight = getMeasuredWidth() - getPaddingRight();
        int childBottom = getMeasuredHeight() - getPaddingBottom();
        int textAvailWidth = Math.max(0, (availWidth - this.mBgPadding.left) - this.mBgPadding.right);
        if (TextUtils.isEmpty(this.mText)) {
            this.mTextMeasuredWidth = 0;
        } else {
            this.mTextMeasuredWidth = (int) this.mTextPaint.measureText(this.mText, 0, this.mText.length());
            if (this.mTextMeasuredWidth <= textAvailWidth) {
                this.mTextPrepared = this.mText;
            } else {
                this.mTextPrepared = TextUtils.ellipsize(this.mText, this.mTextPaint, textAvailWidth, TextUtils.TruncateAt.END, false, null);
                this.mTextMeasuredWidth = (int) this.mTextPaint.measureText(this.mTextPrepared, 0, this.mTextPrepared.length());
            }
        }
        int drWidth = this.mTextMeasuredWidth + this.mBgPadding.left + this.mBgPadding.right;
        int itemLeft = (((childRight - childLeft) / 2) + childLeft) - (drWidth / 2);
        this.mBgLayout.set(itemLeft, childTop, itemLeft + drWidth, childBottom);
        this.mBgDrawable.setBounds(this.mBgLayout);
        int itemLeft2 = this.mBgLayout.left + this.mBgPadding.left;
        int itemTop = this.mBgLayout.top + this.mBgPadding.top;
        this.mTextLayout.set(itemLeft2, itemTop, this.mTextMeasuredWidth + itemLeft2, getTextHeight() + itemTop);
    }

    private void drawInner(Canvas canvas) {
        this.mBgDrawable.draw(canvas);
        if (this.mTextPrepared != null) {
            canvas.drawText(this.mTextPrepared, 0, this.mTextPrepared.length(), this.mTextLayout.left, this.mTextLayout.bottom - this.mFontMetricsInt.descent, this.mTextPaint);
        }
    }

    private int getTextHeight() {
        return this.mFontMetricsInt.descent - this.mFontMetricsInt.ascent;
    }
}
