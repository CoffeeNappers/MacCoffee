package com.facebook;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Typeface;
import android.support.v4.app.Fragment;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;
import com.facebook.appevents.AppEventsLogger;
/* loaded from: classes.dex */
public abstract class FacebookButtonBase extends Button {
    private String analyticsButtonCreatedEventName;
    private String analyticsButtonTappedEventName;
    private View.OnClickListener externalOnClickListener;
    private View.OnClickListener internalOnClickListener;
    private boolean overrideCompoundPadding;
    private int overrideCompoundPaddingLeft;
    private int overrideCompoundPaddingRight;
    private Fragment parentFragment;

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract int getDefaultRequestCode();

    /* JADX INFO: Access modifiers changed from: protected */
    public FacebookButtonBase(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes, String analyticsButtonCreatedEventName, String analyticsButtonTappedEventName) {
        super(context, attrs, 0);
        defStyleRes = defStyleRes == 0 ? getDefaultStyleResource() : defStyleRes;
        configureButton(context, attrs, defStyleAttr, defStyleRes == 0 ? R.style.com_facebook_button : defStyleRes);
        this.analyticsButtonCreatedEventName = analyticsButtonCreatedEventName;
        this.analyticsButtonTappedEventName = analyticsButtonTappedEventName;
    }

    public void setFragment(Fragment fragment) {
        this.parentFragment = fragment;
    }

    public Fragment getFragment() {
        return this.parentFragment;
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        this.externalOnClickListener = l;
    }

    public int getRequestCode() {
        return getDefaultRequestCode();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.widget.TextView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!isInEditMode()) {
            logButtonCreated(getContext());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        boolean centered = (getGravity() & 1) != 0;
        if (centered) {
            int compoundPaddingLeft = getCompoundPaddingLeft();
            int compoundPaddingRight = getCompoundPaddingRight();
            int compoundDrawablePadding = getCompoundDrawablePadding();
            int textX = compoundPaddingLeft + compoundDrawablePadding;
            int textContentWidth = (getWidth() - textX) - compoundPaddingRight;
            int textWidth = measureTextWidth(getText().toString());
            int textPaddingWidth = (textContentWidth - textWidth) / 2;
            int imagePaddingWidth = (compoundPaddingLeft - getPaddingLeft()) / 2;
            int inset = Math.min(textPaddingWidth, imagePaddingWidth);
            this.overrideCompoundPaddingLeft = compoundPaddingLeft - inset;
            this.overrideCompoundPaddingRight = compoundPaddingRight + inset;
            this.overrideCompoundPadding = true;
        }
        super.onDraw(canvas);
        this.overrideCompoundPadding = false;
    }

    @Override // android.widget.TextView
    public int getCompoundPaddingLeft() {
        return this.overrideCompoundPadding ? this.overrideCompoundPaddingLeft : super.getCompoundPaddingLeft();
    }

