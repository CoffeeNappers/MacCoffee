package com.vkontakte.android.stickers;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import android.widget.ProgressBar;
import com.vk.core.util.Screen;
import com.vk.imageloader.OnLoadCallback;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class WindowRecyclerView extends UsableRecyclerView {
    private String mCurrentUrl;
    private boolean mHandledLongTap;
    private final Handler mHandler;
    private VKImageView mImage;
    private int mKeyboardTop;
    private View mLastAnimatedItemView;
    private Rect mLastRect;
    private final Runnable mOnLongPressed;
    private final Runnable mPopupShower;
    private ProgressBar mProgress;
    private List<Rect> mRects;
    private ObjectAnimator mScaleAnimation;
    private MotionEvent mStartEvent;
    private int mStartX;
    private int mStartY;
    private int mTouchSlop;
    private Callback mViewToUrlProjection;
    private PopupWindow mWindow;

    /* loaded from: classes3.dex */
    public interface Callback {
        String getURL(View view);
    }

    public WindowRecyclerView(Context context) {
        super(context);
        this.mHandler = new Handler();
        this.mOnLongPressed = new Runnable() { // from class: com.vkontakte.android.stickers.WindowRecyclerView.1
            @Override // java.lang.Runnable
            public void run() {
                WindowRecyclerView.this.prepare();
                if (WindowRecyclerView.this.handleTouchEvent(WindowRecyclerView.this.mStartX, WindowRecyclerView.this.mStartY)) {
                    WindowRecyclerView.this.mHandledLongTap = true;
                    WindowRecyclerView.this.performHapticFeedback(0);
                    MotionEvent ev = MotionEvent.obtain(WindowRecyclerView.this.mStartEvent);
                    ev.setLocation(WindowRecyclerView.this.mStartX, WindowRecyclerView.this.mStartY);
                    WindowRecyclerView.this.sendMotionToParent(ev);
                    WindowRecyclerView.this.show();
                }
            }
        };
        this.mPopupShower = new Runnable() { // from class: com.vkontakte.android.stickers.WindowRecyclerView.2
            @Override // java.lang.Runnable
            public void run() {
                View decorView = Utils.castToActivity(WindowRecyclerView.this.getContext()).getWindow().getDecorView();
                if (decorView.getWindowVisibility() == 8) {
                    WindowRecyclerView.this.show();
                } else {
                    WindowRecyclerView.this.mWindow.showAtLocation(decorView, 17, 0, 0);
                }
            }
        };
        init(context);
    }

    public WindowRecyclerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mHandler = new Handler();
        this.mOnLongPressed = new Runnable() { // from class: com.vkontakte.android.stickers.WindowRecyclerView.1
            @Override // java.lang.Runnable
            public void run() {
                WindowRecyclerView.this.prepare();
                if (WindowRecyclerView.this.handleTouchEvent(WindowRecyclerView.this.mStartX, WindowRecyclerView.this.mStartY)) {
                    WindowRecyclerView.this.mHandledLongTap = true;
                    WindowRecyclerView.this.performHapticFeedback(0);
                    MotionEvent ev = MotionEvent.obtain(WindowRecyclerView.this.mStartEvent);
                    ev.setLocation(WindowRecyclerView.this.mStartX, WindowRecyclerView.this.mStartY);
                    WindowRecyclerView.this.sendMotionToParent(ev);
                    WindowRecyclerView.this.show();
                }
            }
        };
        this.mPopupShower = new Runnable() { // from class: com.vkontakte.android.stickers.WindowRecyclerView.2
            @Override // java.lang.Runnable
            public void run() {
                View decorView = Utils.castToActivity(WindowRecyclerView.this.getContext()).getWindow().getDecorView();
                if (decorView.getWindowVisibility() == 8) {
                    WindowRecyclerView.this.show();
                } else {
                    WindowRecyclerView.this.mWindow.showAtLocation(decorView, 17, 0, 0);
                }
            }
        };
        init(context);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        int[] location = new int[2];
        getLocationOnScreen(location);
        this.mKeyboardTop = location[1];
    }

    private void init(Context context) {
        setFocusableInTouchMode(true);
        FrameLayout popupView = new FrameLayout(context) { // from class: com.vkontakte.android.stickers.WindowRecyclerView.3
            final int[] position = new int[2];

            @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
            protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
                super.onLayout(changed, left, top, right, bottom);
                if (!Screen.isTablet(getContext())) {
                    int extraPadding = 0;
                    if (Build.VERSION.SDK_INT <= 23) {
                        getLocationOnScreen(this.position);
                        if (this.position[1] == 0) {
                            extraPadding = ViewUtils.getStatusBarHeight();
                        }
                    }
                    int diff = -((WindowRecyclerView.this.mKeyboardTop - ((getMeasuredHeight() >> 1) + (StickersConfig.PREVIEW_SIZE >> 1))) + extraPadding);
                    int maxDiff = ((getMeasuredHeight() >> 1) - (StickersConfig.PREVIEW_SIZE >> 1)) + extraPadding;
                    if (diff > maxDiff) {
                        diff = maxDiff;
                    }
                    if (diff > 0) {
                        ((ViewGroup.MarginLayoutParams) WindowRecyclerView.this.mImage.getLayoutParams()).bottomMargin = diff;
                        ((ViewGroup.MarginLayoutParams) WindowRecyclerView.this.mProgress.getLayoutParams()).bottomMargin = diff;
                        requestLayout();
                    }
                }
            }
        };
        popupView.setFocusable(false);
        popupView.setFocusableInTouchMode(false);
        popupView.setBackgroundColor(1996488704);
        this.mTouchSlop = V.dp(ViewConfiguration.getTouchSlop());
        this.mImage = new VKImageView(context);
        this.mProgress = new ProgressBar(context);
        if (Build.VERSION.SDK_INT < 21) {
            this.mProgress.setIndeterminateDrawable(getResources().getDrawable(R.drawable.progress_light));
        } else {
            this.mProgress.setIndeterminateTintList(ColorStateList.valueOf(-1));
            this.mProgress.setIndeterminateTintMode(PorterDuff.Mode.SRC_IN);
        }
        popupView.addView(this.mProgress, new FrameLayout.LayoutParams(-2, -2, 17));
        popupView.addView(this.mImage, new FrameLayout.LayoutParams(StickersConfig.PREVIEW_SIZE, StickersConfig.PREVIEW_SIZE, 17));
        this.mWindow = new PopupWindow((View) popupView, -1, -1, false);
        this.mWindow.setAnimationStyle(0);
        this.mScaleAnimation = ObjectAnimator.ofPropertyValuesHolder(this.mImage, PropertyValuesHolder.ofFloat("scaleX", 1.0f, 1.08f, 1.0f), PropertyValuesHolder.ofFloat("scaleY", 1.0f, 1.08f, 1.0f));
        this.mScaleAnimation.setDuration(200L);
    }

    public void init(Callback projection) {
        this.mViewToUrlProjection = projection;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void prepare() {
        this.mLastRect = null;
        this.mCurrentUrl = null;
        this.mImage.setImageDrawable(null);
        this.mImage.setAlpha(255);
        this.mImage.setScaleX(1.0f);
        this.mImage.setScaleY(1.0f);
        getParent().requestDisallowInterceptTouchEvent(true);
        int[] location = new int[2];
        this.mRects = new ArrayList(getChildCount());
        for (int i = 0; i < getChildCount(); i++) {
            Rect rect = new Rect();
            View child = getChildAt(i);
            child.getDrawingRect(rect);
            child.getLocationOnScreen(location);
            rect.offset(location[0], location[1]);
            this.mRects.add(rect);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void show() {
        post(this.mPopupShower);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(@NonNull MotionEvent event) {
        switch (event.getAction() & 255) {
            case 0:
                this.mStartX = (int) event.getRawX();
                this.mStartY = (int) event.getRawY();
                this.mStartEvent = event;
                this.mHandler.postDelayed(this.mOnLongPressed, ViewConfiguration.getLongPressTimeout());
                sendMotionToParent(event);
                return true;
            case 1:
            case 3:
                this.mHandledLongTap = false;
                this.mHandler.removeCallbacks(this.mOnLongPressed);
                cancelPopup();
                getParent().requestDisallowInterceptTouchEvent(false);
                sendMotionToParent(event);
                return false;
            case 2:
                if (Math.abs(event.getRawX() - this.mStartX) > this.mTouchSlop || Math.abs(event.getRawY() - this.mStartY) > this.mTouchSlop) {
                    this.mHandler.removeCallbacks(this.mOnLongPressed);
                }
                if (!this.mHandledLongTap) {
                    return sendMotionToParent(event);
                }
                handlePopupMove(event);
                return this.mHandledLongTap;
            default:
                return false;
        }
    }

    private void cancelPopup() {
        this.mImage.animate().scaleX(0.3f).scaleY(0.3f).alpha(100.0f).setDuration(70L).start();
        PopupWindow popupWindow = this.mWindow;
        popupWindow.getClass();
        postDelayed(WindowRecyclerView$$Lambda$1.lambdaFactory$(popupWindow), 70L);
        cancelItemView(this.mLastAnimatedItemView);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean sendMotionToParent(@NonNull MotionEvent event) {
        return super.dispatchTouchEvent(event);
    }

    private void handlePopupMove(MotionEvent event) {
        int x = (int) event.getRawX();
        int y = (int) event.getRawY();
        handleTouchEvent(x, y);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean handleTouchEvent(int x, int y) {
        if (this.mLastRect == null || !this.mLastRect.contains(x, y)) {
            for (int i = 0; i < this.mRects.size(); i++) {
                Rect rect = this.mRects.get(i);
                if (rect.contains(x, y)) {
                    this.mLastRect = rect;
                    View view = getChildAt(i);
                    String url = this.mViewToUrlProjection.getURL(view);
                    String persistentPath = this.mViewToUrlProjection.getURL(view);
                    if (!TextUtils.isEmpty(url)) {
                        cancelItemView(this.mLastAnimatedItemView);
                        loadSticker(url, persistentPath);
                        this.mLastAnimatedItemView = view;
                        animateItemView(view);
                        return true;
                    }
                }
            }
        }
        return false;
    }

    private void cancelItemView(View view) {
        if (view != null) {
            view.animate().scaleX(1.0f).scaleY(1.0f).setDuration(300L).start();
        }
    }

    private void animateItemView(View view) {
        view.animate().scaleX(0.9f).scaleY(0.9f).setDuration(300L).start();
    }

    private void loadSticker(String url, String persistentPath) {
        if (!url.equals(this.mCurrentUrl)) {
            this.mCurrentUrl = url;
            this.mProgress.setVisibility(0);
            this.mImage.setOnLoadCallback(new OnLoadCallback() { // from class: com.vkontakte.android.stickers.WindowRecyclerView.4
                @Override // com.vk.imageloader.OnLoadCallback
                public void onSuccess(int width, int height) {
                    WindowRecyclerView.this.mProgress.setVisibility(8);
                    WindowRecyclerView.this.mScaleAnimation.cancel();
                    WindowRecyclerView.this.mImage.setScaleX(1.0f);
                    WindowRecyclerView.this.mImage.setScaleY(1.0f);
                    WindowRecyclerView.this.mScaleAnimation.start();
                }

                @Override // com.vk.imageloader.OnLoadCallback
                public void onFailure() {
                }
            });
            this.mImage.load(this.mCurrentUrl);
        }
    }
}
