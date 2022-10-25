package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Outline;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.AbsListView;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.RelativeLayout;
import android.widget.Toast;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
/* loaded from: classes3.dex */
public class FABHelper {
    static final Interpolator mInterpolator = new AccelerateDecelerateInterpolator();
    private FloatingActionButton mFloatingActionButton;

    /* loaded from: classes3.dex */
    public interface OnOptionItemSelectedListener {
        boolean onOptionsItemSelected(MenuItem menuItem);
    }

    @Nullable
    public static FABHelper newInstance() {
        if (VKApplication.hasLollipop) {
            return new FABHelper();
        }
        return null;
    }

    public void attach(FrameLayout host) {
        if (this.mFloatingActionButton == null) {
            this.mFloatingActionButton = new FloatingActionButton(host.getContext());
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2);
            params.gravity = 85;
            params.bottomMargin = Global.scale(16.0f);
            params.rightMargin = Global.scale(16.0f);
            host.addView(this.mFloatingActionButton, params);
        }
    }

    public void attachNew(FrameLayout host) {
        if (this.mFloatingActionButton == null) {
            this.mFloatingActionButton = new FloatingActionButton(host.getContext());
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2);
            params.gravity = 85;
            params.bottomMargin = Global.scale(47.0f);
            params.rightMargin = Global.scale(16.0f);
            host.addView(this.mFloatingActionButton, params);
        }
    }

    public void attach(RelativeLayout host) {
        if (this.mFloatingActionButton == null) {
            this.mFloatingActionButton = new FloatingActionButton(host.getContext());
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-2, -2);
            params.addRule(11);
            params.addRule(12);
            params.bottomMargin = Global.scale(16.0f);
            params.rightMargin = Global.scale(16.0f);
            host.addView(this.mFloatingActionButton, params);
        }
    }

    public boolean isAttached() {
        return this.mFloatingActionButton != null;
    }

    public void setData(@Nullable CharSequence label, Drawable icon, View.OnClickListener handler) {
        if (this.mFloatingActionButton == null) {
            throw new IllegalStateException("FloatingActionButton is not attached to the host. Call attach() first.");
        }
        new OnClickListenerDelegate(label, icon, handler).attachTo(this.mFloatingActionButton);
    }

    public void setData(MenuItem item, OnOptionItemSelectedListener handler) {
        if (this.mFloatingActionButton == null) {
            throw new IllegalStateException("FloatingActionButton is not attached to the host. Call attach() first.");
        }
        new OnMenuClickListenerDelegate(item, handler).attachTo(this.mFloatingActionButton);
    }

    public AbsListView.OnScrollListener attachToScroll() {
        if (this.mFloatingActionButton == null) {
            throw new IllegalStateException("FloatingActionButton is not attached to the host. Call attach() first.");
        }
        return this.mFloatingActionButton.mScrollDetector;
    }

    public void attachToScroll(RecyclerView list) {
        if (this.mFloatingActionButton == null) {
            throw new IllegalStateException("FloatingActionButton is not attached to the host. Call attach() first.");
        }
        list.addOnScrollListener(this.mFloatingActionButton.mScrollDetector);
    }

    public void setVisible(boolean visible) {
        if (this.mFloatingActionButton == null) {
            throw new IllegalStateException("FloatingActionButton is not attached to the host. Call attach() first.");
        }
        if (visible) {
            this.mFloatingActionButton.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.FABHelper.1
                @Override // java.lang.Runnable
                public void run() {
                    FABHelper.this.mFloatingActionButton.setVisibility(0);
                }
            }, 300L);
        } else {
            this.mFloatingActionButton.setVisibility(8);
        }
    }

    /* loaded from: classes3.dex */
    private static class OnClickListenerDelegate implements View.OnClickListener, View.OnLongClickListener {
        private final View.OnClickListener mDelegate;
        private final Drawable mIcon;
        private final CharSequence mTitle;

        private OnClickListenerDelegate(@Nullable CharSequence title, Drawable icon, View.OnClickListener delegate) {
            this.mTitle = title;
            this.mIcon = icon;
            this.mDelegate = delegate;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void attachTo(FloatingActionButton ab) {
            ab.setOnLongClickListener(this);
            ab.setOnClickListener(this);
            ab.setImageDrawable(this.mIcon);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (this.mDelegate != null) {
                this.mDelegate.onClick(v);
            }
        }

        @Override // android.view.View.OnLongClickListener
        public boolean onLongClick(View v) {
            if (this.mTitle != null) {
                Toast.makeText(v.getContext(), this.mTitle, 0).show();
                v.performHapticFeedback(0);
            }
            return false;
        }
    }

    /* loaded from: classes3.dex */
    private static class OnMenuClickListenerDelegate implements View.OnClickListener, View.OnLongClickListener {
        private final OnOptionItemSelectedListener mDelegate;
        private final MenuItem mMenuItem;

        private OnMenuClickListenerDelegate(MenuItem item, OnOptionItemSelectedListener delegate) {
            this.mMenuItem = item;
            this.mDelegate = delegate;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void attachTo(FloatingActionButton ab) {
            ab.setOnLongClickListener(this);
            ab.setOnClickListener(this);
            ab.setImageDrawable(this.mMenuItem.getIcon());
            this.mMenuItem.setVisible(false);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (this.mDelegate != null) {
                this.mDelegate.onOptionsItemSelected(this.mMenuItem);
            }
        }

        @Override // android.view.View.OnLongClickListener
        public boolean onLongClick(View v) {
            Toast.makeText(v.getContext(), this.mMenuItem.getTitle(), 0).show();
            v.performHapticFeedback(0);
            return false;
        }
    }

    @TargetApi(21)
    /* loaded from: classes3.dex */
    private static class FloatingActionButton extends ImageButton {
        private static final int TRANSLATE_DURATION_MILLIS = 200;
        private ListDirectionDetector mScrollDetector;
        private boolean mVisible;

        public FloatingActionButton(Context context) {
            super(context);
            this.mVisible = true;
            this.mScrollDetector = new ListDirectionDetector() { // from class: com.vkontakte.android.ui.FABHelper.FloatingActionButton.1
                @Override // com.vkontakte.android.ui.ListDirectionDetector
                public void onScrollDown() {
                    FloatingActionButton.this.show();
                }

                @Override // com.vkontakte.android.ui.ListDirectionDetector
                public void onScrollUp() {
                    FloatingActionButton.this.hide();
                }
            };
            if (Build.VERSION.SDK_INT >= 21) {
                setElevation(Global.scale(8.0f));
            }
            Drawable normal = new ColorDrawable(getResources().getColor(R.color.brand_primary));
            int colorRipple = getResources().getColor(R.color.brand_dark);
            RippleDrawable rippleDrawable = new RippleDrawable(new ColorStateList(new int[][]{new int[0]}, new int[]{colorRipple}), normal, null);
            setOutlineProvider(new ViewOutlineProvider() { // from class: com.vkontakte.android.ui.FABHelper.FloatingActionButton.2
                @Override // android.view.ViewOutlineProvider
                public void getOutline(View view, Outline outline) {
                    int size = Global.scale(56.0f);
                    outline.setOval(0, 0, size, size);
                }
            });
            setClipToOutline(true);
            setBackground(rippleDrawable);
        }

        @Override // android.widget.ImageView, android.view.View
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int size = Global.scale(56.0f);
            setMeasuredDimension(size, size);
        }

        public void show() {
            toggle(true, false);
        }

        public void hide() {
            toggle(false, false);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void toggle(final boolean visible, boolean force) {
            if (this.mVisible != visible || force) {
                this.mVisible = visible;
                int height = getHeight();
                if (height == 0 && !force) {
                    ViewTreeObserver vto = getViewTreeObserver();
                    if (vto.isAlive()) {
                        vto.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.FABHelper.FloatingActionButton.3
                            @Override // android.view.ViewTreeObserver.OnPreDrawListener
                            public boolean onPreDraw() {
                                ViewTreeObserver currentVto = FloatingActionButton.this.getViewTreeObserver();
                                if (currentVto.isAlive()) {
                                    currentVto.removeOnPreDrawListener(this);
                                }
                                FloatingActionButton.this.toggle(visible, true);
                                return true;
                            }
                        });
                        return;
                    }
                }
                int translationY = visible ? 0 : height + getMarginBottom();
                animate().setInterpolator(FABHelper.mInterpolator).setDuration(200L).translationY(translationY);
            }
        }

        private int getMarginBottom() {
            ViewGroup.LayoutParams layoutParams = getLayoutParams();
            if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
                return ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin;
            }
            return 0;
        }
    }
}
