package com.vkontakte.android.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewTreeObserver;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.Scroller;
import com.vk.imageloader.VKImageRequestProgress;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.Future;
import java.util.concurrent.Semaphore;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.utils.WorkerThread;
/* loaded from: classes3.dex */
public class PhotoView extends View implements GestureDetector.OnGestureListener, GestureDetector.OnDoubleTapListener {
    private static final String TAG = "vk_photoview";
    public static final int THUMB_ANIM_DURATION = 300;
    private PhotoViewerAdapter adapter;
    private long animDuration;
    private float animScale;
    private long animStartTime;
    private float animTx;
    private float animTy;
    private float bgAlpha;
    private Paint bgPaint;
    private Paint bitmapPaint;
    private WorkerThread cancelerThread;
    private View.OnClickListener clickListener;
    private FrameLayout customOverlayContainer;
    private float density;
    private GestureDetector detector;
    private boolean disallowZoom;
    private DismissListener dismissListener;
    private boolean dismissed;
    private boolean dismissing;
    private boolean doubleTap;
    private int dragStartPointerID;
    private float dragStartTx;
    private float dragStartTy;
    private float dragStartX;
    private float dragStartY;
    private boolean dragging;
    private boolean dropTouches;
    private View error;
    private boolean firstResume;
    private boolean fitBySmallestSide;
    private boolean inAnimDone;
    private boolean inited;
    private boolean isList;
    private Interpolator itrp;
    private int limitX;
    private int limitY;
    private int listPosition;
    private WorkerThread loaderThread;
    private Vector<ImageLoadTask> loadingBitmaps;
    private float maxScale;
    private int maxX;
    private int maxY;
    private float minScale;
    private int minX;
    private int minY;
    private NavigationListener navListener;
    private boolean outAnimDone;
    private FrameLayout overlay;
    private ArrayList<View> overlayViews;
    private float pinchCenterX;
    private float pinchCenterY;
    private long pinchEndTime;
    private float pinchStartDist;
    private float pinchStartScale;
    private Runnable postedPhotoSwitch;
    private int prevCallbackPos;
    private boolean prevSwitchFwd;
    private float prevViewportH;
    private float prevViewportW;
    private CircularProgressBar progressBar;
    private Semaphore queueLock;
    private BroadcastReceiver receiver;
    private boolean resetOnResize;
    private float scale;
    private float scaleNext;
    private float scalePrev;
    private float scaleStartTx;
    private float scaleStartTy;
    private Scroller scroller;
    private boolean secondIsNext;
    private Runnable showProgress;
    private Texture texture;
    private Texture texture2;
    private Texture textureNext;
    private Texture texturePrev;
    private Rect thumbRect;
    private ClippingImageView thumbView;
    private float touchslop;
    private float translateX;
    private float translateY;
    private float viewportH;
    private float viewportW;
    private ColorDrawable windowBg;
    private ZoomListener zoomListener;
    public static final int PAGE_SPACING = V.dp(10.0f);
    public static Interpolator interpolatorIn = new CubicBezierInterpolator(0.58d, 0.77d, 0.5d, 1.0d);
    public static Interpolator interpolatorOut = new CubicBezierInterpolator(0.42d, 0.33d, 0.5d, 0.0d);

    /* loaded from: classes3.dex */
    public interface DismissListener {
        void onBackgroundAlphaChanged(float f);

        void onDismiss();

        void onPrepareDismiss();
    }

    /* loaded from: classes3.dex */
    public interface NavigationListener {
        void onPositionChanged(int i);

        void onPositionConfirmed(int i);
    }

    /* loaded from: classes3.dex */
    public interface PhotoViewerAdapter {
        boolean allowZoom(int i);

        int getCount();

        RunnableFuture<Bitmap> getPhoto(int i);

        float getPhotoLoadProgress(int i);

        Bitmap getThumb(int i);

        boolean isCached(int i);

        boolean isPhotoLoaded(int i);

        void requestPhotoDownload(int i);

        boolean shouldPreload();
    }

    /* loaded from: classes3.dex */
    public interface RunnableFuture<T> extends Runnable, Future<T> {
        void setProgressCallback(VKImageRequestProgress vKImageRequestProgress);
    }

    /* loaded from: classes3.dex */
    public interface ZoomListener {
        void onZoomChanged(float f, float f2, float f3);
    }

