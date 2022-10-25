package com.google.firebase.database.connection.idl;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.internal.zzaiu;
import com.google.android.gms.internal.zzaix;
import com.google.android.gms.internal.zzaiy;
import com.google.android.gms.internal.zzajb;
import com.google.firebase.database.connection.idl.zzg;
import com.google.firebase.database.connection.idl.zzj;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzc implements zzaiy {
    private final zzh bcq;

    private zzc(zzh zzhVar) {
        this.bcq = zzhVar;
    }

    public static zzc zza(Context context, ConnectionConfig connectionConfig, zzaiu zzaiuVar, zzaiy.zza zzaVar) {
        return new zzc(IPersistentConnectionImpl.loadDynamic(context, connectionConfig, zzaiuVar.zzcsi(), zzaiuVar.zzcsj(), zzaVar));
    }

    private static zzj zza(final zzajb zzajbVar) {
        return new zzj.zza() { // from class: com.google.firebase.database.connection.idl.zzc.2
            @Override // com.google.firebase.database.connection.idl.zzj
            public void zzbn(String str, String str2) throws RemoteException {
                zzajb.this.zzbn(str, str2);
            }
        };
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void initialize() {
        try {
            this.bcq.initialize();
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void interrupt(String str) {
        try {
            this.bcq.interrupt(str);
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public boolean isInterrupted(String str) {
        try {
            return this.bcq.isInterrupted(str);
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void purgeOutstandingWrites() {
        try {
            this.bcq.purgeOutstandingWrites();
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void refreshAuthToken() {
        try {
            this.bcq.refreshAuthToken();
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void resume(String str) {
        try {
            this.bcq.resume(str);
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void shutdown() {
        try {
            this.bcq.shutdown();
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, zzajb zzajbVar) {
        try {
            this.bcq.onDisconnectCancel(list, zza(zzajbVar));
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Object obj, zzajb zzajbVar) {
        try {
            this.bcq.put(list, com.google.android.gms.dynamic.zze.zzac(obj), zza(zzajbVar));
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Object obj, String str, zzajb zzajbVar) {
        try {
            this.bcq.compareAndPut(list, com.google.android.gms.dynamic.zze.zzac(obj), str, zza(zzajbVar));
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Map<String, Object> map) {
        try {
            this.bcq.unlisten(list, com.google.android.gms.dynamic.zze.zzac(map));
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Map<String, Object> map, final zzaix zzaixVar, Long l, zzajb zzajbVar) {
        long longValue;
        zzg.zza zzaVar = new zzg.zza() { // from class: com.google.firebase.database.connection.idl.zzc.1
            @Override // com.google.firebase.database.connection.idl.zzg
            public String zzcsm() {
                return zzaixVar.zzcsm();
            }

            @Override // com.google.firebase.database.connection.idl.zzg
            public boolean zzcsn() {
                return zzaixVar.zzcsn();
            }

            @Override // com.google.firebase.database.connection.idl.zzg
            public CompoundHashParcelable zzctw() {
                return CompoundHashParcelable.zza(zzaixVar.zzcso());
            }
        };
        if (l != null) {
            try {
                longValue = l.longValue();
            } catch (RemoteException e) {
                throw new RuntimeException(e);
            }
        } else {
            longValue = -1;
        }
        this.bcq.listen(list, com.google.android.gms.dynamic.zze.zzac(map), zzaVar, longValue, zza(zzajbVar));
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zza(List<String> list, Map<String, Object> map, zzajb zzajbVar) {
        try {
            this.bcq.merge(list, com.google.android.gms.dynamic.zze.zzac(map), zza(zzajbVar));
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zzb(List<String> list, Object obj, zzajb zzajbVar) {
        try {
            this.bcq.onDisconnectPut(list, com.google.android.gms.dynamic.zze.zzac(obj), zza(zzajbVar));
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zzb(List<String> list, Map<String, Object> map, zzajb zzajbVar) {
        try {
            this.bcq.onDisconnectMerge(list, com.google.android.gms.dynamic.zze.zzac(map), zza(zzajbVar));
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy
    public void zzsk(String str) {
        try {
            this.bcq.refreshAuthToken2(str);
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }
}
