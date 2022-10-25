package com.google.android.gms.internal;

import android.content.Context;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzafv {
    private String aEC;
    Map<String, Object> aLk;
    private final Map<String, Object> aLl;
    private final zzafx aMw;
    private final Context mContext;
    private final com.google.android.gms.common.util.zze zzaql;

    public zzafv(Context context) {
        this(context, new HashMap(), new zzafx(context), com.google.android.gms.common.util.zzh.zzayl());
    }

    zzafv(Context context, Map<String, Object> map, zzafx zzafxVar, com.google.android.gms.common.util.zze zzeVar) {
        this.aEC = null;
        this.aLk = new HashMap();
        this.mContext = context;
        this.zzaql = zzeVar;
        this.aMw = zzafxVar;
        this.aLl = map;
    }

    public void zzqy(String str) {
        this.aEC = str;
    }
}
