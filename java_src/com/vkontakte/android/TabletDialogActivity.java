package com.vkontakte.android;

import android.app.Fragment;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StyleRes;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.FitSystemWindowsFragmentWrapperFrameLayout;
import com.vkontakte.android.ui.FragmentHelper;
import com.vkontakte.android.ui.ResulterProvider;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class TabletDialogActivity extends VKActivity implements View.OnClickListener, ResulterProvider {
    private FitSystemWindowsFragmentWrapperFrameLayout mContentView;
    private List<ActivityResulter> mResulters;
    private int mGravity = 49;
    private int mMinSpacing = V.dp(32.0f);
    private int mMaxWidth = V.dp(760.0f);
    private int mPreferredHeight = -1;
    private int mInputMode = 32;
    private Class<? extends Fragment> mClazz = null;
    private Bundle mArguments = null;
    private int mWindowBackgroundResource = 17170443;
    private int mWindowAnimationResource = 0;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        readArgs();
        setupView();
        adjustSize(getWindow(), getWindow().getAttributes(), this.isTablet);
        if (this.mClazz != null && savedInstanceState == null) {
            start(this.mClazz, this.mArguments);
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        adjustSize(getWindow(), getWindow().getAttributes(), this.isTablet);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        onBackPressed();
    }

    public void start(@NonNull Class<? extends Fragment> clazz, @Nullable Bundle args) {
        FragmentHelper.replaceWithBackStack(this, clazz, args, null);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (!interceptBack()) {
            if (getFragmentManager().getBackStackEntryCount() > 1) {
                getFragmentManager().popBackStack();
            } else {
                finish();
            }
        }
    }

    public boolean interceptBack() {
        Fragment fragment = getFragmentManager().findFragmentById(R.id.fragment_wrapper);
        return fragment != null && (fragment instanceof BackListener) && ((BackListener) fragment).onBackPressed();
    }

    protected void adjustSize(final Window window, final WindowManager.LayoutParams params, boolean isTablet) {
        if (isTablet) {
            if (this.mPreferredHeight >= 0) {
                final Rect rect = new Rect();
                final View decorView = window.getDecorView();
                decorView.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.vkontakte.android.TabletDialogActivity.1
                    private int mPrevHeight = 0;

                    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
                    public void onGlobalLayout() {
                        decorView.getWindowVisibleDisplayFrame(rect);
                        if (this.mPrevHeight != 0 && rect.height() < this.mPrevHeight) {
                            params.height = Math.min(rect.height(), TabletDialogActivity.this.mPreferredHeight) - TabletDialogActivity.this.mContentView.getInsetTop();
                            window.setAttributes(params);
                            decorView.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                        }
                        this.mPrevHeight = rect.height();
                    }
                });
            }
            DisplayMetrics dm = getResources().getDisplayMetrics();
            int width = dm.widthPixels;
            int height = dm.heightPixels;
            params.width = Math.min(this.mMaxWidth, width - (this.mMinSpacing << 1));
            if (this.mPreferredHeight >= 0) {
                params.height = Math.min(height, this.mPreferredHeight) - this.mContentView.getInsetTop();
            }
            params.softInputMode = this.mInputMode;
            params.gravity = this.mGravity;
            window.setAttributes(params);
            window.setSoftInputMode(this.mInputMode);
        }
        if (this.mWindowAnimationResource != 0) {
            window.setWindowAnimations(this.mWindowAnimationResource);
        }
    }

    protected final int getGravity() {
        return this.mGravity;
    }

    protected final int getMinSpacing() {
        return this.mMinSpacing;
    }

    protected final int getMaxWidth() {
        return this.mMaxWidth;
    }

    protected final Class<? extends Fragment> getClazz() {
        return this.mClazz;
    }

    protected final Bundle getArguments() {
        return this.mArguments;
    }

    protected final int getWindowBackgroundResource() {
        return this.mWindowBackgroundResource;
    }

    private void readArgs() {
        Intent intent = getIntent();
        Bundle extras = intent.getExtras();
        if (extras != null) {
            this.mGravity = extras.getInt("gravity", this.mGravity);
            this.mMinSpacing = extras.getInt("min_spacing", this.mMinSpacing);
            this.mMaxWidth = extras.getInt("max_width", this.mMaxWidth);
            this.mClazz = FragmentHelper.extractFragment(intent);
            this.mArguments = FragmentHelper.extractArgs(intent);
            this.mWindowBackgroundResource = extras.getInt("window_background_resource", this.mWindowBackgroundResource);
            this.mWindowAnimationResource = extras.getInt("window_animation", this.mWindowAnimationResource);
            this.mInputMode = extras.getInt("input_mode", this.mInputMode);
            this.mPreferredHeight = extras.getInt("preferred_height", this.mPreferredHeight);
        }
    }

    private void setupView() {
        this.mContentView = new FitSystemWindowsFragmentWrapperFrameLayout(this);
        this.mContentView.setId(R.id.fragment_wrapper);
        if (Build.VERSION.SDK_INT >= 21 && !this.isTablet) {
            getWindow().setStatusBarColor(1140850688);
            this.mContentView.setFitsSystemWindows(true);
            this.mContentView.setDrawStatusBar(true);
            this.mContentView.setStatusBarColor(getResources().getColor(R.color.brand_primary));
            this.mContentView.setClipToPadding(true);
            this.mContentView.setSystemUiVisibility(1280);
        }
        setContentView(this.mContentView);
        View textView = getWindow().getDecorView().findViewById(R.id.title);
        if (textView != null) {
            ((ViewGroup) textView.getParent()).removeView(textView);
        }
        View textView2 = getWindow().getDecorView().findViewById(16908310);
        if (textView2 != null) {
            ((ViewGroup) textView2.getParent()).removeView(textView2);
        }
        getWindow().setBackgroundDrawableResource(this.mWindowBackgroundResource);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (this.mResulters != null) {
            for (ActivityResulter resulter : this.mResulters) {
                resulter.onActivityResult(requestCode, resultCode, data);
            }
        }
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void registerActivityResult(ActivityResulter result) {
        if (this.mResulters == null) {
            this.mResulters = new ArrayList();
        }
        this.mResulters.add(result);
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void unregisterActivityResult(ActivityResulter result) {
        if (this.mResulters != null) {
            this.mResulters.remove(result);
        }
    }

    /* loaded from: classes2.dex */
    public static final class Builder extends Navigator.ActivityNavigator {
        static final String EXTRA_BACKGROUND_RESOURCE = "window_background_resource";
        static final String EXTRA_GRAVITY = "gravity";
        static final String EXTRA_INPUT_MODE = "input_mode";
        static final String EXTRA_MAX_WIDTH = "max_width";
        static final String EXTRA_MIN_SPACING = "min_spacing";
        static final String EXTRA_PREFERRED_HEIGHT = "preferred_height";
        static final String EXTRA_WINDOW_ANIMATION = "window_animation";

        public Builder(@NonNull Class<? extends TabletDialogActivity> activityClass) {
            super(activityClass);
        }

        public Builder() {
            this(TabletDialogActivity.class);
        }

        public Builder setGravity(int gravity) {
            this.args.putInt(EXTRA_GRAVITY, gravity);
            return this;
        }

        public Builder setMinSpacing(int spacing) {
            this.args.putInt(EXTRA_MIN_SPACING, spacing);
            return this;
        }

        public Builder setMaxWidth(int maxWidth) {
            this.args.putInt(EXTRA_MAX_WIDTH, maxWidth);
            return this;
        }

        public Builder setPreferredHeight(int preferredHeight) {
            this.args.putInt(EXTRA_PREFERRED_HEIGHT, preferredHeight);
            return this;
        }

        public Builder setInputMode(int inputMode) {
            this.args.putInt(EXTRA_INPUT_MODE, inputMode);
            return this;
        }

        public Builder windowBackgroundResource(@DrawableRes int color) {
            this.args.putInt(EXTRA_BACKGROUND_RESOURCE, color);
            return this;
        }

        public Builder windowAnimationResource(@StyleRes int animation) {
            this.args.putInt(EXTRA_WINDOW_ANIMATION, animation);
            return this;
        }
    }
}
