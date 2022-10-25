package com.google.firebase.database.connection.idl;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.util.DynamiteApi;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.firebase_database.ModuleDescriptor;
import com.google.android.gms.internal.zzair;
import com.google.android.gms.internal.zzait;
import com.google.android.gms.internal.zzaiu;
import com.google.android.gms.internal.zzaix;
import com.google.android.gms.internal.zzaiy;
import com.google.android.gms.internal.zzaiz;
import com.google.android.gms.internal.zzaja;
import com.google.android.gms.internal.zzajb;
import com.google.android.gms.internal.zzalu;
import com.google.android.gms.internal.zztl;
import com.google.firebase.database.connection.idl.zze;
import com.google.firebase.database.connection.idl.zzf;
import com.google.firebase.database.connection.idl.zzh;
import com.google.firebase.database.connection.idl.zzi;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;
@DynamiteApi
/* loaded from: classes2.dex */
public class IPersistentConnectionImpl extends zzh.zza {
    private zzaiy bcu;

    public static zzh loadDynamic(Context context, ConnectionConfig connectionConfig, zzait zzaitVar, ScheduledExecutorService scheduledExecutorService, zzaiy.zza zzaVar) {
        try {
            zzh asInterface = zzh.zza.asInterface(zztl.zza(context, zztl.Qp, ModuleDescriptor.MODULE_ID).zzjd("com.google.firebase.database.connection.idl.IPersistentConnectionImpl"));
            asInterface.setup(connectionConfig, zza(zzaitVar), com.google.android.gms.dynamic.zze.zzac(scheduledExecutorService), zza(zzaVar));
            return asInterface;
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        } catch (zztl.zza e2) {
            throw new RuntimeException(e2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static long zza(Long l) {
        if (l != null) {
            if (l.longValue() != -1) {
                return l.longValue();
            }
            throw new IllegalArgumentException("Tag parameter clashed with NO_TAG value");
        }
        return -1L;
    }

    private static zzait zza(final zze zzeVar) {
        return new zzait() { // from class: com.google.firebase.database.connection.idl.IPersistentConnectionImpl.6
            @Override // com.google.android.gms.internal.zzait
            public void zza(boolean z, final zzait.zza zzaVar) {
                try {
                    zze.this.zza(z, new zzf.zza() { // from class: com.google.firebase.database.connection.idl.IPersistentConnectionImpl.6.1
                        @Override // com.google.firebase.database.connection.idl.zzf
                        public void onError(String str) throws RemoteException {
                            zzaVar.onError(str);
                        }

                        @Override // com.google.firebase.database.connection.idl.zzf
                        public void zzsi(String str) throws RemoteException {
                            zzaVar.zzsi(str);
                        }
                    });
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }
        };
    }

    private static zzaiy.zza zza(final zzi zziVar) {
        return new zzaiy.zza() { // from class: com.google.firebase.database.connection.idl.IPersistentConnectionImpl.4
            @Override // com.google.android.gms.internal.zzaiy.zza
            public void onDisconnect() {
                try {
                    zzi.this.onDisconnect();
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }

            @Override // com.google.android.gms.internal.zzaiy.zza
            public void zza(List<String> list, Object obj, boolean z, Long l) {
                try {
                    zzi.this.zza(list, com.google.android.gms.dynamic.zze.zzac(obj), z, IPersistentConnectionImpl.zza(l));
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }

            @Override // com.google.android.gms.internal.zzaiy.zza
            public void zza(List<String> list, List<zzaja> list2, Long l) {
                ArrayList arrayList = new ArrayList(list2.size());
                ArrayList arrayList2 = new ArrayList(list2.size());
                for (zzaja zzajaVar : list2) {
                    arrayList.add(RangeParcelable.zza(zzajaVar));
                    arrayList2.add(zzajaVar.zzcto());
                }
                try {
                    zzi.this.zza(list, arrayList, com.google.android.gms.dynamic.zze.zzac(arrayList2), IPersistentConnectionImpl.zza(l));
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }

            @Override // com.google.android.gms.internal.zzaiy.zza
            public void zzbw(Map<String, Object> map) {
                try {
                    zzi.this.zzap(com.google.android.gms.dynamic.zze.zzac(map));
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }

            @Override // com.google.android.gms.internal.zzaiy.zza
            public void zzcsp() {
                try {
                    zzi.this.zzcsp();
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }

            @Override // com.google.android.gms.internal.zzaiy.zza
            public void zzcy(boolean z) {
                try {
                    zzi.this.zzcy(z);
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }
        };
    }

    private static zzajb zza(final zzj zzjVar) {
        return new zzajb() { // from class: com.google.firebase.database.connection.idl.IPersistentConnectionImpl.2
            @Override // com.google.android.gms.internal.zzajb
            public void zzbn(String str, String str2) {
                try {
                    zzj.this.zzbn(str, str2);
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }
        };
    }

    private static zze zza(final zzait zzaitVar) {
        return new zze.zza() { // from class: com.google.firebase.database.connection.idl.IPersistentConnectionImpl.5
            @Override // com.google.firebase.database.connection.idl.zze
            public void zza(boolean z, final zzf zzfVar) throws RemoteException {
                zzait.this.zza(z, new zzait.zza() { // from class: com.google.firebase.database.connection.idl.IPersistentConnectionImpl.5.1
                    @Override // com.google.android.gms.internal.zzait.zza
                    public void onError(String str) {
                        try {
                            zzfVar.onError(str);
                        } catch (RemoteException e) {
                            throw new RuntimeException(e);
                        }
                    }

                    @Override // com.google.android.gms.internal.zzait.zza
                    public void zzsi(String str) {
                        try {
                            zzfVar.zzsi(str);
                        } catch (RemoteException e) {
                            throw new RuntimeException(e);
                        }
                    }
                });
            }
        };
    }

    private static zzi zza(final zzaiy.zza zzaVar) {
        return new zzi.zza() { // from class: com.google.firebase.database.connection.idl.IPersistentConnectionImpl.3
            @Override // com.google.firebase.database.connection.idl.zzi
            public void onDisconnect() {
                zzaiy.zza.this.onDisconnect();
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zza(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, boolean z, long j) {
                zzaiy.zza.this.zza(list, com.google.android.gms.dynamic.zze.zzae(zzdVar), z, IPersistentConnectionImpl.zzce(j));
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zza(List<String> list, List<RangeParcelable> list2, com.google.android.gms.dynamic.zzd zzdVar, long j) {
                List list3 = (List) com.google.android.gms.dynamic.zze.zzae(zzdVar);
                ArrayList arrayList = new ArrayList(list2.size());
                int i = 0;
                while (true) {
                    int i2 = i;
                    if (i2 >= list2.size()) {
                        zzaiy.zza.this.zza(list, arrayList, IPersistentConnectionImpl.zzce(j));
                        return;
                    } else {
                        arrayList.add(RangeParcelable.zza(list2.get(i2), list3.get(i2)));
                        i = i2 + 1;
                    }
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zzap(com.google.android.gms.dynamic.zzd zzdVar) {
                zzaiy.zza.this.zzbw((Map) com.google.android.gms.dynamic.zze.zzae(zzdVar));
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zzcsp() {
                zzaiy.zza.this.zzcsp();
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zzcy(boolean z) {
                zzaiy.zza.this.zzcy(z);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Long zzce(long j) {
        if (j == -1) {
            return null;
        }
        return Long.valueOf(j);
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void compareAndPut(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, String str, zzj zzjVar) {
        this.bcu.zza(list, com.google.android.gms.dynamic.zze.zzae(zzdVar), str, zza(zzjVar));
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void initialize() {
        this.bcu.initialize();
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void interrupt(String str) {
        this.bcu.interrupt(str);
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public boolean isInterrupted(String str) {
        return this.bcu.isInterrupted(str);
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void listen(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, final zzg zzgVar, long j, zzj zzjVar) {
        Long zzce = zzce(j);
        zzaix zzaixVar = new zzaix() { // from class: com.google.firebase.database.connection.idl.IPersistentConnectionImpl.1
            @Override // com.google.android.gms.internal.zzaix
            public String zzcsm() {
                try {
                    return zzgVar.zzcsm();
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }

            @Override // com.google.android.gms.internal.zzaix
            public boolean zzcsn() {
                try {
                    return zzgVar.zzcsn();
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }

            @Override // com.google.android.gms.internal.zzaix
            public zzair zzcso() {
                try {
                    return CompoundHashParcelable.zza(zzgVar.zzctw());
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }
            }
        };
        this.bcu.zza(list, (Map) com.google.android.gms.dynamic.zze.zzae(zzdVar), zzaixVar, zzce, zza(zzjVar));
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void merge(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) {
        this.bcu.zza(list, (Map) com.google.android.gms.dynamic.zze.zzae(zzdVar), zza(zzjVar));
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void onDisconnectCancel(List<String> list, zzj zzjVar) {
        this.bcu.zza(list, zza(zzjVar));
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void onDisconnectMerge(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) {
        this.bcu.zzb(list, (Map) com.google.android.gms.dynamic.zze.zzae(zzdVar), zza(zzjVar));
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void onDisconnectPut(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) {
        this.bcu.zzb(list, com.google.android.gms.dynamic.zze.zzae(zzdVar), zza(zzjVar));
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void purgeOutstandingWrites() {
        this.bcu.purgeOutstandingWrites();
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void put(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) {
        this.bcu.zza(list, com.google.android.gms.dynamic.zze.zzae(zzdVar), zza(zzjVar));
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void refreshAuthToken() {
        this.bcu.refreshAuthToken();
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void refreshAuthToken2(String str) {
        this.bcu.zzsk(str);
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void resume(String str) {
        this.bcu.resume(str);
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void setup(ConnectionConfig connectionConfig, zze zzeVar, com.google.android.gms.dynamic.zzd zzdVar, zzi zziVar) {
        this.bcu = new zzaiz(new zzaiu(new zzalu(connectionConfig.zzctu(), connectionConfig.zzctv()), zza(zzeVar), (ScheduledExecutorService) com.google.android.gms.dynamic.zze.zzae(zzdVar), connectionConfig.baS, connectionConfig.bco, connectionConfig.baU), HostInfoParcelable.zza(connectionConfig.bcl), zza(zziVar));
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void shutdown() {
        this.bcu.shutdown();
    }

    @Override // com.google.firebase.database.connection.idl.zzh
    public void unlisten(List<String> list, com.google.android.gms.dynamic.zzd zzdVar) {
        this.bcu.zza(list, (Map) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }
}
