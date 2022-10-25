package com.my.target.nativeads.views;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.StateSet;
import android.view.MotionEvent;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.Tracer;
import com.my.target.core.net.b;
import com.my.target.core.ui.views.BorderedTextView;
import com.my.target.core.ui.views.CacheImageView;
import com.my.target.core.utils.l;
import com.my.target.nativeads.banners.NativePromoBanner;
import com.my.target.nativeads.banners.NativePromoCard;
import com.my.target.nativeads.factories.NativeViewsFactory;
import com.my.target.nativeads.views.PromoCardRecyclerView;
import java.util.List;
/* loaded from: classes2.dex */
public class ContentStreamAdView extends RelativeLayout {
    protected static final int COLOR_PLACEHOLDER_GRAY = -1118482;
    protected final TextView advertisingLabel;
    @Nullable
    protected RelativeLayout.LayoutParams advertisingLabelParams;
    protected final BorderedTextView ageRestrictionLabel;
    @Nullable
    protected RelativeLayout.LayoutParams ageRestrictionParams;
    @Nullable
    protected NativePromoBanner banner;
    protected final Button ctaButton;
    @Nullable
    protected RelativeLayout.LayoutParams ctaParams;
    protected final TextView descriptionLabel;
    @Nullable
    protected RelativeLayout.LayoutParams descriptionLabelParams;
    protected final TextView disclaimerLabel;
    @Nullable
    protected RelativeLayout.LayoutParams disclaimerParams;
    @Nullable
    protected RelativeLayout.LayoutParams iconImageParams;
    protected final CacheImageView iconImageView;
    protected final LinearLayout labelsLayout;
    @Nullable
    protected RelativeLayout.LayoutParams labelsLayoutParams;
    @Nullable
    protected MediaAdView mediaAdView;
    @Nullable
    protected RelativeLayout.LayoutParams mediaAdViewParams;
    @Nullable
    private PromoCardRecyclerView promoCardRecyclerView;
    protected final LinearLayout ratingLayout;
    @Nullable
    protected RelativeLayout.LayoutParams ratingParams;
    @Nullable
    protected LinearLayout.LayoutParams starsParams;
    protected final StarsRatingView starsView;
    protected final TextView title2Label;
    @Nullable
    protected RelativeLayout.LayoutParams title2Params;
    protected final TextView titleLabel;
    @Nullable
    protected RelativeLayout.LayoutParams titleLayoutParams;
    protected final l uiUtils;
    protected final TextView url2Label;
    @Nullable
    protected RelativeLayout.LayoutParams url2Params;
    protected final TextView urlLabel;
    @Nullable
    protected RelativeLayout.LayoutParams urlLabelParams;
    protected final TextView votesLabel;
    protected static final int AGE_ID = l.a();
    protected static final int ICON_ID = l.a();
    protected static final int LABELS_ID = l.a();
    protected static final int TITLE_ID = l.a();
    protected static final int URL_ID = l.a();
    protected static final int DESC_ID = l.a();
    protected static final int AD_ID = l.a();
    protected static final int MEDIA_ID = l.a();
    protected static final int TITLE_2_ID = l.a();
    protected static final int URL_2_ID = l.a();
    protected static final int CTA_ID = l.a();
    protected static final int STARS_ID = l.a();
    protected static final int VOTES_ID = l.a();
    protected static final int RATING_ID = l.a();

    public TextView getAdvertisingTextView() {
        return this.advertisingLabel;
    }

    public TextView getAgeRestrictionTextView() {
        return this.ageRestrictionLabel;
    }

    public Button getCtaButtonView() {
        return this.ctaButton;
    }

    public TextView getDescriptionTextView() {
        return this.descriptionLabel;
    }

    public TextView getDisclaimerTextView() {
        return this.disclaimerLabel;
    }

    public TextView getDomainOrCategoryTextView() {
        return this.urlLabel;
    }

    public ImageView getIconImageView() {
        return this.iconImageView;
    }

    @Nullable
    public MediaAdView getMediaAdView() {
        return this.mediaAdView;
    }

    @Nullable
    public PromoCardRecyclerView getPromoCardRecyclerView() {
        return this.promoCardRecyclerView;
    }

