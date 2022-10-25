package com.google.android.gms.tagmanager;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.support.annotation.VisibleForTesting;
import com.vkontakte.android.TimeUtils;
import java.util.Random;
/* loaded from: classes2.dex */
public class zzq {
    private final String aDY;
    private final Context mContext;
    private final Random zzbao;

    public zzq(Context context, String str) {
        this(context, str, new Random());
    }

    @VisibleForTesting
    zzq(Context context, String str, Random random) {
        this.mContext = (Context) com.google.android.gms.common.internal.zzaa.zzy(context);
        this.aDY = (String) com.google.android.gms.common.internal.zzaa.zzy(str);
        this.zzbao = random;
    }

    private SharedPreferences zzceo() {
        Context context = this.mContext;
        String valueOf = String.valueOf("_gtmContainerRefreshPolicy_");
        String valueOf2 = String.valueOf(this.aDY);
        return context.getSharedPreferences(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf), 0);
    }

    private long zzg(long j, long j2) {
        SharedPreferences zzceo = zzceo();
        long max = Math.max(0L, zzceo.getLong("FORBIDDEN_COUNT", 0L));
        return ((float) (((((float) max) / ((float) ((Math.max(0L, zzceo.getLong("SUCCESSFUL_COUNT", 0L)) + max) + 1))) * ((float) (j2 - j))) + j)) * this.zzbao.nextFloat();
    }

    public long zzcek() {
        return 43200000 + zzg(7200000L, 259200000L);
    }

    public long zzcel() {
        return TimeUtils.HOUR + zzg(600000L, TimeUtils.DAY);
    }

    @SuppressLint({"CommitPrefEdits"})
    public void zzcem() {
        SharedPreferences zzceo = zzceo();
        long j = zzceo.getLong("FORBIDDEN_COUNT", 0L);
        long j2 = zzceo.getLong("SUCCESSFUL_COUNT", 0L);
        SharedPreferences.Editor edit = zzceo.edit();
        long min = j == 0 ? 3L : Math.min(10L, 1 + j);
        long max = Math.max(0L, Math.min(j2, 10 - min));
        edit.putLong("FORBIDDEN_COUNT", min);
        edit.putLong("SUCCESSFUL_COUNT", max);
        zzdd.zza(edit);
    }

    @SuppressLint({"CommitPrefEdits"})
    public void zzcen() {
        SharedPreferences zzceo = zzceo();
        long j = zzceo.getLong("SUCCESSFUL_COUNT", 0L);
        long j2 = zzceo.getLong("FORBIDDEN_COUNT", 0L);
        long min = Math.min(10L, j + 1);
        long max = Math.max(0L, Math.min(j2, 10 - min));
        SharedPreferences.Editor edit = zzceo.edit();
        edit.putLong("SUCCESSFUL_COUNT", min);
        edit.putLong("FORBIDDEN_COUNT", max);
        zzdd.zza(edit);
    }
}
