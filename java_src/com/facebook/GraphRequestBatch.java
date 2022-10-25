package com.facebook;

import android.os.Handler;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public class GraphRequestBatch extends AbstractList<GraphRequest> {
    private static AtomicInteger idGenerator = new AtomicInteger();
    private String batchApplicationId;
    private Handler callbackHandler;
    private List<Callback> callbacks;
    private final String id;
    private List<GraphRequest> requests;
    private int timeoutInMilliseconds;

    /* loaded from: classes.dex */
    public interface Callback {
        void onBatchCompleted(GraphRequestBatch graphRequestBatch);
    }

    /* loaded from: classes.dex */
    public interface OnProgressCallback extends Callback {
        void onBatchProgress(GraphRequestBatch graphRequestBatch, long j, long j2);
    }

    public GraphRequestBatch() {
        this.requests = new ArrayList();
        this.timeoutInMilliseconds = 0;
        this.id = Integer.valueOf(idGenerator.incrementAndGet()).toString();
        this.callbacks = new ArrayList();
        this.requests = new ArrayList();
    }

    public GraphRequestBatch(Collection<GraphRequest> requests) {
        this.requests = new ArrayList();
        this.timeoutInMilliseconds = 0;
        this.id = Integer.valueOf(idGenerator.incrementAndGet()).toString();
        this.callbacks = new ArrayList();
        this.requests = new ArrayList(requests);
    }

    public GraphRequestBatch(GraphRequest... requests) {
        this.requests = new ArrayList();
        this.timeoutInMilliseconds = 0;
        this.id = Integer.valueOf(idGenerator.incrementAndGet()).toString();
        this.callbacks = new ArrayList();
        this.requests = Arrays.asList(requests);
    }

    public GraphRequestBatch(GraphRequestBatch requests) {
        this.requests = new ArrayList();
        this.timeoutInMilliseconds = 0;
        this.id = Integer.valueOf(idGenerator.incrementAndGet()).toString();
        this.callbacks = new ArrayList();
        this.requests = new ArrayList(requests);
        this.callbackHandler = requests.callbackHandler;
        this.timeoutInMilliseconds = requests.timeoutInMilliseconds;
        this.callbacks = new ArrayList(requests.callbacks);
    }

    public int getTimeout() {
        return this.timeoutInMilliseconds;
    }

    public void setTimeout(int timeoutInMilliseconds) {
        if (timeoutInMilliseconds < 0) {
            throw new IllegalArgumentException("Argument timeoutInMilliseconds must be >= 0.");
        }
        this.timeoutInMilliseconds = timeoutInMilliseconds;
    }

    public void addCallback(Callback callback) {
        if (!this.callbacks.contains(callback)) {
            this.callbacks.add(callback);
        }
    }

    public void removeCallback(Callback callback) {
        this.callbacks.remove(callback);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(GraphRequest request) {
        return this.requests.add(request);
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int location, GraphRequest request) {
        this.requests.add(location, request);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        this.requests.clear();
    }

    @Override // java.util.AbstractList, java.util.List
    /* renamed from: get */
    public final GraphRequest mo185get(int i) {
        return this.requests.get(i);
    }

    @Override // java.util.AbstractList, java.util.List
    /* renamed from: remove */
    public final GraphRequest mo186remove(int location) {
        return this.requests.remove(location);
    }

    @Override // java.util.AbstractList, java.util.List
    public final GraphRequest set(int location, GraphRequest request) {
        return this.requests.set(location, request);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.requests.size();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final Handler getCallbackHandler() {
        return this.callbackHandler;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void setCallbackHandler(Handler callbackHandler) {
        this.callbackHandler = callbackHandler;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final List<GraphRequest> getRequests() {
        return this.requests;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final List<Callback> getCallbacks() {
        return this.callbacks;
    }

    public final String getBatchApplicationId() {
        return this.batchApplicationId;
    }

    public final void setBatchApplicationId(String batchApplicationId) {
        this.batchApplicationId = batchApplicationId;
    }

    public final List<GraphResponse> executeAndWait() {
        return executeAndWaitImpl();
    }

    public final GraphRequestAsyncTask executeAsync() {
        return executeAsyncImpl();
    }

    List<GraphResponse> executeAndWaitImpl() {
        return GraphRequest.executeBatchAndWait(this);
    }

    GraphRequestAsyncTask executeAsyncImpl() {
        return GraphRequest.executeBatchAsync(this);
    }
}
