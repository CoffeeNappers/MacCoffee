package com.google.android.gms.internal;

import android.app.Activity;
import android.graphics.Bitmap;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import java.util.Map;
import java.util.Set;
@zzji
/* loaded from: classes.dex */
public class zzhq extends zzhv {
    static final Set<String> zzbyd = com.google.android.gms.common.util.zzf.zzc("top-left", "top-right", "top-center", "center", "bottom-left", "bottom-right", "bottom-center");
    private int zzakh;
    private int zzaki;
    private final Object zzako;
    private AdSizeParcel zzapp;
    private final zzmd zzbnz;
    private final Activity zzbxt;
    private String zzbye;
    private boolean zzbyf;
    private int zzbyg;
    private int zzbyh;
    private int zzbyi;
    private int zzbyj;
    private ImageView zzbyk;
    private LinearLayout zzbyl;
    private zzhw zzbym;
    private PopupWindow zzbyn;
    private RelativeLayout zzbyo;
    private ViewGroup zzbyp;

    public zzhq(zzmd zzmdVar, zzhw zzhwVar) {
        super(zzmdVar, "resize");
        this.zzbye = "top-right";
        this.zzbyf = true;
        this.zzbyg = 0;
        this.zzbyh = 0;
        this.zzaki = -1;
        this.zzbyi = 0;
        this.zzbyj = 0;
        this.zzakh = -1;
        this.zzako = new Object();
        this.zzbnz = zzmdVar;
        this.zzbxt = zzmdVar.zzwy();
        this.zzbym = zzhwVar;
    }

    private void zzj(Map<String, String> map) {
        if (!TextUtils.isEmpty(map.get("width"))) {
            this.zzakh = com.google.android.gms.ads.internal.zzu.zzgm().zzda(map.get("width"));
        }
        if (!TextUtils.isEmpty(map.get("height"))) {
            this.zzaki = com.google.android.gms.ads.internal.zzu.zzgm().zzda(map.get("height"));
        }
        if (!TextUtils.isEmpty(map.get("offsetX"))) {
            this.zzbyi = com.google.android.gms.ads.internal.zzu.zzgm().zzda(map.get("offsetX"));
        }
        if (!TextUtils.isEmpty(map.get("offsetY"))) {
            this.zzbyj = com.google.android.gms.ads.internal.zzu.zzgm().zzda(map.get("offsetY"));
        }
        if (!TextUtils.isEmpty(map.get("allowOffscreen"))) {
            this.zzbyf = Boolean.parseBoolean(map.get("allowOffscreen"));
        }
        String str = map.get("customClosePosition");
        if (!TextUtils.isEmpty(str)) {
            this.zzbye = str;
        }
    }

