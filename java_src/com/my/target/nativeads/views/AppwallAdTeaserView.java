package com.my.target.nativeads.views;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.ui.views.CacheImageView;
import com.my.target.nativeads.banners.NativeAppwallBanner;
/* loaded from: classes2.dex */
public class AppwallAdTeaserView extends RelativeLayout {
    private NativeAppwallBanner banner;
    private CacheImageView bannerIcon;
    private ShapeDrawable coinsBgShape;
    private TextView coinsCountView;
    private CacheImageView coinsIconView;
    private LinearLayout coinsLayout;
    private TextView descrView;
    private CacheImageView notificationView;
    private CacheImageView openImageView;
    private StarsRatingView starsRatingView;
    private CacheImageView statusIconView;
    private int textColor;
    private TextView titleView;
    private boolean viewed;
    private TextView votesCountView;

    public AppwallAdTeaserView(Context context) {
        super(context);
        this.textColor = Color.rgb(36, 36, 36);
        this.viewed = false;
        initView();
    }

    private void initView() {
        int px = getPx(18);
        int px2 = getPx(14);
        int px3 = getPx(53);
        new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-1, -1052689});
        new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-1903365, -3806472});
        setBackgroundColor(-1);
        ViewGroup.LayoutParams layoutParams = new RelativeLayout.LayoutParams(px3 + px2 + px2, px3 + px + px);
        this.bannerIcon = new CacheImageView(getContext());
        this.bannerIcon.setPadding(px2, px, px2, px);
        addView(this.bannerIcon, layoutParams);
        int px4 = getPx(20);
        this.notificationView = new CacheImageView(getContext());
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(px4, px4);
        layoutParams2.leftMargin = getPx(57);
        layoutParams2.topMargin = getPx(10);
        this.notificationView.setLayoutParams(layoutParams2);
        addView(this.notificationView);
        int px5 = getPx(6);
        this.coinsBgShape = new ShapeDrawable(new RoundRectShape(new float[]{px5, px5, px5, px5, px5, px5, px5, px5}, null, null));
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(px3, px3);
        layoutParams3.addRule(11);
        layoutParams3.rightMargin = px2;
        layoutParams3.topMargin = px;
        this.coinsLayout = new LinearLayout(getContext());
        this.coinsLayout.setBackgroundDrawable(this.coinsBgShape);
        this.coinsLayout.setOrientation(1);
        addView(this.coinsLayout, layoutParams3);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-1, -2);
        this.coinsCountView = new TextView(getContext());
        this.coinsCountView.setTypeface(Typeface.SANS_SERIF);
        this.coinsCountView.setPadding(0, getPx(10), 0, getPx(2));
        this.coinsCountView.setTextSize(2, 13.0f);
        this.coinsCountView.setGravity(49);
        this.coinsLayout.addView(this.coinsCountView, layoutParams4);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(getPx(20), getPx(20));
        this.coinsIconView = new CacheImageView(getContext());
        layoutParams5.gravity = 1;
        this.coinsLayout.addView(this.coinsIconView, layoutParams5);
        RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(getPx(19), -2);
        layoutParams6.addRule(15);
        layoutParams6.addRule(11);
        layoutParams6.rightMargin = getPx(30);
        this.openImageView = new CacheImageView(getContext());
        addView(this.openImageView, layoutParams6);
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(px3, px3);
        layoutParams7.addRule(10);
        layoutParams7.addRule(11);
        this.statusIconView = new CacheImageView(getContext());
        addView(this.statusIconView, layoutParams7);
        this.titleView = new TextView(getContext());
        this.titleView.setTypeface(Typeface.SANS_SERIF);
        this.titleView.setTextSize(2, 18.0f);
        this.titleView.setTextColor(this.textColor);
        this.titleView.setPadding(0, 0, getPx(67), 0);
        this.titleView.setId(3);
        RelativeLayout.LayoutParams layoutParams8 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams8.leftMargin = getPx(91);
        layoutParams8.rightMargin = getPx(15);
        layoutParams8.topMargin = getPx(13);
        this.titleView.setLayoutParams(layoutParams8);
        addView(this.titleView);
        this.descrView = new TextView(getContext());
        this.descrView.setTypeface(Typeface.SANS_SERIF);
        this.descrView.setTextSize(2, 13.0f);
        this.descrView.setTextColor(this.textColor);
        RelativeLayout.LayoutParams layoutParams9 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams9.leftMargin = getPx(91);
        layoutParams9.addRule(3, 3);
        this.descrView.setId(1);
        this.descrView.setLayoutParams(layoutParams9);
        addView(this.descrView);
        RelativeLayout.LayoutParams layoutParams10 = new RelativeLayout.LayoutParams(getPx(73), getPx(12));
        layoutParams10.addRule(3, 1);
        layoutParams10.leftMargin = getPx(91);
        layoutParams10.topMargin = getPx(5);
        this.starsRatingView = new StarsRatingView(getContext());
        this.starsRatingView.setPadding(0, 0, 0, getPx(20));
        this.starsRatingView.setStarsPadding(getPx(2));
        this.starsRatingView.setId(2);
        addView(this.starsRatingView, layoutParams10);
        RelativeLayout.LayoutParams layoutParams11 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams11.addRule(1, 2);
        layoutParams11.addRule(3, 1);
        layoutParams11.leftMargin = getPx(9);
        this.votesCountView = new TextView(getContext());
        this.votesCountView.setTypeface(Typeface.SANS_SERIF);
        this.votesCountView.setPadding(0, getPx(2), 0, 0);
        this.votesCountView.setTextSize(2, 13.0f);
        this.votesCountView.setTextColor(this.textColor);
        this.votesCountView.setGravity(16);
        addView(this.votesCountView, layoutParams11);
    }

    public void setNativeAppwallBanner(NativeAppwallBanner nativeAppwallBanner) {
        this.banner = nativeAppwallBanner;
        this.bannerIcon.setImageData(nativeAppwallBanner.getIcon());
        this.notificationView.setImageData(nativeAppwallBanner.getBubbleIcon());
        String description = nativeAppwallBanner.getDescription();
        this.titleView.setText(nativeAppwallBanner.getTitle());
        this.descrView.setText(description);
        if (nativeAppwallBanner.isHasNotification()) {
            this.notificationView.setVisibility(0);
            this.notificationView.setImageData(nativeAppwallBanner.getBubbleIcon());
        } else {
            this.notificationView.setVisibility(8);
        }
        if (nativeAppwallBanner.getCoins() != 0) {
            this.coinsLayout.setVisibility(0);
            this.coinsIconView.setImageData(nativeAppwallBanner.getCoinsIcon());
            this.coinsCountView.setText(Integer.toString(nativeAppwallBanner.getCoins()));
            this.coinsCountView.setTextColor(nativeAppwallBanner.getCoinsIconTextColor());
            this.coinsBgShape.getPaint().setColor(nativeAppwallBanner.getCoinsIconBgColor());
            this.openImageView.setVisibility(8);
        } else if (nativeAppwallBanner.isAppInstalled()) {
            this.coinsLayout.setVisibility(8);
            this.openImageView.setVisibility(0);
            this.openImageView.setImageData(nativeAppwallBanner.getGotoAppIcon());
        } else {
            this.coinsLayout.setVisibility(8);
            this.openImageView.setVisibility(8);
        }
        if (nativeAppwallBanner.getStatusIcon() != null) {
            this.statusIconView.setVisibility(0);
            this.statusIconView.setImageData(nativeAppwallBanner.getStatusIcon());
        } else {
            this.statusIconView.setVisibility(8);
        }
        if (nativeAppwallBanner.getCoins() != 0 || nativeAppwallBanner.isAppInstalled()) {
            this.descrView.setPadding(0, 0, getPx(70), 0);
        } else if (nativeAppwallBanner.getStatusIcon() != null) {
            this.descrView.setPadding(0, 0, getPx(20), 0);
        }
        if (nativeAppwallBanner.getRating() != 0.0f) {
            this.starsRatingView.setVisibility(0);
            this.votesCountView.setVisibility(0);
            this.starsRatingView.setRating(nativeAppwallBanner.getRating());
            this.votesCountView.setText(Integer.toString(nativeAppwallBanner.getVotes()));
            return;
        }
        this.starsRatingView.setVisibility(8);
        this.votesCountView.setVisibility(8);
        this.descrView.setPadding(this.descrView.getPaddingLeft(), this.descrView.getPaddingTop(), this.descrView.getPaddingRight(), getPx(20));
    }

    private int getPx(int i) {
        return (int) TypedValue.applyDimension(1, i, getContext().getResources().getDisplayMetrics());
    }

    public NativeAppwallBanner getBanner() {
        return this.banner;
    }

    protected void removeNotification() {
        if (this.notificationView != null) {
            removeView(this.notificationView);
        }
    }

    public boolean isViewed() {
        return this.viewed;
    }

    public void setViewed(boolean z) {
        this.viewed = z;
    }

    public ImageView getNotificationImageView() {
        return this.notificationView;
    }

    public ImageView getOpenImageView() {
        return this.openImageView;
    }

    public ImageView getBannerIconImageView() {
        return this.bannerIcon;
    }

    public TextView getCoinsCountTextView() {
        return this.coinsCountView;
    }

    public TextView getDescriptionTextView() {
        return this.descrView;
    }

    public StarsRatingView getStarsRatingView() {
        return this.starsRatingView;
    }

    public TextView getVotesCountTextView() {
        return this.votesCountView;
    }

    public ImageView getStatusIconImageView() {
        return this.statusIconView;
    }

    public TextView getTitleTextView() {
        return this.titleView;
    }

    public ImageView getCoinsIconImageView() {
        return this.coinsIconView;
    }
}
