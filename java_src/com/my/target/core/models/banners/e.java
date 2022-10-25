package com.my.target.core.models.banners;

import com.my.target.ads.instream.models.InstreamAdCompanionBanner;
/* compiled from: CompanionBanner.java */
/* loaded from: classes2.dex */
public final class e extends a implements InstreamAdCompanionBanner {
    private String adSlotID;
    private String apiFramework;
    private int assetHeight;
    private int assetWidth;
    private int expandedHeight;
    private int expandedWidth;
    private String htmlResource;
    private String iframeResource;
    private String required;
    private String staticResource;

    public e(String str, String str2) {
        super(str, str2);
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final int getAssetWidth() {
        return this.assetWidth;
    }

    public final void setAssetWidth(int i) {
        this.assetWidth = i;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final int getAssetHeight() {
        return this.assetHeight;
    }

    public final void setAssetHeight(int i) {
        this.assetHeight = i;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final int getExpandedWidth() {
        return this.expandedWidth;
    }

    public final void setExpandedWidth(int i) {
        this.expandedWidth = i;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final int getExpandedHeight() {
        return this.expandedHeight;
    }

    public final void setExpandedHeight(int i) {
        this.expandedHeight = i;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final String getStaticResource() {
        return this.staticResource;
    }

    public final void setStaticResource(String str) {
        this.staticResource = str;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final String getIframeResource() {
        return this.iframeResource;
    }

    public final void setIframeResource(String str) {
        this.iframeResource = str;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final String getHtmlResource() {
        return this.htmlResource;
    }

    public final void setHtmlResource(String str) {
        this.htmlResource = str;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final String getApiFramework() {
        return this.apiFramework;
    }

    public final void setApiFramework(String str) {
        this.apiFramework = str;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final String getAdSlotID() {
        return this.adSlotID;
    }

    public final void setAdSlotID(String str) {
        this.adSlotID = str;
    }

    @Override // com.my.target.ads.instream.models.InstreamAdCompanionBanner
    public final String getRequired() {
        return this.required;
    }

    public final void setRequired(String str) {
        this.required = str;
    }
}
