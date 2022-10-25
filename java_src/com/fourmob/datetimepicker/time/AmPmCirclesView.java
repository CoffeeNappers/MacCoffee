package com.fourmob.datetimepicker.time;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.util.Log;
import android.view.View;
import com.fourmob.datetimepicker.R;
import java.text.DateFormatSymbols;
/* loaded from: classes.dex */
public class AmPmCirclesView extends View {
    private static final int AM = 0;
    private static final int PM = 1;
    private static final int PRESSED_ALPHA = 175;
    private static final int SELECTED_ALPHA = 51;
    private static final String TAG = "AmPmCirclesView";
    private int mAmOrPm;
    private int mAmOrPmPressed;
    private int mAmPmCircleRadius;
    private float mAmPmCircleRadiusMultiplier;
    private int mAmPmTextColor;
    private int mAmPmYCenter;
    private String mAmText;
    private int mAmXCenter;
    private int mBlue;
    private float mCircleRadiusMultiplier;
    private boolean mDrawValuesReady;
    private boolean mIsInitialized;
    private final Paint mPaint;
    private String mPmText;
    private int mPmXCenter;
    private int mWhite;

    public AmPmCirclesView(Context context) {
        super(context);
        this.mPaint = new Paint();
        this.mIsInitialized = false;
    }

    public void initialize(Context context, int amOrPm) {
        if (this.mIsInitialized) {
            Log.e(TAG, "AmPmCirclesView may only be initialized once.");
            return;
        }
        Resources res = context.getResources();
        this.mWhite = res.getColor(R.color.white);
        this.mAmPmTextColor = res.getColor(R.color.ampm_text_color);
        this.mBlue = res.getColor(R.color.blue);
        String typefaceFamily = res.getString(R.string.sans_serif);
        Typeface tf = Typeface.create(typefaceFamily, 0);
        this.mPaint.setTypeface(tf);
        this.mPaint.setAntiAlias(true);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.circle_radius_multiplier));
        this.mAmPmCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.ampm_circle_radius_multiplier));
        String[] amPmTexts = new DateFormatSymbols().getAmPmStrings();
        this.mAmText = amPmTexts[0];
        this.mPmText = amPmTexts[1];
        setAmOrPm(amOrPm);
        this.mAmOrPmPressed = -1;
        this.mIsInitialized = true;
    }

    public void setAmOrPm(int amOrPm) {
        this.mAmOrPm = amOrPm;
    }

    public void setAmOrPmPressed(int amOrPmPressed) {
        this.mAmOrPmPressed = amOrPmPressed;
    }

    public int getIsTouchingAmOrPm(float xCoord, float yCoord) {
        if (!this.mDrawValuesReady) {
            return -1;
        }
        int squaredYDistance = (int) ((yCoord - this.mAmPmYCenter) * (yCoord - this.mAmPmYCenter));
        int distanceToAmCenter = (int) Math.sqrt(((xCoord - this.mAmXCenter) * (xCoord - this.mAmXCenter)) + squaredYDistance);
        if (distanceToAmCenter <= this.mAmPmCircleRadius) {
            return 0;
        }
        int distanceToPmCenter = (int) Math.sqrt(((xCoord - this.mPmXCenter) * (xCoord - this.mPmXCenter)) + squaredYDistance);
        return distanceToPmCenter <= this.mAmPmCircleRadius ? 1 : -1;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        int viewWidth = getWidth();
        if (viewWidth != 0 && this.mIsInitialized) {
            if (!this.mDrawValuesReady) {
                int layoutXCenter = getWidth() / 2;
                int layoutYCenter = getHeight() / 2;
                int circleRadius = (int) (Math.min(layoutXCenter, layoutYCenter) * this.mCircleRadiusMultiplier);
                this.mAmPmCircleRadius = (int) (circleRadius * this.mAmPmCircleRadiusMultiplier);
                int textSize = (this.mAmPmCircleRadius * 3) / 4;
                this.mPaint.setTextSize(textSize);
                this.mAmPmYCenter = (layoutYCenter - (this.mAmPmCircleRadius / 2)) + circleRadius;
                this.mAmXCenter = (layoutXCenter - circleRadius) + this.mAmPmCircleRadius;
                this.mPmXCenter = (layoutXCenter + circleRadius) - this.mAmPmCircleRadius;
                this.mDrawValuesReady = true;
            }
            int amColor = this.mWhite;
            int amAlpha = 255;
            int pmColor = this.mWhite;
            int pmAlpha = 255;
            if (this.mAmOrPm == 0) {
                amColor = this.mBlue;
                amAlpha = 51;
            } else if (this.mAmOrPm == 1) {
                pmColor = this.mBlue;
                pmAlpha = 51;
            }
            if (this.mAmOrPmPressed == 0) {
                amColor = this.mBlue;
                amAlpha = PRESSED_ALPHA;
            } else if (this.mAmOrPmPressed == 1) {
                pmColor = this.mBlue;
                pmAlpha = PRESSED_ALPHA;
            }
            this.mPaint.setColor(amColor);
            this.mPaint.setAlpha(amAlpha);
            canvas.drawCircle(this.mAmXCenter, this.mAmPmYCenter, this.mAmPmCircleRadius, this.mPaint);
            this.mPaint.setColor(pmColor);
            this.mPaint.setAlpha(pmAlpha);
            canvas.drawCircle(this.mPmXCenter, this.mAmPmYCenter, this.mAmPmCircleRadius, this.mPaint);
            this.mPaint.setColor(this.mAmPmTextColor);
            int textYCenter = this.mAmPmYCenter - (((int) (this.mPaint.descent() + this.mPaint.ascent())) / 2);
            canvas.drawText(this.mAmText, this.mAmXCenter, textYCenter, this.mPaint);
            canvas.drawText(this.mPmText, this.mPmXCenter, textYCenter, this.mPaint);
        }
    }
}
