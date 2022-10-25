package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.provider.CalendarContract;
import android.text.TextUtils;
import com.google.android.gms.R;
import com.google.firebase.analytics.FirebaseAnalytics;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzhp extends zzhv {
    private final Context mContext;
    private final Map<String, String> zzbly;
    private String zzbxx;
    private long zzbxy;
    private long zzbxz;
    private String zzbya;
    private String zzbyb;

    public zzhp(zzmd zzmdVar, Map<String, String> map) {
        super(zzmdVar, "createCalendarEvent");
        this.zzbly = map;
        this.mContext = zzmdVar.zzwy();
        zzor();
    }

    private String zzby(String str) {
        return TextUtils.isEmpty(this.zzbly.get(str)) ? "" : this.zzbly.get(str);
    }

    private long zzbz(String str) {
        String str2 = this.zzbly.get(str);
        if (str2 == null) {
            return -1L;
        }
        try {
            return Long.parseLong(str2);
        } catch (NumberFormatException e) {
            return -1L;
        }
    }

    private void zzor() {
        this.zzbxx = zzby("description");
        this.zzbya = zzby("summary");
        this.zzbxy = zzbz("start_ticks");
        this.zzbxz = zzbz("end_ticks");
        this.zzbyb = zzby(FirebaseAnalytics.Param.LOCATION);
    }

    @TargetApi(14)
    Intent createIntent() {
        Intent data = new Intent("android.intent.action.EDIT").setData(CalendarContract.Events.CONTENT_URI);
        data.putExtra("title", this.zzbxx);
        data.putExtra("eventLocation", this.zzbyb);
        data.putExtra("description", this.zzbya);
        if (this.zzbxy > -1) {
            data.putExtra("beginTime", this.zzbxy);
        }
        if (this.zzbxz > -1) {
            data.putExtra("endTime", this.zzbxz);
        }
        data.setFlags(268435456);
        return data;
    }

    public void execute() {
        if (this.mContext == null) {
            zzcb("Activity context is not available.");
        } else if (!com.google.android.gms.ads.internal.zzu.zzgm().zzac(this.mContext).zzln()) {
            zzcb("This feature is not available on the device.");
        } else {
            AlertDialog.Builder zzab = com.google.android.gms.ads.internal.zzu.zzgm().zzab(this.mContext);
            Resources resources = com.google.android.gms.ads.internal.zzu.zzgq().getResources();
            zzab.setTitle(resources != null ? resources.getString(R.string.create_calendar_title) : "Create calendar event");
            zzab.setMessage(resources != null ? resources.getString(R.string.create_calendar_message) : "Allow Ad to create a calendar event?");
            zzab.setPositiveButton(resources != null ? resources.getString(R.string.accept) : "Accept", new DialogInterface.OnClickListener() { // from class: com.google.android.gms.internal.zzhp.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    com.google.android.gms.ads.internal.zzu.zzgm().zzb(zzhp.this.mContext, zzhp.this.createIntent());
                }
            });
            zzab.setNegativeButton(resources != null ? resources.getString(R.string.decline) : "Decline", new DialogInterface.OnClickListener() { // from class: com.google.android.gms.internal.zzhp.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                    zzhp.this.zzcb("Operation denied by user.");
                }
            });
            zzab.create().show();
        }
    }
}
