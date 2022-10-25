package com.my.target.core.engines;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.View;
import android.view.ViewGroup;
import com.my.target.core.engines.b;
import com.my.target.core.ui.views.FSImageView;
import com.my.target.core.ui.views.controls.IconButton;
/* compiled from: FSImageAdEngine.java */
/* loaded from: classes2.dex */
public final class d extends a implements View.OnClickListener {
    private b.a c;
    private final com.my.target.core.facades.d d;
    private final com.my.target.core.models.banners.f e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(com.my.target.core.facades.d dVar, ViewGroup viewGroup, Context context) {
        super(viewGroup, context);
        Bitmap bitmap = null;
        this.d = dVar;
        FSImageView fSImageView = new FSImageView(context);
        fSImageView.b().setOnClickListener(this);
        fSImageView.a().setOnClickListener(this);
        this.e = dVar.b();
        fSImageView.setImages(this.e.e() != null ? this.e.e().getData() : null, this.e.d() != null ? this.e.d().getData() : null, this.e.a() != null ? this.e.a().getBitmap() : bitmap);
        if (this.e.getAgeRestrictions() != null && !this.e.getAgeRestrictions().equals("")) {
            fSImageView.setAgeRestrictions(this.e.getAgeRestrictions());
        }
        this.a.addView(fSImageView, new ViewGroup.LayoutParams(-1, -1));
        dVar.a(this.e);
    }

    @Override // com.my.target.core.engines.b
    public final void a(b.a aVar) {
        this.c = aVar;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        if (view instanceof IconButton) {
            if (this.c != null) {
                this.c.onCloseClick();
                return;
            }
            return;
        }
        this.d.b(this.e);
        if (this.c != null) {
            this.c.onClick(true);
        }
    }

    @Override // com.my.target.core.engines.b
    public final void g() {
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void e() {
        super.e();
        this.d.c();
    }
}
