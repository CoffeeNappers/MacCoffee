package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.SparseArray;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.safetynet.AttestationData;
import com.google.android.gms.safetynet.HarmfulAppsData;
import com.google.android.gms.safetynet.RecaptchaResultData;
import com.google.android.gms.safetynet.SafeBrowsingData;
import com.google.android.gms.safetynet.SafeBrowsingThreat;
import com.google.android.gms.safetynet.SafetyNetApi;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class zzxc implements SafetyNetApi {
    private static final String TAG = zzxc.class.getSimpleName();
    protected static SparseArray<zzxh> aCk;
    protected static long aCl;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza implements SafetyNetApi.AttestationResult {
        private final AttestationData aCt;
        private final Status hv;

        public zza(Status status, AttestationData attestationData) {
            this.hv = status;
            this.aCt = attestationData;
        }

        @Override // com.google.android.gms.safetynet.SafetyNetApi.AttestationResult
        public String getJwsResult() {
            if (this.aCt == null) {
                return null;
            }
            return this.aCt.getJwsResult();
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static abstract class zzb extends zzwz<SafetyNetApi.AttestationResult> {
        protected zzxa aCu;

        public zzb(GoogleApiClient googleApiClient) {
            super(googleApiClient);
            this.aCu = new zzwy() { // from class: com.google.android.gms.internal.zzxc.zzb.1
                @Override // com.google.android.gms.internal.zzwy, com.google.android.gms.internal.zzxa
                public void zza(Status status, AttestationData attestationData) {
                    zzb.this.zzc((zzb) new zza(status, attestationData));
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzec */
        public SafetyNetApi.AttestationResult zzc(Status status) {
            return new zza(status, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static abstract class zzc extends zzwz<SafetyNetApi.zzc> {
        protected zzxa aCu;

        public zzc(GoogleApiClient googleApiClient) {
            super(googleApiClient);
            this.aCu = new zzwy() { // from class: com.google.android.gms.internal.zzxc.zzc.1
                @Override // com.google.android.gms.internal.zzwy, com.google.android.gms.internal.zzxa
                public void zzb(Status status, boolean z) {
                    zzc.this.zzc((zzc) new zzj(status, z));
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzed */
        public SafetyNetApi.zzc zzc(Status status) {
            return new zzj(status, false);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static abstract class zzd extends zzwz<SafetyNetApi.zza> {
        protected final zzxa aCu;

        public zzd(GoogleApiClient googleApiClient) {
            super(googleApiClient);
            this.aCu = new zzwy() { // from class: com.google.android.gms.internal.zzxc.zzd.1
                @Override // com.google.android.gms.internal.zzwy, com.google.android.gms.internal.zzxa
                public void zza(Status status, List<HarmfulAppsData> list) {
                    zzd.this.zzc((zzd) new zzg(status, list));
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzee */
        public SafetyNetApi.zza zzc(Status status) {
            return new zzg(status, new ArrayList());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static abstract class zze extends zzwz<SafetyNetApi.zzb> {
        protected zzxa aCu;

        public zze(GoogleApiClient googleApiClient) {
            super(googleApiClient);
            this.aCu = new zzwy() { // from class: com.google.android.gms.internal.zzxc.zze.1
                @Override // com.google.android.gms.internal.zzwy, com.google.android.gms.internal.zzxa
                public void zza(Status status, RecaptchaResultData recaptchaResultData) {
                    zze.this.zzc((zze) new zzh(status, recaptchaResultData));
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzef */
        public SafetyNetApi.zzb zzc(Status status) {
            return new zzh(status, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static abstract class zzf extends zzwz<SafetyNetApi.SafeBrowsingResult> {
        protected zzxa aCu;

        public zzf(GoogleApiClient googleApiClient) {
            super(googleApiClient);
            this.aCu = new zzwy() { // from class: com.google.android.gms.internal.zzxc.zzf.1
                @Override // com.google.android.gms.internal.zzwy, com.google.android.gms.internal.zzxa
                public void zza(Status status, SafeBrowsingData safeBrowsingData) {
                    DataHolder blacklistsDataHolder = safeBrowsingData.getBlacklistsDataHolder();
                    if (blacklistsDataHolder != null) {
                        try {
                            int count = blacklistsDataHolder.getCount();
                            if (count != 0) {
                                if (zzxc.aCk != null) {
                                    zzxc.aCk.clear();
                                }
                                zzxc.aCk = new SparseArray<>();
                                for (int i = 0; i < count; i++) {
                                    zzxh zzxhVar = new zzxh(blacklistsDataHolder, i);
                                    zzxc.aCk.put(zzxhVar.getThreatType(), zzxhVar);
                                }
                                zzxc.aCl = SystemClock.elapsedRealtime();
                            }
                        } finally {
                            if (!blacklistsDataHolder.isClosed()) {
                                blacklistsDataHolder.close();
                            }
                        }
                    }
                    zzf.this.zzc((zzf) new zzi(status, safeBrowsingData));
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzeg */
        public SafetyNetApi.SafeBrowsingResult zzc(Status status) {
            return new zzi(status, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzg implements SafetyNetApi.zza {
        private final List<HarmfulAppsData> aCA;
        private final Status hv;

        public zzg(Status status, List<HarmfulAppsData> list) {
            this.hv = status;
            this.aCA = list;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzh implements SafetyNetApi.zzb {
        private final RecaptchaResultData aCB;
        private final Status hv;

        public zzh(Status status, RecaptchaResultData recaptchaResultData) {
            this.hv = status;
            this.aCB = recaptchaResultData;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzi implements SafetyNetApi.SafeBrowsingResult {
        private final SafeBrowsingData aCC;
        private String aCg;
        private Status hv;

        public zzi(Status status, SafeBrowsingData safeBrowsingData) {
            this.hv = status;
            this.aCC = safeBrowsingData;
            this.aCg = null;
            if (this.aCC != null) {
                this.aCg = this.aCC.getMetadata();
            } else if (!this.hv.isSuccess()) {
            } else {
                this.hv = new Status(8);
            }
        }

        @Override // com.google.android.gms.safetynet.SafetyNetApi.SafeBrowsingResult
        public List<SafeBrowsingThreat> getDetectedThreats() {
            ArrayList arrayList = new ArrayList();
            if (this.aCg == null) {
                return arrayList;
            }
            try {
                JSONArray jSONArray = new JSONObject(this.aCg).getJSONArray("matches");
                for (int i = 0; i < jSONArray.length(); i++) {
                    try {
                        arrayList.add(new SafeBrowsingThreat(Integer.parseInt(jSONArray.getJSONObject(i).getString("threat_type"))));
                    } catch (NumberFormatException e) {
                    } catch (JSONException e2) {
                    }
                }
                return arrayList;
            } catch (JSONException e3) {
                return arrayList;
            }
        }

        @Override // com.google.android.gms.safetynet.SafetyNetApi.SafeBrowsingResult
        public String getMetadata() {
            return this.aCg;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzj implements SafetyNetApi.zzc {
        private final Status hv;
        private final boolean zzcxo;

        public zzj(Status status, boolean z) {
            this.hv = status;
            this.zzcxo = z;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.hv;
        }
    }

    @Override // com.google.android.gms.safetynet.SafetyNetApi
    public PendingResult<SafetyNetApi.AttestationResult> attest(GoogleApiClient googleApiClient, final byte[] bArr) {
        return googleApiClient.zza((GoogleApiClient) new zzb(googleApiClient) { // from class: com.google.android.gms.internal.zzxc.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzxd zzxdVar) throws RemoteException {
                zzxdVar.zza(this.aCu, bArr);
            }
        });
    }

    @Override // com.google.android.gms.safetynet.SafetyNetApi
    public PendingResult<SafetyNetApi.zzc> enableVerifyApps(GoogleApiClient googleApiClient) {
        return googleApiClient.zza((GoogleApiClient) new zzc(googleApiClient) { // from class: com.google.android.gms.internal.zzxc.4
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzxd zzxdVar) throws RemoteException {
                zzxdVar.zzb(this.aCu);
            }
        });
    }

    @Override // com.google.android.gms.safetynet.SafetyNetApi
    public boolean isVerifyAppsEnabled(Context context) {
        return new zzxj(context).zzccx();
    }

    @Override // com.google.android.gms.safetynet.SafetyNetApi
    public PendingResult<SafetyNetApi.zza> listHarmfulApps(GoogleApiClient googleApiClient) {
        return googleApiClient.zza((GoogleApiClient) new zzd(googleApiClient) { // from class: com.google.android.gms.internal.zzxc.5
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzxd zzxdVar) throws RemoteException {
                zzxdVar.zzc(this.aCu);
            }
        });
    }

    @Override // com.google.android.gms.safetynet.SafetyNetApi
    public PendingResult<SafetyNetApi.SafeBrowsingResult> lookupUri(GoogleApiClient googleApiClient, final String str, final int... iArr) {
        if (iArr.length == 0) {
            throw new IllegalArgumentException("Null threatTypes in lookupUri");
        }
        if (!TextUtils.isEmpty(str)) {
            return googleApiClient.zza((GoogleApiClient) new zzf(googleApiClient) { // from class: com.google.android.gms.internal.zzxc.3
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // com.google.android.gms.internal.zzqo.zza
                public void zza(zzxd zzxdVar) throws RemoteException {
                    ArrayList arrayList = new ArrayList();
                    for (int i : iArr) {
                        arrayList.add(Integer.valueOf(i));
                    }
                    zzxdVar.zza(this.aCu, arrayList, 1, str, null);
                }
            });
        }
        throw new IllegalArgumentException("Null or empty uri in lookupUri");
    }

    @Override // com.google.android.gms.safetynet.SafetyNetApi
    public PendingResult<SafetyNetApi.SafeBrowsingResult> lookupUri(GoogleApiClient googleApiClient, List<Integer> list, String str) {
        return zza(googleApiClient, list, str, null);
    }

    @Override // com.google.android.gms.safetynet.SafetyNetApi
    public boolean lookupUriInLocalBlacklist(String str, int... iArr) {
        if (iArr == null) {
            throw new IllegalArgumentException("Null threatTypes in lookupUri");
        }
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("Null or empty uri in lookupUri");
        }
        if (aCk == null || aCl == 0 || SystemClock.elapsedRealtime() - aCl >= 1200000) {
            return true;
        }
        if (aCk == null || aCk.size() == 0) {
            return true;
        }
        List<zzxf> zzccs = new zzxi(str).zzccs();
        if (zzccs == null || zzccs.isEmpty()) {
            return true;
        }
        for (zzxf zzxfVar : zzccs) {
            for (int i : iArr) {
                zzxh zzxhVar = aCk.get(i);
                if (zzxhVar != null && !zzxhVar.zzah(zzxfVar.zzzr(4).getBytes())) {
                }
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.gms.safetynet.SafetyNetApi
    public PendingResult<SafetyNetApi.zzb> verifyWithRecaptcha(GoogleApiClient googleApiClient, final String str) {
        return googleApiClient.zza((GoogleApiClient) new zze(googleApiClient) { // from class: com.google.android.gms.internal.zzxc.6
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzxd zzxdVar) throws RemoteException {
                zzxdVar.zza(this.aCu, str);
            }
        });
    }

    public PendingResult<SafetyNetApi.SafeBrowsingResult> zza(GoogleApiClient googleApiClient, final List<Integer> list, final String str, final String str2) {
        if (list == null) {
            throw new IllegalArgumentException("Null threatTypes in lookupUri");
        }
        if (!TextUtils.isEmpty(str)) {
            return googleApiClient.zza((GoogleApiClient) new zzf(googleApiClient) { // from class: com.google.android.gms.internal.zzxc.2
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // com.google.android.gms.internal.zzqo.zza
                public void zza(zzxd zzxdVar) throws RemoteException {
                    zzxdVar.zza(this.aCu, list, 2, str, str2);
                }
            });
        }
        throw new IllegalArgumentException("Null or empty uri in lookupUri");
    }
}
