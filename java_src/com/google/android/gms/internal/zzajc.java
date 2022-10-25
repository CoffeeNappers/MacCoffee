package com.google.android.gms.internal;

import com.facebook.appevents.AppEventsConstants;
import java.io.EOFException;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzajc {
    private static long bbW = 0;
    private final ScheduledExecutorService aZE;
    private final zzalw aZR;
    private zzb bbX;
    private boolean bbY = false;
    private boolean bbZ = false;
    private long bca = 0;
    private zzaje bcb;
    private zza bcc;
    private ScheduledFuture<?> bcd;
    private ScheduledFuture<?> bce;
    private final zzaiu bcf;

    /* loaded from: classes2.dex */
    public interface zza {
        void zzbs(Map<String, Object> map);

        void zzcw(boolean z);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public interface zzb {
        void close();

        void connect();

        void zzsp(String str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzc implements zzb, zzamw {
        private zzamv bch;

        private zzc(zzamv zzamvVar) {
            this.bch = zzamvVar;
            this.bch.zza(this);
        }

        private void shutdown() {
            this.bch.close();
            try {
                this.bch.m();
            } catch (InterruptedException e) {
                zzajc.this.aZR.zzd("Interrupted while shutting down websocket threads", e);
            }
        }

        @Override // com.google.android.gms.internal.zzajc.zzb
        public void close() {
            this.bch.close();
        }

        @Override // com.google.android.gms.internal.zzajc.zzb
        public void connect() {
            try {
                this.bch.connect();
            } catch (zzamx e) {
                if (zzajc.this.aZR.zzcyu()) {
                    zzajc.this.aZR.zza("Error connecting", e, new Object[0]);
                }
                shutdown();
            }
        }

        @Override // com.google.android.gms.internal.zzamw
        public void onClose() {
            zzajc.this.aZE.execute(new Runnable() { // from class: com.google.android.gms.internal.zzajc.zzc.3
                @Override // java.lang.Runnable
                public void run() {
                    if (zzajc.this.aZR.zzcyu()) {
                        zzajc.this.aZR.zzi("closed", new Object[0]);
                    }
                    zzajc.this.zzctr();
                }
            });
        }

        @Override // com.google.android.gms.internal.zzamw
        public void zza(final zzamx zzamxVar) {
            zzajc.this.aZE.execute(new Runnable() { // from class: com.google.android.gms.internal.zzajc.zzc.4
                @Override // java.lang.Runnable
                public void run() {
                    if (zzamxVar.getCause() == null || !(zzamxVar.getCause() instanceof EOFException)) {
                        zzajc.this.aZR.zza("WebSocket error.", zzamxVar, new Object[0]);
                    } else {
                        zzajc.this.aZR.zzi("WebSocket reached EOF.", new Object[0]);
                    }
                    zzajc.this.zzctr();
                }
            });
        }

        @Override // com.google.android.gms.internal.zzamw
        public void zza(zzamz zzamzVar) {
            final String text = zzamzVar.getText();
            if (zzajc.this.aZR.zzcyu()) {
                zzalw zzalwVar = zzajc.this.aZR;
                String valueOf = String.valueOf(text);
                zzalwVar.zzi(valueOf.length() != 0 ? "ws message: ".concat(valueOf) : new String("ws message: "), new Object[0]);
            }
            zzajc.this.aZE.execute(new Runnable() { // from class: com.google.android.gms.internal.zzajc.zzc.2
                @Override // java.lang.Runnable
                public void run() {
                    zzajc.this.zzso(text);
                }
            });
        }

        @Override // com.google.android.gms.internal.zzamw
        public void zzctt() {
            zzajc.this.aZE.execute(new Runnable() { // from class: com.google.android.gms.internal.zzajc.zzc.1
                @Override // java.lang.Runnable
                public void run() {
                    zzajc.this.bce.cancel(false);
                    zzajc.this.bbY = true;
                    if (zzajc.this.aZR.zzcyu()) {
                        zzajc.this.aZR.zzi("websocket opened", new Object[0]);
                    }
                    zzajc.this.zzctp();
                }
            });
        }

        @Override // com.google.android.gms.internal.zzajc.zzb
        public void zzsp(String str) {
            this.bch.zzsp(str);
        }
    }

    public zzajc(zzaiu zzaiuVar, zzaiw zzaiwVar, String str, zza zzaVar, String str2) {
        this.bcf = zzaiuVar;
        this.aZE = zzaiuVar.zzcsj();
        this.bcc = zzaVar;
        long j = bbW;
        bbW = 1 + j;
        this.aZR = new zzalw(zzaiuVar.zzcsh(), "WebSocket", new StringBuilder(23).append("ws_").append(j).toString());
        this.bbX = zza(zzaiwVar, str, str2);
    }

    private boolean isBuffering() {
        return this.bcb != null;
    }

    private void shutdown() {
        this.bbZ = true;
        this.bcc.zzcw(this.bbY);
    }

    private zzb zza(zzaiw zzaiwVar, String str, String str2) {
        if (str == null) {
            str = zzaiwVar.getHost();
        }
        URI zza2 = zzaiw.zza(str, zzaiwVar.isSecure(), zzaiwVar.getNamespace(), str2);
        HashMap hashMap = new HashMap();
        hashMap.put("User-Agent", this.bcf.zzux());
        return new zzc(new zzamv(zza2, null, hashMap));
    }

    private static String[] zzae(String str, int i) {
        int i2 = 0;
        if (str.length() <= i) {
            return new String[]{str};
        }
        ArrayList arrayList = new ArrayList();
        while (i2 < str.length()) {
            arrayList.add(str.substring(i2, Math.min(i2 + i, str.length())));
            i2 += i;
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    private void zzaft(int i) {
        this.bca = i;
        this.bcb = new zzaje();
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(new StringBuilder(41).append("HandleNewFrameCount: ").append(this.bca).toString(), new Object[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzctp() {
        if (!this.bbZ) {
            if (this.bcd != null) {
                this.bcd.cancel(false);
                if (this.aZR.zzcyu()) {
                    this.aZR.zzi(new StringBuilder(48).append("Reset keepAlive. Remaining: ").append(this.bcd.getDelay(TimeUnit.MILLISECONDS)).toString(), new Object[0]);
                }
            } else if (this.aZR.zzcyu()) {
                this.aZR.zzi("Reset keepAlive", new Object[0]);
            }
            this.bcd = this.aZE.schedule(zzctq(), 45000L, TimeUnit.MILLISECONDS);
        }
    }

    private Runnable zzctq() {
        return new Runnable() { // from class: com.google.android.gms.internal.zzajc.2
            @Override // java.lang.Runnable
            public void run() {
                if (zzajc.this.bbX != null) {
                    zzajc.this.bbX.zzsp(AppEventsConstants.EVENT_PARAM_VALUE_NO);
                    zzajc.this.zzctp();
                }
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzctr() {
        if (!this.bbZ) {
            if (this.aZR.zzcyu()) {
                this.aZR.zzi("closing itself", new Object[0]);
            }
            shutdown();
        }
        this.bbX = null;
        if (this.bcd != null) {
            this.bcd.cancel(false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzcts() {
        if (this.bbY || this.bbZ) {
            return;
        }
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("timed out on connect", new Object[0]);
        }
        this.bbX.close();
    }

    private void zzsm(String str) {
        this.bcb.zzsq(str);
        this.bca--;
        if (this.bca == 0) {
            try {
                this.bcb.zzctz();
                Map<String, Object> zztb = zzane.zztb(this.bcb.toString());
                this.bcb = null;
                if (this.aZR.zzcyu()) {
                    zzalw zzalwVar = this.aZR;
                    String valueOf = String.valueOf(zztb);
                    zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 36).append("handleIncomingFrame complete frame: ").append(valueOf).toString(), new Object[0]);
                }
                this.bcc.zzbs(zztb);
            } catch (IOException e) {
                zzalw zzalwVar2 = this.aZR;
                String valueOf2 = String.valueOf(this.bcb.toString());
                zzalwVar2.zzd(valueOf2.length() != 0 ? "Error parsing frame: ".concat(valueOf2) : new String("Error parsing frame: "), e);
                close();
                shutdown();
            } catch (ClassCastException e2) {
                zzalw zzalwVar3 = this.aZR;
                String valueOf3 = String.valueOf(this.bcb.toString());
                zzalwVar3.zzd(valueOf3.length() != 0 ? "Error parsing frame (cast error): ".concat(valueOf3) : new String("Error parsing frame (cast error): "), e2);
                close();
                shutdown();
            }
        }
    }

    private String zzsn(String str) {
        if (str.length() <= 6) {
            try {
                int parseInt = Integer.parseInt(str);
                if (parseInt > 0) {
                    zzaft(parseInt);
                }
                return null;
            } catch (NumberFormatException e) {
            }
        }
        zzaft(1);
        return str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzso(String str) {
        if (!this.bbZ) {
            zzctp();
            if (isBuffering()) {
                zzsm(str);
                return;
            }
            String zzsn = zzsn(str);
            if (zzsn == null) {
                return;
            }
            zzsm(zzsn);
        }
    }

    public void close() {
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("websocket is being closed", new Object[0]);
        }
        this.bbZ = true;
        this.bbX.close();
        if (this.bce != null) {
            this.bce.cancel(true);
        }
        if (this.bcd != null) {
            this.bcd.cancel(true);
        }
    }

    public void open() {
        this.bbX.connect();
        this.bce = this.aZE.schedule(new Runnable() { // from class: com.google.android.gms.internal.zzajc.1
            @Override // java.lang.Runnable
            public void run() {
                zzajc.this.zzcts();
            }
        }, 30000L, TimeUnit.MILLISECONDS);
    }

    public void send(Map<String, Object> map) {
        zzctp();
        try {
            String[] zzae = zzae(zzane.zzce(map), 16384);
            if (zzae.length > 1) {
                this.bbX.zzsp(new StringBuilder(11).append(zzae.length).toString());
            }
            for (String str : zzae) {
                this.bbX.zzsp(str);
            }
        } catch (IOException e) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(map.toString());
            zzalwVar.zzd(valueOf.length() != 0 ? "Failed to serialize message: ".concat(valueOf) : new String("Failed to serialize message: "), e);
            shutdown();
        }
    }

    public void start() {
    }
}
