package com.facebook.imagepipeline.producers;

import android.graphics.Bitmap;
import com.facebook.common.internal.ImmutableMap;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.image.CloseableStaticBitmap;
import com.facebook.imagepipeline.request.Postprocessor;
import com.facebook.imagepipeline.request.RepeatedPostprocessor;
import com.facebook.imagepipeline.request.RepeatedPostprocessorRunner;
import java.util.Map;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public class PostprocessorProducer implements Producer<CloseableReference<CloseableImage>> {
    public static final String NAME = "PostprocessorProducer";
    @VisibleForTesting
    static final String POSTPROCESSOR = "Postprocessor";
    private final PlatformBitmapFactory mBitmapFactory;
    private final Executor mExecutor;
    private final Producer<CloseableReference<CloseableImage>> mInputProducer;

    public PostprocessorProducer(Producer<CloseableReference<CloseableImage>> inputProducer, PlatformBitmapFactory platformBitmapFactory, Executor executor) {
        this.mInputProducer = (Producer) Preconditions.checkNotNull(inputProducer);
        this.mBitmapFactory = platformBitmapFactory;
        this.mExecutor = (Executor) Preconditions.checkNotNull(executor);
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<CloseableReference<CloseableImage>> consumer, ProducerContext context) {
        Consumer<CloseableReference<CloseableImage>> postprocessorConsumer;
        ProducerListener listener = context.getListener();
        Postprocessor postprocessor = context.getImageRequest().getPostprocessor();
        PostprocessorConsumer basePostprocessorConsumer = new PostprocessorConsumer(consumer, listener, context.getId(), postprocessor, context);
        if (postprocessor instanceof RepeatedPostprocessor) {
            postprocessorConsumer = new RepeatedPostprocessorConsumer(basePostprocessorConsumer, (RepeatedPostprocessor) postprocessor, context);
        } else {
            postprocessorConsumer = new SingleUsePostprocessorConsumer(basePostprocessorConsumer);
        }
        this.mInputProducer.produceResults(postprocessorConsumer, context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class PostprocessorConsumer extends DelegatingConsumer<CloseableReference<CloseableImage>, CloseableReference<CloseableImage>> {
        @GuardedBy("PostprocessorConsumer.this")
        private boolean mIsClosed;
        @GuardedBy("PostprocessorConsumer.this")
        private boolean mIsDirty;
        @GuardedBy("PostprocessorConsumer.this")
        private boolean mIsLast;
        @GuardedBy("PostprocessorConsumer.this")
        private boolean mIsPostProcessingRunning;
        private final ProducerListener mListener;
        private final Postprocessor mPostprocessor;
        private final String mRequestId;
        @GuardedBy("PostprocessorConsumer.this")
        @Nullable
        private CloseableReference<CloseableImage> mSourceImageRef;

        public PostprocessorConsumer(Consumer<CloseableReference<CloseableImage>> consumer, ProducerListener listener, String requestId, Postprocessor postprocessor, ProducerContext producerContext) {
            super(consumer);
            this.mSourceImageRef = null;
            this.mIsLast = false;
            this.mIsDirty = false;
            this.mIsPostProcessingRunning = false;
            this.mListener = listener;
            this.mRequestId = requestId;
            this.mPostprocessor = postprocessor;
            producerContext.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.PostprocessorProducer.PostprocessorConsumer.1
                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onCancellationRequested() {
                    PostprocessorConsumer.this.maybeNotifyOnCancellation();
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(CloseableReference<CloseableImage> newResult, boolean isLast) {
            if (!CloseableReference.isValid(newResult)) {
                if (isLast) {
                    maybeNotifyOnNewResult(null, true);
                    return;
                }
                return;
            }
            updateSourceImageRef(newResult, isLast);
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        protected void onFailureImpl(Throwable t) {
            maybeNotifyOnFailure(t);
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        protected void onCancellationImpl() {
            maybeNotifyOnCancellation();
        }

        private void updateSourceImageRef(@Nullable CloseableReference<CloseableImage> sourceImageRef, boolean isLast) {
            synchronized (this) {
                if (!this.mIsClosed) {
                    CloseableReference<CloseableImage> oldSourceImageRef = this.mSourceImageRef;
                    this.mSourceImageRef = CloseableReference.cloneOrNull(sourceImageRef);
                    this.mIsLast = isLast;
                    this.mIsDirty = true;
                    boolean shouldSubmit = setRunningIfDirtyAndNotRunning();
                    CloseableReference.closeSafely(oldSourceImageRef);
                    if (shouldSubmit) {
                        submitPostprocessing();
                    }
                }
            }
        }

        private void submitPostprocessing() {
            PostprocessorProducer.this.mExecutor.execute(new Runnable() { // from class: com.facebook.imagepipeline.producers.PostprocessorProducer.PostprocessorConsumer.2
                @Override // java.lang.Runnable
                public void run() {
                    CloseableReference<CloseableImage> closeableImageRef;
                    boolean isLast;
                    synchronized (PostprocessorConsumer.this) {
                        closeableImageRef = PostprocessorConsumer.this.mSourceImageRef;
                        isLast = PostprocessorConsumer.this.mIsLast;
                        PostprocessorConsumer.this.mSourceImageRef = null;
                        PostprocessorConsumer.this.mIsDirty = false;
                    }
                    if (CloseableReference.isValid(closeableImageRef)) {
                        try {
                            PostprocessorConsumer.this.doPostprocessing(closeableImageRef, isLast);
                        } finally {
                            CloseableReference.closeSafely(closeableImageRef);
                        }
                    }
                    PostprocessorConsumer.this.clearRunningAndStartIfDirty();
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearRunningAndStartIfDirty() {
            boolean shouldExecuteAgain;
            synchronized (this) {
                this.mIsPostProcessingRunning = false;
                shouldExecuteAgain = setRunningIfDirtyAndNotRunning();
            }
            if (shouldExecuteAgain) {
                submitPostprocessing();
            }
        }

        private synchronized boolean setRunningIfDirtyAndNotRunning() {
            boolean z = true;
            synchronized (this) {
                if (this.mIsClosed || !this.mIsDirty || this.mIsPostProcessingRunning || !CloseableReference.isValid(this.mSourceImageRef)) {
                    z = false;
                } else {
                    this.mIsPostProcessingRunning = true;
                }
            }
            return z;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void doPostprocessing(CloseableReference<CloseableImage> sourceImageRef, boolean isLast) {
            Preconditions.checkArgument(CloseableReference.isValid(sourceImageRef));
            if (!shouldPostprocess(sourceImageRef.get())) {
                maybeNotifyOnNewResult(sourceImageRef, isLast);
                return;
            }
            this.mListener.onProducerStart(this.mRequestId, PostprocessorProducer.NAME);
            CloseableReference<CloseableImage> destImageRef = null;
            try {
                destImageRef = postprocessInternal(sourceImageRef.get());
                this.mListener.onProducerFinishWithSuccess(this.mRequestId, PostprocessorProducer.NAME, getExtraMap(this.mListener, this.mRequestId, this.mPostprocessor));
                maybeNotifyOnNewResult(destImageRef, isLast);
            } catch (Exception e) {
                this.mListener.onProducerFinishWithFailure(this.mRequestId, PostprocessorProducer.NAME, e, getExtraMap(this.mListener, this.mRequestId, this.mPostprocessor));
                maybeNotifyOnFailure(e);
            } finally {
                CloseableReference.closeSafely(destImageRef);
            }
        }

        private Map<String, String> getExtraMap(ProducerListener listener, String requestId, Postprocessor postprocessor) {
            if (!listener.requiresExtraMap(requestId)) {
                return null;
            }
            return ImmutableMap.of(PostprocessorProducer.POSTPROCESSOR, postprocessor.getName());
        }

        private boolean shouldPostprocess(CloseableImage sourceImage) {
            return sourceImage instanceof CloseableStaticBitmap;
        }

        private CloseableReference<CloseableImage> postprocessInternal(CloseableImage sourceImage) {
            CloseableStaticBitmap staticBitmap = (CloseableStaticBitmap) sourceImage;
            Bitmap sourceBitmap = staticBitmap.getUnderlyingBitmap();
            CloseableReference<Bitmap> bitmapRef = this.mPostprocessor.process(sourceBitmap, PostprocessorProducer.this.mBitmapFactory);
            int rotationAngle = staticBitmap.getRotationAngle();
            try {
                return CloseableReference.of(new CloseableStaticBitmap(bitmapRef, sourceImage.getQualityInfo(), rotationAngle));
            } finally {
                CloseableReference.closeSafely(bitmapRef);
            }
        }

        private void maybeNotifyOnNewResult(CloseableReference<CloseableImage> newRef, boolean isLast) {
            if ((!isLast && !isClosed()) || (isLast && close())) {
                getConsumer().onNewResult(newRef, isLast);
            }
        }

        private void maybeNotifyOnFailure(Throwable throwable) {
            if (close()) {
                getConsumer().onFailure(throwable);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void maybeNotifyOnCancellation() {
            if (close()) {
                getConsumer().onCancellation();
            }
        }

        private synchronized boolean isClosed() {
            return this.mIsClosed;
        }

        private boolean close() {
            boolean z = true;
            synchronized (this) {
                if (this.mIsClosed) {
                    z = false;
                } else {
                    CloseableReference<CloseableImage> oldSourceImageRef = this.mSourceImageRef;
                    this.mSourceImageRef = null;
                    this.mIsClosed = true;
                    CloseableReference.closeSafely(oldSourceImageRef);
                }
            }
            return z;
        }
    }

    /* loaded from: classes.dex */
    class SingleUsePostprocessorConsumer extends DelegatingConsumer<CloseableReference<CloseableImage>, CloseableReference<CloseableImage>> {
        private SingleUsePostprocessorConsumer(PostprocessorConsumer postprocessorConsumer) {
            super(postprocessorConsumer);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(CloseableReference<CloseableImage> newResult, boolean isLast) {
            if (isLast) {
                getConsumer().onNewResult(newResult, isLast);
            }
        }
    }

    /* loaded from: classes.dex */
    class RepeatedPostprocessorConsumer extends DelegatingConsumer<CloseableReference<CloseableImage>, CloseableReference<CloseableImage>> implements RepeatedPostprocessorRunner {
        @GuardedBy("RepeatedPostprocessorConsumer.this")
        private boolean mIsClosed;
        @GuardedBy("RepeatedPostprocessorConsumer.this")
        @Nullable
        private CloseableReference<CloseableImage> mSourceImageRef;

        private RepeatedPostprocessorConsumer(PostprocessorConsumer postprocessorConsumer, RepeatedPostprocessor repeatedPostprocessor, ProducerContext context) {
            super(postprocessorConsumer);
            this.mIsClosed = false;
            this.mSourceImageRef = null;
            repeatedPostprocessor.setCallback(this);
            context.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.PostprocessorProducer.RepeatedPostprocessorConsumer.1
                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onCancellationRequested() {
                    if (RepeatedPostprocessorConsumer.this.close()) {
                        RepeatedPostprocessorConsumer.this.getConsumer().onCancellation();
                    }
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        public void onNewResultImpl(CloseableReference<CloseableImage> newResult, boolean isLast) {
            if (isLast) {
                setSourceImageRef(newResult);
                updateInternal();
            }
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        protected void onFailureImpl(Throwable throwable) {
            if (close()) {
                getConsumer().onFailure(throwable);
            }
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        protected void onCancellationImpl() {
            if (close()) {
                getConsumer().onCancellation();
            }
        }

        @Override // com.facebook.imagepipeline.request.RepeatedPostprocessorRunner
        public synchronized void update() {
            updateInternal();
        }

        private void updateInternal() {
            synchronized (this) {
                if (!this.mIsClosed) {
                    CloseableReference<CloseableImage> sourceImageRef = CloseableReference.cloneOrNull(this.mSourceImageRef);
                    try {
                        getConsumer().onNewResult(sourceImageRef, false);
                    } finally {
                        CloseableReference.closeSafely(sourceImageRef);
                    }
                }
            }
        }

        private void setSourceImageRef(CloseableReference<CloseableImage> sourceImageRef) {
            synchronized (this) {
                if (!this.mIsClosed) {
                    CloseableReference<CloseableImage> oldSourceImageRef = this.mSourceImageRef;
                    this.mSourceImageRef = CloseableReference.cloneOrNull(sourceImageRef);
                    CloseableReference.closeSafely(oldSourceImageRef);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean close() {
            boolean z = true;
            synchronized (this) {
                if (this.mIsClosed) {
                    z = false;
                } else {
                    CloseableReference<CloseableImage> oldSourceImageRef = this.mSourceImageRef;
                    this.mSourceImageRef = null;
                    this.mIsClosed = true;
                    CloseableReference.closeSafely(oldSourceImageRef);
                }
            }
            return z;
        }
    }
}
