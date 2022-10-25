package uk.co.senab.actionbarpulltorefresh.library;

import android.annotation.TargetApi;
import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowManager;
import java.util.WeakHashMap;
import uk.co.senab.actionbarpulltorefresh.library.listeners.HeaderViewListener;
import uk.co.senab.actionbarpulltorefresh.library.listeners.OnRefreshListener;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;
@TargetApi(14)
/* loaded from: classes3.dex */
public class PullToRefreshAttacher {
    private static final boolean DEBUG = false;
    private static final String LOG_TAG = "PullToRefreshAttacher";
    private boolean inverse;
    private Activity mActivity;
    private final AddHeaderViewRunnable mAddHeaderViewRunnable;
    private EnvironmentDelegate mEnvironmentDelegate;
    private boolean mHandlingTouchEventFromDown;
    private HeaderTransformer mHeaderTransformer;
    private View mHeaderView;
    private HeaderViewListener mHeaderViewListener;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private boolean mIsBeingDragged;
    private boolean mIsRefreshing;
    private float mLastMotionY;
    private OnRefreshListener mOnRefreshListener;
    private float mPullBeginY;
    private final boolean mRefreshMinimize;
    private final int mRefreshMinimizeDelay;
    private final boolean mRefreshOnUp;
    private final float mRefreshScrollDistance;
    private final WeakHashMap<View, ViewDelegate> mRefreshableViews;
    private final int mTouchSlop;
    private View mViewBeingDragged;
    private boolean mIsDestroyed = false;
    private final int[] mViewLocationResult = new int[2];
    private final Rect mRect = new Rect();
    private final Runnable mRefreshMinimizeRunnable = new Runnable() { // from class: uk.co.senab.actionbarpulltorefresh.library.PullToRefreshAttacher.2
        @Override // java.lang.Runnable
        public void run() {
            PullToRefreshAttacher.this.minimizeHeader();
        }
    };

