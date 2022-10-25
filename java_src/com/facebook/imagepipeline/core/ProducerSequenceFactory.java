package com.facebook.imagepipeline.core;

import android.net.Uri;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.media.MediaUtils;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.util.UriUtil;
import com.facebook.common.webp.WebpSupportStatus;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.producers.BitmapMemoryCacheKeyMultiplexProducer;
import com.facebook.imagepipeline.producers.BitmapMemoryCacheProducer;
import com.facebook.imagepipeline.producers.DecodeProducer;
import com.facebook.imagepipeline.producers.EncodedMemoryCacheProducer;
import com.facebook.imagepipeline.producers.LocalAssetFetchProducer;
import com.facebook.imagepipeline.producers.LocalContentUriFetchProducer;
import com.facebook.imagepipeline.producers.LocalFileFetchProducer;
import com.facebook.imagepipeline.producers.LocalResourceFetchProducer;
import com.facebook.imagepipeline.producers.LocalVideoThumbnailProducer;
import com.facebook.imagepipeline.producers.NetworkFetcher;
import com.facebook.imagepipeline.producers.PostprocessedBitmapMemoryCacheProducer;
import com.facebook.imagepipeline.producers.PostprocessorProducer;
import com.facebook.imagepipeline.producers.Producer;
import com.facebook.imagepipeline.producers.RemoveImageTransformMetaDataProducer;
import com.facebook.imagepipeline.producers.SwallowResultProducer;
import com.facebook.imagepipeline.producers.ThreadHandoffProducer;
import com.facebook.imagepipeline.producers.ThreadHandoffProducerQueue;
import com.facebook.imagepipeline.producers.ThrottlingProducer;
import com.facebook.imagepipeline.producers.ThumbnailBranchProducer;
import com.facebook.imagepipeline.producers.ThumbnailProducer;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class ProducerSequenceFactory {
    @VisibleForTesting
    Producer<EncodedImage> mBackgroundLocalFileFetchToEncodedMemorySequence;
    @VisibleForTesting
    Producer<EncodedImage> mBackgroundNetworkFetchToEncodedMemorySequence;
    private Producer<EncodedImage> mCommonNetworkFetchToEncodedMemorySequence;
    @VisibleForTesting
    Producer<CloseableReference<CloseableImage>> mDataFetchSequence;
    @VisibleForTesting
    Producer<CloseableReference<CloseableImage>> mLocalAssetFetchSequence;
    @VisibleForTesting
    Producer<CloseableReference<CloseableImage>> mLocalContentUriFetchSequence;
    @VisibleForTesting
    Producer<CloseableReference<PooledByteBuffer>> mLocalFileEncodedImageProducerSequence;
    @VisibleForTesting
    Producer<Void> mLocalFileFetchToEncodedMemoryPrefetchSequence;
    @VisibleForTesting
    Producer<CloseableReference<CloseableImage>> mLocalImageFileFetchSequence;
    @VisibleForTesting
    Producer<CloseableReference<CloseableImage>> mLocalResourceFetchSequence;
    @VisibleForTesting
    Producer<CloseableReference<CloseableImage>> mLocalVideoFileFetchSequence;
    @VisibleForTesting
    Producer<CloseableReference<PooledByteBuffer>> mNetworkEncodedImageProducerSequence;
    @VisibleForTesting
    Producer<CloseableReference<CloseableImage>> mNetworkFetchSequence;
    @VisibleForTesting
    Producer<Void> mNetworkFetchToEncodedMemoryPrefetchSequence;
    private final NetworkFetcher mNetworkFetcher;
    private final ProducerFactory mProducerFactory;
    private final boolean mResizeAndRotateEnabledForNetwork;
    private final ThreadHandoffProducerQueue mThreadHandoffProducerQueue;
    private final boolean mUseDownsamplingRatio;
    private final boolean mWebpSupportEnabled;
    @VisibleForTesting
    Map<Producer<CloseableReference<CloseableImage>>, Producer<CloseableReference<CloseableImage>>> mPostprocessorSequences = new HashMap();
    @VisibleForTesting
    Map<Producer<CloseableReference<CloseableImage>>, Producer<Void>> mCloseableImagePrefetchSequences = new HashMap();

    public ProducerSequenceFactory(ProducerFactory producerFactory, NetworkFetcher networkFetcher, boolean resizeAndRotateEnabledForNetwork, boolean webpSupportEnabled, ThreadHandoffProducerQueue threadHandoffProducerQueue, boolean useDownsamplingRatio) {
        this.mProducerFactory = producerFactory;
        this.mNetworkFetcher = networkFetcher;
        this.mResizeAndRotateEnabledForNetwork = resizeAndRotateEnabledForNetwork;
        this.mWebpSupportEnabled = webpSupportEnabled;
        this.mThreadHandoffProducerQueue = threadHandoffProducerQueue;
        this.mUseDownsamplingRatio = useDownsamplingRatio;
    }

    public Producer<CloseableReference<PooledByteBuffer>> getEncodedImageProducerSequence(ImageRequest imageRequest) {
        validateEncodedImageRequest(imageRequest);
        Uri uri = imageRequest.getSourceUri();
        if (UriUtil.isNetworkUri(uri)) {
            return getNetworkFetchEncodedImageProducerSequence();
        }
        if (UriUtil.isLocalFileUri(uri)) {
            return getLocalFileFetchEncodedImageProducerSequence();
        }
        throw new IllegalArgumentException("Unsupported uri scheme for encoded image fetch! Uri is: " + getShortenedUriString(uri));
    }

    public Producer<CloseableReference<PooledByteBuffer>> getNetworkFetchEncodedImageProducerSequence() {
        synchronized (this) {
            if (this.mNetworkEncodedImageProducerSequence == null) {
                this.mNetworkEncodedImageProducerSequence = new RemoveImageTransformMetaDataProducer(getBackgroundNetworkFetchToEncodedMemorySequence());
            }
        }
        return this.mNetworkEncodedImageProducerSequence;
    }

    public Producer<CloseableReference<PooledByteBuffer>> getLocalFileFetchEncodedImageProducerSequence() {
        synchronized (this) {
            if (this.mLocalFileEncodedImageProducerSequence == null) {
                this.mLocalFileEncodedImageProducerSequence = new RemoveImageTransformMetaDataProducer(getBackgroundLocalFileFetchToEncodeMemorySequence());
            }
        }
        return this.mLocalFileEncodedImageProducerSequence;
    }

    public Producer<Void> getEncodedImagePrefetchProducerSequence(ImageRequest imageRequest) {
        validateEncodedImageRequest(imageRequest);
        Uri uri = imageRequest.getSourceUri();
        if (UriUtil.isNetworkUri(uri)) {
            return getNetworkFetchToEncodedMemoryPrefetchSequence();
        }
        if (UriUtil.isLocalFileUri(uri)) {
            return getLocalFileFetchToEncodedMemoryPrefetchSequence();
        }
        throw new IllegalArgumentException("Unsupported uri scheme for encoded image fetch! Uri is: " + getShortenedUriString(uri));
    }

    private static void validateEncodedImageRequest(ImageRequest imageRequest) {
        Preconditions.checkNotNull(imageRequest);
        Preconditions.checkArgument(imageRequest.getLowestPermittedRequestLevel().getValue() <= ImageRequest.RequestLevel.ENCODED_MEMORY_CACHE.getValue());
    }

    public Producer<CloseableReference<CloseableImage>> getDecodedImageProducerSequence(ImageRequest imageRequest) {
        Producer<CloseableReference<CloseableImage>> pipelineSequence = getBasicDecodedImageSequence(imageRequest);
        if (imageRequest.getPostprocessor() != null) {
            return getPostprocessorSequence(pipelineSequence);
        }
        return pipelineSequence;
    }

    public Producer<Void> getDecodedImagePrefetchProducerSequence(ImageRequest imageRequest) {
        return getDecodedImagePrefetchSequence(getBasicDecodedImageSequence(imageRequest));
    }

    private Producer<CloseableReference<CloseableImage>> getBasicDecodedImageSequence(ImageRequest imageRequest) {
        Preconditions.checkNotNull(imageRequest);
        Uri uri = imageRequest.getSourceUri();
        Preconditions.checkNotNull(uri, "Uri is null.");
        if (UriUtil.isNetworkUri(uri)) {
            return getNetworkFetchSequence();
        }
        if (UriUtil.isLocalFileUri(uri)) {
            if (MediaUtils.isVideo(MediaUtils.extractMime(uri.getPath()))) {
                return getLocalVideoFileFetchSequence();
            }
            return getLocalImageFileFetchSequence();
        } else if (UriUtil.isLocalContentUri(uri)) {
            return getLocalContentUriFetchSequence();
        } else {
            if (UriUtil.isLocalAssetUri(uri)) {
                return getLocalAssetFetchSequence();
            }
            if (UriUtil.isLocalResourceUri(uri)) {
                return getLocalResourceFetchSequence();
            }
            if (UriUtil.isDataUri(uri)) {
                return getDataFetchSequence();
            }
            throw new IllegalArgumentException("Unsupported uri scheme! Uri is: " + getShortenedUriString(uri));
        }
    }

    private synchronized Producer<CloseableReference<CloseableImage>> getNetworkFetchSequence() {
        if (this.mNetworkFetchSequence == null) {
            this.mNetworkFetchSequence = newBitmapCacheGetToDecodeSequence(getCommonNetworkFetchToEncodedMemorySequence());
        }
        return this.mNetworkFetchSequence;
    }

    private synchronized Producer<EncodedImage> getBackgroundNetworkFetchToEncodedMemorySequence() {
        if (this.mBackgroundNetworkFetchToEncodedMemorySequence == null) {
            this.mBackgroundNetworkFetchToEncodedMemorySequence = this.mProducerFactory.newBackgroundThreadHandoffProducer(getCommonNetworkFetchToEncodedMemorySequence(), this.mThreadHandoffProducerQueue);
        }
        return this.mBackgroundNetworkFetchToEncodedMemorySequence;
    }

    private synchronized Producer<Void> getNetworkFetchToEncodedMemoryPrefetchSequence() {
        if (this.mNetworkFetchToEncodedMemoryPrefetchSequence == null) {
            this.mNetworkFetchToEncodedMemoryPrefetchSequence = ProducerFactory.newSwallowResultProducer(getBackgroundNetworkFetchToEncodedMemorySequence());
        }
        return this.mNetworkFetchToEncodedMemoryPrefetchSequence;
    }

    private synchronized Producer<EncodedImage> getCommonNetworkFetchToEncodedMemorySequence() {
        if (this.mCommonNetworkFetchToEncodedMemorySequence == null) {
            Producer<EncodedImage> inputProducer = newEncodedCacheMultiplexToTranscodeSequence(this.mProducerFactory.newNetworkFetchProducer(this.mNetworkFetcher));
            this.mCommonNetworkFetchToEncodedMemorySequence = ProducerFactory.newAddImageTransformMetaDataProducer(inputProducer);
            this.mCommonNetworkFetchToEncodedMemorySequence = this.mProducerFactory.newResizeAndRotateProducer(this.mCommonNetworkFetchToEncodedMemorySequence, this.mResizeAndRotateEnabledForNetwork, this.mUseDownsamplingRatio);
        }
        return this.mCommonNetworkFetchToEncodedMemorySequence;
    }

    private synchronized Producer<Void> getLocalFileFetchToEncodedMemoryPrefetchSequence() {
        if (this.mLocalFileFetchToEncodedMemoryPrefetchSequence == null) {
            this.mLocalFileFetchToEncodedMemoryPrefetchSequence = ProducerFactory.newSwallowResultProducer(getBackgroundLocalFileFetchToEncodeMemorySequence());
        }
        return this.mLocalFileFetchToEncodedMemoryPrefetchSequence;
    }

    private synchronized Producer<EncodedImage> getBackgroundLocalFileFetchToEncodeMemorySequence() {
        if (this.mBackgroundLocalFileFetchToEncodedMemorySequence == null) {
            LocalFileFetchProducer localFileFetchProducer = this.mProducerFactory.newLocalFileFetchProducer();
            Producer<EncodedImage> toEncodedMultiplexProducer = newEncodedCacheMultiplexToTranscodeSequence(localFileFetchProducer);
            this.mBackgroundLocalFileFetchToEncodedMemorySequence = this.mProducerFactory.newBackgroundThreadHandoffProducer(toEncodedMultiplexProducer, this.mThreadHandoffProducerQueue);
        }
        return this.mBackgroundLocalFileFetchToEncodedMemorySequence;
    }

    private synchronized Producer<CloseableReference<CloseableImage>> getLocalImageFileFetchSequence() {
        if (this.mLocalImageFileFetchSequence == null) {
            LocalFileFetchProducer localFileFetchProducer = this.mProducerFactory.newLocalFileFetchProducer();
            this.mLocalImageFileFetchSequence = newBitmapCacheGetToLocalTransformSequence(localFileFetchProducer);
        }
        return this.mLocalImageFileFetchSequence;
    }

    private synchronized Producer<CloseableReference<CloseableImage>> getLocalVideoFileFetchSequence() {
        if (this.mLocalVideoFileFetchSequence == null) {
            LocalVideoThumbnailProducer localVideoThumbnailProducer = this.mProducerFactory.newLocalVideoThumbnailProducer();
            this.mLocalVideoFileFetchSequence = newBitmapCacheGetToBitmapCacheSequence(localVideoThumbnailProducer);
        }
        return this.mLocalVideoFileFetchSequence;
    }

    private synchronized Producer<CloseableReference<CloseableImage>> getLocalContentUriFetchSequence() {
        if (this.mLocalContentUriFetchSequence == null) {
            LocalContentUriFetchProducer localContentUriFetchProducer = this.mProducerFactory.newLocalContentUriFetchProducer();
            ThumbnailProducer<EncodedImage>[] thumbnailProducers = {this.mProducerFactory.newLocalContentUriThumbnailFetchProducer(), this.mProducerFactory.newLocalExifThumbnailProducer()};
            this.mLocalContentUriFetchSequence = newBitmapCacheGetToLocalTransformSequence(localContentUriFetchProducer, thumbnailProducers);
        }
        return this.mLocalContentUriFetchSequence;
    }

    private synchronized Producer<CloseableReference<CloseableImage>> getLocalResourceFetchSequence() {
        if (this.mLocalResourceFetchSequence == null) {
            LocalResourceFetchProducer localResourceFetchProducer = this.mProducerFactory.newLocalResourceFetchProducer();
            this.mLocalResourceFetchSequence = newBitmapCacheGetToLocalTransformSequence(localResourceFetchProducer);
        }
        return this.mLocalResourceFetchSequence;
    }

    private synchronized Producer<CloseableReference<CloseableImage>> getLocalAssetFetchSequence() {
        if (this.mLocalAssetFetchSequence == null) {
            LocalAssetFetchProducer localAssetFetchProducer = this.mProducerFactory.newLocalAssetFetchProducer();
            this.mLocalAssetFetchSequence = newBitmapCacheGetToLocalTransformSequence(localAssetFetchProducer);
        }
        return this.mLocalAssetFetchSequence;
    }

    private synchronized Producer<CloseableReference<CloseableImage>> getDataFetchSequence() {
        if (this.mDataFetchSequence == null) {
            Producer<EncodedImage> inputProducer = this.mProducerFactory.newDataFetchProducer();
            if (WebpSupportStatus.sIsWebpSupportRequired && (!this.mWebpSupportEnabled || WebpSupportStatus.sWebpBitmapFactory == null)) {
                inputProducer = this.mProducerFactory.newWebpTranscodeProducer(inputProducer);
            }
            ProducerFactory producerFactory = this.mProducerFactory;
            this.mDataFetchSequence = newBitmapCacheGetToDecodeSequence(this.mProducerFactory.newResizeAndRotateProducer(ProducerFactory.newAddImageTransformMetaDataProducer(inputProducer), true, this.mUseDownsamplingRatio));
        }
        return this.mDataFetchSequence;
    }

    private Producer<CloseableReference<CloseableImage>> newBitmapCacheGetToLocalTransformSequence(Producer<EncodedImage> inputProducer) {
        ThumbnailProducer<EncodedImage>[] defaultThumbnailProducers = {this.mProducerFactory.newLocalExifThumbnailProducer()};
        return newBitmapCacheGetToLocalTransformSequence(inputProducer, defaultThumbnailProducers);
    }

    private Producer<CloseableReference<CloseableImage>> newBitmapCacheGetToLocalTransformSequence(Producer<EncodedImage> inputProducer, ThumbnailProducer<EncodedImage>[] thumbnailProducers) {
        Producer<EncodedImage> inputProducerAfterDecode = newLocalTransformationsSequence(newEncodedCacheMultiplexToTranscodeSequence(inputProducer), thumbnailProducers);
        return newBitmapCacheGetToDecodeSequence(inputProducerAfterDecode);
    }

    private Producer<CloseableReference<CloseableImage>> newBitmapCacheGetToDecodeSequence(Producer<EncodedImage> inputProducer) {
        DecodeProducer decodeProducer = this.mProducerFactory.newDecodeProducer(inputProducer);
        return newBitmapCacheGetToBitmapCacheSequence(decodeProducer);
    }

    private Producer<EncodedImage> newEncodedCacheMultiplexToTranscodeSequence(Producer<EncodedImage> inputProducer) {
        if (WebpSupportStatus.sIsWebpSupportRequired && (!this.mWebpSupportEnabled || WebpSupportStatus.sWebpBitmapFactory == null)) {
            inputProducer = this.mProducerFactory.newWebpTranscodeProducer(inputProducer);
        }
        EncodedMemoryCacheProducer encodedMemoryCacheProducer = this.mProducerFactory.newEncodedMemoryCacheProducer(newDiskCacheSequence(inputProducer));
        return this.mProducerFactory.newEncodedCacheKeyMultiplexProducer(encodedMemoryCacheProducer);
    }

    private Producer<EncodedImage> newDiskCacheSequence(Producer<EncodedImage> inputProducer) {
        Producer<EncodedImage> cacheWriteProducer = this.mProducerFactory.newDiskCacheWriteProducer(inputProducer);
        Producer<EncodedImage> mediaVariationsProducer = this.mProducerFactory.newMediaVariationsProducer(cacheWriteProducer);
        return this.mProducerFactory.newDiskCacheReadProducer(mediaVariationsProducer);
    }

    private Producer<CloseableReference<CloseableImage>> newBitmapCacheGetToBitmapCacheSequence(Producer<CloseableReference<CloseableImage>> inputProducer) {
        BitmapMemoryCacheProducer bitmapMemoryCacheProducer = this.mProducerFactory.newBitmapMemoryCacheProducer(inputProducer);
        BitmapMemoryCacheKeyMultiplexProducer bitmapKeyMultiplexProducer = this.mProducerFactory.newBitmapMemoryCacheKeyMultiplexProducer(bitmapMemoryCacheProducer);
        ThreadHandoffProducer<CloseableReference<CloseableImage>> threadHandoffProducer = this.mProducerFactory.newBackgroundThreadHandoffProducer(bitmapKeyMultiplexProducer, this.mThreadHandoffProducerQueue);
        return this.mProducerFactory.newBitmapMemoryCacheGetProducer(threadHandoffProducer);
    }

    private Producer<EncodedImage> newLocalTransformationsSequence(Producer<EncodedImage> inputProducer, ThumbnailProducer<EncodedImage>[] thumbnailProducers) {
        Producer<EncodedImage> localImageProducer = ProducerFactory.newAddImageTransformMetaDataProducer(inputProducer);
        ThrottlingProducer<EncodedImage> localImageThrottlingProducer = this.mProducerFactory.newThrottlingProducer(this.mProducerFactory.newResizeAndRotateProducer(localImageProducer, true, this.mUseDownsamplingRatio));
        ProducerFactory producerFactory = this.mProducerFactory;
        return ProducerFactory.newBranchOnSeparateImagesProducer(newLocalThumbnailProducer(thumbnailProducers), localImageThrottlingProducer);
    }

    private Producer<EncodedImage> newLocalThumbnailProducer(ThumbnailProducer<EncodedImage>[] thumbnailProducers) {
        ThumbnailBranchProducer thumbnailBranchProducer = this.mProducerFactory.newThumbnailBranchProducer(thumbnailProducers);
        return this.mProducerFactory.newResizeAndRotateProducer(thumbnailBranchProducer, true, this.mUseDownsamplingRatio);
    }

    private synchronized Producer<CloseableReference<CloseableImage>> getPostprocessorSequence(Producer<CloseableReference<CloseableImage>> inputProducer) {
        if (!this.mPostprocessorSequences.containsKey(inputProducer)) {
            PostprocessorProducer postprocessorProducer = this.mProducerFactory.newPostprocessorProducer(inputProducer);
            PostprocessedBitmapMemoryCacheProducer postprocessedBitmapMemoryCacheProducer = this.mProducerFactory.newPostprocessorBitmapMemoryCacheProducer(postprocessorProducer);
            this.mPostprocessorSequences.put(inputProducer, postprocessedBitmapMemoryCacheProducer);
        }
        return this.mPostprocessorSequences.get(inputProducer);
    }

    private synchronized Producer<Void> getDecodedImagePrefetchSequence(Producer<CloseableReference<CloseableImage>> inputProducer) {
        if (!this.mCloseableImagePrefetchSequences.containsKey(inputProducer)) {
            ProducerFactory producerFactory = this.mProducerFactory;
            SwallowResultProducer<CloseableReference<CloseableImage>> swallowResultProducer = ProducerFactory.newSwallowResultProducer(inputProducer);
            this.mCloseableImagePrefetchSequences.put(inputProducer, swallowResultProducer);
        }
        return this.mCloseableImagePrefetchSequences.get(inputProducer);
    }

    private static String getShortenedUriString(Uri uri) {
        String uriString = String.valueOf(uri);
        return uriString.length() > 30 ? uriString.substring(0, 30) + "..." : uriString;
    }
}
