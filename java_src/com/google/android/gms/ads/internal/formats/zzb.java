package com.google.android.gms.ads.internal.formats;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzji;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzb extends RelativeLayout {
    private static final float[] zzbmt = {5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f};
    private final RelativeLayout zzbmu;
    @Nullable
    private AnimationDrawable zzbmv;

    public zzb(Context context, zza zzaVar) {
        super(context);
        zzaa.zzy(zzaVar);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        switch (zzaVar.zzml()) {
            case 0:
                layoutParams.addRule(10);
                layoutParams.addRule(9);
                break;
            case 1:
            default:
                layoutParams.addRule(10);
                layoutParams.addRule(11);
                break;
            case 2:
                layoutParams.addRule(12);
                layoutParams.addRule(11);
                break;
            case 3:
                layoutParams.addRule(12);
                layoutParams.addRule(9);
                break;
        }
        ShapeDrawable shapeDrawable = new ShapeDrawable(new RoundRectShape(zzbmt, null, null));
        shapeDrawable.getPaint().setColor(zzaVar.getBackgroundColor());
        this.zzbmu = new RelativeLayout(context);
        this.zzbmu.setLayoutParams(layoutParams);
        zzu.zzgo().zza(this.zzbmu, shapeDrawable);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        if (!TextUtils.isEmpty(zzaVar.getText())) {
            RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
            TextView textView = new TextView(context);
            textView.setLayoutParams(layoutParams3);
            textView.setId(1195835393);
            textView.setTypeface(Typeface.DEFAULT);
            textView.setText(zzaVar.getText());
            textView.setTextColor(zzaVar.getTextColor());
            textView.setTextSize(zzaVar.getTextSize());
            textView.setPadding(zzm.zzkr().zzb(context, 4), 0, zzm.zzkr().zzb(context, 4), 0);
            this.zzbmu.addView(textView);
            layoutParams2.addRule(1, textView.getId());
        }
        ImageView imageView = new ImageView(context);
        imageView.setLayoutParams(layoutParams2);
        imageView.setId(1195835394);
        List<Drawable> zzmj = zzaVar.zzmj();
        if (zzmj.size() > 1) {
            this.zzbmv = new AnimationDrawable();
            for (Drawable drawable : zzmj) {
                this.zzbmv.addFrame(drawable, zzaVar.zzmk());
            }
            zzu.zzgo().zza(imageView, this.zzbmv);
        } else if (zzmj.size() == 1) {
            imageView.setImageDrawable(zzmj.get(0));
        }
        this.zzbmu.addView(imageView);
        addView(this.zzbmu);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        if (this.zzbmv != null) {
            this.zzbmv.start();
        }
        super.onAttachedToWindow();
    }

    public ViewGroup zzmm() {
        return this.zzbmu;
    }
}