    public TextView getSecondDomainOrCategoryTextView() {
        return this.url2Label;
    }

    public TextView getSecondTitleTextView() {
        return this.title2Label;
    }

    public StarsRatingView getStarsRatingView() {
        return this.starsView;
    }

    public TextView getTitleTextView() {
        return this.titleLabel;
    }

    public TextView getVotesTextView() {
        return this.votesLabel;
    }

    public void setupView(NativePromoBanner nativePromoBanner) {
        this.banner = nativePromoBanner;
        Tracer.d("Setup banner");
        boolean z = !nativePromoBanner.getCards().isEmpty();
        if (z) {
            this.title2Label.setVisibility(8);
            this.url2Label.setVisibility(8);
            this.ctaButton.setVisibility(8);
            this.ratingLayout.setVisibility(8);
            this.disclaimerLabel.setVisibility(8);
            if (this.mediaAdView != null && this.mediaAdView.getParent() != null) {
                ((ViewGroup) this.mediaAdView.getParent()).removeView(this.mediaAdView);
                this.mediaAdView = null;
            }
            if (this.promoCardRecyclerView == null) {
                this.promoCardRecyclerView = NativeViewsFactory.getPromoCardRecyclerView(getContext());
                this.promoCardRecyclerView.setId(MEDIA_ID);
                this.mediaAdViewParams = new RelativeLayout.LayoutParams(-1, -1);
                this.mediaAdViewParams.addRule(3, LABELS_ID);
                this.mediaAdViewParams.topMargin = this.uiUtils.a(9);
                this.promoCardRecyclerView.setLayoutParams(this.mediaAdViewParams);
                this.promoCardRecyclerView.setPromoCardAdapter(createPromoCardAdapter(nativePromoBanner.getCards()));
                addView(this.promoCardRecyclerView);
            }
        } else {
            if (this.promoCardRecyclerView != null && this.promoCardRecyclerView.getParent() != null) {
                ((ViewGroup) this.promoCardRecyclerView.getParent()).removeView(this.promoCardRecyclerView);
                this.promoCardRecyclerView = null;
            }
            if (this.mediaAdView == null) {
                this.mediaAdView = NativeViewsFactory.getMediaAdView(getContext());
                this.mediaAdView.setId(MEDIA_ID);
                this.mediaAdViewParams = new RelativeLayout.LayoutParams(-1, -2);
                this.mediaAdViewParams.addRule(3, LABELS_ID);
                this.mediaAdViewParams.topMargin = this.uiUtils.a(9);
                this.mediaAdView.setLayoutParams(this.mediaAdViewParams);
                addView(this.mediaAdView);
            }
        }
        if ("web".equals(nativePromoBanner.getNavigationType())) {
            if (!z) {
                this.url2Label.setVisibility(0);
                this.ratingLayout.setVisibility(8);
                this.urlLabel.setText(nativePromoBanner.getDomain());
                this.url2Label.setText(nativePromoBanner.getDomain());
                this.disclaimerParams = new RelativeLayout.LayoutParams(-2, -2);
                this.disclaimerParams.addRule(3, URL_2_ID);
                this.disclaimerLabel.setLayoutParams(this.disclaimerParams);
            }
        } else if ("store".equals(nativePromoBanner.getNavigationType())) {
            String category = nativePromoBanner.getCategory();
            String subcategory = nativePromoBanner.getSubcategory();
            String str = "";
            if (!TextUtils.isEmpty(category)) {
                str = str + category;
            }
            if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(subcategory)) {
                str = str + ", ";
            }
            if (!TextUtils.isEmpty(subcategory)) {
                str = str + subcategory;
            }
            if (!z) {
                if (nativePromoBanner.getRating() > 0.0f && nativePromoBanner.getRating() <= 5.0f && nativePromoBanner.getVotes() > 0) {
                    this.url2Label.setVisibility(8);
                    this.ratingLayout.setVisibility(0);
                    this.urlLabel.setText(str);
                    this.starsView.setRating(nativePromoBanner.getRating());
                    this.votesLabel.setText(Integer.toString(nativePromoBanner.getVotes()));
                    this.disclaimerParams = new RelativeLayout.LayoutParams(-2, -2);
                    this.disclaimerParams.addRule(3, RATING_ID);
                    this.disclaimerParams.addRule(0, CTA_ID);
                    this.disclaimerParams.rightMargin = this.uiUtils.a(4);
                    this.disclaimerParams.addRule(9, -1);
                    this.disclaimerLabel.setLayoutParams(this.disclaimerParams);
                } else {
                    this.url2Label.setVisibility(0);
                    this.ratingLayout.setVisibility(8);
                    this.url2Label.setText(str);
                    this.disclaimerParams = new RelativeLayout.LayoutParams(-2, -2);
                    this.disclaimerParams.addRule(3, URL_2_ID);
                    this.disclaimerParams.addRule(0, CTA_ID);
                    this.disclaimerParams.rightMargin = this.uiUtils.a(4);
                    this.disclaimerParams.addRule(9, -1);
                    this.disclaimerLabel.setLayoutParams(this.disclaimerParams);
                }
            }
            this.urlLabel.setText(str);
        }
        String disclaimer = nativePromoBanner.getDisclaimer();
        if (!TextUtils.isEmpty(disclaimer)) {
            this.disclaimerLabel.setText(disclaimer);
        } else {
            this.disclaimerLabel.setVisibility(8);
        }
        if (this.mediaAdView != null && nativePromoBanner.getImage() != null) {
            if (nativePromoBanner.getImage().getData() != null) {
                this.mediaAdView.getImageView().setImageBitmap(nativePromoBanner.getImage().getData());
            } else {
                this.mediaAdView.setPlaceHolderDimension(nativePromoBanner.getImage().getWidth(), nativePromoBanner.getImage().getHeight());
            }
        }
        if (nativePromoBanner.getIcon() != null) {
            if (nativePromoBanner.getIcon().getData() != null) {
                this.iconImageView.setImageBitmap(nativePromoBanner.getIcon().getData());
            } else {
                this.iconImageView.setBackgroundColor(COLOR_PLACEHOLDER_GRAY);
                this.iconImageView.setPlaceholderWidth(nativePromoBanner.getIcon().getWidth());
                this.iconImageView.setPlaceholderHeight(nativePromoBanner.getIcon().getHeight());
            }
        }
        this.titleLabel.setText(nativePromoBanner.getTitle());
        this.descriptionLabel.setText(nativePromoBanner.getDescription());
        this.advertisingLabel.setText(nativePromoBanner.getAdvertisingLabel());
        if (nativePromoBanner.getAgeRestrictions() != null && !nativePromoBanner.getAgeRestrictions().equals("")) {
            this.ageRestrictionLabel.setText(nativePromoBanner.getAgeRestrictions());
        } else {
            this.ageRestrictionLabel.setVisibility(8);
        }
        this.ctaButton.setText(nativePromoBanner.getCtaText());
        this.title2Label.setText(nativePromoBanner.getTitle());
    }

    private PromoCardRecyclerView.PromoCardAdapter createPromoCardAdapter(List<NativePromoCard> list) {
        return new PromoCardRecyclerView.PromoCardAdapter(list) { // from class: com.my.target.nativeads.views.ContentStreamAdView.1
            @Override // com.my.target.nativeads.views.PromoCardRecyclerView.PromoCardAdapter
            public PromoCardView getPromoCardView() {
                return NativeViewsFactory.getContentStreamCardView(ContentStreamAdView.this.getContext());
            }
        };
    }

    public ContentStreamAdView(Context context) {
        this(context, null);
    }

    public ContentStreamAdView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ContentStreamAdView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.ageRestrictionLabel = new BorderedTextView(context);
        this.advertisingLabel = new TextView(context);
        this.iconImageView = new CacheImageView(context);
        this.labelsLayout = new LinearLayout(context);
        this.titleLabel = new TextView(context);
        this.urlLabel = new TextView(context);
        this.descriptionLabel = new TextView(context);
        this.title2Label = new TextView(context);
        this.url2Label = new TextView(context);
        this.ratingLayout = new LinearLayout(context);
        this.starsView = new StarsRatingView(context);
        this.votesLabel = new TextView(context);
        this.disclaimerLabel = new TextView(context);
        this.ctaButton = new Button(context);
        this.uiUtils = new l(context);
        initView();
    }

    public void initView() {
        setPadding(this.uiUtils.a(12), this.uiUtils.a(12), this.uiUtils.a(12), this.uiUtils.a(12));
        this.ageRestrictionLabel.setId(AGE_ID);
        this.ageRestrictionLabel.setBorder(1, -7829368);
        this.ageRestrictionLabel.setPadding(this.uiUtils.a(2), 0, 0, 0);
        this.ageRestrictionParams = new RelativeLayout.LayoutParams(-2, -2);
        this.ageRestrictionParams.rightMargin = this.uiUtils.a(9);
        this.ageRestrictionLabel.setLayoutParams(this.ageRestrictionParams);
        this.advertisingLabel.setId(AD_ID);
        this.advertisingLabelParams = new RelativeLayout.LayoutParams(-2, -2);
        this.advertisingLabelParams.addRule(1, AGE_ID);
        this.advertisingLabel.setLayoutParams(this.advertisingLabelParams);
        this.iconImageView.setId(ICON_ID);
        this.iconImageParams = new RelativeLayout.LayoutParams(this.uiUtils.a(54), this.uiUtils.a(54));
        this.iconImageParams.addRule(3, AD_ID);
        this.iconImageParams.topMargin = this.uiUtils.a(9);
        this.iconImageView.setLayoutParams(this.iconImageParams);
        this.labelsLayout.setId(LABELS_ID);
        this.labelsLayout.setOrientation(1);
        this.labelsLayout.setMinimumHeight(this.uiUtils.a(54));
        this.labelsLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
        this.labelsLayoutParams.addRule(3, AD_ID);
        this.labelsLayoutParams.addRule(1, ICON_ID);
        this.labelsLayoutParams.leftMargin = this.uiUtils.a(9);
        this.labelsLayoutParams.topMargin = this.uiUtils.a(3);
        this.labelsLayout.setLayoutParams(this.labelsLayoutParams);
        this.titleLabel.setId(TITLE_ID);
        this.titleLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
        this.titleLabel.setLayoutParams(this.titleLayoutParams);
        this.urlLabel.setId(URL_ID);
        this.urlLabelParams = new RelativeLayout.LayoutParams(-2, -2);
        this.urlLabelParams.topMargin = this.uiUtils.a(9);
        this.urlLabel.setLayoutParams(this.urlLabelParams);
        this.descriptionLabel.setId(DESC_ID);
        this.descriptionLabelParams = new RelativeLayout.LayoutParams(-2, -2);
        this.descriptionLabelParams.topMargin = this.uiUtils.a(9);
        this.descriptionLabel.setLayoutParams(this.descriptionLabelParams);
        this.title2Label.setId(TITLE_2_ID);
        this.title2Params = new RelativeLayout.LayoutParams(-2, -2);
        this.title2Params.addRule(3, MEDIA_ID);
        this.title2Params.topMargin = this.uiUtils.a(9);
        this.title2Label.setLayoutParams(this.title2Params);
        this.url2Label.setId(URL_2_ID);
        this.url2Params = new RelativeLayout.LayoutParams(-2, -2);
        this.url2Params.addRule(3, TITLE_2_ID);
        this.url2Label.setLayoutParams(this.url2Params);
        this.ratingLayout.setId(RATING_ID);
        this.ratingLayout.setOrientation(0);
        this.ratingParams = new RelativeLayout.LayoutParams(-2, -2);
        this.ratingParams.addRule(3, TITLE_2_ID);
        this.ratingLayout.setLayoutParams(this.ratingParams);
        this.starsView.setId(STARS_ID);
        this.starsParams = new LinearLayout.LayoutParams(this.uiUtils.a(73), this.uiUtils.a(12));
        this.starsParams.topMargin = this.uiUtils.a(4);
        this.starsView.setLayoutParams(this.starsParams);
        this.votesLabel.setId(VOTES_ID);
        this.disclaimerParams = new RelativeLayout.LayoutParams(-2, -2);
        this.disclaimerParams.addRule(3, RATING_ID);
        this.disclaimerLabel.setLayoutParams(this.disclaimerParams);
        this.ctaButton.setId(CTA_ID);
        this.ctaButton.setPadding(this.uiUtils.a(10), 0, this.uiUtils.a(10), 0);
        this.ctaParams = new RelativeLayout.LayoutParams(-2, this.uiUtils.a(30));
        this.ctaParams.addRule(3, TITLE_2_ID);
        this.ctaParams.addRule(11);
        this.ctaButton.setLayoutParams(this.ctaParams);
        this.ctaButton.setTransformationMethod(null);
        l.a(this, 0, -3806472);
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
        setClickable(true);
        addView(this.ageRestrictionLabel);
        addView(this.advertisingLabel);
        addView(this.iconImageView);
        addView(this.labelsLayout);
        this.labelsLayout.addView(this.titleLabel);
        this.labelsLayout.addView(this.urlLabel);
        this.labelsLayout.addView(this.descriptionLabel);
        addView(this.title2Label);
        addView(this.url2Label);
        addView(this.ctaButton);
        addView(this.ratingLayout);
        addView(this.disclaimerLabel);
        this.ratingLayout.addView(this.starsView);
        this.ratingLayout.addView(this.votesLabel);
        updateDefaultParams();
    }

    private void updateDefaultParams() {
        this.ageRestrictionLabel.setTextColor(-6710887);
        this.ageRestrictionLabel.setBorder(1, -6710887);
        this.ageRestrictionLabel.setBackgroundColor(0);
        this.advertisingLabel.setTextSize(2, 14.0f);
        this.advertisingLabel.setTextColor(-6710887);
        this.titleLabel.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.titleLabel.setTextSize(2, 16.0f);
        this.titleLabel.setTypeface(null, 1);
        this.urlLabel.setTextColor(-6710887);
        this.urlLabel.setTextSize(2, 14.0f);
        this.descriptionLabel.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.descriptionLabel.setTextSize(2, 14.0f);
        this.title2Label.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.title2Label.setTextSize(2, 16.0f);
        this.title2Label.setTypeface(null, 1);
        this.url2Label.setTextColor(-6710887);
        this.url2Label.setTextSize(2, 14.0f);
        this.votesLabel.setTextColor(-6710887);
        this.votesLabel.setTextSize(2, 14.0f);
        this.disclaimerLabel.setTextColor(-6710887);
        this.disclaimerLabel.setTextSize(2, 12.0f);
        this.ctaButton.setTextColor(-6710887);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        if (x <= this.ctaButton.getLeft() || x >= this.ctaButton.getRight() || y <= this.ctaButton.getTop() || y >= this.ctaButton.getBottom()) {
            if (this.banner != null && this.mediaAdView != null && this.banner.hasVideo() && x > this.mediaAdView.getLeft() && x < this.mediaAdView.getRight() && y > this.mediaAdView.getTop() && y < this.mediaAdView.getBottom()) {
                return false;
            }
            return this.promoCardRecyclerView == null || this.banner == null || this.banner.getCards().isEmpty() || x <= ((float) this.promoCardRecyclerView.getLeft()) || x >= ((float) this.promoCardRecyclerView.getRight()) || y <= ((float) this.promoCardRecyclerView.getTop()) || y >= ((float) this.promoCardRecyclerView.getBottom());
        }
        return false;
    }

    public void loadImages() {
        if (this.banner != null) {
            if (this.banner.getIcon() != null) {
                if (this.banner.getIcon().getData() == null) {
                    b.a().a(this.banner.getIcon(), this.iconImageView);
                } else {
                    this.iconImageView.setImageBitmap(this.banner.getIcon().getData());
                }
            }
            if (this.banner.getImage() != null && this.mediaAdView != null) {
                if (this.banner.getImage().getData() == null) {
                    b.a().a(this.banner.getImage(), this.mediaAdView.getImageView());
                } else {
                    this.mediaAdView.getImageView().setImageBitmap(this.banner.getImage().getData());
                }
            }
            if (!this.banner.getCards().isEmpty() && this.promoCardRecyclerView != null) {
                this.promoCardRecyclerView.loadImages();
            }
        }
    }
}