    @Override // android.widget.TextView
    public int getCompoundPaddingRight() {
        return this.overrideCompoundPadding ? this.overrideCompoundPaddingRight : super.getCompoundPaddingRight();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Activity getActivity() {
        Context context = getContext();
        while (!(context instanceof Activity) && (context instanceof ContextWrapper)) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        if (context instanceof Activity) {
            return (Activity) context;
        }
        throw new FacebookException("Unable to get Activity.");
    }

    protected int getDefaultStyleResource() {
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int measureTextWidth(String text) {
        return (int) Math.ceil(getPaint().measureText(text));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void configureButton(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        parseBackgroundAttributes(context, attrs, defStyleAttr, defStyleRes);
        parseCompoundDrawableAttributes(context, attrs, defStyleAttr, defStyleRes);
        parseContentAttributes(context, attrs, defStyleAttr, defStyleRes);
        parseTextAttributes(context, attrs, defStyleAttr, defStyleRes);
        setupOnClickListener();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void callExternalOnClickListener(View v) {
        if (this.externalOnClickListener != null) {
            this.externalOnClickListener.onClick(v);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setInternalOnClickListener(View.OnClickListener l) {
        this.internalOnClickListener = l;
    }

    private void logButtonCreated(Context context) {
        AppEventsLogger logger = AppEventsLogger.newLogger(context);
        logger.logSdkEvent(this.analyticsButtonCreatedEventName, null, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logButtonTapped(Context context) {
        AppEventsLogger logger = AppEventsLogger.newLogger(context);
        logger.logSdkEvent(this.analyticsButtonTappedEventName, null, null);
    }

    private void parseBackgroundAttributes(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        if (!isInEditMode()) {
            int[] attrsResources = {16842964};
            TypedArray a = context.getTheme().obtainStyledAttributes(attrs, attrsResources, defStyleAttr, defStyleRes);
            try {
                if (a.hasValue(0)) {
                    int backgroundResource = a.getResourceId(0, 0);
                    if (backgroundResource != 0) {
                        setBackgroundResource(backgroundResource);
                    } else {
                        setBackgroundColor(a.getColor(0, 0));
                    }
                } else {
                    setBackgroundColor(a.getColor(0, R.color.com_facebook_blue));
                }
            } finally {
                a.recycle();
            }
        }
    }

    private void parseCompoundDrawableAttributes(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        int[] attrsResources = {16843119, 16843117, 16843120, 16843118, 16843121};
        TypedArray a = context.getTheme().obtainStyledAttributes(attrs, attrsResources, defStyleAttr, defStyleRes);
        try {
            setCompoundDrawablesWithIntrinsicBounds(a.getResourceId(0, 0), a.getResourceId(1, 0), a.getResourceId(2, 0), a.getResourceId(3, 0));
            setCompoundDrawablePadding(a.getDimensionPixelSize(4, 0));
        } finally {
            a.recycle();
        }
    }

    private void parseContentAttributes(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        int[] attrsResources = {16842966, 16842967, 16842968, 16842969};
        TypedArray a = context.getTheme().obtainStyledAttributes(attrs, attrsResources, defStyleAttr, defStyleRes);
        try {
            setPadding(a.getDimensionPixelSize(0, 0), a.getDimensionPixelSize(1, 0), a.getDimensionPixelSize(2, 0), a.getDimensionPixelSize(3, 0));
        } finally {
            a.recycle();
        }
    }

    private void parseTextAttributes(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        int[] colorResources = {16842904};
        TypedArray a = context.getTheme().obtainStyledAttributes(attrs, colorResources, defStyleAttr, defStyleRes);
        try {
            setTextColor(a.getColor(0, -1));
            a.recycle();
            int[] gravityResources = {16842927};
            a = context.getTheme().obtainStyledAttributes(attrs, gravityResources, defStyleAttr, defStyleRes);
            try {
                setGravity(a.getInt(0, 17));
                a.recycle();
                int[] attrsResources = {16842901, 16842903, 16843087};
                a = context.getTheme().obtainStyledAttributes(attrs, attrsResources, defStyleAttr, defStyleRes);
                try {
                    setTextSize(0, a.getDimensionPixelSize(0, 0));
                    setTypeface(Typeface.defaultFromStyle(a.getInt(1, 1)));
                    setText(a.getString(2));
                } finally {
                }
            } finally {
            }
        } finally {
        }
    }

    private void setupOnClickListener() {
        super.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.FacebookButtonBase.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                FacebookButtonBase.this.logButtonTapped(FacebookButtonBase.this.getContext());
                if (FacebookButtonBase.this.internalOnClickListener != null) {
                    FacebookButtonBase.this.internalOnClickListener.onClick(v);
                } else if (FacebookButtonBase.this.externalOnClickListener != null) {
                    FacebookButtonBase.this.externalOnClickListener.onClick(v);
                }
            }
        });
    }
}
