package com.google.android.gms.internal;

import com.coremedia.iso.boxes.AuthorBox;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.internal.zzais;
import com.google.android.gms.internal.zzait;
import com.google.android.gms.internal.zzaiy;
import com.google.android.gms.internal.zzajd;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class zzaiz implements zzais.zza, zzaiy {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static long baE;
    private final ScheduledExecutorService aZE;
    private final zzalw aZR;
    private final zzaiw baF;
    private final zzait baQ;
    private final zzaiy.zza baX;
    private String baY;
    private long bbb;
    private zzais bbc;
    private String bbk;
    private boolean bbl;
    private final zzaiu bbm;
    private final zzajd bbn;
    private String bbo;
    private long bbs;
    private boolean bbt;
    private HashSet<String> baZ = new HashSet<>();
    private boolean bba = true;
    private zzb bbd = zzb.Disconnected;
    private long bbe = 0;
    private long bbf = 0;
    private long bbp = 0;
    private int bbq = 0;
    private ScheduledFuture<?> bbr = null;
    private Map<zzc, zze> bbj = new HashMap();
    private Map<Long, zza> bbg = new HashMap();
    private Map<Long, zzf> bbi = new HashMap();
    private List<zzd> bbh = new ArrayList();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public interface zza {
        void zzbz(Map<String, Object> map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum zzb {
        Disconnected,
        GettingToken,
        Connecting,
        Authenticating,
        Connected
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzc {
        private final List<String> bbJ;
        private final Map<String, Object> bbK;

        public zzc(List<String> list, Map<String, Object> map) {
            this.bbJ = list;
            this.bbK = map;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof zzc)) {
                return false;
            }
            zzc zzcVar = (zzc) obj;
            if (!this.bbJ.equals(zzcVar.bbJ)) {
                return false;
            }
            return this.bbK.equals(zzcVar.bbK);
        }

        public int hashCode() {
            return (this.bbJ.hashCode() * 31) + this.bbK.hashCode();
        }

        public String toString() {
            String valueOf = String.valueOf(zzaiv.zzas(this.bbJ));
            String valueOf2 = String.valueOf(this.bbK);
            return new StringBuilder(String.valueOf(valueOf).length() + 11 + String.valueOf(valueOf2).length()).append(valueOf).append(" (params: ").append(valueOf2).append(")").toString();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzd {
        private final List<String> bbJ;
        private final String bbL;
        private final zzajb bbM;
        private final Object data;

        private zzd(String str, List<String> list, Object obj, zzajb zzajbVar) {
            this.bbL = str;
            this.bbJ = list;
            this.data = obj;
            this.bbM = zzajbVar;
        }

        public String getAction() {
            return this.bbL;
        }

        public Object getData() {
            return this.data;
        }

        public List<String> zzcte() {
            return this.bbJ;
        }

        public zzajb zzctf() {
            return this.bbM;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zze {
        private final zzajb bbN;
        private final zzc bbO;
        private final zzaix bbP;
        private final Long bbQ;

        private zze(zzajb zzajbVar, zzc zzcVar, Long l, zzaix zzaixVar) {
            this.bbN = zzajbVar;
            this.bbO = zzcVar;
            this.bbP = zzaixVar;
            this.bbQ = l;
        }

        public String toString() {
            String valueOf = String.valueOf(this.bbO.toString());
            String valueOf2 = String.valueOf(this.bbQ);
            return new StringBuilder(String.valueOf(valueOf).length() + 8 + String.valueOf(valueOf2).length()).append(valueOf).append(" (Tag: ").append(valueOf2).append(")").toString();
        }

        public zzc zzctg() {
            return this.bbO;
        }

        public Long zzcth() {
            return this.bbQ;
        }

        public zzaix zzcti() {
            return this.bbP;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzf {
        private String bbL;
        private zzajb bbM;
        private Map<String, Object> bbR;
        private boolean bbS;

        private zzf(String str, Map<String, Object> map, zzajb zzajbVar) {
            this.bbL = str;
            this.bbR = map;
            this.bbM = zzajbVar;
        }

        public String getAction() {
            return this.bbL;
        }

        public zzajb zzctf() {
            return this.bbM;
        }

        public Map<String, Object> zzctj() {
            return this.bbR;
        }

        public void zzctk() {
            this.bbS = true;
        }

        public boolean zzctl() {
            return this.bbS;
        }
    }

    static {
        $assertionsDisabled = !zzaiz.class.desiredAssertionStatus();
        baE = 0L;
    }

    public zzaiz(zzaiu zzaiuVar, zzaiw zzaiwVar, zzaiy.zza zzaVar) {
        this.baX = zzaVar;
        this.bbm = zzaiuVar;
        this.aZE = zzaiuVar.zzcsj();
        this.baQ = zzaiuVar.zzcsi();
        this.baF = zzaiwVar;
        this.bbn = new zzajd.zza(this.aZE, zzaiuVar.zzcsh(), "ConnectionRetryHelper").zzcg(1000L).zzj(1.3d).zzch(30000L).zzk(0.7d).zzcty();
        long j = baE;
        baE = 1 + j;
        this.aZR = new zzalw(zzaiuVar.zzcsh(), "PersistentConnection", new StringBuilder(23).append("pc_").append(j).toString());
        this.bbo = null;
        zzctc();
    }

    private boolean isIdle() {
        return this.bbj.isEmpty() && this.bbg.isEmpty() && !this.bbt && this.bbi.isEmpty();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zze zza(zzc zzcVar) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(zzcVar);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 15).append("removing query ").append(valueOf).toString(), new Object[0]);
        }
        if (this.bbj.containsKey(zzcVar)) {
            zze zzeVar = this.bbj.get(zzcVar);
            this.bbj.remove(zzcVar);
            zzctc();
            return zzeVar;
        }
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar2 = this.aZR;
            String valueOf2 = String.valueOf(zzcVar);
            zzalwVar2.zzi(new StringBuilder(String.valueOf(valueOf2).length() + 64).append("Trying to remove listener for QuerySpec ").append(valueOf2).append(" but no listener exists.").toString(), new Object[0]);
        }
        return null;
    }

    private Map<String, Object> zza(List<String> list, Object obj, String str) {
        HashMap hashMap = new HashMap();
        hashMap.put(TtmlNode.TAG_P, zzaiv.zzas(list));
        hashMap.put("d", obj);
        if (str != null) {
            hashMap.put("h", str);
        }
        return hashMap;
    }

    private void zza(zze zzeVar) {
        HashMap hashMap = new HashMap();
        hashMap.put(TtmlNode.TAG_P, zzaiv.zzas(zzeVar.bbO.bbJ));
        Long zzcth = zzeVar.zzcth();
        if (zzcth != null) {
            hashMap.put("q", zzeVar.zzctg().bbK);
            hashMap.put("t", zzcth);
        }
        zza("n", hashMap, (zza) null);
    }

    private void zza(String str, List<String> list, Object obj, final zzajb zzajbVar) {
        HashMap hashMap = new HashMap();
        hashMap.put(TtmlNode.TAG_P, zzaiv.zzas(list));
        hashMap.put("d", obj);
        zza(str, hashMap, new zza() { // from class: com.google.android.gms.internal.zzaiz.2
            @Override // com.google.android.gms.internal.zzaiz.zza
            public void zzbz(Map<String, Object> map) {
                String str2 = null;
                String str3 = (String) map.get("s");
                if (!str3.equals("ok")) {
                    str2 = (String) map.get("d");
                } else {
                    str3 = null;
                }
                if (zzajbVar != null) {
                    zzajbVar.zzbn(str3, str2);
                }
            }
        });
    }

    private void zza(String str, List<String> list, Object obj, String str2, zzajb zzajbVar) {
        Map<String, Object> zza2 = zza(list, obj, str2);
        long j = this.bbe;
        this.bbe = 1 + j;
        this.bbi.put(Long.valueOf(j), new zzf(str, zza2, zzajbVar));
        if (zzcsr()) {
            zzcd(j);
        }
        this.bbs = System.currentTimeMillis();
        zzctc();
    }

    private void zza(String str, Map<String, Object> map, zza zzaVar) {
        zza(str, false, map, zzaVar);
    }

    private void zza(String str, boolean z, Map<String, Object> map, zza zzaVar) {
        long zzctb = zzctb();
        HashMap hashMap = new HashMap();
        hashMap.put("r", Long.valueOf(zzctb));
        hashMap.put("a", str);
        hashMap.put("b", map);
        this.bbc.zza(hashMap, z);
        this.bbg.put(Long.valueOf(zzctb), zzaVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(List<String> list, zzc zzcVar) {
        if (list.contains("no_index")) {
            String valueOf = String.valueOf(zzcVar.bbK.get("i"));
            String sb = new StringBuilder(String.valueOf(valueOf).length() + 14).append("\".indexOn\": \"").append(valueOf).append("\"").toString();
            zzalw zzalwVar = this.aZR;
            String valueOf2 = String.valueOf(zzaiv.zzas(zzcVar.bbJ));
            zzalwVar.warn(new StringBuilder(String.valueOf(sb).length() + 118 + String.valueOf(valueOf2).length()).append("Using an unspecified index. Consider adding '").append(sb).append("' at ").append(valueOf2).append(" to your security and Firebase Database rules for better performance").toString());
        }
    }

    private Collection<zze> zzat(List<String> list) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(list);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 29).append("removing all listens at path ").append(valueOf).toString(), new Object[0]);
        }
        ArrayList<zze> arrayList = new ArrayList();
        for (Map.Entry<zzc, zze> entry : this.bbj.entrySet()) {
            zze value = entry.getValue();
            if (entry.getKey().bbJ.equals(list)) {
                arrayList.add(value);
            }
        }
        for (zze zzeVar : arrayList) {
            this.bbj.remove(zzeVar.zzctg());
        }
        zzctc();
        return arrayList;
    }

    private void zzau(List<String> list) {
        Collection<zze> zzat = zzat(list);
        if (zzat != null) {
            for (zze zzeVar : zzat) {
                zzeVar.bbN.zzbn("permission_denied", null);
            }
        }
    }

    private void zzb(final zze zzeVar) {
        Map<String, Object> hashMap = new HashMap<>();
        hashMap.put(TtmlNode.TAG_P, zzaiv.zzas(zzeVar.zzctg().bbJ));
        Object zzcth = zzeVar.zzcth();
        if (zzcth != null) {
            hashMap.put("q", zzeVar.bbO.bbK);
            hashMap.put("t", zzcth);
        }
        zzaix zzcti = zzeVar.zzcti();
        hashMap.put("h", zzcti.zzcsm());
        if (zzcti.zzcsn()) {
            zzair zzcso = zzcti.zzcso();
            ArrayList arrayList = new ArrayList();
            for (List<String> list : zzcso.zzcsf()) {
                arrayList.add(zzaiv.zzas(list));
            }
            HashMap hashMap2 = new HashMap();
            hashMap2.put("hs", zzcso.zzcsg());
            hashMap2.put("ps", arrayList);
            hashMap.put("ch", hashMap2);
        }
        zza("q", hashMap, new zza() { // from class: com.google.android.gms.internal.zzaiz.5
            @Override // com.google.android.gms.internal.zzaiz.zza
            public void zzbz(Map<String, Object> map) {
                String str = (String) map.get("s");
                if (str.equals("ok")) {
                    Map map2 = (Map) map.get("d");
                    if (map2.containsKey("w")) {
                        zzaiz.this.zza((List) map2.get("w"), zzeVar.bbO);
                    }
                }
                if (((zze) zzaiz.this.bbj.get(zzeVar.zzctg())) == zzeVar) {
                    if (str.equals("ok")) {
                        zzeVar.bbN.zzbn(null, null);
                        return;
                    }
                    zzaiz.this.zza(zzeVar.zzctg());
                    zzeVar.bbN.zzbn(str, (String) map.get("d"));
                }
            }
        });
    }

    private void zzbm(String str, String str2) {
        this.aZR.warn(new StringBuilder(String.valueOf(str).length() + 23 + String.valueOf(str2).length()).append("Auth token revoked: ").append(str).append(" (").append(str2).append(")").toString());
        this.bbk = null;
        this.bbl = true;
        this.baX.zzcy(false);
        this.bbc.close();
    }

    private void zzbx(Map<String, Object> map) {
        this.aZR.info((String) map.get("msg"));
    }

    private void zzby(Map<String, Integer> map) {
        if (!map.isEmpty()) {
            HashMap hashMap = new HashMap();
            hashMap.put("c", map);
            zza("s", hashMap, new zza() { // from class: com.google.android.gms.internal.zzaiz.6
                @Override // com.google.android.gms.internal.zzaiz.zza
                public void zzbz(Map<String, Object> map2) {
                    String str = (String) map2.get("s");
                    if (!str.equals("ok")) {
                        String str2 = (String) map2.get("d");
                        if (!zzaiz.this.aZR.zzcyu()) {
                            return;
                        }
                        zzaiz.this.aZR.zzi(new StringBuilder(String.valueOf(str).length() + 34 + String.valueOf(str2).length()).append("Failed to send stats: ").append(str).append(" (message: ").append(str2).append(")").toString(), new Object[0]);
                    }
                }
            });
        } else if (!this.aZR.zzcyu()) {
        } else {
            this.aZR.zzi("Not sending stats because stats are empty", new Object[0]);
        }
    }

    static /* synthetic */ long zzc(zzaiz zzaizVar) {
        long j = zzaizVar.bbp;
        zzaizVar.bbp = 1 + j;
        return j;
    }

    private void zzcc(long j) {
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("handling timestamp", new Object[0]);
        }
        HashMap hashMap = new HashMap();
        hashMap.put("serverTimeOffset", Long.valueOf(j - System.currentTimeMillis()));
        this.baX.zzbw(hashMap);
    }

    private void zzcd(final long j) {
        if ($assertionsDisabled || zzcsr()) {
            final zzf zzfVar = this.bbi.get(Long.valueOf(j));
            final zzajb zzctf = zzfVar.zzctf();
            final String action = zzfVar.getAction();
            zzfVar.zzctk();
            zza(action, zzfVar.zzctj(), new zza() { // from class: com.google.android.gms.internal.zzaiz.4
                @Override // com.google.android.gms.internal.zzaiz.zza
                public void zzbz(Map<String, Object> map) {
                    if (zzaiz.this.aZR.zzcyu()) {
                        zzalw zzalwVar = zzaiz.this.aZR;
                        String str = action;
                        String valueOf = String.valueOf(map);
                        zzalwVar.zzi(new StringBuilder(String.valueOf(str).length() + 11 + String.valueOf(valueOf).length()).append(str).append(" response: ").append(valueOf).toString(), new Object[0]);
                    }
                    if (((zzf) zzaiz.this.bbi.get(Long.valueOf(j))) == zzfVar) {
                        zzaiz.this.bbi.remove(Long.valueOf(j));
                        if (zzctf != null) {
                            String str2 = (String) map.get("s");
                            if (str2.equals("ok")) {
                                zzctf.zzbn(null, null);
                            } else {
                                zzctf.zzbn(str2, (String) map.get("d"));
                            }
                        }
                    } else if (zzaiz.this.aZR.zzcyu()) {
                        zzaiz.this.aZR.zzi(new StringBuilder(81).append("Ignoring on complete for put ").append(j).append(" because it was removed already.").toString(), new Object[0]);
                    }
                    zzaiz.this.zzctc();
                }
            });
            return;
        }
        throw new AssertionError("sendPut called when we can't send writes (we're disconnected or writes are paused).");
    }

    private boolean zzcsq() {
        return this.bbd == zzb.Authenticating || this.bbd == zzb.Connected;
    }

    private boolean zzcsr() {
        return this.bbd == zzb.Connected;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzcst() {
        if (zzcss()) {
            zzaiv.zzc(this.bbd == zzb.Disconnected, "Not in disconnected state: %s", this.bbd);
            final boolean z = this.bbl;
            this.aZR.zzi("Scheduling connection attempt", new Object[0]);
            this.bbl = false;
            this.bbn.zzr(new Runnable() { // from class: com.google.android.gms.internal.zzaiz.1
                @Override // java.lang.Runnable
                public void run() {
                    zzaiz.this.aZR.zzi("Trying to fetch auth token", new Object[0]);
                    zzaiv.zzc(zzaiz.this.bbd == zzb.Disconnected, "Not in disconnected state: %s", zzaiz.this.bbd);
                    zzaiz.this.bbd = zzb.GettingToken;
                    zzaiz.zzc(zzaiz.this);
                    final long j = zzaiz.this.bbp;
                    zzaiz.this.baQ.zza(z, new zzait.zza() { // from class: com.google.android.gms.internal.zzaiz.1.1
                        @Override // com.google.android.gms.internal.zzait.zza
                        public void onError(String str) {
                            if (j != zzaiz.this.bbp) {
                                zzaiz.this.aZR.zzi("Ignoring getToken error, because this was not the latest attempt.", new Object[0]);
                                return;
                            }
                            zzaiz.this.bbd = zzb.Disconnected;
                            zzalw zzalwVar = zzaiz.this.aZR;
                            String valueOf = String.valueOf(str);
                            zzalwVar.zzi(valueOf.length() != 0 ? "Error fetching token: ".concat(valueOf) : new String("Error fetching token: "), new Object[0]);
                            zzaiz.this.zzcst();
                        }

                        @Override // com.google.android.gms.internal.zzait.zza
                        public void zzsi(String str) {
                            if (j != zzaiz.this.bbp) {
                                zzaiz.this.aZR.zzi("Ignoring getToken result, because this was not the latest attempt.", new Object[0]);
                            } else if (zzaiz.this.bbd == zzb.GettingToken) {
                                zzaiz.this.aZR.zzi("Successfully fetched token, opening connection", new Object[0]);
                                zzaiz.this.zzsl(str);
                            } else {
                                zzaiv.zzc(zzaiz.this.bbd == zzb.Disconnected, "Expected connection state disconnected, but was %s", zzaiz.this.bbd);
                                zzaiz.this.aZR.zzi("Not opening connection after token refresh, because connection was set to disconnected", new Object[0]);
                            }
                        }
                    });
                }
            });
        }
    }

    private void zzcsu() {
        Iterator<Map.Entry<Long, zzf>> it = this.bbi.entrySet().iterator();
        while (it.hasNext()) {
            zzf value = it.next().getValue();
            if (value.zzctj().containsKey("h") && value.zzctl()) {
                value.zzctf().zzbn("disconnected", null);
                it.remove();
            }
        }
    }

    private void zzcsv() {
        zzcz(false);
    }

    private void zzcsw() {
        zzcz(true);
    }

    private void zzcsx() {
        zzaiv.zzc(zzcsq(), "Must be connected to send unauth.", new Object[0]);
        zzaiv.zzc(this.bbk == null, "Auth token must not be set.", new Object[0]);
        zza("unauth", Collections.emptyMap(), (zza) null);
    }

    private void zzcsy() {
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("calling restore state", new Object[0]);
        }
        zzaiv.zzc(this.bbd == zzb.Connecting, "Wanted to restore auth, but was in wrong state: %s", this.bbd);
        if (this.bbk == null) {
            if (this.aZR.zzcyu()) {
                this.aZR.zzi("Not restoring auth because token is null.", new Object[0]);
            }
            this.bbd = zzb.Connected;
            zzcsz();
            return;
        }
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("Restoring auth.", new Object[0]);
        }
        this.bbd = zzb.Authenticating;
        zzcsw();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzcsz() {
        zzaiv.zzc(this.bbd == zzb.Connected, "Should be connected if we're restoring state, but we are: %s", this.bbd);
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("Restoring outstanding listens", new Object[0]);
        }
        for (zze zzeVar : this.bbj.values()) {
            if (this.aZR.zzcyu()) {
                zzalw zzalwVar = this.aZR;
                String valueOf = String.valueOf(zzeVar.zzctg());
                zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 17).append("Restoring listen ").append(valueOf).toString(), new Object[0]);
            }
            zzb(zzeVar);
        }
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("Restoring writes.", new Object[0]);
        }
        ArrayList arrayList = new ArrayList(this.bbi.keySet());
        Collections.sort(arrayList);
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            zzcd(((Long) it.next()).longValue());
        }
        for (zzd zzdVar : this.bbh) {
            zza(zzdVar.getAction(), zzdVar.zzcte(), zzdVar.getData(), zzdVar.zzctf());
        }
        this.bbh.clear();
    }

    private void zzcta() {
        HashMap hashMap = new HashMap();
        if (zzanc.x()) {
            if (this.bbm.zzcsk()) {
                hashMap.put("persistence.android.enabled", 1);
            }
            String valueOf = String.valueOf(this.bbm.zzcsl().replace('.', '-'));
            hashMap.put(valueOf.length() != 0 ? "sdk.android.".concat(valueOf) : new String("sdk.android."), 1);
        } else if (!$assertionsDisabled && this.bbm.zzcsk()) {
            throw new AssertionError("Stats for persistence on JVM missing (persistence not yet supported)");
        } else {
            String valueOf2 = String.valueOf(this.bbm.zzcsl().replace('.', '-'));
            hashMap.put(valueOf2.length() != 0 ? "sdk.java.".concat(valueOf2) : new String("sdk.java."), 1);
        }
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("Sending first connection stats", new Object[0]);
        }
        zzby(hashMap);
    }

    private long zzctb() {
        long j = this.bbf;
        this.bbf = 1 + j;
        return j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzctc() {
        boolean z = false;
        if (isIdle()) {
            if (this.bbr != null) {
                this.bbr.cancel(false);
            }
            this.bbr = this.aZE.schedule(new Runnable() { // from class: com.google.android.gms.internal.zzaiz.7
                @Override // java.lang.Runnable
                public void run() {
                    zzaiz.this.bbr = null;
                    if (zzaiz.this.zzctd()) {
                        zzaiz.this.interrupt("connection_idle");
                    } else {
                        zzaiz.this.zzctc();
                    }
                }
            }, 60000L, TimeUnit.MILLISECONDS);
        } else if (!isInterrupted("connection_idle")) {
        } else {
            if (!isIdle()) {
                z = true;
            }
            zzaiv.zzcx(z);
            resume("connection_idle");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean zzctd() {
        return isIdle() && System.currentTimeMillis() > this.bbs + 60000;
    }

    private void zzcz(final boolean z) {
        zzaiv.zzc(zzcsq(), "Must be connected to send auth, but was: %s", this.bbd);
        zzaiv.zzc(this.bbk != null, "Auth token must be set to authenticate!", new Object[0]);
        zza zzaVar = new zza() { // from class: com.google.android.gms.internal.zzaiz.3
            @Override // com.google.android.gms.internal.zzaiz.zza
            public void zzbz(Map<String, Object> map) {
                zzaiz.this.bbd = zzb.Connected;
                String str = (String) map.get("s");
                if (str.equals("ok")) {
                    zzaiz.this.bbq = 0;
                    zzaiz.this.baX.zzcy(true);
                    if (!z) {
                        return;
                    }
                    zzaiz.this.zzcsz();
                    return;
                }
                zzaiz.this.bbk = null;
                zzaiz.this.bbl = true;
                zzaiz.this.baX.zzcy(false);
                String str2 = (String) map.get("d");
                zzaiz.this.aZR.zzi(new StringBuilder(String.valueOf(str).length() + 26 + String.valueOf(str2).length()).append("Authentication failed: ").append(str).append(" (").append(str2).append(")").toString(), new Object[0]);
                zzaiz.this.bbc.close();
                if (!str.equals("invalid_token")) {
                    return;
                }
                zzaiz.zzj(zzaiz.this);
                if (zzaiz.this.bbq < 3) {
                    return;
                }
                zzaiz.this.bbn.zzctx();
                zzaiz.this.aZR.warn("Provided authentication credentials are invalid. This usually indicates your FirebaseApp instance was not initialized correctly. Make sure your google-services.json file has the correct firebase_url and api_key. You can re-download google-services.json from https://console.firebase.google.com/.");
            }
        };
        HashMap hashMap = new HashMap();
        zzand zzta = zzand.zzta(this.bbk);
        if (zzta == null) {
            hashMap.put("cred", this.bbk);
            zza(AuthorBox.TYPE, true, (Map<String, Object>) hashMap, zzaVar);
            return;
        }
        hashMap.put("cred", zzta.getToken());
        if (zzta.y() != null) {
            hashMap.put("authvar", zzta.y());
        }
        zza("gauth", true, (Map<String, Object>) hashMap, zzaVar);
    }

    static /* synthetic */ int zzj(zzaiz zzaizVar) {
        int i = zzaizVar.bbq;
        zzaizVar.bbq = i + 1;
        return i;
    }

    private void zzl(String str, Map<String, Object> map) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(map);
            zzalwVar.zzi(new StringBuilder(String.valueOf(str).length() + 22 + String.valueOf(valueOf).length()).append("handleServerMessage: ").append(str).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf).toString(), new Object[0]);
        }
        if (str.equals("d") || str.equals("m")) {
            boolean equals = str.equals("m");
            String str2 = (String) map.get(TtmlNode.TAG_P);
            Object obj = map.get("d");
            Long zzbq = zzaiv.zzbq(map.get("t"));
            if (!equals || !(obj instanceof Map) || ((Map) obj).size() != 0) {
                this.baX.zza(zzaiv.zzsj(str2), obj, equals, zzbq);
            } else if (this.aZR.zzcyu()) {
                zzalw zzalwVar2 = this.aZR;
                String valueOf2 = String.valueOf(str2);
                zzalwVar2.zzi(valueOf2.length() != 0 ? "ignoring empty merge for path ".concat(valueOf2) : new String("ignoring empty merge for path "), new Object[0]);
            }
        } else if (str.equals("rm")) {
            String str3 = (String) map.get(TtmlNode.TAG_P);
            List<String> zzsj = zzaiv.zzsj(str3);
            Object obj2 = map.get("d");
            Long zzbq2 = zzaiv.zzbq(map.get("t"));
            ArrayList arrayList = new ArrayList();
            for (Map map2 : (List) obj2) {
                String str4 = (String) map2.get("s");
                String str5 = (String) map2.get("e");
                arrayList.add(new zzaja(str4 != null ? zzaiv.zzsj(str4) : null, str5 != null ? zzaiv.zzsj(str5) : null, map2.get("m")));
            }
            if (!arrayList.isEmpty()) {
                this.baX.zza(zzsj, arrayList, zzbq2);
            } else if (this.aZR.zzcyu()) {
                zzalw zzalwVar3 = this.aZR;
                String valueOf3 = String.valueOf(str3);
                zzalwVar3.zzi(valueOf3.length() != 0 ? "Ignoring empty range merge for path ".concat(valueOf3) : new String("Ignoring empty range merge for path "), new Object[0]);
            }
        } else if (str.equals("c")) {
            zzau(zzaiv.zzsj((String) map.get(TtmlNode.TAG_P)));
        } else if (str.equals("ac")) {
            zzbm((String) map.get("s"), (String) map.get("d"));
        } else if (str.equals("sd")) {
            zzbx(map);
        } else if (this.aZR.zzcyu()) {
            zzalw zzalwVar4 = this.aZR;
            String valueOf4 = String.valueOf(str);
            zzalwVar4.zzi(valueOf4.length() != 0 ? "Unrecognized action from server: ".concat(valueOf4) : new String("Unrecognized action from server: "), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void initialize() {
        zzcst();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void interrupt(String str) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(str);
            zzalwVar.zzi(valueOf.length() != 0 ? "Connection interrupted for: ".concat(valueOf) : new String("Connection interrupted for: "), new Object[0]);
        }
        this.baZ.add(str);
        if (this.bbc != null) {
            this.bbc.close();
            this.bbc = null;
        } else {
            this.bbn.cancel();
            this.bbd = zzb.Disconnected;
        }
        this.bbn.zzcpm();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public boolean isInterrupted(String str) {
        return this.baZ.contains(str);
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void purgeOutstandingWrites() {
        for (zzf zzfVar : this.bbi.values()) {
            if (zzfVar.bbM != null) {
                zzfVar.bbM.zzbn("write_canceled", null);
            }
        }
        for (zzd zzdVar : this.bbh) {
            if (zzdVar.bbM != null) {
                zzdVar.bbM.zzbn("write_canceled", null);
            }
        }
        this.bbi.clear();
        this.bbh.clear();
        if (!zzcsq()) {
            this.bbt = false;
        }
        zzctc();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void refreshAuthToken() {
        this.aZR.zzi("Auth token refresh requested", new Object[0]);
        interrupt("token_refresh");
        resume("token_refresh");
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void resume(String str) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(str);
            zzalwVar.zzi(valueOf.length() != 0 ? "Connection no longer interrupted for: ".concat(valueOf) : new String("Connection no longer interrupted for: "), new Object[0]);
        }
        this.baZ.remove(str);
        if (!zzcss() || this.bbd != zzb.Disconnected) {
            return;
        }
        zzcst();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void shutdown() {
        interrupt("shutdown");
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, zzajb zzajbVar) {
        if (zzcsr()) {
            zza("oc", list, (Object) null, zzajbVar);
        } else {
            this.bbh.add(new zzd("oc", list, null, zzajbVar));
        }
        zzctc();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Object obj, zzajb zzajbVar) {
        zza(TtmlNode.TAG_P, list, obj, (String) null, zzajbVar);
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Object obj, String str, zzajb zzajbVar) {
        zza(TtmlNode.TAG_P, list, obj, str, zzajbVar);
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Map<String, Object> map) {
        zzc zzcVar = new zzc(list, map);
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(zzcVar);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 15).append("unlistening on ").append(valueOf).toString(), new Object[0]);
        }
        zze zza2 = zza(zzcVar);
        if (zza2 != null && zzcsq()) {
            zza(zza2);
        }
        zzctc();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Map<String, Object> map, zzaix zzaixVar, Long l, zzajb zzajbVar) {
        zzc zzcVar = new zzc(list, map);
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(zzcVar);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 13).append("Listening on ").append(valueOf).toString(), new Object[0]);
        }
        zzaiv.zzc(!this.bbj.containsKey(zzcVar), "listen() called twice for same QuerySpec.", new Object[0]);
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar2 = this.aZR;
            String valueOf2 = String.valueOf(zzcVar);
            zzalwVar2.zzi(new StringBuilder(String.valueOf(valueOf2).length() + 21).append("Adding listen query: ").append(valueOf2).toString(), new Object[0]);
        }
        zze zzeVar = new zze(zzajbVar, zzcVar, l, zzaixVar);
        this.bbj.put(zzcVar, zzeVar);
        if (zzcsq()) {
            zzb(zzeVar);
        }
        zzctc();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Map<String, Object> map, zzajb zzajbVar) {
        zza("m", list, map, (String) null, zzajbVar);
    }

    @Override // com.google.android.gms.internal.zzais.zza
    public void zzb(zzais.zzb zzbVar) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(zzbVar.name());
            zzalwVar.zzi(valueOf.length() != 0 ? "Got on disconnect due to ".concat(valueOf) : new String("Got on disconnect due to "), new Object[0]);
        }
        this.bbd = zzb.Disconnected;
        this.bbc = null;
        this.bbt = false;
        this.bbg.clear();
        zzcsu();
        if (zzcss()) {
            boolean z = this.bbb > 0 ? System.currentTimeMillis() - this.bbb > 30000 : false;
            if (zzbVar == zzais.zzb.SERVER_RESET || z) {
                this.bbn.zzcpm();
            }
            zzcst();
        }
        this.bbb = 0L;
        this.baX.onDisconnect();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zzb(List<String> list, Object obj, zzajb zzajbVar) {
        this.bbt = true;
        if (zzcsr()) {
            zza("o", list, obj, zzajbVar);
        } else {
            this.bbh.add(new zzd("o", list, obj, zzajbVar));
        }
        zzctc();
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zzb(List<String> list, Map<String, Object> map, zzajb zzajbVar) {
        this.bbt = true;
        if (zzcsr()) {
            zza("om", list, map, zzajbVar);
        } else {
            this.bbh.add(new zzd("om", list, map, zzajbVar));
        }
        zzctc();
    }

    @Override // com.google.android.gms.internal.zzais.zza
    public void zzbt(Map<String, Object> map) {
        if (map.containsKey("r")) {
            zza remove = this.bbg.remove(Long.valueOf(((Integer) map.get("r")).intValue()));
            if (remove == null) {
                return;
            }
            remove.zzbz((Map) map.get("b"));
        } else if (map.containsKey("error")) {
        } else {
            if (map.containsKey("a")) {
                zzl((String) map.get("a"), (Map) map.get("b"));
            } else if (!this.aZR.zzcyu()) {
            } else {
                zzalw zzalwVar = this.aZR;
                String valueOf = String.valueOf(map);
                zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 26).append("Ignoring unknown message: ").append(valueOf).toString(), new Object[0]);
            }
        }
    }

    boolean zzcss() {
        return this.baZ.size() == 0;
    }

    @Override // com.google.android.gms.internal.zzais.zza
    public void zzj(long j, String str) {
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("onReady", new Object[0]);
        }
        this.bbb = System.currentTimeMillis();
        zzcc(j);
        if (this.bba) {
            zzcta();
        }
        zzcsy();
        this.bba = false;
        this.bbo = str;
        this.baX.zzcsp();
    }

    @Override // com.google.android.gms.internal.zzais.zza
    public void zzsg(String str) {
        this.baY = str;
    }

    @Override // com.google.android.gms.internal.zzais.zza
    public void zzsh(String str) {
        if (this.aZR.zzcyu()) {
            zzalw zzalwVar = this.aZR;
            String valueOf = String.valueOf(str);
            zzalwVar.zzi(valueOf.length() != 0 ? "Firebase Database connection was forcefully killed by the server. Will not attempt reconnect. Reason: ".concat(valueOf) : new String("Firebase Database connection was forcefully killed by the server. Will not attempt reconnect. Reason: "), new Object[0]);
        }
        interrupt("server_kill");
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zzsk(String str) {
        this.aZR.zzi("Auth token refreshed.", new Object[0]);
        this.bbk = str;
        if (zzcsq()) {
            if (str != null) {
                zzcsv();
            } else {
                zzcsx();
            }
        }
    }

    public void zzsl(String str) {
        zzaiv.zzc(this.bbd == zzb.GettingToken, "Trying to open network connection while in the wrong state: %s", this.bbd);
        if (str == null) {
            this.baX.zzcy(false);
        }
        this.bbk = str;
        this.bbd = zzb.Connecting;
        this.bbc = new zzais(this.bbm, this.baF, this.baY, this, this.bbo);
        this.bbc.open();
    }
}
