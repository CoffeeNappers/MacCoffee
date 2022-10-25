package com.my.target.nativeads.views;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.util.StateSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.utils.l;
/* loaded from: classes2.dex */
public class ContentStreamCardView extends LinearLayout implements PromoCardView {
    private static final int MARGIN_DP = 12;
    private View.OnClickListener cardClickListener;
    private final RelativeLayout containerLayout;
    private final Button ctaButton;
    private final TextView descriptionView;
    private final View.OnClickListener elementClickListener;
    private final MediaAdView mediaAdView;
    private final LinearLayout textContainerLayout;
    private final TextView titleView;
    private final l uiUtils;
    private static final int CTA_ID = l.a();
    private static final int MEDIA_ID = l.a();

    public ContentStreamCardView(Context context) {
        super(context);
        this.elementClickListener = new View.OnClickListener() { // from class: com.my.target.nativeads.views.ContentStreamCardView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (ContentStreamCardView.this.cardClickListener != null) {
                    ContentStreamCardView.this.cardClickListener.onClick(ContentStreamCardView.this);
                }
            }
        };
        this.mediaAdView = new MediaAdView(context);
        this.titleView = new TextView(context);
        this.descriptionView = new TextView(context);
        this.containerLayout = new RelativeLayout(context);
        this.ctaButton = new Button(context);
        this.uiUtils = new l(context);
        this.textContainerLayout = new LinearLayout(context);
        initView();
    }

    private void initView() {
        this.mediaAdView.setId(MEDIA_ID);
        setOrientation(1);
        setPadding(this.uiUtils.a(8), this.uiUtils.a(8), this.uiUtils.a(8), this.uiUtils.a(8));
        setClickable(true);
        l.a(this, 0, -3806472);
        l.a(this.containerLayout, 0, -3806472, -3355444, this.uiUtils.a(1), 0);
        this.ctaButton.setId(CTA_ID);
        this.ctaButton.setPadding(this.uiUtils.a(10), 0, this.uiUtils.a(10), 0);
        this.ctaButton.setTextSize(2, 12.0f);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, this.uiUtils.a(30));
        layoutParams.addRule(11, -1);
        layoutParams.addRule(15, -1);
        layoutParams.setMargins(this.uiUtils.a(12), this.uiUtils.a(12), this.uiUtils.a(12), this.uiUtils.a(12));
        this.ctaButton.setLayoutParams(layoutParams);
        this.ctaButton.setTransformationMethod(null);
        if (l.c(21)) {
            this.ctaButton.setStateListAnimator(null);
        }
        this.ctaButton.setTextColor(-6710887);
        GradientDrawable gradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{0, 0});
        gradientDrawable.setStroke(this.uiUtils.a(1), -3355444);
        gradientDrawable.setCornerRadius(this.uiUtils.a(1));
        GradientDrawable gradientDrawable2 = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-3806472, -3806472});
        gradientDrawable2.setStroke(this.uiUtils.a(1), -3355444);
        gradientDrawable2.setCornerRadius(this.uiUtils.a(1));
        StateListDrawable stateListDrawable = new StateListDrawable();
        stateListDrawable.addState(new int[]{16842919}, gradientDrawable2);
        stateListDrawable.addState(StateSet.WILD_CARD, gradientDrawable);
        this.ctaButton.setBackgroundDrawable(stateListDrawable);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(0, CTA_ID);
        this.textContainerLayout.setLayoutParams(layoutParams2);
        this.textContainerLayout.setGravity(16);
        this.textContainerLayout.setOrientation(1);
        this.titleView.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.titleView.setTextSize(2, 14.0f);
        this.titleView.setTypeface(null, 1);
        this.titleView.setLines(2);
        this.titleView.setEllipsize(TextUtils.TruncateAt.END);
        this.titleView.setPadding(this.uiUtils.a(12), this.uiUtils.a(6), this.uiUtils.a(1), this.uiUtils.a(1));
        this.descriptionView.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.descriptionView.setTextSize(2, 12.0f);
        this.descriptionView.setLines(1);
        this.descriptionView.setEllipsize(TextUtils.TruncateAt.END);
        this.descriptionView.setPadding(this.uiUtils.a(12), this.uiUtils.a(1), this.uiUtils.a(1), this.uiUtils.a(12));
        addView(this.mediaAdView);
        addView(this.containerLayout);
        this.containerLayout.addView(this.ctaButton);
        this.containerLayout.addView(this.textContainerLayout);
        this.textContainerLayout.addView(this.titleView);
        this.textContainerLayout.addView(this.descriptionView);
    }

    @Override // com.my.target.nativeads.views.PromoCardView
    public MediaAdView getMediaAdView() {
        return this.mediaAdView;
    }

    @Override // com.my.target.nativeads.views.PromoCardView
    public TextView getTitleTextView() {
        return this.titleView;
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener onClickListener) {
        this.cardClickListener = onClickListener;
        super.setOnClickListener(onClickListener);
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            getChildAt(i).setOnClickListener(this.elementClickListener);
        }
    }

    @Override // com.my.target.nativeads.views.PromoCardView
    public TextView getDescriptionTextView() {
        return this.descriptionView;
    }

    @Override // com.my.target.nativeads.views.PromoCardView
    public Button getCtaButtonView() {
        return this.ctaButton;
    }

    @Override // com.my.target.nativeads.views.PromoCardView
    public View getView() {
        return this;
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        return x > ((float) this.mediaAdView.getLeft()) && x < ((float) this.mediaAdView.getRight()) && y > ((float) this.mediaAdView.getTop()) && y < ((float) this.mediaAdView.getBottom());
    }
}
