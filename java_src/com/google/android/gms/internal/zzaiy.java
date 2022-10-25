package com.google.android.gms.internal;

import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public interface zzaiy {

    /* loaded from: classes2.dex */
    public interface zza {
        void onDisconnect();

        void zza(List<String> list, Object obj, boolean z, Long l);

        void zza(List<String> list, List<zzaja> list2, Long l);

        void zzbw(Map<String, Object> map);

        void zzcsp();

        void zzcy(boolean z);
    }

    void initialize();

    void interrupt(String str);

    boolean isInterrupted(String str);

    void purgeOutstandingWrites();

    void refreshAuthToken();

    void resume(String str);

    void shutdown();

    void zza(List<String> list, zzajb zzajbVar);

    void zza(List<String> list, Object obj, zzajb zzajbVar);

    void zza(List<String> list, Object obj, String str, zzajb zzajbVar);

    void zza(List<String> list, Map<String, Object> map);

    void zza(List<String> list, Map<String, Object> map, zzaix zzaixVar, Long l, zzajb zzajbVar);

    void zza(List<String> list, Map<String, Object> map, zzajb zzajbVar);

    void zzb(List<String> list, Object obj, zzajb zzajbVar);

    void zzb(List<String> list, Map<String, Object> map, zzajb zzajbVar);

    void zzsk(String str);
}
