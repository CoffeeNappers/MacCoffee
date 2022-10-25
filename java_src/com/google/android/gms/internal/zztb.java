package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.config.internal.AnalyticsUserProperty;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public interface zztb {

    /* loaded from: classes2.dex */
    public static class zza {
        private final long GS;
        private final Map<String, String> GT;
        private final int GU;
        private final List<AnalyticsUserProperty> GV;

        /* renamed from: com.google.android.gms.internal.zztb$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        public static class C0133zza {
            private long GS = 43200;
            private Map<String, String> GT;
            private int GU;

            static /* synthetic */ List zzd(C0133zza c0133zza) {
                return null;
            }

            public C0133zza zzag(String str, String str2) {
                if (this.GT == null) {
                    this.GT = new HashMap();
                }
                this.GT.put(str, str2);
                return this;
            }

            public C0133zza zzaj(long j) {
                this.GS = j;
                return this;
            }

            public zza zzazi() {
                return new zza(this);
            }

            public C0133zza zzhj(int i) {
                this.GU = i;
                return this;
            }
        }

        private zza(C0133zza c0133zza) {
            this.GS = c0133zza.GS;
            this.GT = c0133zza.GT;
            this.GU = c0133zza.GU;
            this.GV = C0133zza.zzd(c0133zza);
        }

        public long zzazf() {
            return this.GS;
        }

        public Map<String, String> zzazg() {
            return this.GT == null ? Collections.emptyMap() : this.GT;
        }

        public int zzazh() {
            return this.GU;
        }
    }

    /* loaded from: classes2.dex */
    public interface zzb extends Result {
        @Override // com.google.android.gms.common.api.Result
        Status getStatus();

        long getThrottleEndTimeMillis();

        byte[] zza(String str, byte[] bArr, String str2);

        Map<String, Set<String>> zzazj();
    }

    PendingResult<zzb> zza(GoogleApiClient googleApiClient, zza zzaVar);
}
