package com.my.target.core.engines;

import android.content.Context;
import android.view.ViewGroup;
import com.my.target.core.engines.b;
import com.my.target.nativeads.NativeAppwallAd;
import com.my.target.nativeads.banners.NativeAppwallBanner;
import com.my.target.nativeads.views.AppwallAdTeaserView;
import com.my.target.nativeads.views.AppwallAdView;
import java.util.List;
/* compiled from: AppwallAdEngine.java */
/* loaded from: classes2.dex */
public final class c extends a implements AppwallAdView.BannerClickListener, AppwallAdView.BannerVisibilityListener {
    private NativeAppwallAd c;
    private AppwallAdView d;

    public c(NativeAppwallAd nativeAppwallAd, ViewGroup viewGroup, Context context) {
        super(viewGroup, context);
        this.c = nativeAppwallAd;
        this.d = new AppwallAdView(this.b);
        this.d.setupView(this.c);
        this.d.setBannerClickListener(this);
        this.d.setVisibility(0);
        this.d.setBannerVisibilityListener(this);
        this.d.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        this.a.addView(this.d);
    }

    @Override // com.my.target.nativeads.views.AppwallAdView.BannerClickListener
    public final void onBannerClick(AppwallAdTeaserView appwallAdTeaserView) {
        this.c.handleBannerClick(appwallAdTeaserView.getBanner());
        this.d.notifyDataSetChanged();
    }

    @Override // com.my.target.nativeads.views.AppwallAdView.BannerVisibilityListener
    public final void onBannersShown(List<NativeAppwallBanner> list) {
        this.c.handleBannersShow(list);
    }

    @Override // com.my.target.core.engines.b
    public final void g() {
    }

    @Override // com.my.target.core.engines.b
    public final void a(b.a aVar) {
    }
}
