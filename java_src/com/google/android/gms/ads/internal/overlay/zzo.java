package com.google.android.gms.ads.internal.overlay;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzo extends FrameLayout implements View.OnClickListener {
    private final ImageButton zzccn;
    private final zzu zzcco;

    public zzo(Context context, int i, zzu zzuVar) {
        super(context);
        this.zzcco = zzuVar;
        setOnClickListener(this);
        this.zzccn = new ImageButton(context);
        this.zzccn.setImageResource(17301527);
        this.zzccn.setBackgroundColor(0);
        this.zzccn.setOnClickListener(this);
        this.zzccn.setPadding(0, 0, 0, 0);
        this.zzccn.setContentDescription("Interstitial close button");
        int zzb = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(context, i);
        addView(this.zzccn, new FrameLayout.LayoutParams(zzb, zzb, 17));
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (this.zzcco != null) {
            this.zzcco.zzpm();
        }
    }

    public void zza(boolean z, boolean z2) {
        if (!z2) {
            this.zzccn.setVisibility(0);
        } else if (z) {
            this.zzccn.setVisibility(4);
        } else {
            this.zzccn.setVisibility(8);
        }
    }
}
