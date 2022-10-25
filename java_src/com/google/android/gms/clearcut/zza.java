package com.google.android.gms.clearcut;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Looper;
import android.util.Log;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.PendingResults;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.util.zze;
import com.google.android.gms.common.util.zzh;
import com.google.android.gms.internal.zzasf;
import com.google.android.gms.internal.zzqc;
import com.google.android.gms.internal.zzqd;
import com.google.android.gms.internal.zzqh;
import com.google.android.gms.playlog.internal.PlayLoggerContext;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TimeZone;
/* loaded from: classes.dex */
public final class zza {
    private final int wc;
    private String wd;
    private int we;
    private String wf;
    private String wg;
    private final boolean wh;
    private int wi;
    private final com.google.android.gms.clearcut.zzb wj;
    private zzd wk;
    private final zzb wl;
    private final zze zzaql;
    private final String zzcjc;
    public static final Api.zzf<zzqd> hg = new Api.zzf<>();
    public static final Api.zza<zzqd, Api.ApiOptions.NoOptions> hh = new Api.zza<zzqd, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.clearcut.zza.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zze */
        public zzqd zza(Context context, Looper looper, zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzqd(context, looper, zzfVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    @Deprecated
    public static final Api<Api.ApiOptions.NoOptions> API = new Api<>("ClearcutLogger.API", hh, hg);

    /* renamed from: com.google.android.gms.clearcut.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    public class C0046zza {
        private String wd;
        private int we;
        private String wf;
        private String wg;
        private int wi;
        private final zzc wm;
        private ArrayList<Integer> wn;
        private ArrayList<String> wo;
        private ArrayList<Integer> wp;
        private ArrayList<byte[]> wq;
        private boolean wr;
        private final zzasf.zzc ws;
        private boolean wt;

        private C0046zza(zza zzaVar, byte[] bArr) {
            this(bArr, (zzc) null);
        }

        private C0046zza(byte[] bArr, zzc zzcVar) {
            this.we = zza.this.we;
            this.wd = zza.this.wd;
            this.wf = zza.this.wf;
            this.wg = zza.this.wg;
            this.wi = zza.zze(zza.this);
            this.wn = null;
            this.wo = null;
            this.wp = null;
            this.wq = null;
            this.wr = true;
            this.ws = new zzasf.zzc();
            this.wt = false;
            this.wf = zza.this.wf;
            this.wg = zza.this.wg;
            this.ws.buh = zza.this.zzaql.currentTimeMillis();
            this.ws.bui = zza.this.zzaql.elapsedRealtime();
            this.ws.bus = zza.this.wk.zzag(this.ws.buh);
            if (bArr != null) {
                this.ws.buo = bArr;
            }
            this.wm = zzcVar;
        }

        public LogEventParcelable zzaqg() {
            return new LogEventParcelable(new PlayLoggerContext(zza.this.zzcjc, zza.this.wc, this.we, this.wd, this.wf, this.wg, zza.this.wh, this.wi), this.ws, this.wm, null, zza.zzb((ArrayList<Integer>) null), zza.zzc((ArrayList<String>) null), zza.zzb((ArrayList<Integer>) null), zza.zzd((ArrayList<byte[]>) null), this.wr);
        }

        @Deprecated
        public PendingResult<Status> zzaqh() {
            if (this.wt) {
                throw new IllegalStateException("do not reuse LogEventBuilder");
            }
            this.wt = true;
            LogEventParcelable zzaqg = zzaqg();
            PlayLoggerContext playLoggerContext = zzaqg.wv;
            return zza.this.wl.zzh(playLoggerContext.aAG, playLoggerContext.aAC) ? zza.this.wj.zza(zzaqg) : PendingResults.immediatePendingResult(Status.xZ);
        }

        @Deprecated
        public PendingResult<Status> zze(GoogleApiClient googleApiClient) {
            return zzaqh();
        }

        public C0046zza zzfl(int i) {
            this.ws.buk = i;
            return this;
        }

        public C0046zza zzfm(int i) {
            this.ws.zzajo = i;
            return this;
        }
    }

    /* loaded from: classes2.dex */
    public interface zzb {
        boolean zzh(String str, int i);
    }

    /* loaded from: classes2.dex */
    public interface zzc {
        byte[] zzaqi();
    }

    /* loaded from: classes2.dex */
    public static class zzd {
        public long zzag(long j) {
            return TimeZone.getDefault().getOffset(j) / 1000;
        }
    }

    public zza(Context context, int i, String str, String str2, String str3, boolean z, com.google.android.gms.clearcut.zzb zzbVar, zze zzeVar, zzd zzdVar, zzb zzbVar2) {
        boolean z2 = false;
        this.we = -1;
        this.wi = 0;
        this.zzcjc = context.getPackageName();
        this.wc = zzbh(context);
        this.we = i;
        this.wd = str;
        this.wf = str2;
        this.wg = str3;
        this.wh = z;
        this.wj = zzbVar;
        this.zzaql = zzeVar;
        this.wk = zzdVar == null ? new zzd() : zzdVar;
        this.wi = 0;
        this.wl = zzbVar2;
        if (this.wh) {
            zzaa.zzb(this.wf == null ? true : z2, "can't be anonymous with an upload account");
        }
    }

    public zza(Context context, String str, String str2) {
        this(context, -1, str, str2, null, false, zzqc.zzbi(context), zzh.zzayl(), null, new zzqh(context));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int[] zzb(ArrayList<Integer> arrayList) {
        if (arrayList == null) {
            return null;
        }
        int[] iArr = new int[arrayList.size()];
        int i = 0;
        Iterator<Integer> it = arrayList.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return iArr;
            }
            i = i2 + 1;
            iArr[i2] = it.next().intValue();
        }
    }

    private int zzbh(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            Log.wtf("ClearcutLogger", "This can't happen.");
            return 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String[] zzc(ArrayList<String> arrayList) {
        if (arrayList == null) {
            return null;
        }
        return (String[]) arrayList.toArray(new String[0]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[][] zzd(ArrayList<byte[]> arrayList) {
        if (arrayList == null) {
            return null;
        }
        return (byte[][]) arrayList.toArray(new byte[0]);
    }

    static /* synthetic */ int zze(zza zzaVar) {
        return 0;
    }

    public C0046zza zzm(byte[] bArr) {
        return new C0046zza(bArr);
    }
}
