package com.google.android.gms.internal;

import com.google.android.gms.internal.zzajc;
import java.util.HashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzais implements zzajc.zza {
    private static long baE = 0;
    private final zzalw aZR;
    private zzaiw baF;
    private zzajc baG;
    private zza baH;
    private zzc baI;

    /* loaded from: classes2.dex */
    public interface zza {
        void zzb(zzb zzbVar);

        void zzbt(Map<String, Object> map);

        void zzj(long j, String str);

        void zzsg(String str);

        void zzsh(String str);
    }

    /* loaded from: classes2.dex */
    public enum zzb {
        SERVER_RESET,
        OTHER
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum zzc {
        REALTIME_CONNECTING,
        REALTIME_CONNECTED,
        REALTIME_DISCONNECTED
    }

    public zzais(zzaiu zzaiuVar, zzaiw zzaiwVar, String str, zza zzaVar, String str2) {
        long j = baE;
        baE = 1 + j;
        this.baF = zzaiwVar;
        this.baH = zzaVar;
        this.aZR = new zzalw(zzaiuVar.zzcsh(), "Connection", new StringBuilder(25).append("conn_").append(j).toString());
        this.baI = zzc.REALTIME_CONNECTING;
        this.baG = new zzajc(zzaiuVar, zzaiwVar, str, this, str2);
    }

    private void zzb(Map<String, Object> map, boolean z) {
        if (this.baI != zzc.REALTIME_CONNECTED) {
            this.aZR.zzi("Tried to send on an unconnected connection", new Object[0]);
            return;
        }
        if (z) {
            this.aZR.zzi("Sending data (contents hidden)", new Object[0]);
        } else {
            this.aZR.zzi("Sending data: %s", map);
        }
        this.baG.send(map);
    }

    private void zzbt(Map<String, Object> map) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(map.toString());
            zzalwVar.zzi(valueOf.length() != 0 ? "received data message: ".concat(valueOf) : new String("received data message: "), new Object[0]);
        }
        this.baH.zzbt(map);
    }

    private void zzbu(Map<String, Object> map) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(map.toString());
            zzalwVar.zzi(valueOf.length() != 0 ? "Got control message: ".concat(valueOf) : new String("Got control message: "), new Object[0]);
        }
        try {
            String str = (String) map.get("t");
            if (str == null) {
                if (this.aZR.zzcyu()) {
                    zzalw zzalwVar2 = this.aZR;
                    String valueOf2 = String.valueOf(map.toString());
                    zzalwVar2.zzi(valueOf2.length() != 0 ? "Got invalid control message: ".concat(valueOf2) : new String("Got invalid control message: "), new Object[0]);
                }
                close();
            } else if (str.equals("s")) {
                zzse((String) map.get("d"));
            } else if (str.equals("r")) {
                zzsf((String) map.get("d"));
            } else if (str.equals("h")) {
                zzbv((Map) map.get("d"));
            } else if (!this.aZR.zzcyu()) {
            } else {
                zzalw zzalwVar3 = this.aZR;
                String valueOf3 = String.valueOf(str);
                zzalwVar3.zzi(valueOf3.length() != 0 ? "Ignoring unknown control message: ".concat(valueOf3) : new String("Ignoring unknown control message: "), new Object[0]);
            }
        } catch (ClassCastException e) {
            if (this.aZR.zzcyu()) {
                zzalw zzalwVar4 = this.aZR;
                String valueOf4 = String.valueOf(e.toString());
                zzalwVar4.zzi(valueOf4.length() != 0 ? "Failed to parse control message: ".concat(valueOf4) : new String("Failed to parse control message: "), new Object[0]);
            }
            close();
        }
    }

    private void zzbv(Map<String, Object> map) {
        long longValue = ((Long) map.get("ts")).longValue();
        this.baH.zzsg((String) map.get("h"));
        String str = (String) map.get("s");
        if (this.baI == zzc.REALTIME_CONNECTING) {
            this.baG.start();
            zzi(longValue, str);
        }
    }

    private void zzi(long j, String str) {
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("realtime connection established", new Object[0]);
        }
        this.baI = zzc.REALTIME_CONNECTED;
        this.baH.zzj(j, str);
    }

    private void zzse(String str) {
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("Connection shutdown command received. Shutting down...", new Object[0]);
        }
        this.baH.zzsh(str);
        close();
    }

    private void zzsf(String str) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(this.baF.getHost());
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 62 + String.valueOf(str).length()).append("Got a reset; killing connection to ").append(valueOf).append("; Updating internalHost to ").append(str).toString(), new Object[0]);
        }
        this.baH.zzsg(str);
        zza(zzb.SERVER_RESET);
    }

    public void close() {
        zza(zzb.OTHER);
    }

    public void open() {
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("Opening a connection", new Object[0]);
        }
        this.baG.open();
    }

    public void zza(zzb zzbVar) {
        if (this.baI != zzc.REALTIME_DISCONNECTED) {
            if (this.aZR.zzcyu()) {
                this.aZR.zzi("closing realtime connection", new Object[0]);
            }
            this.baI = zzc.REALTIME_DISCONNECTED;
            if (this.baG != null) {
                this.baG.close();
                this.baG = null;
            }
            this.baH.zzb(zzbVar);
        }
    }

    public void zza(Map<String, Object> map, boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("t", "d");
        hashMap.put("d", map);
        zzb(hashMap, z);
    }

    @Override // com.google.android.gms.internal.zzajc.zza
    public void zzbs(Map<String, Object> map) {
        try {
            String str = (String) map.get("t");
            if (str == null) {
                if (this.aZR.zzcyu()) {
                    zzalw zzalwVar = this.aZR;
                    String valueOf = String.valueOf(map.toString());
                    zzalwVar.zzi(valueOf.length() != 0 ? "Failed to parse server message: missing message type:".concat(valueOf) : new String("Failed to parse server message: missing message type:"), new Object[0]);
                }
                close();
            } else if (str.equals("d")) {
                zzbt((Map) map.get("d"));
            } else if (str.equals("c")) {
                zzbu((Map) map.get("d"));
            } else if (!this.aZR.zzcyu()) {
            } else {
                zzalw zzalwVar2 = this.aZR;
                String valueOf2 = String.valueOf(str);
                zzalwVar2.zzi(valueOf2.length() != 0 ? "Ignoring unknown server message type: ".concat(valueOf2) : new String("Ignoring unknown server message type: "), new Object[0]);
            }
        } catch (ClassCastException e) {
            if (this.aZR.zzcyu()) {
                zzalw zzalwVar3 = this.aZR;
                String valueOf3 = String.valueOf(e.toString());
                zzalwVar3.zzi(valueOf3.length() != 0 ? "Failed to parse server message: ".concat(valueOf3) : new String("Failed to parse server message: "), new Object[0]);
            }
            close();
        }
    }

    @Override // com.google.android.gms.internal.zzajc.zza
    public void zzcw(boolean z) {
        this.baG = null;
        if (z || this.baI != zzc.REALTIME_CONNECTING) {
            if (this.aZR.zzcyu()) {
                this.aZR.zzi("Realtime connection lost", new Object[0]);
            }
        } else if (this.aZR.zzcyu()) {
            this.aZR.zzi("Realtime connection failed", new Object[0]);
        }
        close();
    }
}
