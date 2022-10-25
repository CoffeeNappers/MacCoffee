package com.my.target.nativeads;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.View;
import android.widget.ImageView;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.MyTargetActivity;
import com.my.target.core.facades.a;
import com.my.target.core.models.banners.d;
import com.my.target.core.models.c;
import com.my.target.core.models.sections.b;
import com.my.target.core.net.b;
import com.my.target.nativeads.banners.NativeAppwallBanner;
import com.my.target.nativeads.models.ImageData;
import com.my.target.nativeads.views.AppwallAdTeaserView;
import com.my.target.nativeads.views.AppwallAdView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NativeAppwallAd extends a {
    private com.my.target.core.ui.a adDialog;
    private final com.my.target.core.a adParams;
    private List<NativeAppwallBanner> appwallBannerList;
    private b appwallSection;
    private boolean autoLoadImages;
    private final AppwallAdView.BannerClickListener bannerClickListener;
    private final Map<String, NativeAppwallBanner> bannerIdMap;
    private View.OnClickListener clickListener;
    private final DialogInterface.OnDismissListener dialogDismissListener;
    private AppwallAdView externalAppwallAdView;
    private boolean hideStatusBarInDialog;
    private AppwallAdListener listener;
    private String title;
    private int titleBackgroundColor;
    private int titleSupplementaryColor;
    private int titleTextColor;
    private final AppwallAdView.BannerVisibilityListener visibilityListener;

    /* loaded from: classes2.dex */
    public interface AppwallAdListener {
        void onClick(NativeAppwallBanner nativeAppwallBanner, NativeAppwallAd nativeAppwallAd);

        void onDismissDialog(NativeAppwallAd nativeAppwallAd);

        void onLoad(NativeAppwallAd nativeAppwallAd);

        void onNoAd(String str, NativeAppwallAd nativeAppwallAd);
    }

    public static void loadImageToView(ImageData imageData, ImageView imageView) {
        if (imageData == null || imageView == null) {
            Tracer.i("NativeAppwallAd: invalid or null arguments");
        } else {
            com.my.target.core.net.b.a().a(imageData, imageView);
        }
    }

    public NativeAppwallAd(int i, Context context) {
        this(i, context, null);
    }

    public NativeAppwallAd(int i, Context context, CustomParams customParams) {
        this.bannerIdMap = new HashMap();
        this.appwallBannerList = new ArrayList();
        this.visibilityListener = new AppwallAdView.BannerVisibilityListener() { // from class: com.my.target.nativeads.NativeAppwallAd.1
            @Override // com.my.target.nativeads.views.AppwallAdView.BannerVisibilityListener
            public void onBannersShown(List<NativeAppwallBanner> list) {
                NativeAppwallAd.this.handleBannersShow(list);
            }
        };
        this.title = "Apps";
        this.titleBackgroundColor = -12232093;
        this.titleSupplementaryColor = -13220531;
        this.titleTextColor = -1;
        this.hideStatusBarInDialog = false;
        this.autoLoadImages = true;
        this.bannerClickListener = new AppwallAdView.BannerClickListener() { // from class: com.my.target.nativeads.NativeAppwallAd.2
            @Override // com.my.target.nativeads.views.AppwallAdView.BannerClickListener
            public void onBannerClick(AppwallAdTeaserView appwallAdTeaserView) {
                NativeAppwallAd.this.doBannerClick(appwallAdTeaserView.getBanner());
                if (NativeAppwallAd.this.externalAppwallAdView != null) {
                    NativeAppwallAd.this.externalAppwallAdView.notifyDataSetChanged();
                }
            }
        };
        this.dialogDismissListener = new DialogInterface.OnDismissListener() { // from class: com.my.target.nativeads.NativeAppwallAd.3
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialogInterface) {
                com.my.target.core.ui.a aVar = (com.my.target.core.ui.a) dialogInterface;
                aVar.setOnDismissListener(null);
                if (aVar == NativeAppwallAd.this.adDialog) {
                    NativeAppwallAd.this.adDialog = null;
                    if (NativeAppwallAd.this.listener != null) {
                        NativeAppwallAd.this.listener.onDismissDialog(NativeAppwallAd.this);
                    }
                }
            }
        };
        this.clickListener = new View.OnClickListener() { // from class: com.my.target.nativeads.NativeAppwallAd.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (view.getTag() != null && (view.getTag() instanceof String)) {
                    Map map = NativeAppwallAd.this.bannerIdMap;
                    NativeAppwallAd.this.doBannerClick((NativeAppwallBanner) map.get((String) view.getTag()));
                    return;
                }
                Tracer.d("Banner " + view + " is not registered with AppwallAd");
            }
        };
        this.adParams = new com.my.target.core.a(i, "appwall");
        if (customParams != null) {
            this.adParams.a(customParams);
        }
        Tracer.i("NativeAppwallAd created. Version: 4.6.4");
        init(this.adParams, context);
    }

    @Override // com.my.target.core.facades.a, com.my.target.core.facades.g
    public void load() {
        if (this.adParams.a() <= 0 || this.adData == null || this.adData.d()) {
            super.load();
        } else {
            onLoad(this.adData);
        }
    }

    @Override // com.my.target.core.facades.a
    protected void onLoad(c cVar) {
        if (cVar.g()) {
            this.appwallBannerList = new ArrayList();
            b bVar = (b) cVar.c("appwall");
            this.appwallBannerList.addAll(getBannersFromSection(bVar));
            if (this.appwallBannerList.size() == 0) {
                bVar = (b) cVar.c("showcaseApps");
                this.appwallBannerList.addAll(getBannersFromSection(bVar));
                if (this.appwallBannerList.size() == 0) {
                    bVar = (b) cVar.c("showcaseGames");
                    this.appwallBannerList.addAll(getBannersFromSection(bVar));
                }
            }
            this.appwallSection = bVar;
            if (this.appwallBannerList.size() != 0) {
                if (!this.autoLoadImages) {
                    internalOnLoad();
                    return;
                } else {
                    doAutoLoadImages();
                    return;
                }
            }
            internalOnNoAd();
            return;
        }
        internalOnNoAd();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void internalOnLoad() {
        JSONObject c = this.adData.c();
        if (this.adParams.a() > 0 && c != null && !this.adData.j()) {
            com.my.target.core.factories.b.a(this.adParams.a(), this.adParams.d(), c.toString(), this.context).b();
        }
        if (this.listener != null) {
            this.listener.onLoad(this);
        }
    }

    private void internalOnNoAd() {
        if (this.listener != null) {
            this.listener.onNoAd("No ad", this);
        }
    }

    private void doAutoLoadImages() {
        b.a aVar = new b.a() { // from class: com.my.target.nativeads.NativeAppwallAd.5
            @Override // com.my.target.core.net.b.a
            public void onLoad() {
                NativeAppwallAd.this.internalOnLoad();
            }
        };
        ArrayList arrayList = new ArrayList();
        for (NativeAppwallBanner nativeAppwallBanner : this.appwallBannerList) {
            ImageData statusIcon = nativeAppwallBanner.getStatusIcon();
            ImageData coinsIcon = nativeAppwallBanner.getCoinsIcon();
            ImageData gotoAppIcon = nativeAppwallBanner.getGotoAppIcon();
            ImageData icon = nativeAppwallBanner.getIcon();
            ImageData labelIcon = nativeAppwallBanner.getLabelIcon();
            ImageData bubbleIcon = nativeAppwallBanner.getBubbleIcon();
            ImageData itemHighlightIcon = nativeAppwallBanner.getItemHighlightIcon();
            ImageData crossNotifIcon = nativeAppwallBanner.getCrossNotifIcon();
            if (statusIcon != null) {
                arrayList.add(statusIcon);
            }
            if (coinsIcon != null) {
                arrayList.add(coinsIcon);
            }
            if (gotoAppIcon != null) {
                arrayList.add(gotoAppIcon);
            }
            if (icon != null) {
                arrayList.add(icon);
            }
            if (labelIcon != null) {
                arrayList.add(labelIcon);
            }
            if (bubbleIcon != null) {
                arrayList.add(bubbleIcon);
            }
            if (itemHighlightIcon != null) {
                arrayList.add(itemHighlightIcon);
            }
            if (crossNotifIcon != null) {
                arrayList.add(crossNotifIcon);
            }
        }
        com.my.target.core.net.b.a().a(arrayList, this.context, aVar);
    }

    private List<NativeAppwallBanner> getBannersFromSection(com.my.target.core.models.sections.b bVar) {
        ArrayList arrayList = new ArrayList();
        if (bVar != null && bVar.b() > 0) {
            Iterator<com.my.target.core.models.banners.b> it = bVar.g().iterator();
            while (it.hasNext()) {
                com.my.target.core.models.banners.b next = it.next();
                arrayList.add(next);
                this.bannerIdMap.put(next.getId(), next);
            }
        }
        return arrayList;
    }

    @Override // com.my.target.core.facades.a
    protected void onLoadError(String str) {
        if (this.listener != null) {
            this.listener.onNoAd(str, this);
        }
    }

    public void show() {
        if (this.appwallBannerList.size() == 0) {
            Tracer.i("AppwallAd.show: No ad");
            return;
        }
        MyTargetActivity.ad = this;
        Intent intent = new Intent(this.context, MyTargetActivity.class);
        intent.setAction("com.my.target.actions.appwall");
        if (!(this.context instanceof Activity)) {
            intent.addFlags(268435456);
        }
        this.context.startActivity(intent);
    }

    public void showDialog() {
        if (this.adDialog != null && this.adDialog.isShowing()) {
            Tracer.i("AppwallAd.showDialog: dialog already showing");
        } else if (this.appwallBannerList.size() == 0) {
            Tracer.i("AppwallAd.showDialog: No ad");
        } else {
            this.adDialog = new com.my.target.core.ui.a(this, this.hideStatusBarInDialog, this.context);
            this.adDialog.setOnDismissListener(this.dialogDismissListener);
            this.adDialog.show();
        }
    }

    public void dismissDialog() {
        if (this.adDialog != null && this.adDialog.isShowing()) {
            this.adDialog.dismiss();
        }
    }

    public boolean hasNotifications() {
        for (NativeAppwallBanner nativeAppwallBanner : this.appwallBannerList) {
            if (nativeAppwallBanner.isHasNotification()) {
                return true;
            }
        }
        return false;
    }

    public void registerAppwallAdView(AppwallAdView appwallAdView) {
        appwallAdView.setBannerClickListener(this.bannerClickListener);
        appwallAdView.setBannerVisibilityListener(this.visibilityListener);
        this.externalAppwallAdView = appwallAdView;
    }

    public void unregisterAppwallAdView(AppwallAdView appwallAdView) {
        if (appwallAdView != this.externalAppwallAdView) {
            Tracer.i("No such AppwallAdView registered");
            return;
        }
        this.externalAppwallAdView.setBannerClickListener(null);
        this.externalAppwallAdView.setBannerVisibilityListener(null);
        this.externalAppwallAdView = null;
    }

    public List<NativeAppwallBanner> getBanners() {
        return this.appwallBannerList;
    }

    public void setListener(AppwallAdListener appwallAdListener) {
        this.listener = appwallAdListener;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String str) {
        this.title = str;
    }

    public void handleBannerClick(NativeAppwallBanner nativeAppwallBanner) {
        doBannerClick(nativeAppwallBanner);
    }

    public String prepareBannerClickLink(NativeAppwallBanner nativeAppwallBanner) {
        d dVar = (d) nativeAppwallBanner;
        String b = c.b(dVar, this.context);
        this.adData.a(this.adParams, this.appwallSection, dVar, this.context);
        return b;
    }

    public void handleBannersShow(List<NativeAppwallBanner> list) {
        com.my.target.core.models.sections.b bVar = this.appwallSection;
        Context context = this.context;
        Iterator<NativeAppwallBanner> it = list.iterator();
        while (it.hasNext()) {
            c.a((d) it.next(), bVar, context);
        }
    }

    public void handleBannerShow(NativeAppwallBanner nativeAppwallBanner) {
        c.a((d) nativeAppwallBanner, this.appwallSection, this.context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doBannerClick(NativeAppwallBanner nativeAppwallBanner) {
        if (nativeAppwallBanner == null) {
            Tracer.d("Something horrible happened");
        } else if (this.adData == null) {
            Tracer.d("AdData is null, click will not be processed.");
        } else {
            try {
                d dVar = (d) nativeAppwallBanner;
                this.adData.a(dVar, this.context);
                this.adData.a(this.adParams, this.appwallSection, dVar, this.context);
            } catch (Throwable th) {
                Tracer.d(th.toString());
            }
            if (this.listener != null) {
                this.listener.onClick(nativeAppwallBanner, this);
            }
        }
    }

    public int getTitleBackgroundColor() {
        return this.titleBackgroundColor;
    }

    public void setTitleBackgroundColor(int i) {
        this.titleBackgroundColor = i;
    }

    public int getTitleSupplementaryColor() {
        return this.titleSupplementaryColor;
    }

    public void setTitleSupplementaryColor(int i) {
        this.titleSupplementaryColor = i;
    }

    public int getTitleTextColor() {
        return this.titleTextColor;
    }

    public void setTitleTextColor(int i) {
        this.titleTextColor = i;
    }

    public long getCachePeriod() {
        if (this.adParams == null) {
            return 0L;
        }
        return this.adParams.a();
    }

    public void setCachePeriod(long j) {
        if (this.adParams != null) {
            this.adParams.a(j);
        }
    }

    public boolean isHideStatusBarInDialog() {
        return this.hideStatusBarInDialog;
    }

    public void setHideStatusBarInDialog(boolean z) {
        this.hideStatusBarInDialog = z;
    }

    public boolean isAutoLoadImages() {
        return this.autoLoadImages;
    }

    public void setAutoLoadImages(boolean z) {
        this.autoLoadImages = z;
    }
}