    public PhotoView(Context context) {
        super(context);
        this.scale = 1.0f;
        this.dragStartPointerID = -1;
        this.minScale = 1.0f;
        this.maxScale = 3.0f;
        this.itrp = new DecelerateInterpolator();
        this.scroller = new Scroller(getContext());
        this.pinchEndTime = 0L;
        this.doubleTap = false;
        this.isList = true;
        this.listPosition = 0;
        this.secondIsNext = true;
        this.scaleNext = 1.0f;
        this.scalePrev = 1.0f;
        this.inited = false;
        this.loadingBitmaps = new Vector<>();
        this.firstResume = true;
        this.fitBySmallestSide = false;
        this.resetOnResize = true;
        this.limitX = 0;
        this.limitY = 0;
        this.dropTouches = false;
        this.inAnimDone = true;
        this.outAnimDone = true;
        this.windowBg = new ColorDrawable(ViewCompat.MEASURED_STATE_MASK);
        this.dismissing = false;
        this.dragging = false;
        this.bgAlpha = 1.0f;
        this.bgPaint = new Paint();
        this.dismissed = false;
        this.prevCallbackPos = 0;
        this.prevSwitchFwd = true;
        this.disallowZoom = false;
        this.loaderThread = new WorkerThread("PhotoView Image Loader");
        this.cancelerThread = new WorkerThread("PhotoView Load Canceling");
        this.queueLock = new Semaphore(1, false);
        this.overlayViews = new ArrayList<>();
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.PhotoView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        PhotoView.this.onRetryClick();
                    }
                }
            }
        };
        init();
    }

    public PhotoView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.scale = 1.0f;
        this.dragStartPointerID = -1;
        this.minScale = 1.0f;
        this.maxScale = 3.0f;
        this.itrp = new DecelerateInterpolator();
        this.scroller = new Scroller(getContext());
        this.pinchEndTime = 0L;
        this.doubleTap = false;
        this.isList = true;
        this.listPosition = 0;
        this.secondIsNext = true;
        this.scaleNext = 1.0f;
        this.scalePrev = 1.0f;
        this.inited = false;
        this.loadingBitmaps = new Vector<>();
        this.firstResume = true;
        this.fitBySmallestSide = false;
        this.resetOnResize = true;
        this.limitX = 0;
        this.limitY = 0;
        this.dropTouches = false;
        this.inAnimDone = true;
        this.outAnimDone = true;
        this.windowBg = new ColorDrawable(ViewCompat.MEASURED_STATE_MASK);
        this.dismissing = false;
        this.dragging = false;
        this.bgAlpha = 1.0f;
        this.bgPaint = new Paint();
        this.dismissed = false;
        this.prevCallbackPos = 0;
        this.prevSwitchFwd = true;
        this.disallowZoom = false;
        this.loaderThread = new WorkerThread("PhotoView Image Loader");
        this.cancelerThread = new WorkerThread("PhotoView Load Canceling");
        this.queueLock = new Semaphore(1, false);
        this.overlayViews = new ArrayList<>();
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.PhotoView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        PhotoView.this.onRetryClick();
                    }
                }
            }
        };
        init();
    }

    private void init() {
        this.loaderThread.start();
        this.cancelerThread.start();
        this.texture = new Texture(0);
        this.textureNext = new Texture(1);
        this.texturePrev = new Texture(2);
        this.bgPaint.setColor(-1);
        this.bitmapPaint = new Paint();
        this.bitmapPaint.setFilterBitmap(true);
        this.touchslop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        this.progressBar = new CircularProgressBar(getContext());
        this.error = inflate(getContext(), R.layout.appkit_error, null);
        ((android.widget.TextView) this.error.findViewById(R.id.error_text)).setTextColor(-1);
        ((android.widget.TextView) this.error.findViewById(R.id.error_text)).setText(R.string.err_text);
        ((android.widget.TextView) this.error.findViewById(R.id.error_retry)).setText(R.string.retry);
        this.error.findViewById(R.id.error_retry).setOnClickListener(PhotoView$$Lambda$1.lambdaFactory$(this));
        this.thumbView = new ClippingImageView(getContext());
        this.detector = new GestureDetector(getContext(), this);
        this.detector.setOnDoubleTapListener(this);
        this.density = getResources().getDisplayMetrics().density;
        setFocusable(true);
        setFocusableInTouchMode(true);
        requestFocus();
        Log.i(TAG, "photo viewer init");
        this.error.setBackgroundColor(-1157627904);
        this.error.setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$0(View v) {
        onRetryClick();
    }

    void onRetryClick() {
        load(Arrays.asList(new ImageLoadTask(this.listPosition, false, this.texture)));
    }

    @Override // android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        if (changed) {
            updateViewportSizeDelayed();
        }
        this.inited = true;
    }

    @Override // android.view.View
    public void setPadding(int left, int top, int right, int bottom) {
        super.setPadding(left, top, right, bottom);
        updateViewportSizeDelayed();
    }

    private void updateViewportSizeDelayed() {
        getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.PhotoView.2
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                PhotoView.this.getViewTreeObserver().removeOnPreDrawListener(this);
                PhotoView.this.viewportW = (PhotoView.this.getWidth() - PhotoView.this.getPaddingLeft()) - PhotoView.this.getPaddingRight();
                PhotoView.this.viewportH = (PhotoView.this.getHeight() - PhotoView.this.getPaddingTop()) - PhotoView.this.getPaddingBottom();
                if (PhotoView.this.viewportH != PhotoView.this.prevViewportH || PhotoView.this.viewportW != PhotoView.this.prevViewportW) {
                    PhotoView.this.updateScale(true);
                    PhotoView.this.updateMinMax(PhotoView.this.scale);
                    PhotoView.this.translateX = PhotoView.this.clamp(PhotoView.this.translateX, PhotoView.this.minX, PhotoView.this.maxX);
                    PhotoView.this.translateY = PhotoView.this.clamp(PhotoView.this.translateY, PhotoView.this.minY, PhotoView.this.maxY);
                }
                PhotoView.this.prevViewportW = PhotoView.this.viewportW;
                PhotoView.this.prevViewportH = PhotoView.this.viewportH;
                return true;
            }
        });
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        getContext().registerReceiver(this.receiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
    }

    @Override // android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        try {
            this.queueLock.acquire();
        } catch (Exception e) {
        }
        Iterator<ImageLoadTask> it = this.loadingBitmaps.iterator();
        while (it.hasNext()) {
            ImageLoadTask t = it.next();
            t.cancel();
        }
        this.loadingBitmaps.clear();
        this.queueLock.release();
        getContext().unregisterReceiver(this.receiver);
    }

    public void setPosition(int p) {
        boolean z = false;
        if (this.listPosition != p) {
            this.listPosition = p;
            if (this.texture != null) {
                this.translateY = 0.0f;
                this.translateX = 0.0f;
                updateScale(true);
                updateMinMax(this.scale);
                postInvalidate();
                ImageLoadTask[] imageLoadTaskArr = new ImageLoadTask[2];
                imageLoadTaskArr[0] = new ImageLoadTask(this.listPosition, false, this.texture);
                int i = this.listPosition + 1;
                if (!this.adapter.shouldPreload()) {
                    z = true;
                }
                imageLoadTaskArr[1] = new ImageLoadTask(i, z, this.textureNext);
                load(Arrays.asList(imageLoadTaskArr));
                this.prevCallbackPos = p;
            }
        }
    }

    public void setBgColor(int color) {
        this.bgPaint.setColor(color);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateScale(boolean changed) {
        float iratio = this.texture.cropWidth / this.texture.cropHeight;
        float sratio = this.viewportW / this.viewportH;
        if (iratio > sratio || this.fitBySmallestSide) {
            float fw = this.viewportW;
            float fh = this.viewportH;
            if (this.fitBySmallestSide) {
                fw -= this.limitX * 2;
                fh -= this.limitY * 2;
            }
            this.minScale = fw / this.texture.cropWidth;
            this.maxScale = fh / this.texture.cropHeight;
        } else {
            this.minScale = this.viewportH / this.texture.cropHeight;
            this.maxScale = this.viewportW / this.texture.cropWidth;
        }
        if (this.maxScale < 3.0f) {
            this.maxScale = 3.0f;
        }
        if (this.scale < this.minScale || this.scale > this.maxScale || changed) {
            this.scale = this.minScale;
            this.animScale = this.minScale;
        }
        float iw = this.texture.cropWidth;
        float ih = this.texture.cropHeight;
        float i2w = this.texture2 != null ? this.texture2.cropWidth : 1.0f;
        float i2h = this.texture2 != null ? this.texture2.cropHeight : 1.0f;
        if (iw == 0.0f || ih == 0.0f) {
        }
        if (i2w == 0.0f || i2h == 0.0f) {
            i2h = 1.0f;
            i2w = 1.0f;
        }
        if (this.texture2 != null && (this.texture2.loaded || this.texture2.thumb)) {
            float iratio2 = i2w / i2h;
            float sratio2 = this.viewportW / this.viewportH;
            if (iratio2 > sratio2) {
                this.scaleNext = this.viewportW / i2w;
            } else {
                this.scaleNext = this.viewportH / i2h;
            }
        }
        Log.d(TAG, "Update scale, min=" + this.minScale + ", max=" + this.maxScale + ", next=" + this.scaleNext + ", current=" + this.scale);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateMinMax(float scale) {
        float iratio = this.texture.cropWidth / this.texture.cropHeight;
        float sratio = this.viewportW / this.viewportH;
        if (iratio > sratio) {
            if (scale > this.minScale || this.fitBySmallestSide) {
                this.maxX = Math.round(((this.texture.cropWidth * scale) / 2.0f) - ((this.viewportW / 2.0f) - this.limitX));
                this.minX = -this.maxX;
                if (this.texture.cropHeight * scale > this.viewportH - this.limitY) {
                    this.maxY = Math.round(((this.texture.cropHeight * scale) / 2.0f) - ((this.viewportH / 2.0f) - this.limitY));
                    this.minY = -this.maxY;
                    return;
                }
                this.minY = 0;
                this.maxY = 0;
                return;
            }
            this.minY = 0;
            this.maxY = 0;
            this.minX = 0;
            this.maxX = 0;
        } else if (scale > this.minScale || this.fitBySmallestSide) {
            this.maxY = Math.round(((this.texture.cropHeight * scale) / 2.0f) - ((this.viewportH / 2.0f) - this.limitY));
            this.minY = -this.maxY;
            if (this.texture.cropWidth * scale > this.viewportW) {
                this.maxX = Math.round(((this.texture.cropWidth * scale) / 2.0f) - ((this.viewportW / 2.0f) - this.limitX));
                this.minX = -this.maxX;
                return;
            }
            this.minX = 0;
            this.maxX = 0;
        } else {
            this.minY = 0;
            this.maxY = 0;
            this.minX = 0;
            this.maxX = 0;
        }
    }

    public View getOverlayView() {
        if (this.overlay != null) {
            return this.overlay;
        }
        this.overlay = new FrameLayout(getContext()) { // from class: com.vkontakte.android.ui.PhotoView.3
            @Override // android.view.ViewGroup
            protected boolean drawChild(Canvas canvas, View child, long drawingTime) {
                if (child != PhotoView.this.customOverlayContainer) {
                    if ((child == PhotoView.this.progressBar || child == PhotoView.this.error) && (!PhotoView.this.inAnimDone || !PhotoView.this.outAnimDone)) {
                        return false;
                    }
                    canvas.save();
                    if (PhotoView.this.inAnimDone && PhotoView.this.outAnimDone) {
                        canvas.translate(PhotoView.this.translateX, PhotoView.this.translateY);
                        if (System.currentTimeMillis() - PhotoView.this.animStartTime < PhotoView.this.animDuration) {
                            float a = ((float) (System.currentTimeMillis() - PhotoView.this.animStartTime)) / ((float) PhotoView.this.animDuration);
                            float ai = PhotoView.this.itrp.getInterpolation(a);
                            canvas.translate((PhotoView.this.animTx - PhotoView.this.translateX) * ai, (PhotoView.this.animTy - PhotoView.this.translateY) * ai);
                            invalidate();
                        }
                    }
                    boolean drawChild = super.drawChild(canvas, child, drawingTime);
                    canvas.restore();
                    return drawChild;
                }
                return super.drawChild(canvas, child, drawingTime);
            }

            @Override // android.view.View
            public void draw(Canvas c) {
                if (PhotoView.this.thumbRect != null) {
                    int[] f = {0, 0};
                    getLocationOnScreen(f);
                    c.save();
                    c.translate(0.0f, -f[1]);
                    c.clipRect(PhotoView.this.getPaddingLeft(), PhotoView.this.getPaddingTop(), c.getWidth() - PhotoView.this.getPaddingRight(), c.getHeight() - PhotoView.this.getPaddingBottom());
                    c.drawRect(PhotoView.this.thumbRect, PhotoView.this.bgPaint);
                    c.restore();
                }
                super.draw(c);
            }

            @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
            public void onLayout(boolean changed, int l, int t, int r, int b) {
                super.onLayout(changed, l, t, r, b);
                Drawable d = PhotoView.this.thumbView.getDrawable();
                if (d != null) {
                    int w = ((r - l) - getPaddingLeft()) - getPaddingRight();
                    int h = ((b - t) - getPaddingTop()) - getPaddingBottom();
                    float sr = w / h;
                    float tr = d.getIntrinsicWidth() / d.getIntrinsicHeight();
                    if (sr < tr) {
                        float scale = w / d.getIntrinsicWidth();
                        PhotoView.this.thumbView.layout(getPaddingLeft(), Math.round((h / 2) - ((d.getIntrinsicHeight() * scale) / 2.0f)) + getPaddingTop(), w, Math.round((h / 2) + ((d.getIntrinsicHeight() * scale) / 2.0f)) + getPaddingTop());
                    } else {
                        float scale2 = h / d.getIntrinsicHeight();
                        PhotoView.this.thumbView.layout(Math.round((w / 2) - ((d.getIntrinsicWidth() * scale2) / 2.0f)) + getPaddingLeft(), getPaddingTop(), Math.round((w / 2) + ((d.getIntrinsicWidth() * scale2) / 2.0f)), getPaddingTop() + h);
                    }
                }
                if (PhotoView.this.customOverlayContainer != null && PhotoView.this.texture != null && PhotoView.this.texture.cropWidth > 0 && PhotoView.this.texture.cropHeight > 0) {
                    int w2 = ((r - l) - getPaddingLeft()) - getPaddingRight();
                    int h2 = ((b - t) - getPaddingTop()) - getPaddingBottom();
                    float sr2 = w2 / h2;
                    float tr2 = PhotoView.this.texture.cropWidth / PhotoView.this.texture.cropHeight;
                    if (sr2 < tr2) {
                        float scale3 = w2 / PhotoView.this.texture.cropWidth;
                        PhotoView.this.customOverlayContainer.measure(1073741824 | w2, 1073741824 | Math.round(PhotoView.this.texture.cropHeight * scale3));
                        PhotoView.this.customOverlayContainer.layout(getPaddingLeft(), Math.round((h2 / 2) - ((PhotoView.this.texture.cropHeight * scale3) / 2.0f)) + getPaddingTop(), getPaddingLeft() + w2, Math.round((h2 / 2) + ((PhotoView.this.texture.cropHeight * scale3) / 2.0f)) + getPaddingTop());
                        return;
                    }
                    float scale4 = h2 / PhotoView.this.texture.cropHeight;
                    PhotoView.this.customOverlayContainer.measure(1073741824 | Math.round(PhotoView.this.texture.cropWidth * scale4), 1073741824 | h2);
                    PhotoView.this.customOverlayContainer.layout(Math.round((w2 / 2) - ((PhotoView.this.texture.cropWidth * scale4) / 2.0f)) + getPaddingLeft(), getPaddingTop(), Math.round((w2 / 2) + ((PhotoView.this.texture.cropWidth * scale4) / 2.0f)) + getPaddingLeft(), getPaddingTop() + h2);
                }
            }
        };
        this.overlay.setClipChildren(false);
        this.overlay.addView(this.thumbView);
        this.overlay.addView(this.progressBar, new FrameLayout.LayoutParams(V.dp(80.0f), V.dp(80.0f), 17));
        this.overlay.addView(this.error);
        return this.overlay;
    }

    public void addOverlayView(View view) {
        if (this.customOverlayContainer == null) {
            this.customOverlayContainer = new FrameLayout(getContext());
            this.customOverlayContainer.setClipChildren(false);
            this.overlay.addView(this.customOverlayContainer);
        }
        this.customOverlayContainer.addView(view);
        this.overlayViews.add(view);
    }

    public void setThumb(Bitmap thumb, boolean showProgress) {
        int i = 8;
        this.thumbView.setImageBitmap(thumb);
        this.thumbView.getParent().requestLayout();
        if (showProgress) {
            this.error.setVisibility(8);
        }
        V.cancelVisibilityAnimation(this.progressBar);
        CircularProgressBar circularProgressBar = this.progressBar;
        if (showProgress) {
            i = 0;
        }
        circularProgressBar.setVisibility(i);
    }

    public void setErrorText(String text) {
    }

    public int getPosition() {
        return this.listPosition;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float clamp(float x, float min, float max) {
        return Math.min(Math.max(x, min), max);
    }

    private void updateTextures() {
        if (!this.isList || ((this.translateX > this.maxX && this.listPosition == 0) || (this.translateX < this.minX && this.listPosition == this.adapter.getCount() - 1))) {
            if (this.translateX > this.maxX) {
                this.translateX = this.maxX + ((this.translateX - this.maxX) / 2.0f);
            }
            if (this.translateX < this.minX) {
                this.translateX = this.minX + ((this.translateX - this.minX) / 2.0f);
            }
            if (this.texture2 != null) {
                this.texture2 = null;
                updateScale(false);
            }
        } else if (this.translateX > this.maxX && this.texture2 != this.texturePrev && this.listPosition > 0) {
            this.texture2 = this.texturePrev;
            this.secondIsNext = false;
            updateScale(false);
        } else if (this.translateX < this.minX && this.texture2 != this.textureNext && this.listPosition < this.adapter.getCount()) {
            this.texture2 = this.textureNext;
            this.secondIsNext = true;
            updateScale(false);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (System.currentTimeMillis() - this.animStartTime < this.animDuration && this.animScale != this.scale) {
            this.dropTouches = true;
        }
        if (this.texture == null || !this.inited || this.dropTouches || !this.inAnimDone || !this.outAnimDone || !isEnabled()) {
            this.dropTouches = true;
            if (ev.getAction() == 1) {
                this.dropTouches = false;
            }
            return true;
        } else if (ev.getPointerCount() > 1 && (this.texture == null || !this.texture.loaded)) {
            this.dropTouches = true;
            return true;
        } else {
            if (ev.getPointerCount() == 1) {
                boolean d = this.detector.onTouchEvent(ev);
                if (d && this.doubleTap) {
                    this.doubleTap = false;
                    return true;
                }
            }
            if (ev.getAction() == 1) {
                if (this.dismissing && Math.abs(this.translateY) > this.viewportH / 4.0f && !this.dismissed) {
                    if (this.dismissListener != null && !this.dismissed) {
                        this.dismissListener.onDismiss();
                    }
                    this.dismissing = false;
                    return true;
                }
                this.dragging = false;
                this.dismissing = false;
                updateMinMax(clamp(this.scale, this.minScale, this.maxScale));
                if (System.currentTimeMillis() - this.animStartTime < this.animDuration) {
                    return true;
                }
                if (this.translateX - this.maxX > getWidth() / 2 && this.listPosition > 0) {
                    goToPrev();
                    return true;
                } else if ((-(this.translateX - this.minX)) > getWidth() / 2 && this.listPosition < this.adapter.getCount() - 1) {
                    goToNext();
                    return true;
                } else if (this.translateX < this.minX || this.translateX > this.maxX || this.translateY < this.minY || this.translateY > this.maxY) {
                    animateTo(clamp(this.scale, this.minScale, this.maxScale), clamp(this.translateX, this.minX, this.maxX), clamp(this.translateY, this.minY, this.maxY));
                }
            }
            if (ev.getAction() == 0) {
                if (!this.scroller.isFinished()) {
                    this.scroller.abortAnimation();
                }
                if (System.currentTimeMillis() - this.animStartTime < this.animDuration) {
                    float at = this.itrp.getInterpolation(((float) (System.currentTimeMillis() - this.animStartTime)) / ((float) this.animDuration));
                    this.animStartTime = 0L;
                    this.translateX += Math.round((this.animTx - this.translateX) * at);
                    this.translateY += Math.round((this.animTy - this.translateY) * at);
                    this.scale += (this.animScale - this.scale) * at;
                    invalidate();
                }
                if (this.postedPhotoSwitch != null) {
                    removeCallbacks(this.postedPhotoSwitch);
                    this.postedPhotoSwitch = null;
                }
                this.dragStartX = ev.getX();
                this.dragStartY = ev.getY();
                this.dragStartTx = this.translateX;
                this.dragStartTy = this.translateY;
                this.dragStartPointerID = ev.getPointerId(0);
                if (this.prevCallbackPos != this.listPosition) {
                    if (this.prevCallbackPos == this.listPosition + 1) {
                        this.dragStartX -= this.viewportW + PAGE_SPACING;
                        this.translateX += this.viewportW + PAGE_SPACING;
                        switchPhoto(true);
                    } else if (this.prevCallbackPos == this.listPosition - 1) {
                        this.dragStartX += this.viewportW + PAGE_SPACING;
                        this.translateX -= this.viewportW + PAGE_SPACING;
                        switchPhoto(false);
                    }
                    updateTextures();
                    invalidate();
                    Log.d(TAG, "Already switched " + this.prevCallbackPos);
                }
            }
            if (ev.getAction() == 2 && ev.getPointerCount() == 1) {
                if (System.currentTimeMillis() < this.pinchEndTime + 300 || System.currentTimeMillis() - this.animStartTime < this.animDuration) {
                    return true;
                }
                if (this.dragStartPointerID != ev.getPointerId(0)) {
                    this.dragStartX = ev.getX();
                    this.dragStartY = ev.getY();
                    this.dragStartTx = this.translateX;
                    this.dragStartTy = this.translateY;
                    this.dragStartPointerID = ev.getPointerId(0);
                    return true;
                }
                if (this.maxX > 0 || (this.isList && !this.dismissing)) {
                    this.translateX = (this.dragStartTx + ev.getX()) - this.dragStartX;
                    updateTextures();
                } else {
                    this.translateX = 0.0f;
                }
                if (this.scale == this.minScale && (Math.abs(this.translateY) > this.touchslop || (Math.abs(this.translateX) < this.touchslop && !this.dragging))) {
                    this.translateX = 0.0f;
                }
                if (this.scale == this.minScale && Math.abs(this.translateX) > this.touchslop && !this.dragging) {
                    this.dragging = true;
                    if (this.translateX > 0.0f) {
                        this.dragStartX += this.touchslop;
                        this.translateX -= this.touchslop;
                    } else {
                        this.dragStartX -= this.touchslop;
                        this.translateX += this.touchslop;
                    }
                }
                this.translateY = (this.dragStartTy + ev.getY()) - this.dragStartY;
                if (this.scale != this.minScale) {
                    if (this.translateY > this.maxY) {
                        this.translateY = this.maxY + ((this.translateY - this.maxY) / 2.0f);
                    }
                    if (this.translateY < this.minY) {
                        this.translateY = this.minY + ((this.translateY - this.minY) / 2.0f);
                    }
                } else if (this.scale == this.minScale) {
                    if (Math.abs(this.translateX) > this.touchslop || ((Math.abs(this.translateY) < this.touchslop && !this.dismissing) || this.dragging)) {
                        this.translateY = 0.0f;
                    } else if (Math.abs(this.translateY) > this.touchslop) {
                        if (this.dismissListener != null && !this.dismissing && !this.dismissed) {
                            this.dismissListener.onPrepareDismiss();
                            if (this.translateY > 0.0f) {
                                this.dragStartY += this.touchslop;
                                this.translateY -= this.touchslop;
                            } else {
                                this.dragStartY -= this.touchslop;
                                this.translateY += this.touchslop;
                            }
                        }
                        this.dismissing = true;
                    }
                }
                if (this.translateX - this.maxX > getWidth() / 2 && this.listPosition > 0) {
                    callPositionChanged(this.listPosition - 1);
                } else if ((-(this.translateX - this.minX)) > getWidth() / 2 && this.listPosition < this.adapter.getCount() - 1) {
                    callPositionChanged(this.listPosition + 1);
                } else {
                    callPositionChanged(this.listPosition);
                }
                if (this.scale == this.minScale) {
                    if (this.translateX < 0.0f && (-(this.translateX - this.minX)) > this.viewportW + PAGE_SPACING) {
                        switchPhoto(true);
                        this.dragStartX -= this.viewportW + PAGE_SPACING;
                        this.translateX += this.viewportW + PAGE_SPACING;
                    } else if (this.translateX > 0.0f && this.translateX - this.maxX > this.viewportW + PAGE_SPACING) {
                        switchPhoto(false);
                        this.dragStartX += this.viewportW + PAGE_SPACING;
                        this.translateX -= this.viewportW + PAGE_SPACING;
                    }
                }
                invalidate();
                if (this.thumbView.getVisibility() == 0) {
                    this.overlay.invalidate();
                }
            }
            if ((this.dismissing || this.animStartTime + this.animDuration > System.currentTimeMillis()) && ev.getPointerCount() > 1) {
                return true;
            }
            if ((ev.getAction() & 255) == 5) {
                if ((-(this.translateX - this.minX)) > this.touchslop || this.translateX - this.maxX > this.touchslop) {
                    this.disallowZoom = true;
                    return true;
                }
                this.pinchStartDist = (float) Math.hypot(ev.getX(1) - ev.getX(0), ev.getY(1) - ev.getY(0));
                this.pinchStartScale = this.scale;
                this.pinchCenterX = (ev.getX(0) + ev.getX(1)) / 2.0f;
                this.pinchCenterY = (ev.getY(0) + ev.getY(1)) / 2.0f;
                this.scaleStartTx = this.translateX;
                this.scaleStartTy = this.translateY;
            }
            if ((ev.getAction() & 255) == 6) {
                if (this.disallowZoom) {
                    this.disallowZoom = false;
                    return true;
                }
                this.dragStartPointerID = -1;
                if (this.scale < this.minScale) {
                    animateTo(this.minScale, 0.0f, 0.0f);
                    updateMinMax(this.minScale);
                } else if (this.scale > this.maxScale) {
                    updateMinMax(this.maxScale);
                    float atx = clamp(this.translateX, this.minX, this.maxX);
                    float aty = clamp(this.translateY, this.minY, this.maxY);
                    animateTo(this.maxScale, atx, aty);
                }
                this.pinchEndTime = System.currentTimeMillis();
            }
            if ((ev.getAction() & 255) != 2 || ev.getPointerCount() != 2 || ((this.adapter != null && !this.adapter.allowZoom(this.listPosition)) || this.disallowZoom || this.dismissing)) {
                return true;
            }
            float pinchDist = (float) Math.hypot(ev.getX(1) - ev.getX(0), ev.getY(1) - ev.getY(0));
            this.scale = (pinchDist / this.pinchStartDist) * this.pinchStartScale;
            this.translateX = (this.pinchCenterX - (this.viewportW / 2.0f)) - (((this.pinchCenterX - (this.viewportW / 2.0f)) - this.scaleStartTx) * (this.scale / this.pinchStartScale));
            this.translateY = (this.pinchCenterY - (this.viewportH / 2.0f)) - (((this.pinchCenterY - (this.viewportH / 2.0f)) - this.scaleStartTy) * (this.scale / this.pinchStartScale));
            if (this.zoomListener != null) {
                this.zoomListener.onZoomChanged(this.scale, this.maxScale, this.minScale);
            }
            invalidate();
            return true;
        }
    }

    private void applyOverlayTransform() {
        float tx;
        float ty;
        float ts;
        if (this.customOverlayContainer != null) {
            if (System.currentTimeMillis() - this.animStartTime < this.animDuration) {
                float a = ((float) (System.currentTimeMillis() - this.animStartTime)) / ((float) this.animDuration);
                float ai = this.itrp.getInterpolation(a);
                ts = this.scale + ((this.animScale - this.scale) * ai);
                tx = this.translateX + ((this.animTx - this.translateX) * ai);
                ty = this.translateY + ((this.animTy - this.translateY) * ai);
            } else {
                tx = this.translateX;
                ty = this.translateY;
                ts = this.scale;
            }
            this.customOverlayContainer.setTranslationX(tx);
            this.customOverlayContainer.setTranslationY(ty);
            this.customOverlayContainer.setScaleX(ts / this.minScale);
            this.customOverlayContainer.setScaleY(ts / this.minScale);
            Iterator<View> it = this.overlayViews.iterator();
            while (it.hasNext()) {
                View v = it.next();
                v.invalidate();
            }
        }
    }

    public void animateIn(final Rect rect, final int clipSize, final int clipBottom) {
        this.thumbRect = new Rect(rect);
        this.thumbRect.top += clipSize;
        this.thumbRect.bottom -= clipBottom;
        this.inAnimDone = false;
        this.overlay.setBackgroundDrawable(this.windowBg);
        this.thumbView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.PhotoView.4
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                PhotoView.this.thumbView.getViewTreeObserver().removeOnPreDrawListener(this);
                int[] pos = {0, 0};
                PhotoView.this.thumbView.getLocationOnScreen(pos);
                int rectWidth = rect.width();
                int rectHeight = rect.height();
                float scaleX = rectWidth / PhotoView.this.thumbView.getWidth();
                float scaleY = rectHeight / PhotoView.this.thumbView.getHeight();
                float transX = rect.left - pos[0];
                float transY = rect.top - pos[1];
                float scale = Math.max(scaleX, scaleY);
                float tRatio = rectWidth / rectHeight;
                float ivRatio = PhotoView.this.thumbView.getWidth() / PhotoView.this.thumbView.getHeight();
                int clipV = 0;
                int clipH = 0;
                if (tRatio != ivRatio) {
                    if (tRatio > ivRatio) {
                        float th = PhotoView.this.thumbView.getHeight() * scale;
                        clipV = Math.round(((th - rectHeight) / 2.0f) / scale);
                        transY -= (th - rectHeight) / 2.0f;
                    } else {
                        float tw = PhotoView.this.thumbView.getWidth() * scale;
                        clipH = Math.round(((tw - rectWidth) / 2.0f) / scale);
                        transX -= (tw - rectWidth) / 2.0f;
                    }
                }
                int clipV2 = Math.max(0, clipV);
                int clipH2 = Math.max(0, clipH);
                PhotoView.this.thumbView.setPivotX(0.0f);
                PhotoView.this.thumbView.setPivotY(0.0f);
                PhotoView.this.thumbView.setScaleX(scale);
                PhotoView.this.thumbView.setScaleY(scale);
                PhotoView.this.thumbView.setTranslationX(transX);
                PhotoView.this.thumbView.setTranslationY(transY);
                AnimatorSet set = new AnimatorSet();
                set.playTogether(ObjectAnimator.ofFloat(PhotoView.this.thumbView, "scaleX", 1.0f), ObjectAnimator.ofFloat(PhotoView.this.thumbView, "scaleY", 1.0f), ObjectAnimator.ofFloat(PhotoView.this.thumbView, "translationX", 0.0f), ObjectAnimator.ofFloat(PhotoView.this.thumbView, "translationY", 0.0f), ObjectAnimator.ofInt(PhotoView.this, "windowBgAlpha", 0, 255), ObjectAnimator.ofInt(PhotoView.this.thumbView, "clipBottom", Math.round(clipBottom / scale) + clipV2, 0), ObjectAnimator.ofInt(PhotoView.this.thumbView, "clipTop", Math.round(clipSize / scale) + clipV2, 0), ObjectAnimator.ofInt(PhotoView.this.thumbView, "clipHorizontal", clipH2, 0));
                set.setDuration(300L);
                set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.PhotoView.4.1
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator a) {
                        PhotoView.this.overlay.setBackgroundDrawable(null);
                        PhotoView.this.inAnimDone = true;
                        PhotoView.this.invalidate();
                    }
                });
                set.setInterpolator(PhotoView.interpolatorIn);
                set.start();
                return true;
            }
        });
    }

    public void animateOut(Rect rect, int clipSize, int clipBottom, Runnable after) {
        if (this.inAnimDone) {
            this.thumbView.setVisibility(0);
            this.thumbView.clearAnimation();
            if (this.texture.data != null) {
                this.thumbView.setImageBitmap(this.texture.data);
            }
            requestLayout();
            this.thumbView.getViewTreeObserver().addOnPreDrawListener(new AnonymousClass5(rect, clipBottom, clipSize, after));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ui.PhotoView$5  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass5 implements ViewTreeObserver.OnPreDrawListener {
        final /* synthetic */ Runnable val$after;
        final /* synthetic */ int val$clipBottom;
        final /* synthetic */ int val$clipSize;
        final /* synthetic */ Rect val$rect;

        AnonymousClass5(Rect rect, int i, int i2, Runnable runnable) {
            this.val$rect = rect;
            this.val$clipBottom = i;
            this.val$clipSize = i2;
            this.val$after = runnable;
        }

        @Override // android.view.ViewTreeObserver.OnPreDrawListener
        public boolean onPreDraw() {
            if (PhotoView.this.outAnimDone) {
                PhotoView.this.thumbView.getViewTreeObserver().removeOnPreDrawListener(this);
                PhotoView.this.overlay.setBackgroundDrawable(PhotoView.this.windowBg);
                PhotoView.this.outAnimDone = false;
                PhotoView.this.invalidate();
                int[] pos = {0, 0};
                PhotoView.this.thumbView.getLocationOnScreen(pos);
                float scaleX = this.val$rect.width() / PhotoView.this.thumbView.getWidth();
                float scaleY = this.val$rect.height() / PhotoView.this.thumbView.getHeight();
                float transX = this.val$rect.left - pos[0];
                float transY = this.val$rect.top - pos[1];
                float scale = Math.max(scaleX, scaleY);
                float tRatio = this.val$rect.width() / this.val$rect.height();
                float ivRatio = PhotoView.this.thumbView.getWidth() / PhotoView.this.thumbView.getHeight();
                int clipV = 0;
                int clipH = 0;
                if (tRatio != ivRatio) {
                    if (tRatio > ivRatio) {
                        float th = PhotoView.this.thumbView.getHeight() * scale;
                        clipV = Math.round(((th - this.val$rect.height()) / 2.0f) / scale);
                        transY -= (th - this.val$rect.height()) / 2.0f;
                    } else {
                        float tw = PhotoView.this.thumbView.getWidth() * scale;
                        clipH = Math.round(((tw - this.val$rect.width()) / 2.0f) / scale);
                        transX -= (tw - this.val$rect.width()) / 2.0f;
                    }
                }
                PhotoView.this.thumbView.setPivotX(0.0f);
                PhotoView.this.thumbView.setPivotY(0.0f);
                PhotoView.this.thumbView.setScaleX(PhotoView.this.scale / PhotoView.this.minScale);
                PhotoView.this.thumbView.setScaleY(PhotoView.this.scale / PhotoView.this.minScale);
                PhotoView.this.thumbView.setTranslationX(PhotoView.this.translateX - ((PhotoView.this.texture.cropWidth / 2) * Math.max((PhotoView.this.scale / PhotoView.this.minScale) - 1.0f, 0.0f)));
                PhotoView.this.thumbView.setTranslationY(PhotoView.this.translateY - ((PhotoView.this.texture.cropHeight / 2) * Math.max((PhotoView.this.scale / PhotoView.this.minScale) - 1.0f, 0.0f)));
                V.cancelVisibilityAnimation(PhotoView.this.thumbView);
                AnimatorSet set = new AnimatorSet();
                set.playTogether(ObjectAnimator.ofFloat(PhotoView.this.thumbView, "scaleX", scale), ObjectAnimator.ofFloat(PhotoView.this.thumbView, "scaleY", scale), ObjectAnimator.ofFloat(PhotoView.this.thumbView, "translationX", transX), ObjectAnimator.ofFloat(PhotoView.this.thumbView, "translationY", transY), ObjectAnimator.ofInt(PhotoView.this, "windowBgAlpha", Math.round(PhotoView.this.bgAlpha * 255.0f), 0), ObjectAnimator.ofInt(PhotoView.this.thumbView, "clipBottom", 0, Math.round(this.val$clipBottom / scale) + clipV), ObjectAnimator.ofInt(PhotoView.this.thumbView, "clipTop", 0, Math.round(this.val$clipSize / scale) + clipV), ObjectAnimator.ofInt(PhotoView.this.thumbView, "clipHorizontal", 0, clipH));
                set.setDuration(300L);
                set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.PhotoView.5.1
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator a) {
                        PhotoView.this.post(new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.5.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                PhotoView.this.overlay.setBackgroundDrawable(null);
                                PhotoView.this.thumbView.setVisibility(8);
                                PhotoView.this.inAnimDone = true;
                                PhotoView.this.invalidate();
                                if (AnonymousClass5.this.val$after != null) {
                                    AnonymousClass5.this.val$after.run();
                                }
                            }
                        });
                    }
                });
                set.setInterpolator(PhotoView.interpolatorIn);
                set.start();
                return true;
            }
            return true;
        }
    }

    public void setWindowBgAlpha(int alpha) {
        this.windowBg.setAlpha(alpha);
        if (this.dismissListener != null) {
            this.dismissListener.onBackgroundAlphaChanged(alpha / 522.0f);
        }
    }

    @Override // android.view.View
    public boolean onTrackballEvent(MotionEvent ev) {
        if (ev.getAction() == 2) {
            this.translateX = clamp(this.translateX + (ev.getX() * 50.0f), this.minX, this.maxX);
            this.translateY = clamp(this.translateY - (ev.getY() * 50.0f), this.minY, this.maxY);
            postInvalidate();
        }
        if (ev.getAction() == 0) {
            if (this.scale < this.maxScale) {
                animateTo(this.maxScale, this.translateX, this.translateY);
                return true;
            }
            animateTo(this.minScale, 0.0f, 0.0f);
            return true;
        }
        return true;
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        this.clickListener = l;
    }

    public void setLimitOffsets(int x, int y) {
        this.limitY = y;
        this.limitX = x;
    }

    public void setNavigationListener(NavigationListener l) {
        this.navListener = l;
    }

    public void setDismissListener(DismissListener l) {
        this.dismissListener = l;
    }

    public void setZoomListener(ZoomListener l) {
        this.zoomListener = l;
    }

    private void callPositionChanged(int pos) {
        if (this.navListener != null && pos != this.prevCallbackPos) {
            this.navListener.onPositionChanged(pos);
        }
        this.prevCallbackPos = pos;
    }

    private void animateTo(float newScale, float newTx, float newTy) {
        Log.d(TAG, "animate to " + newScale + ", " + newTx + ", " + newTy + " from " + this.scale + ", " + this.translateX + ", " + this.translateY);
        this.animScale = newScale;
        this.animTx = newTx;
        this.animTy = newTy;
        this.animStartTime = System.currentTimeMillis();
        this.animDuration = 300L;
        postInvalidate();
        this.overlay.postInvalidate();
        if (this.zoomListener != null) {
            this.zoomListener.onZoomChanged(newScale, this.maxScale, this.minScale);
        }
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTap(MotionEvent e) {
        if ((this.scale != this.minScale || Math.abs(this.translateY) <= 0.0f) && this.animStartTime + this.animDuration <= System.currentTimeMillis() && this.translateX <= this.maxX + this.touchslop && this.translateX >= this.minX - this.touchslop) {
            if (this.texture != null && !this.texture.loaded) {
                return false;
            }
            if (this.scale < this.maxScale) {
                float atx = (e.getX() - (this.viewportW / 2.0f)) - (((e.getX() - (this.viewportW / 2.0f)) - this.translateX) * (this.maxScale / this.scale));
                float aty = (e.getY() - (this.viewportH / 2.0f)) - (((e.getY() - (this.viewportH / 2.0f)) - this.translateY) * (this.maxScale / this.scale));
                updateMinMax(this.maxScale);
                animateTo(this.maxScale, clamp(atx, this.minX, this.maxX), clamp(aty, this.minY, this.maxY));
            } else {
                animateTo(this.minScale, 0.0f, 0.0f);
            }
            this.doubleTap = true;
            return true;
        }
        return false;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTapEvent(MotionEvent e) {
        return false;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onSingleTapConfirmed(MotionEvent e) {
        if (this.clickListener != null) {
            this.clickListener.onClick(this);
            return true;
        }
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onDown(MotionEvent e) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
        if (this.scale == this.minScale && this.dismissing && Math.abs(velocityY) > V.dp(1000.0f) && this.dismissListener != null) {
            this.dismissListener.onDismiss();
            this.dismissed = true;
        } else if ((this.translateX - this.maxX > 0.0f || (-(this.translateX - this.minX)) > 0.0f) && Math.abs(velocityX) > 650.0f * this.density) {
            Log.i(TAG, "Switch by velocity");
            if (velocityX > 0.0f && this.listPosition > 0) {
                goToPrev();
            } else if (velocityX < 0.0f && this.listPosition < this.adapter.getCount() - 1) {
                goToNext();
            }
        } else if (System.currentTimeMillis() > this.pinchEndTime + 300) {
            this.scroller.fling(Math.round(this.translateX), Math.round(this.translateY), Math.round(velocityX), Math.round(velocityY), this.minX, this.maxX, this.minY, this.maxY);
            postInvalidate();
        }
        return true;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onLongPress(MotionEvent e) {
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onShowPress(MotionEvent e) {
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onSingleTapUp(MotionEvent e) {
        return false;
    }

    public void goToNext() {
        animateTo(this.scale, (this.minX - this.viewportW) - PAGE_SPACING, this.translateY);
        postSwitch(true);
    }

    public void goToPrev() {
        animateTo(this.scale, this.maxX + this.viewportW + PAGE_SPACING, this.translateY);
        postSwitch(false);
    }

    private void postSwitch(final boolean fwd) {
        Runnable runnable = new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.6
            @Override // java.lang.Runnable
            public void run() {
                PhotoView.this.postedPhotoSwitch = null;
                PhotoView.this.translateX = PhotoView.this.translateY = 0.0f;
                PhotoView.this.switchPhoto(fwd);
            }
        };
        this.postedPhotoSwitch = runnable;
        postDelayed(runnable, this.animDuration + 50);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void switchPhoto(boolean fwd) {
        if (fwd) {
            this.listPosition++;
        } else {
            this.listPosition--;
        }
        if (this.listPosition < 0) {
            this.listPosition = 0;
        }
        if (this.listPosition >= this.adapter.getCount()) {
            this.listPosition = this.adapter.getCount() - 1;
        }
        callPositionChanged(this.listPosition);
        if (this.navListener != null) {
            this.navListener.onPositionConfirmed(this.listPosition);
        }
        if (fwd) {
            Log.i(TAG, "Switch photo >> [" + this.listPosition + "]");
            Texture tmp = this.texturePrev;
            this.texturePrev = this.texture;
            this.texture = this.textureNext;
            this.textureNext = tmp;
        } else {
            Log.i(TAG, "Switch photo << [" + this.listPosition + "]");
            Texture tmp2 = this.textureNext;
            this.textureNext = this.texture;
            this.texture = this.texturePrev;
            this.texturePrev = tmp2;
        }
        updateScale(true);
        updateMinMax(this.scale);
        loadPhotos(fwd);
        if (this.texture.thumb && this.texture.data != null) {
            this.thumbView.setImageBitmap(this.texture.data);
            this.thumbView.setVisibility(0);
            this.overlay.invalidate();
        } else {
            this.thumbView.setImageBitmap(null);
        }
        if (this.prevSwitchFwd != fwd) {
            Log.i(TAG, "Switch dir was " + this.prevSwitchFwd + ", now " + fwd);
        }
        this.prevSwitchFwd = fwd;
        if (this.texturePrev == this.textureNext) {
            Log.e(TAG, "OH SHIT!");
        }
        if (this.texture == this.textureNext) {
            Log.e(TAG, "OH SHIT!");
        }
        if (this.texture == this.texturePrev) {
            Log.e(TAG, "OH SHIT!");
        }
        V.setVisibilityAnimated(this.progressBar, 0);
        invalidate();
        this.overlay.requestLayout();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadPhotos(boolean fwd) {
        boolean z = true;
        boolean z2 = false;
        if (!fwd ? this.listPosition - 1 >= 0 : this.listPosition + 1 < this.adapter.getCount()) {
            if (!this.texture.loaded) {
                ImageLoadTask[] imageLoadTaskArr = new ImageLoadTask[2];
                imageLoadTaskArr[0] = new ImageLoadTask(this.listPosition, false, this.texture);
                int i = fwd ? this.listPosition + 1 : this.listPosition - 1;
                if (!this.adapter.shouldPreload()) {
                    z2 = true;
                }
                imageLoadTaskArr[1] = new ImageLoadTask(i, z2, fwd ? this.textureNext : this.texturePrev);
                load(Arrays.asList(imageLoadTaskArr));
                return;
            }
            ImageLoadTask[] imageLoadTaskArr2 = new ImageLoadTask[1];
            int i2 = fwd ? this.listPosition + 1 : this.listPosition - 1;
            if (this.adapter.shouldPreload()) {
                z = false;
            }
            imageLoadTaskArr2[0] = new ImageLoadTask(i2, z, fwd ? this.textureNext : this.texturePrev);
            load(Arrays.asList(imageLoadTaskArr2));
        } else if (!this.texture.loaded) {
            ImageLoadTask[] imageLoadTaskArr3 = new ImageLoadTask[2];
            imageLoadTaskArr3[0] = new ImageLoadTask(this.listPosition, false, this.texture);
            int i3 = fwd ? this.listPosition + 1 : this.listPosition - 1;
            if (!this.adapter.shouldPreload()) {
                z2 = true;
            }
            imageLoadTaskArr3[1] = new ImageLoadTask(i3, z2, fwd ? this.textureNext : this.texturePrev);
            load(Arrays.asList(imageLoadTaskArr3));
        }
    }

    public void setAdapter(PhotoViewerAdapter a) {
        this.adapter = a;
        if (this.inited) {
            loadPhotos(true);
            return;
        }
        final long tt = System.currentTimeMillis();
        post(new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.7
            @Override // java.lang.Runnable
            public void run() {
                Log.i(PhotoView.TAG, "wait before load: " + (System.currentTimeMillis() - tt));
                if (PhotoView.this.inited) {
                    if (PhotoView.this.loadingBitmaps.size() <= 0) {
                        PhotoView.this.loadPhotos(true);
                        return;
                    }
                    return;
                }
                PhotoView.this.post(this);
            }
        });
    }

    private void load(List<ImageLoadTask> tasks) {
        this.error.setVisibility(8);
        try {
            this.queueLock.acquire();
        } catch (Exception e) {
        }
        ArrayList<Integer> indexes = new ArrayList<>();
        for (ImageLoadTask t : tasks) {
            indexes.add(Integer.valueOf(t.index));
            boolean found = false;
            Iterator<ImageLoadTask> it = this.loadingBitmaps.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                ImageLoadTask s = it.next();
                if (s.index == t.index) {
                    if (s.onlyIfCached && !t.onlyIfCached && s.loader == null) {
                        s.cancel();
                        this.loadingBitmaps.remove(s);
                        Log.i(TAG, "Replacing cache-only task with full for " + t.index);
                    } else {
                        found = true;
                    }
                }
            }
            if (!found) {
                t.tex.loaded = false;
                t.tex.thumb = false;
                t.preRun();
                this.loaderThread.postRunnable(t, 0);
                this.loadingBitmaps.add(t);
            }
        }
        Iterator<ImageLoadTask> itrtr = this.loadingBitmaps.iterator();
        while (itrtr.hasNext()) {
            ImageLoadTask task = itrtr.next();
            if (!indexes.contains(Integer.valueOf(task.index))) {
                task.cancel();
                itrtr.remove();
            }
        }
        Log.d(TAG, "Current queue: " + this.loadingBitmaps);
        this.queueLock.release();
    }

    public float getTranslateX() {
        return this.translateX;
    }

    public float getTranslateY() {
        return this.translateY;
    }

    public float getScale() {
        return this.scale;
    }

    public int getPhotoWidth() {
        return this.texture.cropWidth;
    }

    public int getPhotoHeight() {
        return this.texture.cropHeight;
    }

    public void setFitBySmallestSide(boolean fit) {
        this.fitBySmallestSide = fit;
    }

    public void setResetOnResize(boolean reset) {
        this.resetOnResize = reset;
    }

    @Override // android.view.View
    public void onDraw(Canvas c) {
        float aty;
        if (this.inAnimDone && this.outAnimDone) {
            if (this.thumbRect != null) {
                int[] f = {0, 0};
                getLocationOnScreen(f);
                c.save();
                c.translate(0.0f, -f[1]);
                c.clipRect(0, getPaddingTop(), c.getWidth(), c.getHeight() - getPaddingBottom());
                c.drawRect(this.thumbRect, this.bgPaint);
                c.restore();
            }
            c.save();
            c.translate((((getWidth() - getPaddingLeft()) - getPaddingRight()) / 2) + getPaddingLeft(), (((getHeight() - getPaddingTop()) - getPaddingBottom()) / 2) + getPaddingTop());
            float f2 = this.translateY;
            if (System.currentTimeMillis() - this.animStartTime < this.animDuration) {
                if (!this.scroller.isFinished()) {
                    this.scroller.abortAnimation();
                }
                float a = ((float) (System.currentTimeMillis() - this.animStartTime)) / ((float) this.animDuration);
                float ai = this.itrp.getInterpolation(a);
                float ts = this.scale + ((this.animScale - this.scale) * ai);
                float tx = (this.translateX + ((this.animTx - this.translateX) * ai)) / ts;
                float ty = (this.translateY + ((this.animTy - this.translateY) * ai)) / ts;
                aty = ty;
                if (tx - this.maxX > getWidth() / 2 && this.listPosition > 0) {
                    callPositionChanged(this.listPosition - 1);
                } else if ((-(tx - this.minX)) > getWidth() / 2 && this.listPosition < this.adapter.getCount() - 1) {
                    callPositionChanged(this.listPosition + 1);
                }
                c.scale(ts, ts);
                c.translate(tx, ty);
                invalidate();
            } else {
                if (this.animStartTime != 0) {
                    this.translateX = this.animTx;
                    this.translateY = this.animTy;
                    this.scale = this.animScale;
                    this.bgAlpha = 1.0f;
                    if (this.dismissListener != null) {
                        this.dismissListener.onBackgroundAlphaChanged(this.bgAlpha);
                    }
                    this.animStartTime = 0L;
                    updateMinMax(this.scale);
                }
                if (!this.scroller.isFinished() && this.scroller.computeScrollOffset()) {
                    if (this.scroller.getStartX() < this.maxX && this.scroller.getStartX() > this.minX) {
                        this.translateX = this.scroller.getCurrX();
                    }
                    if (this.scroller.getStartY() < this.maxY && this.scroller.getStartY() > this.minY) {
                        this.translateY = this.scroller.getCurrY();
                    }
                    invalidate();
                }
                c.translate(this.translateX, this.translateY);
                c.scale(this.scale, this.scale);
                aty = this.translateY;
                this.overlay.invalidate();
            }
            int ba = 255;
            if (this.scale == this.minScale) {
                if (Float.isNaN(aty)) {
                    aty = 0.0f;
                }
                this.bgAlpha = 1.0f - (Math.abs(aty) / getHeight());
                if (this.dismissListener != null) {
                    this.dismissListener.onBackgroundAlphaChanged(this.bgAlpha);
                }
                ba = Math.round(this.bgAlpha * 255.0f);
            }
            c.drawColor(ba << 24);
            if (this.texture != null && ((this.texture.loaded || this.texture.thumb) && this.texture.data != null)) {
                if (this.progressBar.getVisibility() != 8 && !this.texture.thumb) {
                    V.cancelVisibilityAnimation(this.progressBar);
                    this.progressBar.setVisibility(8);
                }
                c.drawBitmap(this.texture.data, (-this.texture.cropWidth) / 2.0f, (-this.texture.cropHeight) / 2.0f, this.bitmapPaint);
            }
            if (this.scale >= this.minScale && this.texture2 != null && this.texture2.data != null && (this.texture2.loaded || this.texture2.thumb)) {
                c.translate(0.0f, (-this.translateY) / this.scale);
                float k = this.secondIsNext ? 1.0f : -1.0f;
                c.translate((((this.viewportW + PAGE_SPACING) * k) / this.minScale) / 2.0f, 0.0f);
                c.scale(this.scaleNext / this.scale, this.scaleNext / this.scale);
                c.translate((((this.viewportW + PAGE_SPACING) * k) / this.scaleNext) / 2.0f, 0.0f);
                c.drawBitmap(this.texture2.data, (-this.texture2.cropWidth) / 2.0f, (-this.texture2.cropHeight) / 2.0f, this.bitmapPaint);
            }
            c.restore();
            applyOverlayTransform();
        }
    }

    public void setThumbBounds(Rect r) {
        if (this.thumbRect != null) {
            this.thumbRect.set(r);
        }
        this.overlay.invalidate();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class Texture {
        int cropHeight;
        int cropWidth;
        Bitmap data;
        int id;
        int photoIndex;
        boolean loaded = false;
        boolean thumb = false;

        public Texture(int _id) {
            this.id = _id;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class ImageLoadTask implements Runnable {
        boolean canceled;
        int index;
        RunnableFuture<Bitmap> loader;
        boolean onlyIfCached;
        Texture tex;

        public ImageLoadTask(int _index, boolean _onlyIfCached, Texture _texture) {
            this.index = _index;
            this.onlyIfCached = _onlyIfCached;
            this.tex = _texture;
        }

        public void cancel() {
            this.canceled = true;
            PhotoView.this.cancelerThread.postRunnable(new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.ImageLoadTask.1
                @Override // java.lang.Runnable
                public void run() {
                    if (ImageLoadTask.this.loader != null) {
                        ImageLoadTask.this.loader.cancel(false);
                    }
                }
            }, 0);
        }

        public void preRun() {
            Bitmap thumb = PhotoView.this.adapter.getThumb(this.index);
            if (thumb != null) {
                Log.i(PhotoView.TAG, "Set thumb " + this.index);
                this.tex.thumb = true;
                this.tex.data = thumb;
                this.tex.cropWidth = thumb.getWidth();
                this.tex.cropHeight = thumb.getHeight();
                PhotoView.this.updateScale(false);
                PhotoView.this.postInvalidate();
            }
        }

        public String toString() {
            return "ImageLoadTask{index=" + this.index + ", canceled=" + this.canceled + ", ifCached=" + this.onlyIfCached + "}";
        }

        @Override // java.lang.Runnable
        public void run() {
            boolean z = true;
            try {
                if (this.canceled) {
                    Log.i("vk", "Load task for " + this.index + " canceled before load");
                } else if (this.index < 0 || this.index >= PhotoView.this.adapter.getCount()) {
                    Log.w(PhotoView.TAG, "Index " + this.index + " out of adapter bounds, canceled");
                    try {
                        PhotoView.this.queueLock.acquire();
                    } catch (Exception e) {
                    }
                    PhotoView.this.loadingBitmaps.remove(this);
                    PhotoView.this.queueLock.release();
                } else if (this.onlyIfCached && !PhotoView.this.adapter.isCached(this.index)) {
                    Log.d("vk", "Image " + this.index + " is not cached");
                    try {
                        PhotoView.this.queueLock.acquire();
                    } catch (Exception e2) {
                    }
                    PhotoView.this.loadingBitmaps.remove(this);
                    PhotoView.this.queueLock.release();
                } else {
                    try {
                        if (System.currentTimeMillis() - PhotoView.this.animStartTime < PhotoView.this.animDuration) {
                            Thread.sleep((PhotoView.this.animDuration - (System.currentTimeMillis() - PhotoView.this.animStartTime)) + 100);
                        }
                        final Bitmap thumb = PhotoView.this.adapter.getThumb(this.index);
                        if (this.index == PhotoView.this.listPosition) {
                            Utils.castToActivity(PhotoView.this.getContext()).runOnUiThread(new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.ImageLoadTask.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    if (PhotoView.this.adapter.isCached(ImageLoadTask.this.index) || (thumb != null && Math.max(thumb.getWidth(), thumb.getHeight()) > 500)) {
                                        V.cancelVisibilityAnimation(PhotoView.this.progressBar);
                                        PhotoView.this.progressBar.setVisibility(8);
                                    } else {
                                        if (PhotoView.this.showProgress != null) {
                                            PhotoView.this.removeCallbacks(PhotoView.this.showProgress);
                                        }
                                        PhotoView.this.showProgress = new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.ImageLoadTask.2.1
                                            @Override // java.lang.Runnable
                                            public void run() {
                                                V.setVisibilityAnimated(PhotoView.this.progressBar, 0);
                                                PhotoView.this.showProgress = null;
                                            }
                                        };
                                    }
                                    PhotoView.this.postDelayed(PhotoView.this.showProgress, 400L);
                                    PhotoView.this.progressBar.setProgress(0.0d);
                                    if (thumb != null) {
                                        PhotoView.this.thumbView.setImageBitmap(thumb);
                                        PhotoView.this.thumbView.setVisibility(0);
                                        Log.i(PhotoView.TAG, "Set thumb image " + PhotoView.this.listPosition);
                                    } else {
                                        PhotoView.this.thumbView.setImageBitmap(null);
                                    }
                                    PhotoView.this.overlay.requestLayout();
                                }
                            });
                        }
                        this.tex.data = thumb;
                        this.tex.thumb = true;
                        if (thumb != null) {
                            this.tex.cropWidth = thumb.getWidth();
                            this.tex.cropHeight = thumb.getHeight();
                        }
                        this.loader = PhotoView.this.adapter.getPhoto(this.index);
                        this.loader.setProgressCallback(new VKImageRequestProgress() { // from class: com.vkontakte.android.ui.PhotoView.ImageLoadTask.3
                            @Override // com.vk.imageloader.VKImageRequestProgress
                            public void onProgressUpdate(final float progress) {
                                if (ImageLoadTask.this.index == PhotoView.this.listPosition) {
                                    Utils.castToActivity(PhotoView.this.getContext()).runOnUiThread(new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.ImageLoadTask.3.1
                                        @Override // java.lang.Runnable
                                        public void run() {
                                            PhotoView.this.progressBar.setProgress(progress);
                                            PhotoView.this.error.setVisibility(8);
                                        }
                                    });
                                }
                            }
                        });
                        this.loader.run();
                    } catch (Exception x) {
                        Log.w("vk", "Error appkit_loading photo at position " + this.index, x);
                    }
                    if (this.canceled) {
                        Log.i("vk", "Load task for " + this.index + " canceled after load");
                        try {
                            PhotoView.this.queueLock.acquire();
                        } catch (Exception e3) {
                        }
                        PhotoView.this.loadingBitmaps.remove(this);
                        PhotoView.this.queueLock.release();
                        return;
                    }
                    if (!this.loader.isDone() && !this.loader.isCancelled()) {
                        this.loader.run();
                    }
                    Bitmap bmp = this.loader.get();
                    if (bmp != null) {
                        this.tex.cropWidth = bmp.getWidth();
                        this.tex.cropHeight = bmp.getHeight();
                        this.tex.data = bmp;
                        this.tex.loaded = true;
                        this.tex.thumb = false;
                        Log.d(PhotoView.TAG, "Loaded bitmap " + this.index + " into texture " + (this.tex == PhotoView.this.textureNext ? "NEXT" : this.tex == PhotoView.this.texturePrev ? "PREV" : "CURRENT") + " (cur " + PhotoView.this.listPosition + ")");
                        PhotoView photoView = PhotoView.this;
                        if (this.index != PhotoView.this.listPosition) {
                            z = false;
                        }
                        photoView.updateScale(z);
                        PhotoView.this.updateMinMax(PhotoView.this.scale);
                        if (this.index == PhotoView.this.listPosition) {
                            while (true) {
                                if (PhotoView.this.getWidth() != 0 && PhotoView.this.inAnimDone) {
                                    break;
                                }
                                Thread.sleep(10L);
                            }
                            Utils.castToActivity(PhotoView.this.getContext()).runOnUiThread(new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.ImageLoadTask.4
                                @Override // java.lang.Runnable
                                public void run() {
                                    if (PhotoView.this.showProgress != null) {
                                        PhotoView.this.removeCallbacks(PhotoView.this.showProgress);
                                    }
                                    V.cancelVisibilityAnimation(PhotoView.this.progressBar);
                                    PhotoView.this.progressBar.setVisibility(8);
                                    PhotoView.this.thumbView.setVisibility(0);
                                    V.setVisibilityAnimated(PhotoView.this.thumbView, 8);
                                }
                            });
                        }
                        PhotoView.this.postInvalidate();
                    } else if (this.index == PhotoView.this.listPosition && !this.canceled && !this.loader.isCancelled()) {
                        Utils.castToActivity(PhotoView.this.getContext()).runOnUiThread(new Runnable() { // from class: com.vkontakte.android.ui.PhotoView.ImageLoadTask.5
                            @Override // java.lang.Runnable
                            public void run() {
                                if (ImageLoadTask.this.index == PhotoView.this.listPosition && !ImageLoadTask.this.canceled && !ImageLoadTask.this.loader.isCancelled()) {
                                    if (PhotoView.this.showProgress != null) {
                                        PhotoView.this.removeCallbacks(PhotoView.this.showProgress);
                                    }
                                    Log.w("vk", "Showing error view for photo " + ImageLoadTask.this.index + ", canceled=" + ImageLoadTask.this.canceled + ", loader canceled=" + ImageLoadTask.this.loader.isCancelled());
                                    V.cancelVisibilityAnimation(PhotoView.this.progressBar);
                                    PhotoView.this.progressBar.setVisibility(8);
                                    PhotoView.this.error.setVisibility(0);
                                }
                            }
                        });
                    }
                    try {
                        PhotoView.this.queueLock.acquire();
                    } catch (Exception e4) {
                    }
                    PhotoView.this.loadingBitmaps.remove(this);
                    PhotoView.this.queueLock.release();
                }
            } finally {
                try {
                    PhotoView.this.queueLock.acquire();
                } catch (Exception e5) {
                }
                PhotoView.this.loadingBitmaps.remove(this);
                PhotoView.this.queueLock.release();
            }
        }
    }
}
