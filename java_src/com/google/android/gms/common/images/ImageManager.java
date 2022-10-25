package com.google.android.gms.common.images;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.ResultReceiver;
import android.os.SystemClock;
import android.support.v4.util.LruCache;
import android.util.Log;
import android.widget.ImageView;
import com.google.android.gms.common.annotation.KeepName;
import com.google.android.gms.common.images.zza;
import com.google.android.gms.common.util.zzs;
import com.google.android.gms.internal.zzsl;
import com.vkontakte.android.TimeUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes2.dex */
public final class ImageManager {
    private static final Object Co = new Object();
    private static HashSet<Uri> Cp = new HashSet<>();
    private static ImageManager Cq;
    private static ImageManager Cr;
    private final zzb Ct;
    private final zzsl Cu;
    private final Map<com.google.android.gms.common.images.zza, ImageReceiver> Cv;
    private final Map<Uri, ImageReceiver> Cw;
    private final Map<Uri, Long> Cx;
    private final Context mContext;
    private final Handler mHandler = new Handler(Looper.getMainLooper());
    private final ExecutorService Cs = Executors.newFixedThreadPool(4);

    /* JADX INFO: Access modifiers changed from: private */
    @KeepName
    /* loaded from: classes2.dex */
    public final class ImageReceiver extends ResultReceiver {
        private final ArrayList<com.google.android.gms.common.images.zza> Cy;
        private final Uri mUri;

        ImageReceiver(Uri uri) {
            super(new Handler(Looper.getMainLooper()));
            this.mUri = uri;
            this.Cy = new ArrayList<>();
        }

        @Override // android.os.ResultReceiver
        public void onReceiveResult(int i, Bundle bundle) {
            ImageManager.this.Cs.execute(new zzc(this.mUri, (ParcelFileDescriptor) bundle.getParcelable("com.google.android.gms.extra.fileDescriptor")));
        }

        public void zzauv() {
            Intent intent = new Intent("com.google.android.gms.common.images.LOAD_IMAGE");
            intent.putExtra("com.google.android.gms.extras.uri", this.mUri);
            intent.putExtra("com.google.android.gms.extras.resultReceiver", this);
            intent.putExtra("com.google.android.gms.extras.priority", 3);
            ImageManager.this.mContext.sendBroadcast(intent);
        }

        public void zzb(com.google.android.gms.common.images.zza zzaVar) {
            com.google.android.gms.common.internal.zzc.zzhs("ImageReceiver.addImageRequest() must be called in the main thread");
            this.Cy.add(zzaVar);
        }

        public void zzc(com.google.android.gms.common.images.zza zzaVar) {
            com.google.android.gms.common.internal.zzc.zzhs("ImageReceiver.removeImageRequest() must be called in the main thread");
            this.Cy.remove(zzaVar);
        }
    }

