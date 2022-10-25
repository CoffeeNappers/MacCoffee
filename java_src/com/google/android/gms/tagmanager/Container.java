package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzafw;
import com.google.android.gms.internal.zzai;
import com.google.android.gms.tagmanager.zzcj;
import com.google.android.gms.tagmanager.zzu;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class Container {
    private final String aDY;
    private final DataLayer aDZ;
    private zzcx aEa;
    private volatile long aEd;
    private final Context mContext;
    private Map<String, FunctionCallMacroCallback> aEb = new HashMap();
    private Map<String, FunctionCallTagCallback> aEc = new HashMap();
    private volatile String aEe = "";

    /* loaded from: classes2.dex */
    public interface FunctionCallMacroCallback {
        Object getValue(String str, Map<String, Object> map);
    }

    /* loaded from: classes2.dex */
    public interface FunctionCallTagCallback {
        void execute(String str, Map<String, Object> map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zza implements zzu.zza {
        private zza() {
        }

        @Override // com.google.android.gms.tagmanager.zzu.zza
        public Object zzf(String str, Map<String, Object> map) {
            FunctionCallMacroCallback zzot = Container.this.zzot(str);
            if (zzot == null) {
                return null;
            }
            return zzot.getValue(str, map);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzb implements zzu.zza {
        private zzb() {
        }

        @Override // com.google.android.gms.tagmanager.zzu.zza
        public Object zzf(String str, Map<String, Object> map) {
            FunctionCallTagCallback zzou = Container.this.zzou(str);
            if (zzou != null) {
                zzou.execute(str, map);
            }
            return zzdm.zzchl();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Container(Context context, DataLayer dataLayer, String str, long j, zzafw.zzc zzcVar) {
        this.mContext = context;
        this.aDZ = dataLayer;
        this.aDY = str;
        this.aEd = j;
        zza(zzcVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Container(Context context, DataLayer dataLayer, String str, long j, zzai.zzj zzjVar) {
        this.mContext = context;
        this.aDZ = dataLayer;
        this.aDY = str;
        this.aEd = j;
        zza(zzjVar.zzxv);
        if (zzjVar.zzxu != null) {
            zza(zzjVar.zzxu);
        }
    }

    private void zza(zzafw.zzc zzcVar) {
        this.aEe = zzcVar.getVersion();
        zza(new zzcx(this.mContext, zzcVar, this.aDZ, new zza(), new zzb(), zzow(this.aEe)));
        if (getBoolean("_gtm.loadEventEnabled")) {
            this.aDZ.pushEvent("gtm.load", DataLayer.mapOf("gtm.id", this.aDY));
        }
    }

    private void zza(zzai.zzf zzfVar) {
        if (zzfVar == null) {
            throw new NullPointerException();
        }
        try {
            zza(zzafw.zzb(zzfVar));
        } catch (zzafw.zzg e) {
            String valueOf = String.valueOf(zzfVar);
            String valueOf2 = String.valueOf(e.toString());
            zzbo.e(new StringBuilder(String.valueOf(valueOf).length() + 46 + String.valueOf(valueOf2).length()).append("Not loading resource: ").append(valueOf).append(" because it is invalid: ").append(valueOf2).toString());
        }
    }

    private synchronized void zza(zzcx zzcxVar) {
        this.aEa = zzcxVar;
    }

    private void zza(zzai.zzi[] zziVarArr) {
        ArrayList arrayList = new ArrayList();
        for (zzai.zzi zziVar : zziVarArr) {
            arrayList.add(zziVar);
        }
        zzcdz().zzam(arrayList);
    }

    private synchronized zzcx zzcdz() {
        return this.aEa;
    }

    public boolean getBoolean(String str) {
        zzcx zzcdz = zzcdz();
        if (zzcdz == null) {
            zzbo.e("getBoolean called for closed container.");
            return zzdm.zzchj().booleanValue();
        }
        try {
            return zzdm.zzk(zzcdz.zzpr(str).getObject()).booleanValue();
        } catch (Exception e) {
            String valueOf = String.valueOf(e.getMessage());
            zzbo.e(new StringBuilder(String.valueOf(valueOf).length() + 66).append("Calling getBoolean() threw an exception: ").append(valueOf).append(" Returning default value.").toString());
            return zzdm.zzchj().booleanValue();
        }
    }

    public String getContainerId() {
        return this.aDY;
    }

    public double getDouble(String str) {
        zzcx zzcdz = zzcdz();
        if (zzcdz == null) {
            zzbo.e("getDouble called for closed container.");
            return zzdm.zzchi().doubleValue();
        }
        try {
            return zzdm.zzj(zzcdz.zzpr(str).getObject()).doubleValue();
        } catch (Exception e) {
            String valueOf = String.valueOf(e.getMessage());
            zzbo.e(new StringBuilder(String.valueOf(valueOf).length() + 65).append("Calling getDouble() threw an exception: ").append(valueOf).append(" Returning default value.").toString());
            return zzdm.zzchi().doubleValue();
        }
    }

    public long getLastRefreshTime() {
        return this.aEd;
    }

    public long getLong(String str) {
        zzcx zzcdz = zzcdz();
        if (zzcdz == null) {
            zzbo.e("getLong called for closed container.");
            return zzdm.zzchh().longValue();
        }
        try {
            return zzdm.zzi(zzcdz.zzpr(str).getObject()).longValue();
        } catch (Exception e) {
            String valueOf = String.valueOf(e.getMessage());
            zzbo.e(new StringBuilder(String.valueOf(valueOf).length() + 63).append("Calling getLong() threw an exception: ").append(valueOf).append(" Returning default value.").toString());
            return zzdm.zzchh().longValue();
        }
    }

    public String getString(String str) {
        zzcx zzcdz = zzcdz();
        if (zzcdz == null) {
            zzbo.e("getString called for closed container.");
            return zzdm.zzchl();
        }
        try {
            return zzdm.zzg(zzcdz.zzpr(str).getObject());
        } catch (Exception e) {
            String valueOf = String.valueOf(e.getMessage());
            zzbo.e(new StringBuilder(String.valueOf(valueOf).length() + 65).append("Calling getString() threw an exception: ").append(valueOf).append(" Returning default value.").toString());
            return zzdm.zzchl();
        }
    }

    public boolean isDefault() {
        return getLastRefreshTime() == 0;
    }

    public void registerFunctionCallMacroCallback(String str, FunctionCallMacroCallback functionCallMacroCallback) {
        if (functionCallMacroCallback == null) {
            throw new NullPointerException("Macro handler must be non-null");
        }
        synchronized (this.aEb) {
            this.aEb.put(str, functionCallMacroCallback);
        }
    }

    public void registerFunctionCallTagCallback(String str, FunctionCallTagCallback functionCallTagCallback) {
        if (functionCallTagCallback == null) {
            throw new NullPointerException("Tag callback must be non-null");
        }
        synchronized (this.aEc) {
            this.aEc.put(str, functionCallTagCallback);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void release() {
        this.aEa = null;
    }

    public void unregisterFunctionCallMacroCallback(String str) {
        synchronized (this.aEb) {
            this.aEb.remove(str);
        }
    }

    public void unregisterFunctionCallTagCallback(String str) {
        synchronized (this.aEc) {
            this.aEc.remove(str);
        }
    }

    public String zzcdy() {
        return this.aEe;
    }

    FunctionCallMacroCallback zzot(String str) {
        FunctionCallMacroCallback functionCallMacroCallback;
        synchronized (this.aEb) {
            functionCallMacroCallback = this.aEb.get(str);
        }
        return functionCallMacroCallback;
    }

    public FunctionCallTagCallback zzou(String str) {
        FunctionCallTagCallback functionCallTagCallback;
        synchronized (this.aEc) {
            functionCallTagCallback = this.aEc.get(str);
        }
        return functionCallTagCallback;
    }

    public void zzov(String str) {
        zzcdz().zzov(str);
    }

    zzaj zzow(String str) {
        if (zzcj.zzcfz().zzcga().equals(zzcj.zza.CONTAINER_DEBUG)) {
        }
        return new zzbw();
    }
}
