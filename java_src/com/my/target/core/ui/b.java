package com.my.target.core.ui;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.widget.LinearLayout;
import com.my.target.core.models.banners.h;
import com.my.target.core.ui.views.controls.IconButton;
import com.my.target.core.ui.views.video.VideoDialogView;
import com.my.target.core.ui.views.video.VideoTextureView;
import com.my.target.core.utils.l;
import com.my.target.nativeads.models.VideoData;
/* compiled from: VideoDialog.java */
/* loaded from: classes2.dex */
public final class b extends Dialog {
    private final VideoDialogView a;
    private final Bitmap b;
    private final Bitmap c;

    /* compiled from: VideoDialog.java */
    /* loaded from: classes2.dex */
    public interface a {
        void a();

        void a(View view);

        void b();

        void c();
    }

    public final IconButton a() {
        return this.a.a();
    }

    public b(Context context) {
        super(context);
        this.a = new VideoDialogView(getContext());
        l lVar = new l(getContext());
        this.b = com.my.target.core.resources.a.e(lVar.a(28));
        this.c = com.my.target.core.resources.a.c(lVar.a(28));
    }

    @Override // android.app.Dialog
    protected final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().setBackgroundDrawable(new ColorDrawable(ViewCompat.MEASURED_STATE_MASK));
        requestWindowFeature(1);
        this.a.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
        setContentView(this.a);
        getWindow().setLayout(-1, -1);
    }

    public final void a(a aVar) {
        this.a.setDialogListener(aVar);
        this.a.setDismissButtonListener(new View.OnClickListener() { // from class: com.my.target.core.ui.b.1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                b.this.dismiss();
            }
        });
    }

    public final void a(h hVar, VideoData videoData) {
        this.a.setData(hVar, videoData);
    }

    public final void b() {
        this.a.b();
    }

    public final void c() {
        this.a.f();
    }

    public final void d() {
        this.a.d();
    }

    public final void e() {
        this.a.e();
    }

    public final void a(VideoTextureView videoTextureView) {
        this.a.a(videoTextureView);
    }

    public final void f() {
        this.a.h();
    }

    public final void a(float f, float f2) {
        this.a.a(f, f2);
    }

    public final void a(boolean z) {
        if (z) {
            this.a.a().setBitmap(this.c, false);
        } else {
            this.a.a().setBitmap(this.b, false);
        }
    }
}