    /* loaded from: classes2.dex */
    public interface OnImageLoadedListener {
        void onImageLoaded(Uri uri, Drawable drawable, boolean z);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @TargetApi(11)
    /* loaded from: classes2.dex */
    public static final class zza {
        static int zza(ActivityManager activityManager) {
            return activityManager.getLargeMemoryClass();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class zzb extends LruCache<zza.C0047zza, Bitmap> {
        public zzb(Context context) {
            super(zzbz(context));
        }

        @TargetApi(11)
        private static int zzbz(Context context) {
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            return (int) (((!((context.getApplicationInfo().flags & 1048576) != 0) || !zzs.zzayn()) ? activityManager.getMemoryClass() : zza.zza(activityManager)) * 1048576 * 0.33f);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.support.v4.util.LruCache
        /* renamed from: zza */
        public int sizeOf(zza.C0047zza c0047zza, Bitmap bitmap) {
            return bitmap.getHeight() * bitmap.getRowBytes();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.support.v4.util.LruCache
        /* renamed from: zza */
        public void entryRemoved(boolean z, zza.C0047zza c0047zza, Bitmap bitmap, Bitmap bitmap2) {
            super.entryRemoved(z, c0047zza, bitmap, bitmap2);
        }
    }

    /* loaded from: classes2.dex */
    private final class zzc implements Runnable {
        private final ParcelFileDescriptor CA;
        private final Uri mUri;

        public zzc(Uri uri, ParcelFileDescriptor parcelFileDescriptor) {
            this.mUri = uri;
            this.CA = parcelFileDescriptor;
        }

        @Override // java.lang.Runnable
        public void run() {
            com.google.android.gms.common.internal.zzc.zzht("LoadBitmapFromDiskRunnable can't be executed in the main thread");
            boolean z = false;
            Bitmap bitmap = null;
            if (this.CA != null) {
                try {
                    bitmap = BitmapFactory.decodeFileDescriptor(this.CA.getFileDescriptor());
                } catch (OutOfMemoryError e) {
                    String valueOf = String.valueOf(this.mUri);
                    Log.e("ImageManager", new StringBuilder(String.valueOf(valueOf).length() + 34).append("OOM while loading bitmap for uri: ").append(valueOf).toString(), e);
                    z = true;
                }
                try {
                    this.CA.close();
                } catch (IOException e2) {
                    Log.e("ImageManager", "closed failed", e2);
                }
            }
            CountDownLatch countDownLatch = new CountDownLatch(1);
            ImageManager.this.mHandler.post(new zzf(this.mUri, bitmap, z, countDownLatch));
            try {
                countDownLatch.await();
            } catch (InterruptedException e3) {
                String valueOf2 = String.valueOf(this.mUri);
                Log.w("ImageManager", new StringBuilder(String.valueOf(valueOf2).length() + 32).append("Latch interrupted while posting ").append(valueOf2).toString());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class zzd implements Runnable {
        private final com.google.android.gms.common.images.zza CB;

        public zzd(com.google.android.gms.common.images.zza zzaVar) {
            this.CB = zzaVar;
        }

        @Override // java.lang.Runnable
        public void run() {
            com.google.android.gms.common.internal.zzc.zzhs("LoadImageRunnable must be executed on the main thread");
            ImageReceiver imageReceiver = (ImageReceiver) ImageManager.this.Cv.get(this.CB);
            if (imageReceiver != null) {
                ImageManager.this.Cv.remove(this.CB);
                imageReceiver.zzc(this.CB);
            }
            zza.C0047zza c0047zza = this.CB.CD;
            if (c0047zza.uri == null) {
                this.CB.zza(ImageManager.this.mContext, ImageManager.this.Cu, true);
                return;
            }
            Bitmap zza = ImageManager.this.zza(c0047zza);
            if (zza != null) {
                this.CB.zza(ImageManager.this.mContext, zza, true);
                return;
            }
            Long l = (Long) ImageManager.this.Cx.get(c0047zza.uri);
            if (l != null) {
                if (SystemClock.elapsedRealtime() - l.longValue() < TimeUtils.HOUR) {
                    this.CB.zza(ImageManager.this.mContext, ImageManager.this.Cu, true);
                    return;
                }
                ImageManager.this.Cx.remove(c0047zza.uri);
            }
            this.CB.zza(ImageManager.this.mContext, ImageManager.this.Cu);
            ImageReceiver imageReceiver2 = (ImageReceiver) ImageManager.this.Cw.get(c0047zza.uri);
            if (imageReceiver2 == null) {
                imageReceiver2 = new ImageReceiver(c0047zza.uri);
                ImageManager.this.Cw.put(c0047zza.uri, imageReceiver2);
            }
            imageReceiver2.zzb(this.CB);
            if (!(this.CB instanceof zza.zzc)) {
                ImageManager.this.Cv.put(this.CB, imageReceiver2);
            }
            synchronized (ImageManager.Co) {
                if (!ImageManager.Cp.contains(c0047zza.uri)) {
                    ImageManager.Cp.add(c0047zza.uri);
                    imageReceiver2.zzauv();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @TargetApi(14)
    /* loaded from: classes2.dex */
    public static final class zze implements ComponentCallbacks2 {
        private final zzb Ct;

        public zze(zzb zzbVar) {
            this.Ct = zzbVar;
        }

        @Override // android.content.ComponentCallbacks
        public void onConfigurationChanged(Configuration configuration) {
        }

        @Override // android.content.ComponentCallbacks
        public void onLowMemory() {
            this.Ct.evictAll();
        }

        @Override // android.content.ComponentCallbacks2
        public void onTrimMemory(int i) {
            if (i >= 60) {
                this.Ct.evictAll();
            } else if (i < 20) {
            } else {
                this.Ct.trimToSize(this.Ct.size() / 2);
            }
        }
    }

    /* loaded from: classes2.dex */
    private final class zzf implements Runnable {
        private boolean CC;
        private final Bitmap mBitmap;
        private final Uri mUri;
        private final CountDownLatch zzank;

        public zzf(Uri uri, Bitmap bitmap, boolean z, CountDownLatch countDownLatch) {
            this.mUri = uri;
            this.mBitmap = bitmap;
            this.CC = z;
            this.zzank = countDownLatch;
        }

        private void zza(ImageReceiver imageReceiver, boolean z) {
            ArrayList arrayList = imageReceiver.Cy;
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                com.google.android.gms.common.images.zza zzaVar = (com.google.android.gms.common.images.zza) arrayList.get(i);
                if (z) {
                    zzaVar.zza(ImageManager.this.mContext, this.mBitmap, false);
                } else {
                    ImageManager.this.Cx.put(this.mUri, Long.valueOf(SystemClock.elapsedRealtime()));
                    zzaVar.zza(ImageManager.this.mContext, ImageManager.this.Cu, false);
                }
                if (!(zzaVar instanceof zza.zzc)) {
                    ImageManager.this.Cv.remove(zzaVar);
                }
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            com.google.android.gms.common.internal.zzc.zzhs("OnBitmapLoadedRunnable must be executed in the main thread");
            boolean z = this.mBitmap != null;
            if (ImageManager.this.Ct != null) {
                if (this.CC) {
                    ImageManager.this.Ct.evictAll();
                    System.gc();
                    this.CC = false;
                    ImageManager.this.mHandler.post(this);
                    return;
                } else if (z) {
                    ImageManager.this.Ct.put(new zza.C0047zza(this.mUri), this.mBitmap);
                }
            }
            ImageReceiver imageReceiver = (ImageReceiver) ImageManager.this.Cw.remove(this.mUri);
            if (imageReceiver != null) {
                zza(imageReceiver, z);
            }
            this.zzank.countDown();
            synchronized (ImageManager.Co) {
                ImageManager.Cp.remove(this.mUri);
            }
        }
    }

    private ImageManager(Context context, boolean z) {
        this.mContext = context.getApplicationContext();
        if (z) {
            this.Ct = new zzb(this.mContext);
            if (zzs.zzayq()) {
                zzaut();
            }
        } else {
            this.Ct = null;
        }
        this.Cu = new zzsl();
        this.Cv = new HashMap();
        this.Cw = new HashMap();
        this.Cx = new HashMap();
    }

    public static ImageManager create(Context context) {
        return zzg(context, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Bitmap zza(zza.C0047zza c0047zza) {
        if (this.Ct == null) {
            return null;
        }
        return this.Ct.get(c0047zza);
    }

    @TargetApi(14)
    private void zzaut() {
        this.mContext.registerComponentCallbacks(new zze(this.Ct));
    }

    public static ImageManager zzg(Context context, boolean z) {
        if (z) {
            if (Cr == null) {
                Cr = new ImageManager(context, true);
            }
            return Cr;
        }
        if (Cq == null) {
            Cq = new ImageManager(context, false);
        }
        return Cq;
    }

    public void loadImage(ImageView imageView, int i) {
        zza(new zza.zzb(imageView, i));
    }

    public void loadImage(ImageView imageView, Uri uri) {
        zza(new zza.zzb(imageView, uri));
    }

    public void loadImage(ImageView imageView, Uri uri, int i) {
        zza.zzb zzbVar = new zza.zzb(imageView, uri);
        zzbVar.zzgg(i);
        zza(zzbVar);
    }

    public void loadImage(OnImageLoadedListener onImageLoadedListener, Uri uri) {
        zza(new zza.zzc(onImageLoadedListener, uri));
    }

    public void loadImage(OnImageLoadedListener onImageLoadedListener, Uri uri, int i) {
        zza.zzc zzcVar = new zza.zzc(onImageLoadedListener, uri);
        zzcVar.zzgg(i);
        zza(zzcVar);
    }

    public void zza(com.google.android.gms.common.images.zza zzaVar) {
        com.google.android.gms.common.internal.zzc.zzhs("ImageManager.loadImage() must be called in the main thread");
        new zzd(zzaVar).run();
    }
}
