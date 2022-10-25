package com.facebook.imagepipeline.producers;

import android.content.ContentResolver;
import android.media.ExifInterface;
import android.net.Uri;
import android.util.Pair;
import com.facebook.common.internal.ImmutableMap;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.util.UriUtil;
import com.facebook.imageformat.DefaultImageFormats;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.memory.PooledByteBufferFactory;
import com.facebook.imagepipeline.memory.PooledByteBufferInputStream;
import com.facebook.imagepipeline.request.ImageRequest;
import com.facebook.imageutils.BitmapUtil;
import com.facebook.imageutils.JfifUtil;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public class LocalExifThumbnailProducer implements ThumbnailProducer<EncodedImage> {
    private static final int COMMON_EXIF_THUMBNAIL_MAX_DIMENSION = 512;
    @VisibleForTesting
    static final String CREATED_THUMBNAIL = "createdThumbnail";
    public static final String PRODUCER_NAME = "LocalExifThumbnailProducer";
    private final ContentResolver mContentResolver;
    private final Executor mExecutor;
    private final PooledByteBufferFactory mPooledByteBufferFactory;

    public LocalExifThumbnailProducer(Executor executor, PooledByteBufferFactory pooledByteBufferFactory, ContentResolver contentResolver) {
        this.mExecutor = executor;
        this.mPooledByteBufferFactory = pooledByteBufferFactory;
        this.mContentResolver = contentResolver;
    }

    @Override // com.facebook.imagepipeline.producers.ThumbnailProducer
    public boolean canProvideImageForSize(ResizeOptions resizeOptions) {
        return ThumbnailSizeChecker.isImageBigEnough(512, 512, resizeOptions);
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
        ProducerListener listener = producerContext.getListener();
        String requestId = producerContext.getId();
        final ImageRequest imageRequest = producerContext.getImageRequest();
        final StatefulProducerRunnable cancellableProducerRunnable = new StatefulProducerRunnable<EncodedImage>(consumer, listener, PRODUCER_NAME, requestId) { // from class: com.facebook.imagepipeline.producers.LocalExifThumbnailProducer.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.common.executors.StatefulRunnable
            /* renamed from: getResult */
            public EncodedImage mo244getResult() throws Exception {
                Uri sourceUri = imageRequest.getSourceUri();
                ExifInterface exifInterface = LocalExifThumbnailProducer.this.getExifInterface(sourceUri);
                if (exifInterface == null || !exifInterface.hasThumbnail()) {
                    return null;
                }
                byte[] bytes = exifInterface.getThumbnail();
                PooledByteBuffer pooledByteBuffer = LocalExifThumbnailProducer.this.mPooledByteBufferFactory.mo233newByteBuffer(bytes);
                return LocalExifThumbnailProducer.this.buildEncodedImage(pooledByteBuffer, exifInterface);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.imagepipeline.producers.StatefulProducerRunnable, com.facebook.common.executors.StatefulRunnable
            public void disposeResult(EncodedImage result) {
                EncodedImage.closeSafely(result);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.imagepipeline.producers.StatefulProducerRunnable
            public Map<String, String> getExtraMapOnSuccess(EncodedImage result) {
                return ImmutableMap.of(LocalExifThumbnailProducer.CREATED_THUMBNAIL, Boolean.toString(result != null));
            }
        };
        producerContext.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.LocalExifThumbnailProducer.2
            @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
            public void onCancellationRequested() {
                cancellableProducerRunnable.cancel();
            }
        });
        this.mExecutor.execute(cancellableProducerRunnable);
    }

    @VisibleForTesting
    ExifInterface getExifInterface(Uri uri) throws IOException {
        String realPath = UriUtil.getRealPathFromUri(this.mContentResolver, uri);
        if (canReadAsFile(realPath)) {
            return new ExifInterface(realPath);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public EncodedImage buildEncodedImage(PooledByteBuffer imageBytes, ExifInterface exifInterface) {
        int height = -1;
        Pair<Integer, Integer> dimensions = BitmapUtil.decodeDimensions(new PooledByteBufferInputStream(imageBytes));
        int rotationAngle = getRotationAngle(exifInterface);
        int width = dimensions != null ? ((Integer) dimensions.first).intValue() : -1;
        if (dimensions != null) {
            height = ((Integer) dimensions.second).intValue();
        }
        CloseableReference<PooledByteBuffer> closeableByteBuffer = CloseableReference.of(imageBytes);
        try {
            EncodedImage encodedImage = new EncodedImage(closeableByteBuffer);
            CloseableReference.closeSafely(closeableByteBuffer);
            encodedImage.setImageFormat(DefaultImageFormats.JPEG);
            encodedImage.setRotationAngle(rotationAngle);
            encodedImage.setWidth(width);
            encodedImage.setHeight(height);
            return encodedImage;
        } catch (Throwable th) {
            CloseableReference.closeSafely(closeableByteBuffer);
            throw th;
        }
    }

    private int getRotationAngle(ExifInterface exifInterface) {
        return JfifUtil.getAutoRotateAngleFromOrientation(Integer.parseInt(exifInterface.getAttribute("Orientation")));
    }

    @VisibleForTesting
    boolean canReadAsFile(String realPath) throws IOException {
        if (realPath == null) {
            return false;
        }
        File file = new File(realPath);
        return file.exists() && file.canRead();
    }
}
