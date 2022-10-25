package uk.co.senab.actionbarpulltorefresh.library;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import com.vkontakte.android.R;
import uk.co.senab.actionbarpulltorefresh.library.listeners.HeaderViewListener;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;
/* loaded from: classes3.dex */
public class PullToRefreshLayout extends FrameLayout {
    private static final boolean DEBUG = false;
    private static final String LOG_TAG = "PullToRefreshLayout";
    private boolean isInverse;
    private PullToRefreshAttacher mPullToRefreshAttacher;
    private ViewTreeObserver.OnPreDrawListener preDrawListener;

    public PullToRefreshLayout(Context context) {
        this(context, null);
    }

    public PullToRefreshLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public PullToRefreshLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.preDrawListener = new ViewTreeObserver.OnPreDrawListener() { // from class: uk.co.senab.actionbarpulltorefresh.library.PullToRefreshLayout.1
            private boolean viewVisible = true;

            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                if (PullToRefreshLayout.this.isRefreshing()) {
                    int[] loc = {0, 0};
                    int[] ploc = {0, 0};
                    PullToRefreshLayout.this.getLocationOnScreen(loc);
                    View decorView = ((Activity) PullToRefreshLayout.this.getContext()).getWindow().getDecorView();
                    decorView.getLocationOnScreen(ploc);
                    Rect tRect = new Rect(loc[0], loc[1], PullToRefreshLayout.this.getWidth() + loc[0], PullToRefreshLayout.this.getHeight() + loc[1]);
                    Rect pRect = new Rect(ploc[0], ploc[1], decorView.getWidth() + ploc[0], decorView.getHeight() + ploc[1]);
                    boolean isOnScreen = pRect.contains(tRect.centerX(), tRect.centerY());
                    if (isOnScreen != this.viewVisible) {
                        if (isOnScreen) {
                            PullToRefreshLayout.this.mPullToRefreshAttacher.setRefreshing(true);
                            PullToRefreshLayout.this.mPullToRefreshAttacher.minimizeHeader();
                        } else {
                            PullToRefreshLayout.this.mPullToRefreshAttacher.hideHeaderView();
                        }
                        this.viewVisible = isOnScreen;
                    }
                }
                return true;
            }
        };
        this.isInverse = false;
    }

    public boolean isInverse() {
        return this.isInverse;
    }

    public void setInverse(boolean inv) {
        this.isInverse = inv;
        ensureAttacher();
        this.mPullToRefreshAttacher.setInverse(this.isInverse);
    }

    public final void setRefreshing(boolean refreshing) {
        ensureAttacher();
        this.mPullToRefreshAttacher.setRefreshing(refreshing);
    }

    public final boolean isRefreshing() {
        ensureAttacher();
        return this.mPullToRefreshAttacher.isRefreshing();
    }

    public final void setRefreshComplete() {
        ensureAttacher();
        this.mPullToRefreshAttacher.setRefreshComplete();
    }

    public final void setHeaderViewListener(HeaderViewListener listener) {
        ensureAttacher();
        this.mPullToRefreshAttacher.setHeaderViewListener(listener);
    }

    public final View getHeaderView() {
        ensureAttacher();
        return this.mPullToRefreshAttacher.getHeaderView();
    }

    public HeaderTransformer getHeaderTransformer() {
        ensureAttacher();
        return this.mPullToRefreshAttacher.getHeaderTransformer();
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent event) {
        if (!isEnabled() || this.mPullToRefreshAttacher == null || getChildCount() <= 0) {
            return false;
        }
        return this.mPullToRefreshAttacher.onInterceptTouchEvent(event);
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent event) {
        return (!isEnabled() || this.mPullToRefreshAttacher == null) ? super.onTouchEvent(event) : this.mPullToRefreshAttacher.onTouchEvent(event);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public FrameLayout.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        ((Activity) getContext()).getWindow().getDecorView().getViewTreeObserver().addOnPreDrawListener(this.preDrawListener);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        ((Activity) getContext()).getWindow().getDecorView().getViewTreeObserver().removeOnPreDrawListener(this.preDrawListener);
        if (this.mPullToRefreshAttacher != null) {
            this.mPullToRefreshAttacher.destroy();
        }
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    protected void onConfigurationChanged(Configuration newConfig) {
        if (this.mPullToRefreshAttacher != null) {
            this.mPullToRefreshAttacher.onConfigurationChanged(newConfig);
        }
        super.onConfigurationChanged(newConfig);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setPullToRefreshAttacher(PullToRefreshAttacher attacher) {
        if (this.mPullToRefreshAttacher != null) {
            this.mPullToRefreshAttacher.destroy();
        }
        this.mPullToRefreshAttacher = attacher;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addAllChildrenAsPullable() {
        ensureAttacher();
        int z = getChildCount();
        for (int i = 0; i < z; i++) {
            addRefreshableView(getChildAt(i));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addChildrenAsPullable(int[] viewIds) {
        int z = viewIds.length;
        for (int i = 0; i < z; i++) {
            View view = findViewById(viewIds[i]);
            if (view != null) {
                addRefreshableView(findViewById(viewIds[i]));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addChildrenAsPullable(View[] views) {
        int z = views.length;
        for (int i = 0; i < z; i++) {
            if (views[i] != null) {
                addRefreshableView(views[i]);
            }
        }
    }

    void addRefreshableView(View view) {
        if (this.mPullToRefreshAttacher != null) {
            this.mPullToRefreshAttacher.addRefreshableView(view, getViewDelegateFromLayoutParams(view));
        }
    }

    ViewDelegate getViewDelegateFromLayoutParams(View view) {
        if (view != null && (view.getLayoutParams() instanceof LayoutParams)) {
            LayoutParams lp = (LayoutParams) view.getLayoutParams();
            String clazzName = lp.getViewDelegateClassName();
            if (!TextUtils.isEmpty(clazzName)) {
                int firstDot = clazzName.indexOf(46);
                if (firstDot == -1) {
                    clazzName = getContext().getPackageName() + "." + clazzName;
                } else if (firstDot == 0) {
                    clazzName = getContext().getPackageName() + clazzName;
                }
                return (ViewDelegate) InstanceCreationUtils.instantiateViewDelegate(getContext(), clazzName);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PullToRefreshAttacher createPullToRefreshAttacher(Activity activity, Options options) {
        if (options == null) {
            options = new Options();
        }
        return new PullToRefreshAttacher(activity, options);
    }

    private void ensureAttacher() {
        if (this.mPullToRefreshAttacher == null) {
            throw new IllegalStateException("You need to setup the PullToRefreshLayout before using it");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class LayoutParams extends FrameLayout.LayoutParams {
        private final String mViewDelegateClassName;

        LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            TypedArray a = c.obtainStyledAttributes(attrs, R.styleable.PullToRefreshView);
            this.mViewDelegateClassName = a.getString(0);
            a.recycle();
        }

        String getViewDelegateClassName() {
            return this.mViewDelegateClassName;
        }
    }
}
