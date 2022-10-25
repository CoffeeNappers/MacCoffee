package com.my.target.nativeads.views;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.StateSet;
import android.view.ViewGroup;
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
/* loaded from: classes2.dex */
public class ChatListAdView extends RelativeLayout {
    protected static final int COLOR_PLACEHOLDER_GRAY = -1118482;
    private static final int LETTERS_GREY = -6710887;
    protected final TextView advertisingLabel;
    protected RelativeLayout.LayoutParams advertisingLabelParams;
    protected final BorderedTextView ageRestrictionLabel;
    protected RelativeLayout.LayoutParams ageRestrictionParams;
    protected NativePromoBanner banner;
    protected final TextView descriptionLabel;
    protected RelativeLayout.LayoutParams descriptionLabelParams;
    protected final TextView disclaimerLabel;
    protected RelativeLayout.LayoutParams disclaimerParams;
    protected RelativeLayout.LayoutParams iconImageParams;
    protected final CacheImageView iconImageView;
    protected final LinearLayout labelsLayout;
    protected RelativeLayout.LayoutParams labelsLayoutParams;
    protected final LinearLayout ratingLayout;
    protected RelativeLayout.LayoutParams ratingParams;
    protected LinearLayout.LayoutParams starsParams;
    protected final StarsRatingView starsView;
    protected final TextView titleLabel;
    protected RelativeLayout.LayoutParams titleLayoutParams;
    protected final l uiUtils;
    protected final TextView urlLabel;
    protected RelativeLayout.LayoutParams urlLabelParams;
    protected final TextView votesLabel;
    protected static final int AGE_ID = l.a();
    protected static final int ICON_ID = l.a();
    protected static final int LABELS_ID = l.a();
    protected static final int TITLE_ID = l.a();
    protected static final int URL_ID = l.a();
    protected static final int DESC_ID = l.a();
    protected static final int AD_ID = l.a();
    protected static final int TITLE_2_ID = l.a();
    protected static final int STARS_ID = l.a();
    protected static final int VOTES_ID = l.a();
    protected static final int RATING_ID = l.a();

    public TextView getAdvertisingTextView() {
        return this.advertisingLabel;
    }

    public TextView getAgeRestrictionTextView() {
        return this.ageRestrictionLabel;
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
        if ("web".equals(nativePromoBanner.getNavigationType())) {
            this.urlLabel.setVisibility(0);
            this.ratingLayout.setVisibility(8);
            this.urlLabel.setText(nativePromoBanner.getDomain());
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
            if (nativePromoBanner.getRating() > 0.0f && nativePromoBanner.getRating() <= 5.0f && nativePromoBanner.getVotes() > 0) {
                this.urlLabel.setVisibility(8);
                ((ViewGroup) this.ratingLayout.getParent()).removeView(this.ratingLayout);
                this.labelsLayout.addView(this.ratingLayout, 1);
                this.ratingLayout.setVisibility(0);
                this.starsView.setRating(nativePromoBanner.getRating());
                this.votesLabel.setText(Integer.toString(nativePromoBanner.getVotes()));
            } else {
                this.urlLabel.setVisibility(0);
                this.urlLabel.setText(str);
                this.ratingLayout.setVisibility(8);
            }
        }
        if (nativePromoBanner.getIcon() != null && nativePromoBanner.getIcon().getData() != null) {
            this.iconImageView.setImageBitmap(nativePromoBanner.getIcon().getData());
        } else {
            this.iconImageView.setBackgroundColor(COLOR_PLACEHOLDER_GRAY);
            this.iconImageView.setPlaceholderWidth(nativePromoBanner.getIcon().getWidth());
            this.iconImageView.setPlaceholderHeight(nativePromoBanner.getIcon().getHeight());
        }
        this.titleLabel.setText(nativePromoBanner.getTitle());
        this.descriptionLabel.setText(nativePromoBanner.getDescription());
        this.advertisingLabel.setText(nativePromoBanner.getAdvertisingLabel());
        if (nativePromoBanner.getAgeRestrictions() != null && nativePromoBanner.getAgeRestrictions().length() > 0) {
            this.ageRestrictionLabel.setText(nativePromoBanner.getAgeRestrictions());
        } else {
            this.ageRestrictionLabel.setVisibility(8);
        }
        String disclaimer = nativePromoBanner.getDisclaimer();
        if (disclaimer != null && disclaimer.length() > 0) {
            removeView(this.disclaimerLabel);
            this.disclaimerParams = new RelativeLayout.LayoutParams(-2, -2);
            this.disclaimerLabel.setLayoutParams(this.disclaimerParams);
            this.labelsLayout.addView(this.disclaimerLabel);
            this.disclaimerLabel.setText(disclaimer);
            return;
        }
        this.disclaimerLabel.setVisibility(8);
    }

