package com.fourmob.datetimepicker.time;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.os.Vibrator;
import android.text.format.DateUtils;
import android.text.format.Time;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import com.fourmob.datetimepicker.R;
import com.fourmob.datetimepicker.Utils;
import com.my.target.ads.instream.InstreamAd;
/* loaded from: classes.dex */
public class RadialPickerLayout extends FrameLayout implements View.OnTouchListener {
    private static final int AM = 0;
    private static final int AMPM_INDEX = 2;
    private static final int ENABLE_PICKER_INDEX = 3;
    private static final int HOUR_INDEX = 0;
    private static final int HOUR_VALUE_TO_DEGREES_STEP_SIZE = 30;
    private static final int MINUTE_INDEX = 1;
    private static final int MINUTE_VALUE_TO_DEGREES_STEP_SIZE = 6;
    private static final int PM = 1;
    private static final String TAG = "RadialPickerLayout";
    private static final int VISIBLE_DEGREES_STEP_SIZE = 30;
    private final int TAP_TIMEOUT;
    private final int TOUCH_SLOP;
    private AccessibilityManager mAccessibilityManager;
    private AmPmCirclesView mAmPmCirclesView;
    private CircleView mCircleView;
    private int mCurrentHoursOfDay;
    private int mCurrentItemShowing;
    private int mCurrentMinutes;
    private boolean mDoingMove;
    private boolean mDoingTouch;
    private int mDownDegrees;
    private float mDownX;
    private float mDownY;
    private View mGrayBox;
    private Handler mHandler;
    private boolean mHideAmPm;
    private RadialSelectorView mHourRadialSelectorView;
    private RadialTextsView mHourRadialTextsView;
    private boolean mInputEnabled;
    private boolean mIs24HourMode;
    private int mIsTouchingAmOrPm;
    private int mLastValueSelected;
    private long mLastVibrate;
    private OnValueSelectedListener mListener;
    private RadialSelectorView mMinuteRadialSelectorView;
    private RadialTextsView mMinuteRadialTextsView;
    private int[] mSnapPrefer30sMap;
    private boolean mTimeInitialized;
    private AnimatorSet mTransition;
    private boolean mVibrate;
    private Vibrator mVibrator;

    /* loaded from: classes.dex */
    public interface OnValueSelectedListener {
        void onValueSelected(int i, int i2, boolean z);
    }

