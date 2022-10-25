package uk.co.senab.actionbarpulltorefresh.library;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RectShape;
import android.os.Build;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vkontakte.android.R;
import fr.castorflex.android.smoothprogressbar.SmoothProgressBar;
import uk.co.senab.actionbarpulltorefresh.library.sdk.Compat;
/* loaded from: classes3.dex */
public class DefaultHeaderTransformer extends HeaderTransformer {
    public static final int PROGRESS_BAR_STYLE_INSIDE = 0;
    public static final int PROGRESS_BAR_STYLE_OUTSIDE = 1;
    private long mAnimationDuration;
    private ViewGroup mContentLayout;
    private SmoothProgressBar mHeaderProgressBar;
    private TextView mHeaderTextView;
    private View mHeaderView;
    private int mProgressBarStyle;
    private int mProgressDrawableColor;
    private CharSequence mPullRefreshLabel;
    private CharSequence mRefreshingLabel;
    private CharSequence mReleaseLabel;
    private int mProgressBarHeight = -2;
    private final Interpolator mInterpolator = new AccelerateInterpolator();

    /* JADX INFO: Access modifiers changed from: protected */
    public DefaultHeaderTransformer() {
        int min = getMinimumApiLevel();
        if (Build.VERSION.SDK_INT < min) {
            throw new IllegalStateException("This HeaderTransformer is designed to run on SDK " + min + "+. If using ActionBarSherlock or ActionBarCompat you should use the appropriate provided extra.");
        }
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public void onViewCreated(Activity activity, View headerView) {
        this.mHeaderView = headerView;
        this.mHeaderProgressBar = (SmoothProgressBar) headerView.findViewById(R.id.ptr_progress);
        this.mHeaderTextView = (TextView) headerView.findViewById(R.id.ptr_text);
        this.mContentLayout = (ViewGroup) headerView.findViewById(R.id.ptr_content);
        this.mPullRefreshLabel = activity.getString(R.string.pull_to_refresh);
        this.mRefreshingLabel = activity.getString(R.string.refreshing);
        this.mReleaseLabel = activity.getString(R.string.release_to_refresh);
        this.mAnimationDuration = activity.getResources().getInteger(17694720);
        this.mProgressDrawableColor = activity.getResources().getColor(R.color.default_progress_bar_color);
        setupViewsFromStyles(activity, headerView);
        applyProgressBarStyle();
        applyProgressBarSettings();
        onReset();
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public void onConfigurationChanged(Activity activity, Configuration newConfig) {
        setupViewsFromStyles(activity, getHeaderView());
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public void onReset() {
        if (this.mHeaderProgressBar != null) {
            this.mHeaderProgressBar.setVisibility(0);
            this.mHeaderProgressBar.setProgress(0);
            this.mHeaderProgressBar.setIndeterminate(false);
        }
        if (this.mHeaderTextView != null) {
            this.mHeaderTextView.setVisibility(0);
            this.mHeaderTextView.setText(this.mPullRefreshLabel);
        }
        if (this.mContentLayout != null) {
            this.mContentLayout.setVisibility(0);
            Compat.setAlpha(this.mContentLayout, 1.0f);
        }
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public void onPulled(float percentagePulled) {
        if (this.mHeaderProgressBar != null) {
            this.mHeaderProgressBar.setVisibility(0);
            float progress = this.mInterpolator.getInterpolation(percentagePulled);
            this.mHeaderProgressBar.setProgress(Math.round(this.mHeaderProgressBar.getMax() * progress));
        }
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public void onRefreshStarted() {
        if (this.mHeaderTextView != null) {
            this.mHeaderTextView.setText(this.mRefreshingLabel);
        }
        if (this.mHeaderProgressBar != null) {
            this.mHeaderProgressBar.setVisibility(0);
            this.mHeaderProgressBar.setIndeterminate(true);
            this.mHeaderProgressBar.setSmoothProgressDrawableColor(this.mProgressDrawableColor);
            this.mHeaderProgressBar.setInterpolator(new AccelerateInterpolator(1.5f));
        }
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public void onReleaseToRefresh() {
        if (this.mHeaderTextView != null) {
            this.mHeaderTextView.setText(this.mReleaseLabel);
        }
        if (this.mHeaderProgressBar != null) {
            this.mHeaderProgressBar.setProgress(this.mHeaderProgressBar.getMax());
        }
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public void onRefreshMinimized() {
        if (this.mContentLayout != null) {
            ObjectAnimator.ofFloat(this.mContentLayout, "alpha", 1.0f, 0.0f).start();
        }
    }

    public View getHeaderView() {
        return this.mHeaderView;
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public boolean showHeaderView() {
        boolean changeVis = this.mHeaderView.getVisibility() != 0;
        if (changeVis) {
            this.mHeaderView.setVisibility(0);
            AnimatorSet animSet = new AnimatorSet();
            ObjectAnimator transAnim = ObjectAnimator.ofFloat(this.mContentLayout, "translationY", -this.mContentLayout.getHeight(), 0.0f);
            ObjectAnimator alphaAnim = ObjectAnimator.ofFloat(this.mHeaderView, "alpha", 0.0f, 1.0f);
            animSet.playTogether(transAnim, alphaAnim);
            animSet.setDuration(this.mAnimationDuration);
            animSet.start();
        }
        return changeVis;
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer
    public boolean hideHeaderView() {
        Animator animator;
        boolean changeVis = this.mHeaderView.getVisibility() != 8;
        if (changeVis) {
            if (this.mContentLayout.getAlpha() >= 0.5f) {
                animator = new AnimatorSet();
                ObjectAnimator transAnim = ObjectAnimator.ofFloat(this.mContentLayout, "translationY", 0.0f, -this.mContentLayout.getHeight());
                ObjectAnimator alphaAnim = ObjectAnimator.ofFloat(this.mHeaderView, "alpha", 1.0f, 0.0f);
                ((AnimatorSet) animator).playTogether(transAnim, alphaAnim);
            } else {
                animator = ObjectAnimator.ofFloat(this.mHeaderView, "alpha", 1.0f, 0.0f);
            }
            animator.setDuration(this.mAnimationDuration);
            animator.addListener(new HideAnimationCallback());
            animator.start();
        }
        return changeVis;
    }

    public void setProgressBarColor(int color) {
        if (color != this.mProgressDrawableColor) {
            this.mProgressDrawableColor = color;
            this.mHeaderProgressBar.setSmoothProgressDrawableColor(color);
            applyProgressBarSettings();
        }
    }

    public void setProgressBarStyle(int style) {
        if (this.mProgressBarStyle != style) {
            this.mProgressBarStyle = style;
            applyProgressBarStyle();
        }
    }

    public void setProgressBarHeight(int height) {
        if (this.mProgressBarHeight != height) {
            this.mProgressBarHeight = height;
            applyProgressBarStyle();
        }
    }

    public void setPullText(CharSequence pullText) {
        this.mPullRefreshLabel = pullText;
        if (this.mHeaderTextView != null) {
            this.mHeaderTextView.setText(this.mPullRefreshLabel);
        }
    }

    public void setRefreshingText(CharSequence refreshingText) {
        this.mRefreshingLabel = refreshingText;
    }

    public void setReleaseText(CharSequence releaseText) {
        this.mReleaseLabel = releaseText;
    }

    private void setupViewsFromStyles(Activity activity, View headerView) {
        Drawable bg;
        int spbStyleRes;
        TypedArray styleAttrs = obtainStyledAttrsFromThemeAttr(activity, R.attr.ptrHeaderStyle, R.styleable.PullToRefreshHeader);
        if (this.mContentLayout != null) {
            int height = styleAttrs.getDimensionPixelSize(1, getActionBarSize(activity));
            this.mContentLayout.getLayoutParams().height = height;
            this.mContentLayout.requestLayout();
        }
        if (styleAttrs.hasValue(0)) {
            bg = styleAttrs.getDrawable(0);
        } else {
            bg = getActionBarBackground(activity);
        }
        if (bg != null) {
            this.mHeaderTextView.setBackgroundDrawable(bg);
            if (this.mContentLayout != null && bg.getOpacity() == -1) {
                this.mContentLayout.setBackgroundResource(0);
            }
        }
        Context abContext = headerView.getContext();
        int titleTextStyle = styleAttrs.getResourceId(2, getActionBarTitleStyle(abContext));
        if (titleTextStyle != 0) {
            this.mHeaderTextView.setTextAppearance(abContext, titleTextStyle);
        }
        if (styleAttrs.hasValue(3)) {
            this.mProgressDrawableColor = styleAttrs.getColor(3, this.mProgressDrawableColor);
        }
        this.mProgressBarStyle = styleAttrs.getInt(4, 1);
        if (styleAttrs.hasValue(5)) {
            this.mProgressBarHeight = styleAttrs.getDimensionPixelSize(5, this.mProgressBarHeight);
        }
        if (styleAttrs.hasValue(6)) {
            this.mPullRefreshLabel = styleAttrs.getString(6);
        }
        if (styleAttrs.hasValue(7)) {
            this.mRefreshingLabel = styleAttrs.getString(7);
        }
        if (styleAttrs.hasValue(8)) {
            this.mReleaseLabel = styleAttrs.getString(8);
        }
        if (styleAttrs.hasValue(9) && (spbStyleRes = styleAttrs.getResourceId(9, 0)) != 0) {
            this.mHeaderProgressBar.applyStyle(spbStyleRes);
        }
        styleAttrs.recycle();
    }

    private void applyProgressBarStyle() {
        RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(-1, this.mProgressBarHeight);
        switch (this.mProgressBarStyle) {
            case 0:
                lp.addRule(8, R.id.ptr_content);
                break;
            case 1:
                lp.addRule(3, R.id.ptr_content);
                break;
        }
        this.mHeaderProgressBar.setLayoutParams(lp);
    }

    private void applyProgressBarSettings() {
        if (this.mHeaderProgressBar != null) {
            ShapeDrawable shape = new ShapeDrawable();
            shape.setShape(new RectShape());
            shape.getPaint().setColor(this.mProgressDrawableColor);
            ClipDrawable clipDrawable = new ClipDrawable(shape, 17, 1);
            this.mHeaderProgressBar.setProgressDrawable(clipDrawable);
        }
    }

    protected Drawable getActionBarBackground(Context context) {
        int[] android_styleable_ActionBar = {16842964};
        TypedArray abStyle = obtainStyledAttrsFromThemeAttr(context, 16843470, android_styleable_ActionBar);
        try {
            return abStyle.getDrawable(0);
        } finally {
            abStyle.recycle();
        }
    }

    protected int getActionBarSize(Context context) {
        int[] attrs = {16843499};
        TypedArray values = context.getTheme().obtainStyledAttributes(attrs);
        try {
            return values.getDimensionPixelSize(0, 0);
        } finally {
            values.recycle();
        }
    }

    protected int getActionBarTitleStyle(Context context) {
        int[] android_styleable_ActionBar = {16843512};
        TypedArray abStyle = obtainStyledAttrsFromThemeAttr(context, 16843470, android_styleable_ActionBar);
        try {
            return abStyle.getResourceId(0, 0);
        } finally {
            abStyle.recycle();
        }
    }

    protected int getMinimumApiLevel() {
        return 14;
    }

    /* loaded from: classes3.dex */
    class HideAnimationCallback extends AnimatorListenerAdapter {
        HideAnimationCallback() {
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            View headerView = DefaultHeaderTransformer.this.getHeaderView();
            if (headerView != null) {
                headerView.setVisibility(8);
            }
            DefaultHeaderTransformer.this.onReset();
        }
    }

    protected static TypedArray obtainStyledAttrsFromThemeAttr(Context context, int themeAttr, int[] styleAttrs) {
        TypedValue outValue = new TypedValue();
        context.getTheme().resolveAttribute(themeAttr, outValue, true);
        int styleResId = outValue.resourceId;
        return context.obtainStyledAttributes(styleResId, styleAttrs);
    }
}
