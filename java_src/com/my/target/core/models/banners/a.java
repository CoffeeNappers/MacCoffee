package com.my.target.core.models.banners;

import java.util.ArrayList;
import java.util.Iterator;
/* compiled from: AbstractBanner.java */
/* loaded from: classes2.dex */
public abstract class a extends com.my.target.core.models.b implements d {
    private static final String DEFAULT_CTA_TEXT_STORE = "Install";
    private static final String DEFAULT_CTA_TEXT_WEB = "Visit";
    public static final String DEFAULT_NAVIGATION_TYPE = "web";
    public static final boolean DEFAULT_OPEN_IN_BROWSER = false;
    public static final boolean DEFAULT_USE_PLAY_ACTION = false;
    protected String advertisingLabel;
    protected String ageRestrictions;
    protected boolean appInstalled;
    protected String bundleId;
    protected String ctaText;
    protected String deepLink;
    protected String finalLink;
    protected int height;
    protected String id;
    protected String navigationType;
    protected boolean openInBrowser;
    protected ArrayList<com.my.target.core.models.k> stats = new ArrayList<>();
    protected int timeout;
    protected String trackingLink;
    protected final String type;
    protected String urlScheme;
    private boolean usePlayStoreAction;
    protected int width;

    public static String getDefaultCtaText(String str) {
        return "store".equals(str) ? DEFAULT_CTA_TEXT_STORE : DEFAULT_CTA_TEXT_WEB;
    }

    @Override // com.my.target.core.models.banners.d
    public String getId() {
        return this.id;
    }

    @Override // com.my.target.core.models.banners.d
    public String getType() {
        return this.type;
    }

    @Override // com.my.target.core.models.banners.d
    public String getUrlScheme() {
        return this.urlScheme;
    }

    @Override // com.my.target.core.models.banners.d
    public void setUrlScheme(String str) {
        this.urlScheme = str;
    }

    @Override // com.my.target.core.models.banners.d
    public String getBundleId() {
        return this.bundleId;
    }

    @Override // com.my.target.core.models.banners.d
    public void setBundleId(String str) {
        this.bundleId = str;
    }

    @Override // com.my.target.core.models.banners.d
    public void setAppInstalled(boolean z) {
        this.appInstalled = z;
    }

    public boolean isAppInstalled() {
        return this.appInstalled;
    }

    @Override // com.my.target.core.models.banners.d
    public String getTrackingLink() {
        return this.trackingLink;
    }

    @Override // com.my.target.core.models.banners.d
    public void setTrackingLink(String str) {
        this.trackingLink = str;
    }

    @Override // com.my.target.core.models.banners.d
    public int getTimeout() {
        return this.timeout;
    }

    @Override // com.my.target.core.models.banners.d
    public void setTimeout(int i) {
        this.timeout = i;
    }

    public String getFinalLink() {
        return this.finalLink;
    }

    @Override // com.my.target.core.models.banners.d
    public void setFinalLink(String str) {
        this.finalLink = str;
    }

    public int getWidth() {
        return this.width;
    }

    @Override // com.my.target.core.models.banners.d
    public void setWidth(int i) {
        this.width = i;
    }

    public int getHeight() {
        return this.height;
    }

    @Override // com.my.target.core.models.banners.d
    public void setHeight(int i) {
        this.height = i;
    }

    public String getAgeRestrictions() {
        return this.ageRestrictions;
    }

    @Override // com.my.target.core.models.banners.d
    public void setAgeRestrictions(String str) {
        this.ageRestrictions = str;
    }

    @Override // com.my.target.core.models.banners.d
    public void setNavigationType(String str) {
        this.navigationType = str;
    }

    @Override // com.my.target.core.models.banners.d
    public String getNavigationType() {
        return this.navigationType;
    }

    @Override // com.my.target.core.models.banners.d
    public void setCtaText(String str) {
        this.ctaText = str;
    }

    public String getCtaText() {
        return this.ctaText;
    }

    public String getAdvertisingLabel() {
        return this.advertisingLabel;
    }

    @Override // com.my.target.core.models.banners.d
    public void setAdvertisingLabel(String str) {
        this.advertisingLabel = str;
    }

    @Override // com.my.target.core.models.banners.d
    public boolean isOpenInBrowser() {
        return this.openInBrowser;
    }

    @Override // com.my.target.core.models.banners.d
    public void setOpenInBrowser(boolean z) {
        this.openInBrowser = z;
    }

    @Override // com.my.target.core.models.banners.d
    public String getDeepLink() {
        return this.deepLink;
    }

    @Override // com.my.target.core.models.banners.d
    public void setDeepLink(String str) {
        this.deepLink = str;
    }

    @Override // com.my.target.core.models.banners.d
    public void setUsePlayStoreAction(boolean z) {
        this.usePlayStoreAction = z;
    }

    @Override // com.my.target.core.models.banners.d
    public boolean getUsePlayStoreAction() {
        return this.usePlayStoreAction;
    }

    public a(String str, String str2) {
        this.id = str;
        this.type = str2;
    }

    public synchronized boolean addStat(com.my.target.core.models.k kVar) {
        boolean z;
        if (!this.stats.contains(kVar)) {
            this.stats.add(kVar);
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    @Override // com.my.target.core.models.banners.d
    public ArrayList<com.my.target.core.models.k> getStats() {
        return new ArrayList<>(this.stats);
    }

    @Override // com.my.target.core.models.banners.d
    public void addStats(ArrayList<com.my.target.core.models.k> arrayList) {
        Iterator<com.my.target.core.models.k> it = arrayList.iterator();
        while (it.hasNext()) {
            addStat(it.next());
        }
    }
}
