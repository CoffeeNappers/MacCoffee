package com.google.ads.mediation;

import android.location.Location;
import com.google.ads.AdRequest;
import java.util.Calendar;
import java.util.Date;
import java.util.Set;
@Deprecated
/* loaded from: classes.dex */
public class MediationAdRequest {
    private final Date zzgr;
    private final AdRequest.Gender zzgs;
    private final Set<String> zzgt;
    private final boolean zzgu;
    private final Location zzgv;

    public MediationAdRequest(Date date, AdRequest.Gender gender, Set<String> set, boolean z, Location location) {
        this.zzgr = date;
        this.zzgs = gender;
        this.zzgt = set;
        this.zzgu = z;
        this.zzgv = location;
    }

    public Integer getAgeInYears() {
        if (this.zzgr != null) {
            Calendar calendar = Calendar.getInstance();
            Calendar calendar2 = Calendar.getInstance();
            calendar.setTime(this.zzgr);
            Integer valueOf = Integer.valueOf(calendar2.get(1) - calendar.get(1));
            return (calendar2.get(2) < calendar.get(2) || (calendar2.get(2) == calendar.get(2) && calendar2.get(5) < calendar.get(5))) ? Integer.valueOf(valueOf.intValue() - 1) : valueOf;
        }
        return null;
    }

    public Date getBirthday() {
        return this.zzgr;
    }

    public AdRequest.Gender getGender() {
        return this.zzgs;
    }

    public Set<String> getKeywords() {
        return this.zzgt;
    }

    public Location getLocation() {
        return this.zzgv;
    }

    public boolean isTesting() {
        return this.zzgu;
    }
}
