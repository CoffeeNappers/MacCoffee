package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.content.Context;
import android.view.View;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.internal.zzxq;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public final class zzf {
    private final Set<Scope> DJ;
    private final Map<Api<?>, zza> DK;
    private final zzxq DL;
    private Integer DM;
    private final Account gj;
    private final String hu;
    private final Set<Scope> xF;
    private final int xH;
    private final View xI;
    private final String xJ;

    /* loaded from: classes2.dex */
    public static final class zza {
        public final boolean DN;
        public final Set<Scope> jw;

        public zza(Set<Scope> set, boolean z) {
            zzaa.zzy(set);
            this.jw = Collections.unmodifiableSet(set);
            this.DN = z;
        }
    }

    public zzf(Account account, Set<Scope> set, Map<Api<?>, zza> map, int i, View view, String str, String str2, zzxq zzxqVar) {
        this.gj = account;
        this.xF = set == null ? Collections.EMPTY_SET : Collections.unmodifiableSet(set);
        this.DK = map == null ? Collections.EMPTY_MAP : map;
        this.xI = view;
        this.xH = i;
        this.hu = str;
        this.xJ = str2;
        this.DL = zzxqVar;
        HashSet hashSet = new HashSet(this.xF);
        for (zza zzaVar : this.DK.values()) {
            hashSet.addAll(zzaVar.jw);
        }
        this.DJ = Collections.unmodifiableSet(hashSet);
    }

    public static zzf zzca(Context context) {
        return new GoogleApiClient.Builder(context).zzarf();
    }

    public Account getAccount() {
        return this.gj;
    }

    @Deprecated
    public String getAccountName() {
        if (this.gj != null) {
            return this.gj.name;
        }
        return null;
    }

    public Account zzave() {
        return this.gj != null ? this.gj : new Account("<<default account>>", "com.google");
    }

    public int zzavo() {
        return this.xH;
    }

    public Set<Scope> zzavp() {
        return this.xF;
    }

    public Set<Scope> zzavq() {
        return this.DJ;
    }

    public Map<Api<?>, zza> zzavr() {
        return this.DK;
    }

    public String zzavs() {
        return this.hu;
    }

    public String zzavt() {
        return this.xJ;
    }

    public View zzavu() {
        return this.xI;
    }

    public zzxq zzavv() {
        return this.DL;
    }

    public Integer zzavw() {
        return this.DM;
    }

    public Set<Scope> zzc(Api<?> api) {
        zza zzaVar = this.DK.get(api);
        if (zzaVar == null || zzaVar.jw.isEmpty()) {
            return this.xF;
        }
        HashSet hashSet = new HashSet(this.xF);
        hashSet.addAll(zzaVar.jw);
        return hashSet;
    }

    public void zzc(Integer num) {
        this.DM = num;
    }
}
