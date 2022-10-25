package com.my.target.core.net;

import android.content.Context;
import android.os.Looper;
import android.widget.ImageView;
import com.my.target.Tracer;
import com.my.target.core.async.commands.b;
import com.my.target.core.async.commands.f;
import com.my.target.core.models.h;
import com.my.target.core.ui.views.CacheImageView;
import com.my.target.nativeads.models.ImageData;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.List;
/* compiled from: MediaLoader.java */
/* loaded from: classes2.dex */
public final class b {
    private final HashMap<com.my.target.core.async.commands.b<h>, c> a;
    private b.a<h> b;

    /* compiled from: MediaLoader.java */
    /* loaded from: classes2.dex */
    public interface a {
        void onLoad();
    }

    /* synthetic */ b(byte b) {
        this();
    }

    public static b a() {
        return C0234b.a;
    }

    private b() {
        this.a = new HashMap<>();
        this.b = new b.a<h>() { // from class: com.my.target.core.net.b.1
            @Override // com.my.target.core.async.commands.b.a
            public final /* synthetic */ void onExecute(com.my.target.core.async.commands.b<h> bVar, h hVar) {
                h hVar2 = hVar;
                c cVar = (c) b.this.a.remove(bVar);
                if (cVar != null) {
                    b.b(cVar, hVar2);
                }
            }
        };
    }

    public final void a(List<h> list, Context context, a aVar) {
        if (context == null) {
            Tracer.d("Unable to load media: null context");
            return;
        }
        c cVar = new c(aVar, null, (byte) 0);
        cVar.c = list.size();
        for (h hVar : list) {
            a(hVar, cVar, context);
        }
    }

    public final void a(ImageData imageData, ImageView imageView) {
        if (imageData != null && imageView != null) {
            a(imageData, new c(null, imageView, (byte) 0), imageView.getContext());
        }
    }

    private void a(h hVar, c cVar, Context context) {
        if (hVar.getData() != null) {
            b(cVar, hVar);
            return;
        }
        f fVar = new f(hVar, context);
        this.a.put(fVar, cVar);
        fVar.a(this.b);
        fVar.b();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void b(c cVar, h hVar) {
        ImageView imageView;
        cVar.c--;
        if ((hVar instanceof ImageData) && cVar.b != null && hVar.getData() != null && (imageView = cVar.b.get()) != null) {
            if (Looper.getMainLooper().equals(Looper.myLooper())) {
                if (imageView instanceof CacheImageView) {
                    ((CacheImageView) imageView).setImageBitmap(((ImageData) hVar).getBitmap(), true);
                } else {
                    imageView.setImageBitmap(((ImageData) hVar).getBitmap());
                }
            } else {
                Tracer.d("Unable to set image: not main thread");
            }
        }
        if (cVar.c != 0 || cVar.a == null) {
            return;
        }
        cVar.a.onLoad();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: MediaLoader.java */
    /* loaded from: classes2.dex */
    public static class c {
        public final a a;
        public final WeakReference<ImageView> b;
        public int c;

        /* synthetic */ c(a aVar, ImageView imageView, byte b) {
            this(aVar, imageView);
        }

        private c(a aVar, ImageView imageView) {
            this.c = 1;
            this.a = aVar;
            if (imageView == null) {
                this.b = null;
            } else {
                this.b = new WeakReference<>(imageView);
            }
        }
    }

    /* compiled from: MediaLoader.java */
    /* renamed from: com.my.target.core.net.b$b  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    private static class C0234b {
        private static final b a = new b((byte) 0);
    }
}
