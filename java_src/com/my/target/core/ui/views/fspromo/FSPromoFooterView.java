package com.my.target.core.ui.views.fspromo;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.util.Base64;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.my.target.Tracer;
import com.my.target.core.models.banners.g;
import com.my.target.core.utils.l;
import com.my.target.nativeads.models.ImageData;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class FSPromoFooterView extends RelativeLayout {
    private final RelativeLayout a;
    private final ImageView b;
    private final ImageView c;
    private final l d;
    private final boolean e;
    private View.OnClickListener f;

    public FSPromoFooterView(Context context, l lVar, boolean z) {
        super(context);
        this.f = new View.OnClickListener() { // from class: com.my.target.core.ui.views.fspromo.FSPromoFooterView.1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                try {
                    Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("https://target.my.com/"));
                    if (!(FSPromoFooterView.this.getContext() instanceof Activity)) {
                        intent.addFlags(268435456);
                    }
                    FSPromoFooterView.this.getContext().startActivity(intent);
                } catch (Throwable th) {
                    Tracer.d(th.getMessage());
                }
            }
        };
        this.a = new RelativeLayout(context);
        this.b = new ImageView(context);
        this.b.setContentDescription("fsmt");
        this.c = new ImageView(context);
        this.c.setContentDescription("fsst");
        this.d = lVar;
        this.e = z;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(12, -1);
        this.a.setLayoutParams(layoutParams);
        ImageView imageView = this.b;
        Context context = getContext();
        byte[] decode = Base64.decode("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", 0);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inDensity = 320;
        options.inTargetDensity = context.getResources().getDisplayMetrics().densityDpi;
        imageView.setImageBitmap(BitmapFactory.decodeByteArray(decode, 0, decode.length, options));
        this.a.addView(this.b);
        this.a.addView(this.c);
        addView(this.a);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(int i, boolean z) {
        int i2 = i / 3;
        if (this.e) {
            i2 = i / 5;
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(this.d.a(196), i2);
        if (z) {
            layoutParams.setMargins(this.d.a(8), this.d.a(4), this.d.a(8), this.d.a(16));
        } else {
            layoutParams.setMargins(this.d.a(24), this.d.a(16), this.d.a(18), this.d.a(16));
        }
        layoutParams.addRule(15, -1);
        if (l.c(17)) {
            layoutParams.addRule(20);
        } else {
            layoutParams.addRule(9);
        }
        this.c.setScaleType(ImageView.ScaleType.FIT_START);
        this.c.setLayoutParams(layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, i2);
        if (z) {
            layoutParams2.setMargins(this.d.a(8), this.d.a(4), this.d.a(8), this.d.a(16));
        } else {
            layoutParams2.setMargins(this.d.a(24), this.d.a(16), this.d.a(24), this.d.a(16));
        }
        layoutParams2.addRule(15, -1);
        if (l.c(18)) {
            layoutParams2.addRule(21);
        } else {
            layoutParams2.addRule(11);
        }
        this.b.setScaleType(ImageView.ScaleType.FIT_END);
        this.b.setLayoutParams(layoutParams2);
        this.b.setOnClickListener(this.f);
    }

    public void setBanner(g gVar) {
        ImageData e = gVar.e();
        if ("store".equals(gVar.getNavigationType()) && e != null && e.getData() != null) {
            this.c.setImageBitmap(e.getData());
        }
    }
}
