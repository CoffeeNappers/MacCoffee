package com.my.target.nativeads.banners;

import com.my.target.nativeads.models.ImageData;
import java.util.List;
/* loaded from: classes2.dex */
public interface NativePromoBanner {
    String getAdvertisingLabel();

    String getAgeRestrictions();

    List<NativePromoCard> getCards();

    String getCategory();

    String getCtaText();

    String getDescription();

    String getDisclaimer();

    String getDomain();

    ImageData getIcon();

    ImageData getImage();

    String getNavigationType();

    float getRating();

    String getSubcategory();

    String getTitle();

    int getVotes();

    boolean hasVideo();
}