    public RadialPickerLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mVibrate = true;
        this.mIsTouchingAmOrPm = -1;
        this.mHandler = new Handler();
        setOnTouchListener(this);
        ViewConfiguration vc = ViewConfiguration.get(context);
        this.TOUCH_SLOP = vc.getScaledTouchSlop();
        this.TAP_TIMEOUT = ViewConfiguration.getTapTimeout();
        this.mDoingMove = false;
        this.mCircleView = new CircleView(context);
        addView(this.mCircleView);
        this.mAmPmCirclesView = new AmPmCirclesView(context);
        addView(this.mAmPmCirclesView);
        this.mHourRadialTextsView = new RadialTextsView(context);
        addView(this.mHourRadialTextsView);
        this.mMinuteRadialTextsView = new RadialTextsView(context);
        addView(this.mMinuteRadialTextsView);
        this.mHourRadialSelectorView = new RadialSelectorView(context);
        addView(this.mHourRadialSelectorView);
        this.mMinuteRadialSelectorView = new RadialSelectorView(context);
        addView(this.mMinuteRadialSelectorView);
        preparePrefer30sMap();
        this.mVibrator = (Vibrator) context.getSystemService("vibrator");
        this.mLastVibrate = 0L;
        this.mLastValueSelected = -1;
        this.mInputEnabled = true;
        this.mGrayBox = new View(context);
        this.mGrayBox.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        this.mGrayBox.setBackgroundColor(getResources().getColor(R.color.transparent_black));
        this.mGrayBox.setVisibility(4);
        addView(this.mGrayBox);
        this.mAccessibilityManager = (AccessibilityManager) context.getSystemService("accessibility");
        this.mTimeInitialized = false;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int measuredWidth = View.MeasureSpec.getSize(widthMeasureSpec);
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int measuredHeight = View.MeasureSpec.getSize(heightMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int minDimension = Math.min(measuredWidth, measuredHeight);
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(minDimension, widthMode), View.MeasureSpec.makeMeasureSpec(minDimension, heightMode));
    }

    public void setOnValueSelectedListener(OnValueSelectedListener listener) {
        this.mListener = listener;
    }

    public void initialize(Context context, int initialHoursOfDay, int initialMinutes, boolean is24HourMode, boolean vibrate) {
        if (this.mTimeInitialized) {
            Log.e(TAG, "Time has already been initialized.");
            return;
        }
        this.mIs24HourMode = is24HourMode;
        this.mHideAmPm = Utils.isTouchExplorationEnabled(this.mAccessibilityManager) ? true : this.mIs24HourMode;
        this.mVibrate = vibrate;
        this.mCircleView.initialize(context, this.mHideAmPm);
        this.mCircleView.invalidate();
        if (!this.mHideAmPm) {
            this.mAmPmCirclesView.initialize(context, initialHoursOfDay < 12 ? 0 : 1);
            this.mAmPmCirclesView.invalidate();
        }
        Resources res = context.getResources();
        int[] hours = {12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
        int[] hours_24 = {0, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
        int[] minutes = {0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55};
        String[] hoursTexts = new String[12];
        String[] innerHoursTexts = new String[12];
        String[] minutesTexts = new String[12];
        for (int i = 0; i < 12; i++) {
            hoursTexts[i] = is24HourMode ? String.format("%02d", Integer.valueOf(hours_24[i])) : String.format("%d", Integer.valueOf(hours[i]));
            innerHoursTexts[i] = String.format("%d", Integer.valueOf(hours[i]));
            minutesTexts[i] = String.format("%02d", Integer.valueOf(minutes[i]));
        }
        this.mHourRadialTextsView.initialize(res, hoursTexts, is24HourMode ? innerHoursTexts : null, this.mHideAmPm, true);
        this.mHourRadialTextsView.invalidate();
        this.mMinuteRadialTextsView.initialize(res, minutesTexts, null, this.mHideAmPm, false);
        this.mMinuteRadialTextsView.invalidate();
        setValueForItem(0, initialHoursOfDay);
        setValueForItem(1, initialMinutes);
        int hourDegrees = (initialHoursOfDay % 12) * 30;
        this.mHourRadialSelectorView.initialize(context, this.mHideAmPm, is24HourMode, true, hourDegrees, isHourInnerCircle(initialHoursOfDay));
        int minuteDegrees = initialMinutes * 6;
        this.mMinuteRadialSelectorView.initialize(context, this.mHideAmPm, false, false, minuteDegrees, false);
        this.mTimeInitialized = true;
    }

    public void setTime(int hours, int minutes) {
        setItem(0, hours);
        setItem(1, minutes);
    }

    public void setVibrate(boolean vibrate) {
        this.mVibrate = vibrate;
    }

    private void setItem(int index, int value) {
        if (index == 0) {
            setValueForItem(0, value);
            int hourDegrees = (value % 12) * 30;
            this.mHourRadialSelectorView.setSelection(hourDegrees, isHourInnerCircle(value), false);
            this.mHourRadialSelectorView.invalidate();
        } else if (index == 1) {
            setValueForItem(1, value);
            int minuteDegrees = value * 6;
            this.mMinuteRadialSelectorView.setSelection(minuteDegrees, false, false);
            this.mMinuteRadialSelectorView.invalidate();
        }
    }

    private boolean isHourInnerCircle(int hourOfDay) {
        return this.mIs24HourMode && hourOfDay <= 12 && hourOfDay != 0;
    }

    public int getHours() {
        return this.mCurrentHoursOfDay;
    }

    public int getMinutes() {
        return this.mCurrentMinutes;
    }

    private int getCurrentlyShowingValue() {
        int currentIndex = getCurrentItemShowing();
        if (currentIndex == 0) {
            return this.mCurrentHoursOfDay;
        }
        if (currentIndex == 1) {
            return this.mCurrentMinutes;
        }
        return -1;
    }

    public int getIsCurrentlyAmOrPm() {
        if (this.mCurrentHoursOfDay < 12) {
            return 0;
        }
        if (this.mCurrentHoursOfDay < 24) {
            return 1;
        }
        return -1;
    }

    private void setValueForItem(int index, int value) {
        if (index == 0) {
            this.mCurrentHoursOfDay = value;
        } else if (index == 1) {
            this.mCurrentMinutes = value;
        } else if (index == 2) {
            if (value == 0) {
                this.mCurrentHoursOfDay %= 12;
            } else if (value == 1) {
                this.mCurrentHoursOfDay = (this.mCurrentHoursOfDay % 12) + 12;
            }
        }
    }

    public void setAmOrPm(int amOrPm) {
        this.mAmPmCirclesView.setAmOrPm(amOrPm);
        this.mAmPmCirclesView.invalidate();
        setValueForItem(2, amOrPm);
    }

    private void preparePrefer30sMap() {
        this.mSnapPrefer30sMap = new int[361];
        int snappedOutputDegrees = 0;
        int count = 1;
        int expectedCount = 8;
        for (int degrees = 0; degrees < 361; degrees++) {
            this.mSnapPrefer30sMap[degrees] = snappedOutputDegrees;
            if (count == expectedCount) {
                snappedOutputDegrees += 6;
                if (snappedOutputDegrees == 360) {
                    expectedCount = 7;
                } else if (snappedOutputDegrees % 30 == 0) {
                    expectedCount = 14;
                } else {
                    expectedCount = 4;
                }
                count = 1;
            } else {
                count++;
            }
        }
    }

    private int snapPrefer30s(int degrees) {
        if (this.mSnapPrefer30sMap == null) {
            return -1;
        }
        return this.mSnapPrefer30sMap[degrees];
    }

    private int snapOnly30s(int degrees, int forceHigherOrLower) {
        int floor = (degrees / 30) * 30;
        int ceiling = floor + 30;
        if (forceHigherOrLower == 1) {
            return ceiling;
        }
        if (forceHigherOrLower == -1) {
            if (degrees == floor) {
                floor -= 30;
            }
            return floor;
        } else if (degrees - floor < ceiling - degrees) {
            return floor;
        } else {
            return ceiling;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int reselectSelector(int degrees, boolean isInnerCircle, boolean forceToVisibleValue, boolean forceDrawDot) {
        int degrees2;
        RadialSelectorView radialSelectorView;
        int stepSize;
        if (degrees == -1) {
            return -1;
        }
        int currentShowing = getCurrentItemShowing();
        boolean allowFineGrained = !forceToVisibleValue && currentShowing == 1;
        if (allowFineGrained) {
            degrees2 = snapPrefer30s(degrees);
        } else {
            degrees2 = snapOnly30s(degrees, 0);
        }
        if (currentShowing == 0) {
            radialSelectorView = this.mHourRadialSelectorView;
            stepSize = 30;
        } else {
            radialSelectorView = this.mMinuteRadialSelectorView;
            stepSize = 6;
        }
        radialSelectorView.setSelection(degrees2, isInnerCircle, forceDrawDot);
        radialSelectorView.invalidate();
        if (currentShowing == 0) {
            if (this.mIs24HourMode) {
                if (degrees2 == 0 && isInnerCircle) {
                    degrees2 = InstreamAd.DEFAULT_VIDEO_QUALITY;
                } else if (degrees2 == 360 && !isInnerCircle) {
                    degrees2 = 0;
                }
            } else if (degrees2 == 0) {
                degrees2 = InstreamAd.DEFAULT_VIDEO_QUALITY;
            }
        } else if (degrees2 == 360 && currentShowing == 1) {
            degrees2 = 0;
        }
        int value = degrees2 / stepSize;
        if (currentShowing == 0 && this.mIs24HourMode && !isInnerCircle && degrees2 != 0) {
            return value + 12;
        }
        return value;
    }

    private int getDegreesFromCoords(float pointX, float pointY, boolean forceLegal, Boolean[] isInnerCircle) {
        int currentItem = getCurrentItemShowing();
        if (currentItem == 0) {
            return this.mHourRadialSelectorView.getDegreesFromCoords(pointX, pointY, forceLegal, isInnerCircle);
        }
        if (currentItem == 1) {
            return this.mMinuteRadialSelectorView.getDegreesFromCoords(pointX, pointY, forceLegal, isInnerCircle);
        }
        return -1;
    }

    public int getCurrentItemShowing() {
        if (this.mCurrentItemShowing == 0 || this.mCurrentItemShowing == 1) {
            return this.mCurrentItemShowing;
        }
        Log.e(TAG, "Current item showing was unfortunately set to " + this.mCurrentItemShowing);
        return -1;
    }

    public void setCurrentItemShowing(int index, boolean animate) {
        int minuteVisibility = 4;
        if (index != 0 && index != 1) {
            Log.e(TAG, "TimePicker does not support view at index " + index);
            return;
        }
        boolean animate2 = animate && Build.VERSION.SDK_INT >= 14;
        int lastIndex = getCurrentItemShowing();
        this.mCurrentItemShowing = index;
        if (animate2 && index != lastIndex) {
            ObjectAnimator[] anims = new ObjectAnimator[4];
            if (index == 1) {
                anims[0] = this.mHourRadialTextsView.getDisappearAnimator();
                anims[1] = this.mHourRadialSelectorView.getDisappearAnimator();
                anims[2] = this.mMinuteRadialTextsView.getReappearAnimator();
                anims[3] = this.mMinuteRadialSelectorView.getReappearAnimator();
            } else if (index == 0) {
                anims[0] = this.mHourRadialTextsView.getReappearAnimator();
                anims[1] = this.mHourRadialSelectorView.getReappearAnimator();
                anims[2] = this.mMinuteRadialTextsView.getDisappearAnimator();
                anims[3] = this.mMinuteRadialSelectorView.getDisappearAnimator();
            }
            if (this.mTransition != null && this.mTransition.isRunning()) {
                this.mTransition.end();
            }
            this.mTransition = new AnimatorSet();
            this.mTransition.playTogether(anims);
            this.mTransition.start();
        } else if (Build.VERSION.SDK_INT >= 11) {
            int hourAlpha = index == 0 ? 255 : 0;
            int minuteAlpha = index == 1 ? 255 : 0;
            this.mHourRadialTextsView.setAlpha(hourAlpha);
            this.mHourRadialSelectorView.setAlpha(hourAlpha);
            this.mMinuteRadialTextsView.setAlpha(minuteAlpha);
            this.mMinuteRadialSelectorView.setAlpha(minuteAlpha);
        } else {
            int hourVisibility = index == 0 ? 0 : 4;
            if (index == 1) {
                minuteVisibility = 0;
            }
            this.mHourRadialTextsView.setVisibility(hourVisibility);
            this.mHourRadialSelectorView.setVisibility(hourVisibility);
            this.mMinuteRadialTextsView.setVisibility(minuteVisibility);
            this.mMinuteRadialSelectorView.setVisibility(minuteVisibility);
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        int degrees;
        int value;
        float eventX = event.getX();
        float eventY = event.getY();
        final Boolean[] isInnerCircle = {false};
        SystemClock.uptimeMillis();
        switch (event.getAction()) {
            case 0:
                if (!this.mInputEnabled) {
                    return true;
                }
                this.mDownX = eventX;
                this.mDownY = eventY;
                this.mLastValueSelected = -1;
                this.mDoingMove = false;
                this.mDoingTouch = true;
                if (!this.mHideAmPm) {
                    this.mIsTouchingAmOrPm = this.mAmPmCirclesView.getIsTouchingAmOrPm(eventX, eventY);
                } else {
                    this.mIsTouchingAmOrPm = -1;
                }
                if (this.mIsTouchingAmOrPm == 0 || this.mIsTouchingAmOrPm == 1) {
                    tryVibrate();
                    this.mDownDegrees = -1;
                    this.mHandler.postDelayed(new Runnable() { // from class: com.fourmob.datetimepicker.time.RadialPickerLayout.1
                        @Override // java.lang.Runnable
                        public void run() {
                            RadialPickerLayout.this.mAmPmCirclesView.setAmOrPmPressed(RadialPickerLayout.this.mIsTouchingAmOrPm);
                            RadialPickerLayout.this.mAmPmCirclesView.invalidate();
                        }
                    }, this.TAP_TIMEOUT);
                } else {
                    boolean forceLegal = Utils.isTouchExplorationEnabled(this.mAccessibilityManager);
                    this.mDownDegrees = getDegreesFromCoords(eventX, eventY, forceLegal, isInnerCircle);
                    if (this.mDownDegrees != -1) {
                        tryVibrate();
                        this.mHandler.postDelayed(new Runnable() { // from class: com.fourmob.datetimepicker.time.RadialPickerLayout.2
                            @Override // java.lang.Runnable
                            public void run() {
                                RadialPickerLayout.this.mDoingMove = true;
                                int value2 = RadialPickerLayout.this.reselectSelector(RadialPickerLayout.this.mDownDegrees, isInnerCircle[0].booleanValue(), false, true);
                                RadialPickerLayout.this.mLastValueSelected = value2;
                                RadialPickerLayout.this.mListener.onValueSelected(RadialPickerLayout.this.getCurrentItemShowing(), value2, false);
                            }
                        }, this.TAP_TIMEOUT);
                    }
                }
                return true;
            case 1:
                if (!this.mInputEnabled) {
                    Log.d(TAG, "Input was disabled, but received ACTION_UP.");
                    this.mListener.onValueSelected(3, 1, false);
                    return true;
                }
                this.mHandler.removeCallbacksAndMessages(null);
                this.mDoingTouch = false;
                if (this.mIsTouchingAmOrPm == 0 || this.mIsTouchingAmOrPm == 1) {
                    int isTouchingAmOrPm = this.mAmPmCirclesView.getIsTouchingAmOrPm(eventX, eventY);
                    this.mAmPmCirclesView.setAmOrPmPressed(-1);
                    this.mAmPmCirclesView.invalidate();
                    if (isTouchingAmOrPm == this.mIsTouchingAmOrPm) {
                        this.mAmPmCirclesView.setAmOrPm(isTouchingAmOrPm);
                        if (getIsCurrentlyAmOrPm() != isTouchingAmOrPm) {
                            this.mListener.onValueSelected(2, this.mIsTouchingAmOrPm, false);
                            setValueForItem(2, isTouchingAmOrPm);
                        }
                    }
                    this.mIsTouchingAmOrPm = -1;
                    break;
                } else {
                    if (this.mDownDegrees != -1 && (degrees = getDegreesFromCoords(eventX, eventY, this.mDoingMove, isInnerCircle)) != -1) {
                        int value2 = reselectSelector(degrees, isInnerCircle[0].booleanValue(), !this.mDoingMove, false);
                        if (getCurrentItemShowing() == 0 && !this.mIs24HourMode) {
                            int amOrPm = getIsCurrentlyAmOrPm();
                            if (amOrPm == 0 && value2 == 12) {
                                value2 = 0;
                            } else if (amOrPm == 1 && value2 != 12) {
                                value2 += 12;
                            }
                        }
                        setValueForItem(getCurrentItemShowing(), value2);
                        this.mListener.onValueSelected(getCurrentItemShowing(), value2, true);
                    }
                    this.mDoingMove = false;
                    return true;
                }
                break;
            case 2:
                if (!this.mInputEnabled) {
                    Log.e(TAG, "Input was disabled, but received ACTION_MOVE.");
                    return true;
                }
                float dY = Math.abs(eventY - this.mDownY);
                float dX = Math.abs(eventX - this.mDownX);
                if (this.mDoingMove || dX > this.TOUCH_SLOP || dY > this.TOUCH_SLOP) {
                    if (this.mIsTouchingAmOrPm == 0 || this.mIsTouchingAmOrPm == 1) {
                        this.mHandler.removeCallbacksAndMessages(null);
                        if (this.mAmPmCirclesView.getIsTouchingAmOrPm(eventX, eventY) != this.mIsTouchingAmOrPm) {
                            this.mAmPmCirclesView.setAmOrPmPressed(-1);
                            this.mAmPmCirclesView.invalidate();
                            this.mIsTouchingAmOrPm = -1;
                            break;
                        }
                    } else if (this.mDownDegrees != -1) {
                        this.mDoingMove = true;
                        this.mHandler.removeCallbacksAndMessages(null);
                        int degrees2 = getDegreesFromCoords(eventX, eventY, true, isInnerCircle);
                        if (degrees2 != -1 && (value = reselectSelector(degrees2, isInnerCircle[0].booleanValue(), false, true)) != this.mLastValueSelected) {
                            tryVibrate();
                            this.mLastValueSelected = value;
                            this.mListener.onValueSelected(getCurrentItemShowing(), value, false);
                        }
                        return true;
                    }
                }
                break;
        }
        return false;
    }

    public void tryVibrate() {
        if (this.mVibrate && this.mVibrator != null) {
            long now = SystemClock.uptimeMillis();
            if (now - this.mLastVibrate >= 125) {
                this.mVibrator.vibrate(5L);
                this.mLastVibrate = now;
            }
        }
    }

    public boolean trySettingInputEnabled(boolean inputEnabled) {
        int i = 0;
        if (!this.mDoingTouch || inputEnabled) {
            this.mInputEnabled = inputEnabled;
            View view = this.mGrayBox;
            if (inputEnabled) {
                i = 4;
            }
            view.setVisibility(i);
            return true;
        }
        return false;
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        if (Build.VERSION.SDK_INT >= 14) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.addAction(4096);
            info.addAction(8192);
        }
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        if (event.getEventType() == 32) {
            event.getText().clear();
            Time time = new Time();
            time.hour = getHours();
            time.minute = getMinutes();
            long millis = time.normalize(true);
            int flags = 1;
            if (this.mIs24HourMode) {
                flags = 1 | 128;
            }
            String timeString = DateUtils.formatDateTime(getContext(), millis, flags);
            event.getText().add(timeString);
            return true;
        }
        return super.dispatchPopulateAccessibilityEvent(event);
    }

    @Override // android.view.View
    @SuppressLint({"NewApi"})
    public boolean performAccessibilityAction(int action, Bundle arguments) {
        int maxValue;
        if (super.performAccessibilityAction(action, arguments)) {
            return true;
        }
        int changeMultiplier = 0;
        if (action == 4096) {
            changeMultiplier = 1;
        } else if (action == 8192) {
            changeMultiplier = -1;
        }
        if (changeMultiplier == 0) {
            return false;
        }
        int value = getCurrentlyShowingValue();
        int stepSize = 0;
        int currentItemShowing = getCurrentItemShowing();
        if (currentItemShowing == 0) {
            stepSize = 30;
            value %= 12;
        } else if (currentItemShowing == 1) {
            stepSize = 6;
        }
        int degrees = value * stepSize;
        int value2 = snapOnly30s(degrees, changeMultiplier) / stepSize;
        int minValue = 0;
        if (currentItemShowing == 0) {
            if (this.mIs24HourMode) {
                maxValue = 23;
            } else {
                maxValue = 12;
                minValue = 1;
            }
        } else {
            maxValue = 55;
        }
        if (value2 > maxValue) {
            value2 = minValue;
        } else if (value2 < minValue) {
            value2 = maxValue;
        }
        setItem(currentItemShowing, value2);
        this.mListener.onValueSelected(currentItemShowing, value2, false);
        return true;
    }
}