    /* JADX INFO: Access modifiers changed from: protected */
    public PullToRefreshAttacher(Activity activity, Options options) {
        if (activity == null) {
            throw new IllegalArgumentException("activity cannot be null");
        }
        if (options == null) {
            Log.i(LOG_TAG, "Given null options so using default options.");
            options = new Options();
        }
        this.mActivity = activity;
        this.mRefreshableViews = new WeakHashMap<>();
        this.mRefreshScrollDistance = options.refreshScrollDistance;
        this.mRefreshOnUp = options.refreshOnUp;
        this.mRefreshMinimizeDelay = options.refreshMinimizeDelay;
        this.mRefreshMinimize = options.refreshMinimize;
        this.mEnvironmentDelegate = options.environmentDelegate != null ? options.environmentDelegate : createDefaultEnvironmentDelegate();
        this.mHeaderTransformer = options.headerTransformer != null ? options.headerTransformer : createDefaultHeaderTransformer();
        this.mTouchSlop = ViewConfiguration.get(activity).getScaledTouchSlop();
        ViewGroup decorView = (ViewGroup) activity.getWindow().getDecorView();
        this.mHeaderView = LayoutInflater.from(this.mEnvironmentDelegate.getContextForInflater(activity)).inflate(options.headerLayout, decorView, false);
        if (this.mHeaderView == null) {
            throw new IllegalArgumentException("Must supply valid layout id for header.");
        }
        this.mHeaderView.setVisibility(4);
        this.mHeaderTransformer.onViewCreated(activity, this.mHeaderView);
        this.mAddHeaderViewRunnable = new AddHeaderViewRunnable();
        this.mAddHeaderViewRunnable.start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addRefreshableView(View view, ViewDelegate viewDelegate) {
        if (!isDestroyed()) {
            if (view == null) {
                Log.i(LOG_TAG, "Refreshable View is null.");
                return;
            }
            if (viewDelegate == null) {
                viewDelegate = InstanceCreationUtils.getBuiltInViewDelegate(view);
            }
            this.mRefreshableViews.put(view, viewDelegate);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void useViewDelegate(Class<?> viewClass, ViewDelegate delegate) {
        for (View view : this.mRefreshableViews.keySet()) {
            if (viewClass.isInstance(view)) {
                this.mRefreshableViews.put(view, delegate);
            }
        }
    }

    void clearRefreshableViews() {
        this.mRefreshableViews.clear();
    }

    public void onConfigurationChanged(Configuration newConfig) {
        this.mHeaderTransformer.onConfigurationChanged(this.mActivity, newConfig);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void setRefreshing(boolean refreshing) {
        setRefreshingInt(null, refreshing, false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean isRefreshing() {
        return this.mIsRefreshing;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void setRefreshComplete() {
        setRefreshingInt(null, false, false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOnRefreshListener(OnRefreshListener listener) {
        this.mOnRefreshListener = listener;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void destroy() {
        if (!this.mIsDestroyed) {
            removeHeaderViewFromActivity(this.mHeaderView);
            clearRefreshableViews();
            this.mActivity = null;
            this.mHeaderView = null;
            this.mHeaderViewListener = null;
            this.mEnvironmentDelegate = null;
            this.mHeaderTransformer = null;
            this.mIsDestroyed = true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void setHeaderViewListener(HeaderViewListener listener) {
        this.mHeaderViewListener = listener;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final View getHeaderView() {
        return this.mHeaderView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public HeaderTransformer getHeaderTransformer() {
        return this.mHeaderTransformer;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean onInterceptTouchEvent(MotionEvent event) {
        if (isRefreshing()) {
            return false;
        }
        float x = event.getX();
        float y = event.getY();
        switch (event.getAction()) {
            case 0:
                if (canRefresh(true)) {
                    for (View view : this.mRefreshableViews.keySet()) {
                        if (isViewBeingDragged(view, event)) {
                            this.mInitialMotionX = x;
                            this.mInitialMotionY = y;
                            this.mViewBeingDragged = view;
                        }
                    }
                    break;
                }
                break;
            case 1:
            case 3:
                resetTouch();
                break;
            case 2:
                if (!this.mIsBeingDragged && this.mInitialMotionY > 0.0f) {
                    float yDiff = this.inverse ? -(y - this.mInitialMotionY) : y - this.mInitialMotionY;
                    float xDiff = x - this.mInitialMotionX;
                    if (Math.abs(yDiff) > Math.abs(xDiff) && yDiff > this.mTouchSlop) {
                        this.mIsBeingDragged = true;
                        onPullStarted(y);
                        break;
                    } else if (yDiff < (-this.mTouchSlop)) {
                        resetTouch();
                        break;
                    }
                }
                break;
        }
        return this.mIsBeingDragged;
    }

    final boolean isViewBeingDragged(View view, MotionEvent event) {
        ViewDelegate delegate;
        if (!view.isShown() || !this.mRefreshableViews.containsKey(view)) {
            return false;
        }
        view.getLocationOnScreen(this.mViewLocationResult);
        int viewLeft = this.mViewLocationResult[0];
        int viewTop = this.mViewLocationResult[1];
        this.mRect.set(viewLeft, viewTop, view.getWidth() + viewLeft, view.getHeight() + viewTop);
        int rawX = (int) event.getRawX();
        int rawY = (int) event.getRawY();
        if (this.mRect.contains(rawX, rawY) && (delegate = this.mRefreshableViews.get(view)) != null) {
            return delegate.isReadyForPull(view, rawX - this.mRect.left, rawY - this.mRect.top);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == 0) {
            this.mHandlingTouchEventFromDown = true;
        }
        if (this.mHandlingTouchEventFromDown && !this.mIsBeingDragged) {
            onInterceptTouchEvent(event);
            return true;
        } else if (this.mViewBeingDragged == null) {
            return false;
        } else {
            switch (event.getAction()) {
                case 1:
                case 3:
                    checkScrollForRefresh(this.mViewBeingDragged);
                    if (this.mIsBeingDragged) {
                        onPullEnded();
                    }
                    resetTouch();
                    return true;
                case 2:
                    if (isRefreshing()) {
                        return false;
                    }
                    float y = event.getY();
                    if (!this.mIsBeingDragged || y == this.mLastMotionY) {
                        return true;
                    }
                    float yDx = this.inverse ? this.mLastMotionY - y : y - this.mLastMotionY;
                    Log.i("vk", "dy=" + yDx + ", slop=" + this.mTouchSlop);
                    if (yDx >= (-this.mTouchSlop)) {
                        onPull(this.mViewBeingDragged, y);
                        if (yDx <= 0.0f) {
                            return true;
                        }
                        this.mLastMotionY = y;
                        return true;
                    }
                    onPullEnded();
                    resetTouch();
                    return true;
                default:
                    return true;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void minimizeHeader() {
        if (!isDestroyed()) {
            this.mHeaderTransformer.onRefreshMinimized();
            if (this.mHeaderViewListener != null) {
                this.mHeaderViewListener.onStateChanged(this.mHeaderView, 1);
            }
        }
    }

    void resetTouch() {
        this.mIsBeingDragged = false;
        this.mHandlingTouchEventFromDown = false;
        this.mPullBeginY = -1.0f;
        this.mLastMotionY = -1.0f;
        this.mInitialMotionY = -1.0f;
    }

    void onPullStarted(float y) {
        showHeaderView();
        this.mPullBeginY = y;
        if (this.inverse) {
            this.mLastMotionY = y;
        }
    }

    void onPull(View view, float y) {
        float pxScrollForRefresh = getScrollNeededForRefresh(view);
        float scrollLength = Math.abs(y - this.mPullBeginY);
        if (scrollLength < pxScrollForRefresh) {
            this.mHeaderTransformer.onPulled(scrollLength / pxScrollForRefresh);
        } else if (this.mRefreshOnUp) {
            this.mHeaderTransformer.onReleaseToRefresh();
        } else {
            setRefreshingInt(view, true, true);
        }
    }

    void onPullEnded() {
        if (!this.mIsRefreshing) {
            reset(true);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setInverse(boolean inv) {
        this.inverse = inv;
    }

    boolean isInverse() {
        return this.inverse;
    }

    void showHeaderView() {
        updateHeaderViewPosition(this.mHeaderView);
        if (this.mHeaderTransformer.showHeaderView() && this.mHeaderViewListener != null) {
            this.mHeaderViewListener.onStateChanged(this.mHeaderView, 0);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void hideHeaderView() {
        if (this.mHeaderTransformer.hideHeaderView() && this.mHeaderViewListener != null) {
            this.mHeaderViewListener.onStateChanged(this.mHeaderView, 2);
        }
    }

    protected final Activity getAttachedActivity() {
        return this.mActivity;
    }

    protected EnvironmentDelegate createDefaultEnvironmentDelegate() {
        return new EnvironmentDelegate() { // from class: uk.co.senab.actionbarpulltorefresh.library.PullToRefreshAttacher.1
            @Override // uk.co.senab.actionbarpulltorefresh.library.EnvironmentDelegate
            public Context getContextForInflater(Activity activity) {
                ActionBar ab;
                Context context = null;
                if (Build.VERSION.SDK_INT >= 14 && (ab = activity.getActionBar()) != null) {
                    context = ab.getThemedContext();
                }
                if (context == null) {
                    return activity;
                }
                return context;
            }
        };
    }

    protected HeaderTransformer createDefaultHeaderTransformer() {
        return new DefaultHeaderTransformer();
    }

    private boolean checkScrollForRefresh(View view) {
        if (!this.mIsBeingDragged || !this.mRefreshOnUp || view == null || this.mLastMotionY - this.mPullBeginY < getScrollNeededForRefresh(view)) {
            return false;
        }
        setRefreshingInt(view, true, true);
        return true;
    }

    private void setRefreshingInt(View view, boolean refreshing, boolean fromTouch) {
        if (!isDestroyed() && this.mIsRefreshing != refreshing) {
            resetTouch();
            if (refreshing && canRefresh(fromTouch)) {
                startRefresh(view, fromTouch);
            } else {
                reset(fromTouch);
            }
        }
    }

    private boolean canRefresh(boolean fromTouch) {
        return !this.mIsRefreshing && (!fromTouch || this.mOnRefreshListener != null);
    }

    private float getScrollNeededForRefresh(View view) {
        return view.getHeight() * this.mRefreshScrollDistance;
    }

    private void reset(boolean fromTouch) {
        this.mIsRefreshing = false;
        if (this.mRefreshMinimize) {
            getHeaderView().removeCallbacks(this.mRefreshMinimizeRunnable);
        }
        hideHeaderView();
    }

    private void startRefresh(View view, boolean fromTouch) {
        this.mIsRefreshing = true;
        if (fromTouch && this.mOnRefreshListener != null) {
            this.mOnRefreshListener.onRefreshStarted(view);
        }
        this.mHeaderTransformer.onRefreshStarted();
        showHeaderView();
        if (this.mRefreshMinimize) {
            if (this.mRefreshMinimizeDelay > 0) {
                getHeaderView().postDelayed(this.mRefreshMinimizeRunnable, this.mRefreshMinimizeDelay);
            } else {
                getHeaderView().post(this.mRefreshMinimizeRunnable);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isDestroyed() {
        if (this.mIsDestroyed) {
            Log.i(LOG_TAG, "PullToRefreshAttacher is destroyed.");
        }
        return this.mIsDestroyed;
    }

    protected void addHeaderViewToActivity(View headerView) {
        this.mActivity.getWindow().getDecorView().getWindowVisibleDisplayFrame(this.mRect);
        int width = -1;
        int height = -2;
        ViewGroup.LayoutParams requestedLp = headerView.getLayoutParams();
        if (requestedLp != null) {
            width = requestedLp.width;
            height = requestedLp.height;
        }
        WindowManager.LayoutParams wlp = new WindowManager.LayoutParams(width, height, 1000, 280, -3);
        wlp.x = 0;
        wlp.y = this.mRect.top;
        wlp.gravity = 48;
        headerView.setTag(wlp);
        this.mActivity.getWindowManager().addView(headerView, wlp);
    }

    protected void updateHeaderViewPosition(View headerView) {
        this.mActivity.getWindow().getDecorView().getWindowVisibleDisplayFrame(this.mRect);
        WindowManager.LayoutParams wlp = null;
        if (headerView.getLayoutParams() instanceof WindowManager.LayoutParams) {
            wlp = (WindowManager.LayoutParams) headerView.getLayoutParams();
        } else if (headerView.getTag() instanceof WindowManager.LayoutParams) {
            wlp = (WindowManager.LayoutParams) headerView.getTag();
        }
        if (wlp != null && wlp.y != this.mRect.top) {
            wlp.y = this.mRect.top;
            this.mActivity.getWindowManager().updateViewLayout(headerView, wlp);
        }
    }

    protected void removeHeaderViewFromActivity(View headerView) {
        this.mAddHeaderViewRunnable.finish();
        if (headerView.getWindowToken() != null) {
            this.mActivity.getWindowManager().removeViewImmediate(headerView);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class AddHeaderViewRunnable implements Runnable {
        private AddHeaderViewRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!PullToRefreshAttacher.this.isDestroyed()) {
                if (getDecorView().getWindowToken() != null) {
                    PullToRefreshAttacher.this.addHeaderViewToActivity(PullToRefreshAttacher.this.mHeaderView);
                } else {
                    start();
                }
            }
        }

        public void start() {
            getDecorView().post(this);
        }

        public void finish() {
            getDecorView().removeCallbacks(this);
        }

        private View getDecorView() {
            return PullToRefreshAttacher.this.getAttachedActivity().getWindow().getDecorView();
        }
    }
}
