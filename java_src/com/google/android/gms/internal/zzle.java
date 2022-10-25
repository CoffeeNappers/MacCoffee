package com.google.android.gms.internal;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.text.TextUtils;
import android.view.MotionEvent;
import com.google.android.gms.R;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzle {
    private final Context mContext;
    private int mState;
    private String zzant;
    private final float zzbzc;
    private String zzcvu;
    private float zzcvv;
    private float zzcvw;
    private float zzcvx;

    public zzle(Context context) {
        this.mState = 0;
        this.mContext = context;
        this.zzbzc = context.getResources().getDisplayMetrics().density;
    }

    public zzle(Context context, String str) {
        this(context);
        this.zzcvu = str;
    }

    private int zza(List<String> list, String str, boolean z) {
        if (!z) {
            return -1;
        }
        list.add(str);
        return list.size() - 1;
    }

    static String zzdd(String str) {
        if (TextUtils.isEmpty(str)) {
            return "No debug information";
        }
        Uri build = new Uri.Builder().encodedQuery(str.replaceAll("\\+", "%20")).build();
        StringBuilder sb = new StringBuilder();
        Map<String, String> zzg = com.google.android.gms.ads.internal.zzu.zzgm().zzg(build);
        for (String str2 : zzg.keySet()) {
            sb.append(str2).append(" = ").append(zzg.get(str2)).append("\n\n");
        }
        String trim = sb.toString().trim();
        return TextUtils.isEmpty(trim) ? "No debug information" : trim;
    }

    private void zzwb() {
        if (!(this.mContext instanceof Activity)) {
            zzkx.zzdh("Can not create dialog without Activity Context");
            return;
        }
        Resources resources = com.google.android.gms.ads.internal.zzu.zzgq().getResources();
        String string = resources != null ? resources.getString(R.string.debug_menu_title) : "Select a Debug Mode";
        String string2 = resources != null ? resources.getString(R.string.debug_menu_ad_information) : "Ad Information";
        String string3 = resources != null ? resources.getString(R.string.debug_menu_creative_preview) : "Creative Preview";
        String string4 = resources != null ? resources.getString(R.string.debug_menu_troubleshooting) : "Troubleshooting";
        ArrayList arrayList = new ArrayList();
        final int zza = zza((List<String>) arrayList, string2, true);
        final int zza2 = zza(arrayList, string3, zzdr.zzbkw.get().booleanValue());
        final int zza3 = zza(arrayList, string4, zzdr.zzbkx.get().booleanValue());
        new AlertDialog.Builder(this.mContext).setTitle(string).setItems((CharSequence[]) arrayList.toArray(new String[0]), new DialogInterface.OnClickListener() { // from class: com.google.android.gms.internal.zzle.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (i == zza) {
                    zzle.this.zzwc();
                } else if (i == zza2 && zzdr.zzbkw.get().booleanValue()) {
                    zzle.this.zzwd();
                } else if (i != zza3 || !zzdr.zzbkx.get().booleanValue()) {
                } else {
                    zzle.this.zzwe();
                }
            }
        }).create().show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzwc() {
        if (!(this.mContext instanceof Activity)) {
            zzkx.zzdh("Can not create dialog without Activity Context");
            return;
        }
        final String zzdd = zzdd(this.zzcvu);
        AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
        builder.setMessage(zzdd);
        builder.setTitle("Ad Information");
        builder.setPositiveButton("Share", new DialogInterface.OnClickListener() { // from class: com.google.android.gms.internal.zzle.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                com.google.android.gms.ads.internal.zzu.zzgm().zzb(zzle.this.mContext, Intent.createChooser(new Intent("android.intent.action.SEND").setType("text/plain").putExtra("android.intent.extra.TEXT", zzdd), "Share via"));
            }
        });
        builder.setNegativeButton("Close", new DialogInterface.OnClickListener() { // from class: com.google.android.gms.internal.zzle.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.create().show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzwd() {
        zzkx.zzdg("Debug mode [Creative Preview] selected.");
        zzla.zza(new Runnable() { // from class: com.google.android.gms.internal.zzle.4
            @Override // java.lang.Runnable
            public void run() {
                com.google.android.gms.ads.internal.zzu.zzgu().zzj(zzle.this.mContext, zzle.this.zzant);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzwe() {
        zzkx.zzdg("Debug mode [Troubleshooting] selected.");
        zzla.zza(new Runnable() { // from class: com.google.android.gms.internal.zzle.5
            @Override // java.lang.Runnable
            public void run() {
                com.google.android.gms.ads.internal.zzu.zzgu().zzk(zzle.this.mContext, zzle.this.zzant);
            }
        });
    }

    public void setAdUnitId(String str) {
        this.zzant = str;
    }

    public void showDialog() {
        if (zzdr.zzbkx.get().booleanValue() || zzdr.zzbkw.get().booleanValue()) {
            zzwb();
        } else {
            zzwc();
        }
    }

    void zza(int i, float f, float f2) {
        if (i == 0) {
            this.mState = 0;
            this.zzcvv = f;
            this.zzcvw = f2;
            this.zzcvx = f2;
        } else if (this.mState == -1) {
        } else {
            if (i != 2) {
                if (i != 1 || this.mState != 4) {
                    return;
                }
                showDialog();
                return;
            }
            if (f2 > this.zzcvw) {
                this.zzcvw = f2;
            } else if (f2 < this.zzcvx) {
                this.zzcvx = f2;
            }
            if (this.zzcvw - this.zzcvx > 30.0f * this.zzbzc) {
                this.mState = -1;
                return;
            }
            if (this.mState == 0 || this.mState == 2) {
                if (f - this.zzcvv >= 50.0f * this.zzbzc) {
                    this.zzcvv = f;
                    this.mState++;
                }
            } else if ((this.mState == 1 || this.mState == 3) && f - this.zzcvv <= (-50.0f) * this.zzbzc) {
                this.zzcvv = f;
                this.mState++;
            }
            if (this.mState == 1 || this.mState == 3) {
                if (f <= this.zzcvv) {
                    return;
                }
                this.zzcvv = f;
            } else if (this.mState != 2 || f >= this.zzcvv) {
            } else {
                this.zzcvv = f;
            }
        }
    }

    public void zzdc(String str) {
        this.zzcvu = str;
    }

    public void zzg(MotionEvent motionEvent) {
        int historySize = motionEvent.getHistorySize();
        for (int i = 0; i < historySize; i++) {
            zza(motionEvent.getActionMasked(), motionEvent.getHistoricalX(0, i), motionEvent.getHistoricalY(0, i));
        }
        zza(motionEvent.getActionMasked(), motionEvent.getX(), motionEvent.getY());
    }
}
