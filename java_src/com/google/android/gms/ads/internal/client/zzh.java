package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.reward.client.RewardedVideoAdRequestParcel;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.internal.zzji;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;
@zzji
/* loaded from: classes.dex */
public class zzh {
    public static final zzh zzazp = new zzh();

    protected zzh() {
    }

    public static zzh zzkb() {
        return zzazp;
    }

    public AdRequestParcel zza(Context context, zzad zzadVar) {
        Date birthday = zzadVar.getBirthday();
        long time = birthday != null ? birthday.getTime() : -1L;
        String contentUrl = zzadVar.getContentUrl();
        int gender = zzadVar.getGender();
        Set<String> keywords = zzadVar.getKeywords();
        List unmodifiableList = !keywords.isEmpty() ? Collections.unmodifiableList(new ArrayList(keywords)) : null;
        boolean isTestDevice = zzadVar.isTestDevice(context);
        int zzld = zzadVar.zzld();
        Location location = zzadVar.getLocation();
        Bundle networkExtrasBundle = zzadVar.getNetworkExtrasBundle(AdMobAdapter.class);
        boolean manualImpressionsEnabled = zzadVar.getManualImpressionsEnabled();
        String publisherProvidedId = zzadVar.getPublisherProvidedId();
        SearchAdRequest zzla = zzadVar.zzla();
        SearchAdRequestParcel searchAdRequestParcel = zzla != null ? new SearchAdRequestParcel(zzla) : null;
        String str = null;
        Context applicationContext = context.getApplicationContext();
        if (applicationContext != null) {
            str = zzm.zzkr().zza(Thread.currentThread().getStackTrace(), applicationContext.getPackageName());
        }
        return new AdRequestParcel(7, time, networkExtrasBundle, gender, unmodifiableList, isTestDevice, zzld, manualImpressionsEnabled, publisherProvidedId, searchAdRequestParcel, location, contentUrl, zzadVar.zzlc(), zzadVar.getCustomTargeting(), Collections.unmodifiableList(new ArrayList(zzadVar.zzle())), zzadVar.zzkz(), str, zzadVar.isDesignedForFamilies());
    }

    public RewardedVideoAdRequestParcel zza(Context context, zzad zzadVar, String str) {
        return new RewardedVideoAdRequestParcel(zza(context, zzadVar), str);
    }
}
