package com.google.android.gms.internal;

import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.statistics.Statistic;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzfn implements zzfe {
    private final zza zzbqy;

    /* loaded from: classes2.dex */
    public interface zza {
        void zzb(RewardItemParcel rewardItemParcel);

        void zzfo();
    }

    public zzfn(zza zzaVar) {
        this.zzbqy = zzaVar;
    }

    public static void zza(zzmd zzmdVar, zza zzaVar) {
        zzmdVar.zzxc().zza("/reward", new zzfn(zzaVar));
    }

    private void zzf(Map<String, String> map) {
        RewardItemParcel rewardItemParcel;
        int parseInt;
        String str;
        try {
            parseInt = Integer.parseInt(map.get(ServerKeys.AMOUNT));
            str = map.get(ServerKeys.TYPE);
        } catch (NumberFormatException e) {
            zzkx.zzc("Unable to parse reward amount.", e);
        }
        if (!TextUtils.isEmpty(str)) {
            rewardItemParcel = new RewardItemParcel(str, parseInt);
            this.zzbqy.zzb(rewardItemParcel);
        }
        rewardItemParcel = null;
        this.zzbqy.zzb(rewardItemParcel);
    }

    private void zzg(Map<String, String> map) {
        this.zzbqy.zzfo();
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        String str = map.get(NativeProtocol.WEB_DIALOG_ACTION);
        if ("grant".equals(str)) {
            zzf(map);
        } else if (!Statistic.TYPE_VIDEO_PLAY.equals(str)) {
        } else {
            zzg(map);
        }
    }
}
