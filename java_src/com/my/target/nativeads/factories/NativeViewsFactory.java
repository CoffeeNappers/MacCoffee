package com.my.target.nativeads.factories;

import android.content.Context;
import com.my.target.nativeads.NativeAd;
import com.my.target.nativeads.NativeAppwallAd;
import com.my.target.nativeads.banners.NativeAppwallBanner;
import com.my.target.nativeads.banners.NativePromoBanner;
import com.my.target.nativeads.views.AppwallAdTeaserView;
import com.my.target.nativeads.views.AppwallAdView;
import com.my.target.nativeads.views.ChatListAdView;
import com.my.target.nativeads.views.ContentStreamAdView;
import com.my.target.nativeads.views.ContentStreamCardView;
import com.my.target.nativeads.views.ContentWallAdView;
import com.my.target.nativeads.views.MediaAdView;
import com.my.target.nativeads.views.NewsFeedAdView;
import com.my.target.nativeads.views.PromoCardRecyclerView;
/* loaded from: classes2.dex */
public class NativeViewsFactory {
    public static AppwallAdTeaserView getAppwallAppView(NativeAppwallBanner nativeAppwallBanner, Context context) {
        AppwallAdTeaserView appwallAppView = getAppwallAppView(context);
        appwallAppView.setNativeAppwallBanner(nativeAppwallBanner);
        return appwallAppView;
    }

    public static AppwallAdTeaserView getAppwallAppView(Context context) {
        return new AppwallAdTeaserView(context);
    }

    public static AppwallAdView getAppwallView(NativeAppwallAd nativeAppwallAd, Context context) {
        AppwallAdView appwallView = getAppwallView(context);
        appwallView.setupView(nativeAppwallAd);
        return appwallView;
    }

    public static AppwallAdView getAppwallView(Context context) {
        return new AppwallAdView(context);
    }

    public static ChatListAdView getChatListView(NativeAd nativeAd, Context context) {
        return getChatListView(nativeAd.getBanner(), context);
    }

    public static ChatListAdView getChatListView(NativePromoBanner nativePromoBanner, Context context) {
        ChatListAdView chatListView = getChatListView(context);
        chatListView.setupView(nativePromoBanner);
        return chatListView;
    }

    public static ChatListAdView getChatListView(Context context) {
        return new ChatListAdView(context);
    }

    public static ContentStreamCardView getContentStreamCardView(Context context) {
        return new ContentStreamCardView(context);
    }

    public static ContentStreamAdView getContentStreamView(NativeAd nativeAd, Context context) {
        return getContentStreamView(nativeAd.getBanner(), context);
    }

    public static ContentStreamAdView getContentStreamView(NativePromoBanner nativePromoBanner, Context context) {
        ContentStreamAdView contentStreamView = getContentStreamView(context);
        contentStreamView.setupView(nativePromoBanner);
        return contentStreamView;
    }

    public static ContentStreamAdView getContentStreamView(Context context) {
        return new ContentStreamAdView(context);
    }

    public static ContentWallAdView getContentWallView(NativeAd nativeAd, Context context) {
        return getContentWallView(nativeAd.getBanner(), context);
    }

    public static ContentWallAdView getContentWallView(NativePromoBanner nativePromoBanner, Context context) {
        ContentWallAdView contentWallView = getContentWallView(context);
        contentWallView.setupView(nativePromoBanner);
        return contentWallView;
    }

    public static ContentWallAdView getContentWallView(Context context) {
        return new ContentWallAdView(context);
    }

    public static MediaAdView getMediaAdView(Context context) {
        return new MediaAdView(context);
    }

    public static NewsFeedAdView getNewsFeedView(NativeAd nativeAd, Context context) {
        return getNewsFeedView(nativeAd.getBanner(), context);
    }

    public static NewsFeedAdView getNewsFeedView(NativePromoBanner nativePromoBanner, Context context) {
        NewsFeedAdView newsFeedView = getNewsFeedView(context);
        newsFeedView.setupView(nativePromoBanner);
        return newsFeedView;
    }

    public static NewsFeedAdView getNewsFeedView(Context context) {
        return new NewsFeedAdView(context);
    }

    public static PromoCardRecyclerView getPromoCardRecyclerView(Context context) {
        return new PromoCardRecyclerView(context);
    }
}
