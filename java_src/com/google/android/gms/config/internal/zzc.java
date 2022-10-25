package com.google.android.gms.config.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.config.internal.zzi;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzrk;
import com.google.android.gms.internal.zzta;
import com.google.android.gms.internal.zztb;
import com.google.android.gms.internal.zztc;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class zzc implements zztb {
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    private static final Pattern GW = Pattern.compile("^(1|true|t|yes|y|on)$", 2);
    private static final Pattern GX = Pattern.compile("^(0|false|f|no|n|off|)$", 2);

    /* loaded from: classes2.dex */
    static abstract class zza extends zzi.zza {
        zza() {
        }

        @Override // com.google.android.gms.config.internal.zzi
        public void zza(Status status, FetchConfigIpcResponse fetchConfigIpcResponse) {
            throw new UnsupportedOperationException();
        }

        @Override // com.google.android.gms.config.internal.zzi
        public void zza(Status status, Map map) {
            throw new UnsupportedOperationException();
        }

        @Override // com.google.android.gms.config.internal.zzi
        public void zza(Status status, byte[] bArr) {
            throw new UnsupportedOperationException();
        }

        @Override // com.google.android.gms.config.internal.zzi
        public void zzah(Status status) {
            throw new UnsupportedOperationException();
        }
    }

    /* loaded from: classes2.dex */
    static abstract class zzb<R extends Result> extends zzqo.zza<R, zze> {
        public zzb(GoogleApiClient googleApiClient) {
            super(zzta.API, googleApiClient);
        }

        protected abstract void zza(Context context, zzj zzjVar) throws RemoteException;

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqo.zza
        public final void zza(zze zzeVar) throws RemoteException {
            zza(zzeVar.getContext(), (zzj) zzeVar.zzavg());
        }
    }

    /* renamed from: com.google.android.gms.config.internal.zzc$zzc  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    static abstract class AbstractC0059zzc extends zzb<zztb.zzb> {
        protected zzi Ha;

        public AbstractC0059zzc(GoogleApiClient googleApiClient) {
            super(googleApiClient);
            this.Ha = new zza() { // from class: com.google.android.gms.config.internal.zzc.zzc.1
                @Override // com.google.android.gms.config.internal.zzc.zza, com.google.android.gms.config.internal.zzi
                public void zza(Status status, FetchConfigIpcResponse fetchConfigIpcResponse) {
                    if (fetchConfigIpcResponse.getStatusCode() == 6502 || fetchConfigIpcResponse.getStatusCode() == 6507) {
                        AbstractC0059zzc.this.zzc((AbstractC0059zzc) new zzd(zzc.zzhl(fetchConfigIpcResponse.getStatusCode()), zzc.zza(fetchConfigIpcResponse), fetchConfigIpcResponse.getThrottleEndTimeMillis()));
                    } else {
                        AbstractC0059zzc.this.zzc((AbstractC0059zzc) new zzd(zzc.zzhl(fetchConfigIpcResponse.getStatusCode()), zzc.zza(fetchConfigIpcResponse)));
                    }
                }
            };
        }
    }

    /* loaded from: classes2.dex */
    public static class zzd implements zztb.zzb {
        private final Map<String, TreeMap<String, byte[]>> Hc;
        private final long Hd;
        private final Status hv;

        public zzd(Status status, Map<String, TreeMap<String, byte[]>> map) {
            this(status, map, -1L);
        }

        public zzd(Status status, Map<String, TreeMap<String, byte[]>> map, long j) {
            this.hv = status;
            this.Hc = map;
            this.Hd = j;
        }

        @Override // com.google.android.gms.internal.zztb.zzb, com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }

        @Override // com.google.android.gms.internal.zztb.zzb
        public long getThrottleEndTimeMillis() {
            return this.Hd;
        }

        @Override // com.google.android.gms.internal.zztb.zzb
        public byte[] zza(String str, byte[] bArr, String str2) {
            return zzah(str, str2) ? this.Hc.get(str2).get(str) : bArr;
        }

        public boolean zzah(String str, String str2) {
            if (this.Hc == null || this.Hc.get(str2) == null) {
                return false;
            }
            return this.Hc.get(str2).get(str) != null;
        }

        @Override // com.google.android.gms.internal.zztb.zzb
        public Map<String, Set<String>> zzazj() {
            HashMap hashMap = new HashMap();
            if (this.Hc != null) {
                for (String str : this.Hc.keySet()) {
                    TreeMap<String, byte[]> treeMap = this.Hc.get(str);
                    if (treeMap != null) {
                        hashMap.put(str, treeMap.keySet());
                    }
                }
            }
            return hashMap;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static HashMap<String, TreeMap<String, byte[]>> zza(FetchConfigIpcResponse fetchConfigIpcResponse) {
        DataHolder zzazr;
        if (fetchConfigIpcResponse == null || (zzazr = fetchConfigIpcResponse.zzazr()) == null) {
            return null;
        }
        PackageConfigTable packageConfigTable = (PackageConfigTable) new com.google.android.gms.common.data.zzd(zzazr, PackageConfigTable.CREATOR).get(0);
        fetchConfigIpcResponse.zzazs();
        HashMap<String, TreeMap<String, byte[]>> hashMap = new HashMap<>();
        for (String str : packageConfigTable.zzazt().keySet()) {
            TreeMap<String, byte[]> treeMap = new TreeMap<>();
            hashMap.put(str, treeMap);
            Bundle bundle = packageConfigTable.zzazt().getBundle(str);
            for (String str2 : bundle.keySet()) {
                treeMap.put(str2, bundle.getByteArray(str2));
            }
        }
        return hashMap;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Status zzhl(int i) {
        return new Status(i, zztc.getStatusCodeString(i));
    }

    @Override // com.google.android.gms.internal.zztb
    public PendingResult<zztb.zzb> zza(GoogleApiClient googleApiClient, final zztb.zza zzaVar) {
        if (googleApiClient == null || zzaVar == null) {
            return null;
        }
        return googleApiClient.zza((GoogleApiClient) new AbstractC0059zzc(googleApiClient) { // from class: com.google.android.gms.config.internal.zzc.1
            @Override // com.google.android.gms.config.internal.zzc.zzb
            protected void zza(Context context, zzj zzjVar) throws RemoteException {
                String str;
                String str2;
                DataHolder.zza zzaum = com.google.android.gms.common.data.zzd.zzaum();
                for (Map.Entry<String, String> entry : zzaVar.zzazg().entrySet()) {
                    com.google.android.gms.common.data.zzd.zza(zzaum, new CustomVariable(entry.getKey(), entry.getValue()));
                }
                DataHolder zzgc = zzaum.zzgc(0);
                String zzatt = zzrk.zzby(context) == Status.xZ ? zzrk.zzatt() : null;
                try {
                    str = com.google.firebase.iid.zzc.C().getId();
                    try {
                        str2 = com.google.firebase.iid.zzc.C().getToken();
                    } catch (IllegalStateException e) {
                        e = e;
                        if (Log.isLoggable("ConfigApiImpl", 3)) {
                            Log.d("ConfigApiImpl", "Cannot retrieve instanceId or instanceIdToken.", e);
                        }
                        str2 = null;
                        zzjVar.zza(this.Ha, new FetchConfigIpcRequest(context.getPackageName(), zzaVar.zzazf(), zzgc, zzatt, str, str2, null, zzaVar.zzazh(), com.google.android.gms.config.internal.zzb.zzcq(context)));
                        zzgc.close();
                    }
                } catch (IllegalStateException e2) {
                    e = e2;
                    str = null;
                }
                zzjVar.zza(this.Ha, new FetchConfigIpcRequest(context.getPackageName(), zzaVar.zzazf(), zzgc, zzatt, str, str2, null, zzaVar.zzazh(), com.google.android.gms.config.internal.zzb.zzcq(context)));
                zzgc.close();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzag */
            public zztb.zzb zzc(Status status) {
                return new zzd(status, new HashMap());
            }
        });
    }
}
