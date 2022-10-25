package com.my.target.nativeads.views;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.Tracer;
import com.my.target.core.net.b;
import com.my.target.core.ui.views.BorderedTextView;
import com.my.target.core.utils.l;
import com.my.target.nativeads.banners.NativePromoBanner;
import com.my.target.nativeads.factories.NativeViewsFactory;
/* loaded from: classes2.dex */
public class ContentWallAdView extends RelativeLayout {
    protected final TextView advertisingLabel;
    protected RelativeLayout.LayoutParams advertisingLabelParams;
    protected final BorderedTextView ageRestrictionLabel;
    protected RelativeLayout.LayoutParams ageRestrictionParams;
    protected NativePromoBanner banner;
    protected final MediaAdView mediaAdView;
    protected RelativeLayout.LayoutParams mediaAdViewParams;
    protected LinearLayout.LayoutParams starsParams;
    protected final StarsRatingView starsView;
    protected final l uiUtils;
    protected final TextView votesLabel;
    protected static final int AGE_ID = l.a();
    protected static final int AD_ID = l.a();
    protected static final int IMAGE_ID = l.a();
    protected static final int STARS_ID = l.a();
    protected static final int VOTES_ID = l.a();

    public TextView getAdvertisingTextView() {
        return this.advertisingLabel;
    }

    public TextView getAgeRestrictionTextView() {
        return this.ageRestrictionLabel;
    }

    public MediaAdView getMediaAdView() {
        return this.mediaAdView;
    }

    public void setupView(NativePromoBanner nativePromoBanner) {
        this.banner = nativePromoBanner;
        Tracer.d("Setup banner");
        if (nativePromoBanner.getAgeRestrictions() != null && nativePromoBanner.getAgeRestrictions().length() > 0) {
            this.ageRestrictionLabel.setText(nativePromoBanner.getAgeRestrictions());
        } else {
            this.ageRestrictionLabel.setVisibility(8);
            this.advertisingLabel.setPadding(0, 0, 0, 0);
        }
        if (nativePromoBanner.getImage() != null && nativePromoBanner.getImage().getData() != null) {
            this.mediaAdView.getImageView().setImageBitmap(nativePromoBanner.getImage().getData());
        } else {
            this.mediaAdView.setPlaceHolderDimension(nativePromoBanner.getImage().getWidth(), nativePromoBanner.getImage().getHeight());
        }
        this.ageRestrictionLabel.setText(nativePromoBanner.getAgeRestrictions());
        this.advertisingLabel.setText(nativePromoBanner.getAdvertisingLabel());
    }

    public ContentWallAdView(Context context) {
        this(context, null);
    }

    public ContentWallAdView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ContentWallAdView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.ageRestrictionLabel = new BorderedTextView(context);
        this.advertisingLabel = new TextView(context);
        this.mediaAdView = NativeViewsFactory.getMediaAdView(context);
        this.starsView = new StarsRatingView(context);
        this.votesLabel = new TextView(context);
        this.uiUtils = new l(context);
        initView();
    }

    public void initView() {
        setPadding(this.uiUtils.a(12), this.uiUtils.a(12), this.uiUtils.a(12), this.uiUtils.a(12));
        this.ageRestrictionLabel.setId(AGE_ID);
        this.ageRestrictionLabel.setPadding(this.uiUtils.a(2), 0, 0, 0);
        this.ageRestrictionParams = new RelativeLayout.LayoutParams(-2, -2);
        this.ageRestrictionParams.rightMargin = this.uiUtils.a(9);
        this.ageRestrictionLabel.setLayoutParams(this.ageRestrictionParams);
        this.ageRestrictionLabel.setTextColor(-1);
        this.ageRestrictionLabel.setBorder(1, -1);
        this.advertisingLabel.setId(AD_ID);
        this.advertisingLabelParams = new RelativeLayout.LayoutParams(-2, -2);
        this.advertisingLabelParams.addRule(1, AGE_ID);
        this.advertisingLabel.setLayoutParams(this.advertisingLabelParams);
        this.advertisingLabel.setTextColor(-1);
        this.advertisingLabel.setPadding(this.uiUtils.a(3), 0, 0, 0);
        this.mediaAdView.setId(IMAGE_ID);
        this.mediaAdViewParams = new RelativeLayout.LayoutParams(-1, -2);
        this.mediaAdView.setLayoutParams(this.mediaAdViewParams);
        this.starsView.setId(STARS_ID);
        this.starsParams = new LinearLayout.LayoutParams(this.uiUtils.a(73), this.uiUtils.a(12));
        this.starsParams.topMargin = this.uiUtils.a(4);
        this.starsView.setLayoutParams(this.starsParams);
        this.votesLabel.setId(VOTES_ID);
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(0);
        linearLayout.setPadding(this.uiUtils.a(3), this.uiUtils.a(3), this.uiUtils.a(3), this.uiUtils.a(3));
        linearLayout.setBackgroundColor(Color.parseColor("#55000000"));
        linearLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        l.a(this, 0, -3806472);
        setClickable(true);
        addView(this.mediaAdView);
        linearLayout.addView(this.ageRestrictionLabel);
        linearLayout.addView(this.advertisingLabel);
        addView(linearLayout);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        return (this.banner == null || !this.banner.hasVideo() || x <= ((float) this.mediaAdView.getLeft()) || x >= ((float) this.mediaAdView.getRight()) || y <= ((float) this.mediaAdView.getTop()) || y >= ((float) this.mediaAdView.getBottom())) ? onTouchEvent(motionEvent) : super.onInterceptTouchEvent(motionEvent);
    }

    public void loadImages() {
        if (this.banner != null && this.banner.getImage() != null) {
            if (this.banner.getImage().getData() == null) {
                b.a().a(this.banner.getImage(), this.mediaAdView.getImageView());
            } else {
                this.mediaAdView.getImageView().setImageBitmap(this.banner.getImage().getData());
            }
        }
    }
}