    public ChatListAdView(Context context) {
        this(context, null);
    }

    public ChatListAdView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ChatListAdView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.ageRestrictionLabel = new BorderedTextView(context);
        this.advertisingLabel = new TextView(context);
        this.iconImageView = new CacheImageView(context);
        this.labelsLayout = new LinearLayout(context);
        this.titleLabel = new TextView(context);
        this.urlLabel = new TextView(context);
        this.descriptionLabel = new TextView(context);
        this.ratingLayout = new LinearLayout(context);
        this.starsView = new StarsRatingView(context);
        this.votesLabel = new TextView(context);
        this.disclaimerLabel = new TextView(context);
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
        this.ageRestrictionLabel.setTextColor(LETTERS_GREY);
        this.ageRestrictionLabel.setBorder(1, LETTERS_GREY);
        this.ageRestrictionLabel.setBackgroundColor(0);
        this.advertisingLabel.setId(AD_ID);
        this.advertisingLabelParams = new RelativeLayout.LayoutParams(-2, -2);
        this.advertisingLabelParams.addRule(1, AGE_ID);
        this.advertisingLabel.setLayoutParams(this.advertisingLabelParams);
        this.advertisingLabel.setTextSize(2, 14.0f);
        this.advertisingLabel.setTextColor(LETTERS_GREY);
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
        this.titleLabel.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.titleLabel.setTextSize(2, 16.0f);
        this.titleLabel.setTypeface(null, 1);
        this.urlLabel.setId(URL_ID);
        this.urlLabelParams = new RelativeLayout.LayoutParams(-2, -2);
        this.urlLabelParams.topMargin = this.uiUtils.a(9);
        this.urlLabel.setLayoutParams(this.urlLabelParams);
        this.urlLabel.setTextColor(LETTERS_GREY);
        this.urlLabel.setTextSize(2, 14.0f);
        this.descriptionLabel.setId(DESC_ID);
        this.descriptionLabelParams = new RelativeLayout.LayoutParams(-2, -2);
        this.descriptionLabelParams.topMargin = this.uiUtils.a(9);
        this.descriptionLabel.setLayoutParams(this.descriptionLabelParams);
        this.descriptionLabel.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.descriptionLabel.setTextSize(2, 14.0f);
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
        this.votesLabel.setTextColor(LETTERS_GREY);
        this.votesLabel.setTextSize(2, 14.0f);
        this.disclaimerParams = new RelativeLayout.LayoutParams(-2, -2);
        this.disclaimerParams.addRule(3, RATING_ID);
        this.disclaimerLabel.setLayoutParams(this.disclaimerParams);
        this.disclaimerLabel.setTextColor(LETTERS_GREY);
        this.disclaimerLabel.setTextSize(2, 12.0f);
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
        setClickable(true);
        addView(this.ageRestrictionLabel);
        addView(this.advertisingLabel);
        addView(this.iconImageView);
        addView(this.labelsLayout);
        this.labelsLayout.addView(this.titleLabel);
        this.labelsLayout.addView(this.urlLabel);
        this.labelsLayout.addView(this.descriptionLabel);
        addView(this.ratingLayout);
        addView(this.disclaimerLabel);
        this.ratingLayout.addView(this.starsView);
        this.ratingLayout.addView(this.votesLabel);
    }

    public void loadImages() {
        if (this.banner != null && this.banner.getIcon() != null) {
            if (this.banner.getIcon().getData() == null) {
                b.a().a(this.banner.getIcon(), this.iconImageView);
            } else {
                this.iconImageView.setImageBitmap(this.banner.getIcon().getData());
            }
        }
    }
}
