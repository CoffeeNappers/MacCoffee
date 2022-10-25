package com.google.android.gms.common.images;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.widget.ImageView;
import com.google.android.gms.common.images.ImageManager;
import com.google.android.gms.common.internal.zzz;
import com.google.android.gms.internal.zzsj;
import com.google.android.gms.internal.zzsk;
import com.google.android.gms.internal.zzsl;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public abstract class zza {
    final C0047zza CD;
    protected int CF;
    protected int CE = 0;
    protected boolean CG = false;
    private boolean CH = true;
    private boolean CI = false;
    private boolean CJ = true;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.google.android.gms.common.images.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public static final class C0047zza {
        public final Uri uri;

        public C0047zza(Uri uri) {
            this.uri = uri;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C0047zza)) {
                return false;
            }
            if (this != obj) {
                return zzz.equal(((C0047zza) obj).uri, this.uri);
            }
            return true;
        }

        public int hashCode() {
            return zzz.hashCode(this.uri);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zza {
        private WeakReference<ImageView> CK;

        public zzb(ImageView imageView, int i) {
            super(null, i);
            com.google.android.gms.common.internal.zzc.zzu(imageView);
            this.CK = new WeakReference<>(imageView);
        }

        public zzb(ImageView imageView, Uri uri) {
            super(uri, 0);
            com.google.android.gms.common.internal.zzc.zzu(imageView);
            this.CK = new WeakReference<>(imageView);
        }

        private void zza(ImageView imageView, Drawable drawable, boolean z, boolean z2, boolean z3) {
            boolean z4 = !z2 && !z3;
            if (z4 && (imageView instanceof zzsk)) {
                int zzauy = ((zzsk) imageView).zzauy();
                if (this.CF != 0 && zzauy == this.CF) {
                    return;
                }
            }
            boolean zzc = zzc(z, z2);
            Drawable zza = zzc ? zza(imageView.getDrawable(), drawable) : drawable;
            imageView.setImageDrawable(zza);
            if (imageView instanceof zzsk) {
                zzsk zzskVar = (zzsk) imageView;
                zzskVar.zzr(z3 ? this.CD.uri : null);
                zzskVar.zzgi(z4 ? this.CF : 0);
            }
            if (zzc) {
                ((zzsj) zza).startTransition(250);
            }
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof zzb)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            ImageView imageView = this.CK.get();
            ImageView imageView2 = ((zzb) obj).CK.get();
            return (imageView2 == null || imageView == null || !zzz.equal(imageView2, imageView)) ? false : true;
        }

        public int hashCode() {
            return 0;
        }

        @Override // com.google.android.gms.common.images.zza
        protected void zza(Drawable drawable, boolean z, boolean z2, boolean z3) {
            ImageView imageView = this.CK.get();
            if (imageView != null) {
                zza(imageView, drawable, z, z2, z3);
            }
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zza {
        private WeakReference<ImageManager.OnImageLoadedListener> CL;

        public zzc(ImageManager.OnImageLoadedListener onImageLoadedListener, Uri uri) {
            super(uri, 0);
            com.google.android.gms.common.internal.zzc.zzu(onImageLoadedListener);
            this.CL = new WeakReference<>(onImageLoadedListener);
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof zzc)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            zzc zzcVar = (zzc) obj;
            ImageManager.OnImageLoadedListener onImageLoadedListener = this.CL.get();
            ImageManager.OnImageLoadedListener onImageLoadedListener2 = zzcVar.CL.get();
            return onImageLoadedListener2 != null && onImageLoadedListener != null && zzz.equal(onImageLoadedListener2, onImageLoadedListener) && zzz.equal(zzcVar.CD, this.CD);
        }

        public int hashCode() {
            return zzz.hashCode(this.CD);
        }

        @Override // com.google.android.gms.common.images.zza
        protected void zza(Drawable drawable, boolean z, boolean z2, boolean z3) {
            ImageManager.OnImageLoadedListener onImageLoadedListener;
            if (z2 || (onImageLoadedListener = this.CL.get()) == null) {
                return;
            }
            onImageLoadedListener.onImageLoaded(this.CD.uri, drawable, z3);
        }
    }

    public zza(Uri uri, int i) {
        this.CF = 0;
        this.CD = new C0047zza(uri);
        this.CF = i;
    }

    private Drawable zza(Context context, zzsl zzslVar, int i) {
        return context.getResources().getDrawable(i);
    }

    protected zzsj zza(Drawable drawable, Drawable drawable2) {
        if (drawable == null) {
            drawable = null;
        } else if (drawable instanceof zzsj) {
            drawable = ((zzsj) drawable).zzauw();
        }
        return new zzsj(drawable, drawable2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(Context context, Bitmap bitmap, boolean z) {
        com.google.android.gms.common.internal.zzc.zzu(bitmap);
        zza(new BitmapDrawable(context.getResources(), bitmap), z, false, true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(Context context, zzsl zzslVar) {
        if (this.CJ) {
            zza(null, false, true, false);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(Context context, zzsl zzslVar, boolean z) {
        Drawable drawable = null;
        if (this.CF != 0) {
            drawable = zza(context, zzslVar, this.CF);
        }
        zza(drawable, z, false, false);
    }

    protected abstract void zza(Drawable drawable, boolean z, boolean z2, boolean z3);

    protected boolean zzc(boolean z, boolean z2) {
        return this.CH && !z2 && !z;
    }

    public void zzgg(int i) {
        this.CF = i;
    }
}
