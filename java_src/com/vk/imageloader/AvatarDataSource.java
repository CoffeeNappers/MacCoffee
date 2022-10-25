package com.vk.imageloader;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.net.Uri;
import com.facebook.common.executors.CallerThreadExecutor;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.AbstractDataSource;
import com.facebook.datasource.BaseDataSubscriber;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.drawee.backends.pipeline.PipelineDraweeControllerBuilder;
import com.facebook.drawee.controller.AbstractDraweeControllerBuilder;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.datasource.ListDataSource;
import com.facebook.imagepipeline.image.CloseableBitmap;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.image.CloseableStaticBitmap;
import com.facebook.imagepipeline.image.ImmutableQualityInfo;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class AvatarDataSource extends AbstractDataSource<CloseableReference<CloseableImage>> {
    public static final String CHAT_AVATAR_SCHEME = "vkchatphoto";
    private final ListDataSource<CloseableImage> mDataSource;

    public static AvatarDataSource get(Uri uri) {
        String p;
        ArrayList<DataSource<CloseableReference<CloseableImage>>> dataSources = new ArrayList<>();
        for (int i = 0; i < 4 && (p = uri.getQueryParameter("photo" + i)) != null; i++) {
            dataSources.add(Fresco.getImagePipeline().fetchDecodedImage(ImageRequest.fromUri(p), null, PipelineDraweeControllerBuilder.convertCacheLevelToRequestLevel(AbstractDraweeControllerBuilder.CacheLevel.FULL_FETCH)));
        }
        if (dataSources.size() == 0) {
            return null;
        }
        return new AvatarDataSource(dataSources);
    }

    public AvatarDataSource(ArrayList<DataSource<CloseableReference<CloseableImage>>> mDataSources) {
        this.mDataSource = ListDataSource.create((DataSource[]) mDataSources.toArray(new DataSource[0]));
        this.mDataSource.subscribe(new BaseDataSubscriber<List<CloseableReference<CloseableImage>>>() { // from class: com.vk.imageloader.AvatarDataSource.1
            @Override // com.facebook.datasource.BaseDataSubscriber
            protected void onNewResultImpl(DataSource<List<CloseableReference<CloseableImage>>> dataSource) {
                AvatarDataSource.this.setResult(AvatarDataSource.processResult(dataSource.mo479getResult()), true);
            }

            @Override // com.facebook.datasource.BaseDataSubscriber
            protected void onFailureImpl(DataSource<List<CloseableReference<CloseableImage>>> dataSource) {
                AvatarDataSource.this.setResult(null, false);
            }
        }, CallerThreadExecutor.getInstance());
    }

    @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
    /* renamed from: getResult */
    public synchronized CloseableReference<CloseableImage> mo479getResult() {
        if (!super.hasResult() && this.mDataSource.hasResult()) {
            setResult(processResult(this.mDataSource.mo479getResult()), true);
        }
        return (CloseableReference) super.mo479getResult();
    }

    @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
    public boolean close() {
        return this.mDataSource.close();
    }

    @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
    public synchronized boolean hasResult() {
        return !super.hasResult() ? this.mDataSource.hasResult() : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static CloseableReference<CloseableImage> processResult(List<CloseableReference<CloseableImage>> res) {
        if (res == null || res.size() == 0) {
            return null;
        }
        if (res.size() == 1) {
            return res.get(0);
        }
        PlatformBitmapFactory platformBitmapFactory = Fresco.getImagePipelineFactory().getPlatformBitmapFactory();
        int bs = (int) (64.0f * Resources.getSystem().getDisplayMetrics().density);
        CloseableReference<Bitmap> resultBitmapRef = platformBitmapFactory.createBitmap(bs, bs);
        try {
            Bitmap resultBitmap = resultBitmapRef.get();
            Canvas canvas = new Canvas(resultBitmap);
            Rect src = ImageLoaderUtils.Rect1ThreadLocal.get();
            Rect dst = ImageLoaderUtils.Rect2ThreadLocal.get();
            int size = Math.min(res.size(), 4);
            for (int i = 0; i < size; i++) {
                CloseableReference<CloseableImage> imgRef = res.get(i);
                CloseableImage ci = imgRef.get();
                if (ci instanceof CloseableBitmap) {
                    Bitmap img = ((CloseableBitmap) ci).getUnderlyingBitmap();
                    initRects(i, size, src, dst, bs, img.getWidth(), img.getHeight());
                    canvas.drawBitmap(img, src, dst, ImageLoaderUtils.bitmapPaint);
                    CloseableReference.closeSafely(imgRef);
                } else {
                    CloseableReference.closeSafely(imgRef);
                }
            }
            return CloseableReference.of(new CloseableStaticBitmap(resultBitmapRef, ImmutableQualityInfo.FULL_QUALITY, 0));
        } finally {
            CloseableReference.closeSafely(resultBitmapRef);
        }
    }

    private static void initRects(int i, int size, Rect src, Rect dst, int bs, int iw, int ih) {
        if (size == 2) {
            if (i == 0) {
                dst.set(0, 0, bs / 2, bs);
                src.set(iw / 4, 0, (iw / 4) * 3, ih);
                return;
            }
            dst.set(bs / 2, 0, bs, bs);
            src.set(iw / 4, 0, (iw / 4) * 3, ih);
        } else if (size == 3) {
            if (i == 0) {
                dst.set(0, 0, bs / 2, bs);
                src.set(iw / 4, 0, (iw / 4) * 3, ih);
            } else if (i == 1) {
                dst.set(bs / 2, 0, bs, bs / 2);
                src.set(0, 0, iw, ih);
            } else {
                dst.set(bs / 2, bs / 2, bs, bs);
                src.set(0, 0, iw, ih);
            }
        } else if (size == 4) {
            if (i == 0) {
                dst.set(0, 0, bs / 2, bs / 2);
                src.set(0, 0, iw, ih);
            } else if (i == 1) {
                dst.set(0, bs / 2, bs / 2, bs);
                src.set(0, 0, iw, ih);
            } else if (i == 2) {
                dst.set(bs / 2, 0, bs, bs / 2);
                src.set(0, 0, iw, ih);
            } else {
                dst.set(bs / 2, bs / 2, bs, bs);
                src.set(0, 0, iw, ih);
            }
        }
    }
}