    private int[] zzot() {
        if (!zzov()) {
            return null;
        }
        if (this.zzbyf) {
            return new int[]{this.zzbyg + this.zzbyi, this.zzbyh + this.zzbyj};
        }
        int[] zzi = com.google.android.gms.ads.internal.zzu.zzgm().zzi(this.zzbxt);
        int[] zzk = com.google.android.gms.ads.internal.zzu.zzgm().zzk(this.zzbxt);
        int i = zzi[0];
        int i2 = this.zzbyg + this.zzbyi;
        int i3 = this.zzbyh + this.zzbyj;
        if (i2 < 0) {
            i2 = 0;
        } else if (this.zzakh + i2 > i) {
            i2 = i - this.zzakh;
        }
        if (i3 < zzk[0]) {
            i3 = zzk[0];
        } else if (this.zzaki + i3 > zzk[1]) {
            i3 = zzk[1] - this.zzaki;
        }
        return new int[]{i2, i3};
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public void execute(Map<String, String> map) {
        char c;
        synchronized (this.zzako) {
            if (this.zzbxt == null) {
                zzcb("Not an activity context. Cannot resize.");
            } else if (this.zzbnz.zzeg() == null) {
                zzcb("Webview is not yet available, size is not set.");
            } else if (this.zzbnz.zzeg().zzazr) {
                zzcb("Is interstitial. Cannot resize an interstitial.");
            } else if (this.zzbnz.zzxg()) {
                zzcb("Cannot resize an expanded banner.");
            } else {
                zzj(map);
                if (!zzos()) {
                    zzcb("Invalid width and height options. Cannot resize.");
                    return;
                }
                Window window = this.zzbxt.getWindow();
                if (window == null || window.getDecorView() == null) {
                    zzcb("Activity context is not ready, cannot get window or decor view.");
                    return;
                }
                int[] zzot = zzot();
                if (zzot == null) {
                    zzcb("Resize location out of screen or close button is not visible.");
                    return;
                }
                int zzb = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzbxt, this.zzakh);
                int zzb2 = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzbxt, this.zzaki);
                ViewParent parent = this.zzbnz.getView().getParent();
                if (parent == null || !(parent instanceof ViewGroup)) {
                    zzcb("Webview is detached, probably in the middle of a resize or expand.");
                    return;
                }
                ((ViewGroup) parent).removeView(this.zzbnz.getView());
                if (this.zzbyn == null) {
                    this.zzbyp = (ViewGroup) parent;
                    Bitmap zzq = com.google.android.gms.ads.internal.zzu.zzgm().zzq(this.zzbnz.getView());
                    this.zzbyk = new ImageView(this.zzbxt);
                    this.zzbyk.setImageBitmap(zzq);
                    this.zzapp = this.zzbnz.zzeg();
                    this.zzbyp.addView(this.zzbyk);
                } else {
                    this.zzbyn.dismiss();
                }
                this.zzbyo = new RelativeLayout(this.zzbxt);
                this.zzbyo.setBackgroundColor(0);
                this.zzbyo.setLayoutParams(new ViewGroup.LayoutParams(zzb, zzb2));
                this.zzbyn = com.google.android.gms.ads.internal.zzu.zzgm().zza((View) this.zzbyo, zzb, zzb2, false);
                this.zzbyn.setOutsideTouchable(true);
                this.zzbyn.setTouchable(true);
                this.zzbyn.setClippingEnabled(!this.zzbyf);
                this.zzbyo.addView(this.zzbnz.getView(), -1, -1);
                this.zzbyl = new LinearLayout(this.zzbxt);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzbxt, 50), com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzbxt, 50));
                String str = this.zzbye;
                switch (str.hashCode()) {
                    case -1364013995:
                        if (str.equals("center")) {
                            c = 2;
                            break;
                        }
                        c = 65535;
                        break;
                    case -1012429441:
                        if (str.equals("top-left")) {
                            c = 0;
                            break;
                        }
                        c = 65535;
                        break;
                    case -655373719:
                        if (str.equals("bottom-left")) {
                            c = 3;
                            break;
                        }
                        c = 65535;
                        break;
                    case 1163912186:
                        if (str.equals("bottom-right")) {
                            c = 5;
                            break;
                        }
                        c = 65535;
                        break;
                    case 1288627767:
                        if (str.equals("bottom-center")) {
                            c = 4;
                            break;
                        }
                        c = 65535;
                        break;
                    case 1755462605:
                        if (str.equals("top-center")) {
                            c = 1;
                            break;
                        }
                        c = 65535;
                        break;
                    default:
                        c = 65535;
                        break;
                }
                switch (c) {
                    case 0:
                        layoutParams.addRule(10);
                        layoutParams.addRule(9);
                        break;
                    case 1:
                        layoutParams.addRule(10);
                        layoutParams.addRule(14);
                        break;
                    case 2:
                        layoutParams.addRule(13);
                        break;
                    case 3:
                        layoutParams.addRule(12);
                        layoutParams.addRule(9);
                        break;
                    case 4:
                        layoutParams.addRule(12);
                        layoutParams.addRule(14);
                        break;
                    case 5:
                        layoutParams.addRule(12);
                        layoutParams.addRule(11);
                        break;
                    default:
                        layoutParams.addRule(10);
                        layoutParams.addRule(11);
                        break;
                }
                this.zzbyl.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.gms.internal.zzhq.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        zzhq.this.zzt(true);
                    }
                });
                this.zzbyl.setContentDescription("Close button");
                this.zzbyo.addView(this.zzbyl, layoutParams);
                try {
                    this.zzbyn.showAtLocation(window.getDecorView(), 0, com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzbxt, zzot[0]), com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzbxt, zzot[1]));
                    zzb(zzot[0], zzot[1]);
                    this.zzbnz.zza(new AdSizeParcel(this.zzbxt, new AdSize(this.zzakh, this.zzaki)));
                    zzc(zzot[0], zzot[1]);
                    zzcd("resized");
                } catch (RuntimeException e) {
                    String valueOf = String.valueOf(e.getMessage());
                    zzcb(valueOf.length() != 0 ? "Cannot show popup window: ".concat(valueOf) : new String("Cannot show popup window: "));
                    this.zzbyo.removeView(this.zzbnz.getView());
                    if (this.zzbyp != null) {
                        this.zzbyp.removeView(this.zzbyk);
                        this.zzbyp.addView(this.zzbnz.getView());
                        this.zzbnz.zza(this.zzapp);
                    }
                }
            }
        }
    }

    public void zza(int i, int i2, boolean z) {
        synchronized (this.zzako) {
            this.zzbyg = i;
            this.zzbyh = i2;
            if (this.zzbyn != null && z) {
                int[] zzot = zzot();
                if (zzot != null) {
                    this.zzbyn.update(com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzbxt, zzot[0]), com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzbxt, zzot[1]), this.zzbyn.getWidth(), this.zzbyn.getHeight());
                    zzc(zzot[0], zzot[1]);
                } else {
                    zzt(true);
                }
            }
        }
    }

    void zzb(int i, int i2) {
        if (this.zzbym != null) {
            this.zzbym.zza(i, i2, this.zzakh, this.zzaki);
        }
    }

    void zzc(int i, int i2) {
        zzb(i, i2 - com.google.android.gms.ads.internal.zzu.zzgm().zzk(this.zzbxt)[0], this.zzakh, this.zzaki);
    }

    public void zzd(int i, int i2) {
        this.zzbyg = i;
        this.zzbyh = i2;
    }

    boolean zzos() {
        return this.zzakh > -1 && this.zzaki > -1;
    }

    public boolean zzou() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzbyn != null;
        }
        return z;
    }

    boolean zzov() {
        int i;
        int i2;
        int[] zzi = com.google.android.gms.ads.internal.zzu.zzgm().zzi(this.zzbxt);
        int[] zzk = com.google.android.gms.ads.internal.zzu.zzgm().zzk(this.zzbxt);
        int i3 = zzi[0];
        int i4 = zzi[1];
        if (this.zzakh < 50 || this.zzakh > i3) {
            zzkx.zzdi("Width is too small or too large.");
            return false;
        } else if (this.zzaki < 50 || this.zzaki > i4) {
            zzkx.zzdi("Height is too small or too large.");
            return false;
        } else if (this.zzaki == i4 && this.zzakh == i3) {
            zzkx.zzdi("Cannot resize to a full-screen ad.");
            return false;
        } else {
            if (this.zzbyf) {
                String str = this.zzbye;
                char c = 65535;
                switch (str.hashCode()) {
                    case -1364013995:
                        if (str.equals("center")) {
                            c = 2;
                            break;
                        }
                        break;
                    case -1012429441:
                        if (str.equals("top-left")) {
                            c = 0;
                            break;
                        }
                        break;
                    case -655373719:
                        if (str.equals("bottom-left")) {
                            c = 3;
                            break;
                        }
                        break;
                    case 1163912186:
                        if (str.equals("bottom-right")) {
                            c = 5;
                            break;
                        }
                        break;
                    case 1288627767:
                        if (str.equals("bottom-center")) {
                            c = 4;
                            break;
                        }
                        break;
                    case 1755462605:
                        if (str.equals("top-center")) {
                            c = 1;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        i = this.zzbyi + this.zzbyg;
                        i2 = this.zzbyh + this.zzbyj;
                        break;
                    case 1:
                        i = ((this.zzbyg + this.zzbyi) + (this.zzakh / 2)) - 25;
                        i2 = this.zzbyh + this.zzbyj;
                        break;
                    case 2:
                        i = ((this.zzbyg + this.zzbyi) + (this.zzakh / 2)) - 25;
                        i2 = ((this.zzbyh + this.zzbyj) + (this.zzaki / 2)) - 25;
                        break;
                    case 3:
                        i = this.zzbyi + this.zzbyg;
                        i2 = ((this.zzbyh + this.zzbyj) + this.zzaki) - 50;
                        break;
                    case 4:
                        i = ((this.zzbyg + this.zzbyi) + (this.zzakh / 2)) - 25;
                        i2 = ((this.zzbyh + this.zzbyj) + this.zzaki) - 50;
                        break;
                    case 5:
                        i = ((this.zzbyg + this.zzbyi) + this.zzakh) - 50;
                        i2 = ((this.zzbyh + this.zzbyj) + this.zzaki) - 50;
                        break;
                    default:
                        i = ((this.zzbyg + this.zzbyi) + this.zzakh) - 50;
                        i2 = this.zzbyh + this.zzbyj;
                        break;
                }
                if (i < 0 || i + 50 > i3 || i2 < zzk[0] || i2 + 50 > zzk[1]) {
                    return false;
                }
            }
            return true;
        }
    }

    public void zzt(boolean z) {
        synchronized (this.zzako) {
            if (this.zzbyn != null) {
                this.zzbyn.dismiss();
                this.zzbyo.removeView(this.zzbnz.getView());
                if (this.zzbyp != null) {
                    this.zzbyp.removeView(this.zzbyk);
                    this.zzbyp.addView(this.zzbnz.getView());
                    this.zzbnz.zza(this.zzapp);
                }
                if (z) {
                    zzcd("default");
                    if (this.zzbym != null) {
                        this.zzbym.zzfc();
                    }
                }
                this.zzbyn = null;
                this.zzbyo = null;
                this.zzbyp = null;
                this.zzbyl = null;
            }
        }
    }
}
