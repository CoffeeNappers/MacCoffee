package com.my.target.core.models.banners;

import java.util.ArrayList;
/* compiled from: Banner.java */
/* loaded from: classes2.dex */
public interface d {
    void addStats(ArrayList<com.my.target.core.models.k> arrayList);

    String getBundleId();

    String getDeepLink();

    String getId();

    String getNavigationType();

    ArrayList<com.my.target.core.models.k> getStats();

    int getTimeout();

    String getTrackingLink();

    String getType();

    String getUrlScheme();

    boolean getUsePlayStoreAction();

    boolean isOpenInBrowser();

    void setAdvertisingLabel(String str);

    void setAgeRestrictions(String str);

    void setAppInstalled(boolean z);

    void setBundleId(String str);

    void setCtaText(String str);

    void setDeepLink(String str);

    void setFinalLink(String str);

    void setHeight(int i);

    void setNavigationType(String str);

    void setOpenInBrowser(boolean z);

    void setTimeout(int i);

    void setTrackingLink(String str);

    void setUrlScheme(String str);

    void setUsePlayStoreAction(boolean z);

    void setWidth(int i);
}
