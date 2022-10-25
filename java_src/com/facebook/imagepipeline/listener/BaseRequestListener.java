package com.facebook.imagepipeline.listener;

import com.facebook.imagepipeline.request.ImageRequest;
import java.util.Map;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class BaseRequestListener implements RequestListener {
    @Override // com.facebook.imagepipeline.listener.RequestListener
    public void onRequestStart(ImageRequest request, Object callerContext, String requestId, boolean isPrefetch) {
    }

    @Override // com.facebook.imagepipeline.listener.RequestListener
    public void onRequestSuccess(ImageRequest request, String requestId, boolean isPrefetch) {
    }

    @Override // com.facebook.imagepipeline.listener.RequestListener
    public void onRequestFailure(ImageRequest request, String requestId, Throwable throwable, boolean isPrefetch) {
    }

    @Override // com.facebook.imagepipeline.listener.RequestListener
    public void onRequestCancellation(String requestId) {
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public void onProducerStart(String requestId, String producerName) {
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public void onProducerEvent(String requestId, String producerName, String eventName) {
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public void onProducerFinishWithSuccess(String requestId, String producerName, @Nullable Map<String, String> extraMap) {
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public void onProducerFinishWithFailure(String requestId, String producerName, Throwable t, @Nullable Map<String, String> extraMap) {
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public void onProducerFinishWithCancellation(String requestId, String producerName, @Nullable Map<String, String> extraMap) {
    }

    @Override // com.facebook.imagepipeline.producers.ProducerListener
    public boolean requiresExtraMap(String requestId) {
        return false;
    }
}
