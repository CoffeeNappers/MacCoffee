package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.admob.AdMobExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.internal.zzji;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
@zzji
/* loaded from: classes.dex */
public final class zzad {
    public static final String DEVICE_ID_EMULATOR = zzm.zzkr().zzdf("emulator");
    private final boolean zzamv;
    private final int zzazc;
    private final int zzazf;
    private final String zzazg;
    private final String zzazi;
    private final Bundle zzazk;
    private final String zzazm;
    private final boolean zzazo;
    private final Bundle zzbar;
    private final Map<Class<? extends NetworkExtras>, NetworkExtras> zzbas;
    private final SearchAdRequest zzbat;
    private final Set<String> zzbau;
    private final Set<String> zzbav;
    private final Date zzgr;
    private final Set<String> zzgt;
    private final Location zzgv;

    /* loaded from: classes.dex */
    public static final class zza {
        private String zzazg;
        private String zzazi;
        private String zzazm;
        private boolean zzazo;
        private Date zzgr;
        private Location zzgv;
        private final HashSet<String> zzbaw = new HashSet<>();
        private final Bundle zzbar = new Bundle();
        private final HashMap<Class<? extends NetworkExtras>, NetworkExtras> zzbax = new HashMap<>();
        private final HashSet<String> zzbay = new HashSet<>();
        private final Bundle zzazk = new Bundle();
        private final HashSet<String> zzbaz = new HashSet<>();
        private int zzazc = -1;
        private boolean zzamv = false;
        private int zzazf = -1;

        public void setManualImpressionsEnabled(boolean z) {
            this.zzamv = z;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Deprecated
        public void zza(NetworkExtras networkExtras) {
            if (networkExtras instanceof AdMobExtras) {
                zza(AdMobAdapter.class, ((AdMobExtras) networkExtras).getExtras());
            } else {
                this.zzbax.put(networkExtras.getClass(), networkExtras);
            }
        }

        public void zza(Class<? extends MediationAdapter> cls, Bundle bundle) {
            this.zzbar.putBundle(cls.getName(), bundle);
        }

        public void zza(Date date) {
            this.zzgr = date;
        }

        public void zzam(String str) {
            this.zzbaw.add(str);
        }

        public void zzan(String str) {
            this.zzbay.add(str);
        }

        public void zzao(String str) {
            this.zzbay.remove(str);
        }

        public void zzap(String str) {
            this.zzazi = str;
        }

        public void zzaq(String str) {
            this.zzazg = str;
        }

        public void zzar(String str) {
            this.zzazm = str;
        }

        public void zzas(String str) {
            this.zzbaz.add(str);
        }

        public void zzb(Location location) {
            this.zzgv = location;
        }

        public void zzb(Class<? extends CustomEvent> cls, Bundle bundle) {
            if (this.zzbar.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter") == null) {
                this.zzbar.putBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter", new Bundle());
            }
            this.zzbar.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter").putBundle(cls.getName(), bundle);
        }

        public void zze(String str, String str2) {
            this.zzazk.putString(str, str2);
        }

        public void zzo(boolean z) {
            this.zzazf = z ? 1 : 0;
        }

        public void zzp(boolean z) {
            this.zzazo = z;
        }

        public void zzx(int i) {
            this.zzazc = i;
        }
    }

    public zzad(zza zzaVar) {
        this(zzaVar, null);
    }

    public zzad(zza zzaVar, SearchAdRequest searchAdRequest) {
        this.zzgr = zzaVar.zzgr;
        this.zzazi = zzaVar.zzazi;
        this.zzazc = zzaVar.zzazc;
        this.zzgt = Collections.unmodifiableSet(zzaVar.zzbaw);
        this.zzgv = zzaVar.zzgv;
        this.zzamv = zzaVar.zzamv;
        this.zzbar = zzaVar.zzbar;
        this.zzbas = Collections.unmodifiableMap(zzaVar.zzbax);
        this.zzazg = zzaVar.zzazg;
        this.zzazm = zzaVar.zzazm;
        this.zzbat = searchAdRequest;
        this.zzazf = zzaVar.zzazf;
        this.zzbau = Collections.unmodifiableSet(zzaVar.zzbay);
        this.zzazk = zzaVar.zzazk;
        this.zzbav = Collections.unmodifiableSet(zzaVar.zzbaz);
        this.zzazo = zzaVar.zzazo;
    }

    public Date getBirthday() {
        return this.zzgr;
    }

    public String getContentUrl() {
        return this.zzazi;
    }

    public Bundle getCustomEventExtrasBundle(Class<? extends CustomEvent> cls) {
        Bundle bundle = this.zzbar.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter");
        if (bundle != null) {
            return bundle.getBundle(cls.getName());
        }
        return null;
    }

    public Bundle getCustomTargeting() {
        return this.zzazk;
    }

    public int getGender() {
        return this.zzazc;
    }

    public Set<String> getKeywords() {
        return this.zzgt;
    }

    public Location getLocation() {
        return this.zzgv;
    }

    public boolean getManualImpressionsEnabled() {
        return this.zzamv;
    }

    @Deprecated
    public <T extends NetworkExtras> T getNetworkExtras(Class<T> cls) {
        return (T) this.zzbas.get(cls);
    }

    public Bundle getNetworkExtrasBundle(Class<? extends MediationAdapter> cls) {
        return this.zzbar.getBundle(cls.getName());
    }

    public String getPublisherProvidedId() {
        return this.zzazg;
    }

    public boolean isDesignedForFamilies() {
        return this.zzazo;
    }

    public boolean isTestDevice(Context context) {
        return this.zzbau.contains(zzm.zzkr().zzao(context));
    }

    public String zzkz() {
        return this.zzazm;
    }

    public SearchAdRequest zzla() {
        return this.zzbat;
    }

    public Map<Class<? extends NetworkExtras>, NetworkExtras> zzlb() {
        return this.zzbas;
    }

    public Bundle zzlc() {
        return this.zzbar;
    }

    public int zzld() {
        return this.zzazf;
    }

    public Set<String> zzle() {
        return this.zzbav;
    }
}
