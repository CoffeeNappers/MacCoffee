package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.internal.zzvq;
import java.util.ArrayList;
import java.util.Collection;
/* loaded from: classes2.dex */
public class zzvr {
    private final Collection<zzvq> zzbcp = new ArrayList();
    private final Collection<zzvq.zzd> zzbcq = new ArrayList();
    private final Collection<zzvq.zzd> zzbcr = new ArrayList();

    public static void initialize(Context context) {
        zzvu.zzbhf().initialize(context);
    }

    public void zza(zzvq zzvqVar) {
        this.zzbcp.add(zzvqVar);
    }
}
