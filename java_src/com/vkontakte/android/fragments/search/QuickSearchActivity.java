package com.vkontakte.android.fragments.search;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.TimeInterpolator;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.gms.actions.SearchIntents;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.animation.ViewAnimationUtils;
import com.vkontakte.android.ui.cardview.CardDrawable;
import com.vkontakte.android.utils.LinkUtils;
import com.vkontakte.android.utils.VoiceUtils;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class QuickSearchActivity extends Activity implements View.OnClickListener, TextWatcher, TextView.OnEditorActionListener {
    static final long ANIMATION_DURATION = 300;
    static final int sPaddingVertical = V.dp(7.0f);
    private int mAnimationRadius;
    private int mAnimationX;
    private int mAnimationY;
    private ImageView mClear;
    private View mContent;
    boolean mHasAnimation;
    private TextView mQueryField;
    private QuickSearchFragment mSearchFragment;
    private LogoutReceiver logoutReceiver = null;
    private final Drawable mWindowBackground = new ColorDrawable(1711276032);
    private final TimeInterpolator mInterpolator = new AccelerateDecelerateInterpolator() { // from class: com.vkontakte.android.fragments.search.QuickSearchActivity.1
        @Override // android.view.animation.AccelerateDecelerateInterpolator, android.animation.TimeInterpolator
        public float getInterpolation(float input) {
            float result = super.getInterpolation(input);
            QuickSearchActivity.this.mWindowBackground.setAlpha((int) (255.0f * input));
            QuickSearchActivity.this.mWindowBackground.invalidateSelf();
            return result;
        }
    };

    public static void start(View view) {
        Context context = view.getContext();
        Intent intent = new Intent(context, QuickSearchActivity.class);
        int width = view.getWidth();
        int height = view.getHeight();
        intent.putExtra("x", view.getLeft() + (width >> 1));
        intent.putExtra("y", view.getTop() + (height >> 1));
        intent.putExtra("radius", V.dp(10.0f));
        context.startActivity(intent);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.logoutReceiver = LogoutReceiver.register(this);
        overridePendingTransition(0, 0);
        getWindow().setBackgroundDrawable(this.mWindowBackground);
        Bundle args = getIntent().getExtras();
        if (args != null) {
            this.mHasAnimation = true;
            this.mAnimationX = args.getInt("x");
            this.mAnimationY = args.getInt("y");
            this.mAnimationRadius = args.getInt("radius");
        }
        Resources res = getResources();
        setContentView(R.layout.quick_search_activity);
        ViewUtils.setBackgroundWithViewPadding(findViewById(R.id.search_box), new CardDrawable(res));
        ImageView back = (ImageView) findViewById(R.id.back);
        ImageView voice = (ImageView) findViewById(R.id.voice);
        this.mClear = (ImageView) findViewById(R.id.clear);
        this.mQueryField = (TextView) findViewById(R.id.query);
        this.mContent = findViewById(R.id.content);
        measureDimensions(res.getConfiguration());
        back.setOnClickListener(this);
        this.mClear.setOnClickListener(this);
        voice.setOnClickListener(this);
        this.mContent.setOnClickListener(this);
        this.mQueryField.addTextChangedListener(this);
        this.mQueryField.setOnEditorActionListener(this);
        if ("android.intent.action.SEARCH".equals(getIntent().getAction())) {
            this.mQueryField.setText(getIntent().getStringExtra(SearchIntents.EXTRA_QUERY));
        }
        if (Build.VERSION.SDK_INT < 23) {
            this.mQueryField.setCustomSelectionActionModeCallback(new ActionMode.Callback() { // from class: com.vkontakte.android.fragments.search.QuickSearchActivity.2
                @Override // android.view.ActionMode.Callback
                public boolean onCreateActionMode(ActionMode mode, Menu menu) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public void onDestroyActionMode(ActionMode mode) {
                }
            });
        }
        if (!VoiceUtils.voiceSearchAvailable()) {
            voice.setVisibility(8);
        }
        if (this.mHasAnimation) {
            DisplayMetrics dm = getResources().getDisplayMetrics();
            final float screenWidth = Math.max(dm.widthPixels, dm.heightPixels);
            this.mContent.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.search.QuickSearchActivity.3
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    QuickSearchActivity.this.mContent.setLayerType(2, null);
                    Animator animation = ViewAnimationUtils.createCircularReveal(QuickSearchActivity.this.mContent, QuickSearchActivity.this.mAnimationX, QuickSearchActivity.this.mAnimationY, QuickSearchActivity.this.mAnimationRadius, screenWidth);
                    animation.setDuration(QuickSearchActivity.ANIMATION_DURATION);
                    animation.setInterpolator(QuickSearchActivity.this.mInterpolator);
                    animation.start();
                    animation.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.search.QuickSearchActivity.3.1
                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationEnd(Animator animation2) {
                            QuickSearchActivity.this.mContent.setLayerType(0, null);
                        }
                    });
                    QuickSearchActivity.this.mContent.getViewTreeObserver().removeOnPreDrawListener(this);
                    return true;
                }
            });
            return;
        }
        showKeyboard();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void showKeyboard() {
        InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
        imm.showSoftInput(this.mQueryField, 0);
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        measureDimensions(newConfig);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.content /* 2131755022 */:
            case R.id.back /* 2131755557 */:
                finish();
                return;
            case R.id.clear /* 2131755669 */:
                this.mQueryField.setText((CharSequence) null);
                return;
            case R.id.voice /* 2131755670 */:
                VoiceUtils.startVoiceRecognizer(this);
                return;
            default:
                return;
        }
    }

    @Override // android.app.Activity
    public void finish() {
        if (this.mHasAnimation) {
            DisplayMetrics dm = getResources().getDisplayMetrics();
            float screenWidth = Math.max(dm.widthPixels, dm.heightPixels);
            Animator animation = ViewAnimationUtils.createCircularReveal(this.mContent, this.mAnimationX, this.mAnimationY, screenWidth, this.mAnimationRadius);
            this.mContent.setLayerType(2, null);
            animation.addListener(new Animator.AnimatorListener() { // from class: com.vkontakte.android.fragments.search.QuickSearchActivity.4
                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animation2) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation2) {
                    QuickSearchActivity.this.mContent.setVisibility(4);
                    QuickSearchActivity.super.finish();
                    QuickSearchActivity.this.overridePendingTransition(0, 0);
                    QuickSearchActivity.this.mContent.setLayerType(0, null);
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation2) {
                    QuickSearchActivity.this.mContent.setVisibility(4);
                    QuickSearchActivity.super.finish();
                    QuickSearchActivity.this.overridePendingTransition(0, 0);
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationRepeat(Animator animation2) {
                }
            });
            animation.setDuration(200L);
            animation.setInterpolator(this.mInterpolator);
            animation.start();
            return;
        }
        super.finish();
        overridePendingTransition(0, 0);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
        InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
        imm.hideSoftInputFromWindow(v.getWindowToken(), 0);
        return true;
    }

    @Override // android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        String voiceResult = VoiceUtils.getVoiceResult(reqCode, resCode, data);
        if (voiceResult != null) {
            this.mQueryField.setText(voiceResult);
        }
    }

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence s, int start, int before, int count) {
        this.mClear.setVisibility(!TextUtils.isEmpty(s) ? 0 : 8);
        if (this.mSearchFragment == null) {
            this.mSearchFragment = (QuickSearchFragment) getFragmentManager().findFragmentById(R.id.search_fragment);
        }
        this.mSearchFragment.updateFilter(s.toString());
    }

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
    }

    private void measureDimensions(Configuration configuration) {
        int mPaddingHorizontal;
        int scrW = configuration.screenWidthDp;
        if (scrW >= 1024) {
            mPaddingHorizontal = V.dp(((int) (scrW - 802.5f)) >> 1);
        } else {
            mPaddingHorizontal = V.dp(6.0f);
        }
        this.mContent.setPadding(mPaddingHorizontal, (Build.VERSION.SDK_INT >= 21 ? ViewUtils.getStatusBarHeight() : 0) + sPaddingVertical, mPaddingHorizontal, 0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void openResult(int id, String link) {
        if (id == 0) {
            LinkUtils.processInternalLink(this, "https://" + link);
        } else if (id == Integer.MAX_VALUE) {
            Bundle args = new Bundle();
            args.putString("q", this.mQueryField.getText().toString());
            Navigate.to(ExtendedSearchFragment.class, args, this);
        } else {
            new ProfileFragment.Builder(id).go(this);
        }
    }
}
