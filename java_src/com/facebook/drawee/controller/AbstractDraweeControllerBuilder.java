package com.facebook.drawee.controller;

import android.content.Context;
import android.graphics.drawable.Animatable;
import com.facebook.common.internal.Objects;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Supplier;
import com.facebook.datasource.DataSource;
import com.facebook.datasource.DataSources;
import com.facebook.datasource.FirstAvailableDataSourceSupplier;
import com.facebook.datasource.IncreasingQualityDataSourceSupplier;
import com.facebook.drawee.components.RetryManager;
import com.facebook.drawee.controller.AbstractDraweeControllerBuilder;
import com.facebook.drawee.gestures.GestureDetector;
import com.facebook.drawee.interfaces.DraweeController;
import com.facebook.drawee.interfaces.SimpleDraweeControllerBuilder;
import com.facebook.share.internal.ShareConstants;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public abstract class AbstractDraweeControllerBuilder<BUILDER extends AbstractDraweeControllerBuilder<BUILDER, REQUEST, IMAGE, INFO>, REQUEST, IMAGE, INFO> implements SimpleDraweeControllerBuilder {
    private boolean mAutoPlayAnimations;
    private final Set<ControllerListener> mBoundControllerListeners;
    @Nullable
    private Object mCallerContext;
    private String mContentDescription;
    private final Context mContext;
    @Nullable
    private ControllerListener<? super INFO> mControllerListener;
    @Nullable
    private ControllerViewportVisibilityListener mControllerViewportVisibilityListener;
    @Nullable
    private Supplier<DataSource<IMAGE>> mDataSourceSupplier;
    @Nullable
    private REQUEST mImageRequest;
    @Nullable
    private REQUEST mLowResImageRequest;
    @Nullable
    private REQUEST[] mMultiImageRequests;
    @Nullable
    private DraweeController mOldController;
    private boolean mRetainImageOnFailure;
    private boolean mTapToRetryEnabled;
    private boolean mTryCacheOnlyFirst;
    private static final ControllerListener<Object> sAutoPlayAnimationsListener = new BaseControllerListener<Object>() { // from class: com.facebook.drawee.controller.AbstractDraweeControllerBuilder.1
        @Override // com.facebook.drawee.controller.BaseControllerListener, com.facebook.drawee.controller.ControllerListener
        public void onFinalImageSet(String id, @Nullable Object info, @Nullable Animatable anim) {
            if (anim != null) {
                anim.start();
            }
        }
    };
    private static final NullPointerException NO_REQUEST_EXCEPTION = new NullPointerException("No image request was specified!");
    private static final AtomicLong sIdCounter = new AtomicLong();

    /* loaded from: classes.dex */
    public enum CacheLevel {
        FULL_FETCH,
        DISK_CACHE,
        BITMAP_MEMORY_CACHE
    }

    protected abstract DataSource<IMAGE> getDataSourceForRequest(REQUEST request, Object obj, CacheLevel cacheLevel);

    /* renamed from: getThis */
    protected abstract BUILDER mo203getThis();

    /* renamed from: obtainController */
    protected abstract AbstractDraweeController mo204obtainController();

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractDraweeControllerBuilder(Context context, Set<ControllerListener> boundControllerListeners) {
        this.mContext = context;
        this.mBoundControllerListeners = boundControllerListeners;
        init();
    }

    private void init() {
        this.mCallerContext = null;
        this.mImageRequest = null;
        this.mLowResImageRequest = null;
        this.mMultiImageRequests = null;
        this.mTryCacheOnlyFirst = true;
        this.mControllerListener = null;
        this.mControllerViewportVisibilityListener = null;
        this.mTapToRetryEnabled = false;
        this.mAutoPlayAnimations = false;
        this.mOldController = null;
        this.mContentDescription = null;
    }

    public BUILDER reset() {
        init();
        return mo203getThis();
    }

    @Override // com.facebook.drawee.interfaces.SimpleDraweeControllerBuilder
    /* renamed from: setCallerContext */
    public BUILDER mo209setCallerContext(Object callerContext) {
        this.mCallerContext = callerContext;
        return mo203getThis();
    }

    @Nullable
    public Object getCallerContext() {
        return this.mCallerContext;
    }

    public BUILDER setImageRequest(REQUEST imageRequest) {
        this.mImageRequest = imageRequest;
        return mo203getThis();
    }

    @Nullable
    public REQUEST getImageRequest() {
        return this.mImageRequest;
    }

    public BUILDER setLowResImageRequest(REQUEST lowResImageRequest) {
        this.mLowResImageRequest = lowResImageRequest;
        return mo203getThis();
    }

    @Nullable
    public REQUEST getLowResImageRequest() {
        return this.mLowResImageRequest;
    }

    public BUILDER setFirstAvailableImageRequests(REQUEST[] firstAvailableImageRequests) {
        return setFirstAvailableImageRequests(firstAvailableImageRequests, true);
    }

    public BUILDER setFirstAvailableImageRequests(REQUEST[] firstAvailableImageRequests, boolean tryCacheOnlyFirst) {
        this.mMultiImageRequests = firstAvailableImageRequests;
        this.mTryCacheOnlyFirst = tryCacheOnlyFirst;
        return mo203getThis();
    }

    @Nullable
    public REQUEST[] getFirstAvailableImageRequests() {
        return this.mMultiImageRequests;
    }

    public void setDataSourceSupplier(@Nullable Supplier<DataSource<IMAGE>> dataSourceSupplier) {
        this.mDataSourceSupplier = dataSourceSupplier;
    }

    @Nullable
    public Supplier<DataSource<IMAGE>> getDataSourceSupplier() {
        return this.mDataSourceSupplier;
    }

    public BUILDER setTapToRetryEnabled(boolean enabled) {
        this.mTapToRetryEnabled = enabled;
        return mo203getThis();
    }

    public boolean getTapToRetryEnabled() {
        return this.mTapToRetryEnabled;
    }

    public BUILDER setRetainImageOnFailure(boolean enabled) {
        this.mRetainImageOnFailure = enabled;
        return mo203getThis();
    }

    public boolean getRetainImageOnFailure() {
        return this.mRetainImageOnFailure;
    }

    public BUILDER setAutoPlayAnimations(boolean enabled) {
        this.mAutoPlayAnimations = enabled;
        return mo203getThis();
    }

    public boolean getAutoPlayAnimations() {
        return this.mAutoPlayAnimations;
    }

    public BUILDER setControllerListener(ControllerListener<? super INFO> controllerListener) {
        this.mControllerListener = controllerListener;
        return mo203getThis();
    }

    @Nullable
    public ControllerListener<? super INFO> getControllerListener() {
        return this.mControllerListener;
    }

    public BUILDER setControllerViewportVisibilityListener(@Nullable ControllerViewportVisibilityListener controllerViewportVisibilityListener) {
        this.mControllerViewportVisibilityListener = controllerViewportVisibilityListener;
        return mo203getThis();
    }

    @Nullable
    public ControllerViewportVisibilityListener getControllerViewportVisibilityListener() {
        return this.mControllerViewportVisibilityListener;
    }

    public BUILDER setContentDescription(String contentDescription) {
        this.mContentDescription = contentDescription;
        return mo203getThis();
    }

    @Nullable
    public String getContentDescription() {
        return this.mContentDescription;
    }

    @Override // com.facebook.drawee.interfaces.SimpleDraweeControllerBuilder
    /* renamed from: setOldController */
    public BUILDER mo210setOldController(@Nullable DraweeController oldController) {
        this.mOldController = oldController;
        return mo203getThis();
    }

    @Nullable
    public DraweeController getOldController() {
        return this.mOldController;
    }

    @Override // com.facebook.drawee.interfaces.SimpleDraweeControllerBuilder
    /* renamed from: build */
    public AbstractDraweeController mo208build() {
        validate();
        if (this.mImageRequest == null && this.mMultiImageRequests == null && this.mLowResImageRequest != null) {
            this.mImageRequest = this.mLowResImageRequest;
            this.mLowResImageRequest = null;
        }
        return buildController();
    }

    protected void validate() {
        boolean z = false;
        Preconditions.checkState(this.mMultiImageRequests == null || this.mImageRequest == null, "Cannot specify both ImageRequest and FirstAvailableImageRequests!");
        if (this.mDataSourceSupplier == null || (this.mMultiImageRequests == null && this.mImageRequest == null && this.mLowResImageRequest == null)) {
            z = true;
        }
        Preconditions.checkState(z, "Cannot specify DataSourceSupplier with other ImageRequests! Use one or the other.");
    }

    protected AbstractDraweeController buildController() {
        AbstractDraweeController controller = mo204obtainController();
        controller.setRetainImageOnFailure(getRetainImageOnFailure());
        controller.setContentDescription(getContentDescription());
        controller.setControllerViewportVisibilityListener(getControllerViewportVisibilityListener());
        maybeBuildAndSetRetryManager(controller);
        maybeAttachListeners(controller);
        return controller;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static String generateUniqueControllerId() {
        return String.valueOf(sIdCounter.getAndIncrement());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Supplier<DataSource<IMAGE>> obtainDataSourceSupplier() {
        if (this.mDataSourceSupplier != null) {
            return this.mDataSourceSupplier;
        }
        Supplier<DataSource<IMAGE>> supplier = null;
        if (this.mImageRequest != null) {
            supplier = getDataSourceSupplierForRequest(this.mImageRequest);
        } else if (this.mMultiImageRequests != null) {
            supplier = getFirstAvailableDataSourceSupplier(this.mMultiImageRequests, this.mTryCacheOnlyFirst);
        }
        if (supplier != null && this.mLowResImageRequest != null) {
            List<Supplier<DataSource<IMAGE>>> suppliers = new ArrayList<>(2);
            suppliers.add(supplier);
            suppliers.add(getDataSourceSupplierForRequest(this.mLowResImageRequest));
            supplier = IncreasingQualityDataSourceSupplier.create(suppliers);
        }
        if (supplier == null) {
            Supplier<DataSource<IMAGE>> supplier2 = DataSources.getFailedDataSourceSupplier(NO_REQUEST_EXCEPTION);
            return supplier2;
        }
        return supplier;
    }

    protected Supplier<DataSource<IMAGE>> getFirstAvailableDataSourceSupplier(REQUEST[] imageRequests, boolean tryBitmapCacheOnlyFirst) {
        List<Supplier<DataSource<IMAGE>>> suppliers = new ArrayList<>(imageRequests.length * 2);
        if (tryBitmapCacheOnlyFirst) {
            for (REQUEST request : imageRequests) {
                suppliers.add(getDataSourceSupplierForRequest(request, CacheLevel.BITMAP_MEMORY_CACHE));
            }
        }
        for (REQUEST request2 : imageRequests) {
            suppliers.add(getDataSourceSupplierForRequest(request2));
        }
        return FirstAvailableDataSourceSupplier.create(suppliers);
    }

    protected Supplier<DataSource<IMAGE>> getDataSourceSupplierForRequest(REQUEST imageRequest) {
        return getDataSourceSupplierForRequest(imageRequest, CacheLevel.FULL_FETCH);
    }

    protected Supplier<DataSource<IMAGE>> getDataSourceSupplierForRequest(final REQUEST imageRequest, final CacheLevel cacheLevel) {
        final Object callerContext = getCallerContext();
        return new Supplier<DataSource<IMAGE>>() { // from class: com.facebook.drawee.controller.AbstractDraweeControllerBuilder.2
            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.facebook.common.internal.Supplier
            /* renamed from: get */
            public DataSource<IMAGE> mo486get() {
                return AbstractDraweeControllerBuilder.this.getDataSourceForRequest(imageRequest, callerContext, cacheLevel);
            }

            public String toString() {
                return Objects.toStringHelper(this).add(ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID, imageRequest.toString()).toString();
            }
        };
    }

    protected void maybeAttachListeners(AbstractDraweeController controller) {
        if (this.mBoundControllerListeners != null) {
            for (ControllerListener listener : this.mBoundControllerListeners) {
                controller.addControllerListener(listener);
            }
        }
        if (this.mControllerListener != null) {
            controller.addControllerListener(this.mControllerListener);
        }
        if (this.mAutoPlayAnimations) {
            controller.addControllerListener(sAutoPlayAnimationsListener);
        }
    }

    protected void maybeBuildAndSetRetryManager(AbstractDraweeController controller) {
        if (this.mTapToRetryEnabled) {
            RetryManager retryManager = controller.getRetryManager();
            if (retryManager == null) {
                retryManager = new RetryManager();
                controller.setRetryManager(retryManager);
            }
            retryManager.setTapToRetryEnabled(this.mTapToRetryEnabled);
            maybeBuildAndSetGestureDetector(controller);
        }
    }

    protected void maybeBuildAndSetGestureDetector(AbstractDraweeController controller) {
        GestureDetector gestureDetector = controller.getGestureDetector();
        if (gestureDetector == null) {
            GestureDetector gestureDetector2 = GestureDetector.newInstance(this.mContext);
            controller.setGestureDetector(gestureDetector2);
        }
    }

    protected Context getContext() {
        return this.mContext;
    }
}
