package com.vkontakte.android.gifs;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.DownloadManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.Size;
import android.support.v4.media.TransportMediator;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.core.network.Network;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.sharing.Sharing;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.docs.DocsAdd;
import com.vkontakte.android.attachments.DocumentAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.cache.FileLruCache;
import com.vkontakte.android.cache.Gifs;
import com.vkontakte.android.gifs.GifRootLayout;
import com.vkontakte.android.ui.CircularProgressBar;
import com.vkontakte.android.ui.PhotoView;
import com.vkontakte.android.ui.animation.MovieDrawable;
import com.vkontakte.android.ui.widget.RatioImageView;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
/* loaded from: classes3.dex */
public class GifViewer extends VKWindow implements View.OnClickListener, GifRootLayout.Callback {
    static final Gifs sGifs = Gifs.get();
    boolean ignoreCache;
    private final LifecycleHandler lifecycleHandler;
    String mAccessKey;
    ImageView mAddButton;
    int mDocumentId;
    View mDragView;
    MovieDrawable mDrawable;
    View mErrorLayout;
    String mExtension;
    int mHeight;
    RatioImageView mImageView;
    int mOwnerId;
    int mPosition;
    Bitmap mPreview;
    CircularProgressBar mProgress;
    @Nullable
    Provider mProvider;
    GifRootLayout mRootView;
    View mShareButton;
    int mSize;
    AsyncTask<?, ?, ?> mTask;
    String mThumb;
    String mTitle;
    Toolbar mToolbar;
    String mUrl;
    String mVideo;
    int mWidth;

    /* loaded from: classes3.dex */
    public interface Provider {
        @Size(2)
        int[] getClipTopBottom();

        @Nullable
        Bitmap getPreview();

        @Nullable
        Rect getViewLocation();

        boolean hasPreviewLocationData();

        void onFinish(int i);
    }

    public static void start(Activity activity, DocumentAttachment attachment) {
        start(activity, attachment, null, false);
    }

    public static GifViewer start(Activity activity, DocumentAttachment attachment, @Nullable Provider provider, boolean ignoreCache) {
        GifViewer viewer = create(activity, attachment, provider, ignoreCache);
        viewer.show();
        return viewer;
    }

    public static GifViewer create(Activity activity, DocumentAttachment attachment, @Nullable Provider provider, boolean ignoreCache) {
        GifViewer viewer = new GifViewer(activity);
        viewer.mTitle = attachment.title;
        viewer.mUrl = attachment.url;
        viewer.mVideo = attachment.video;
        viewer.mWidth = attachment.width;
        viewer.mHeight = attachment.height;
        viewer.mOwnerId = attachment.oid;
        viewer.mDocumentId = attachment.did;
        viewer.mAccessKey = attachment.access_key;
        viewer.mSize = attachment.size;
        viewer.mThumb = attachment.thumb;
        viewer.mExtension = attachment.extension;
        viewer.mPosition = attachment.getPosition();
        viewer.mProvider = provider;
        viewer.ignoreCache = ignoreCache;
        return viewer;
    }

    public static GifViewer start(Activity activity, Document attachment) {
        GifViewer viewer = new GifViewer(activity);
        viewer.mTitle = attachment.title;
        viewer.mUrl = attachment.url;
        viewer.mVideo = attachment.video;
        viewer.mWidth = attachment.width;
        viewer.mHeight = attachment.height;
        viewer.mOwnerId = attachment.oid;
        viewer.mDocumentId = attachment.did;
        viewer.mAccessKey = attachment.access_key;
        viewer.mSize = attachment.size;
        viewer.mThumb = attachment.thumb;
        viewer.mExtension = attachment.ext;
        viewer.show();
        return viewer;
    }

    GifViewer(@NonNull Activity activity) {
        super(activity, R.layout.gif_viewer);
        this.lifecycleHandler = LifecycleHandler.install(activity);
        this.lifecycleHandler.setLifecycleListener(new LifecycleListener() { // from class: com.vkontakte.android.gifs.GifViewer.1
            @Override // com.vk.core.widget.LifecycleListener
            public void onActivityResumed(@NonNull Activity activity2) {
                if (GifViewer.this.mDrawable != null) {
                    GifViewer.this.mDrawable.start();
                }
            }

            @Override // com.vk.core.widget.LifecycleListener
            public void onActivityPaused(@NonNull Activity activity2) {
                if (GifViewer.this.mDrawable != null) {
                    GifViewer.this.mDrawable.stop();
                }
            }
        });
    }

    @Override // com.vkontakte.android.gifs.VKWindow
    public WindowManager.LayoutParams onCreateWindowLayoutParams() {
        int windowFlags = 0;
        if (Build.VERSION.SDK_INT >= 21) {
            windowFlags = 0 | (-2147417856);
        } else if (Build.VERSION.SDK_INT >= 19) {
            windowFlags = 0 | 201392384;
        }
        return new WindowManager.LayoutParams(-1, -1, 2, windowFlags, 1);
    }

    @Override // com.vkontakte.android.gifs.VKWindow
    public void onViewCreated(@NonNull View root) {
        super.onViewCreated(root);
        setupUI();
        if (this.mDrawable == null) {
            obtainData();
        }
    }

    @Override // com.vkontakte.android.gifs.VKWindow
    public void onViewDestroyed() {
        super.onViewDestroyed();
        if (this.mDrawable != null) {
            this.mDrawable.recycle();
        }
        if (this.mTask != null) {
            this.mTask.cancel();
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.add /* 2131755184 */:
                add();
                return;
            case R.id.image /* 2131755300 */:
                if (this.mDrawable != null) {
                    if (this.mDrawable.isRunning()) {
                        this.mDrawable.stop();
                        return;
                    } else {
                        this.mDrawable.start();
                        return;
                    }
                }
                return;
            case R.id.error_retry /* 2131755426 */:
                obtainData();
                return;
            case R.id.share /* 2131755721 */:
                showShareDialog();
                return;
            default:
                finish();
                return;
        }
    }

    @SuppressLint({"PrivateResource"})
    void setupUI() {
        this.mProgress = (CircularProgressBar) $(R.id.progress);
        this.mImageView = (RatioImageView) $(R.id.image);
        this.mDragView = $(R.id.drag);
        this.mErrorLayout = $(R.id.error_layout);
        this.mAddButton = (ImageView) $(R.id.add);
        this.mShareButton = $(R.id.share);
        this.mRootView = (GifRootLayout) $(R.id.root);
        ((TextView) this.mErrorLayout.findViewById(R.id.error_text)).setTextColor(-1);
        this.mErrorLayout.findViewById(R.id.error_retry).setOnClickListener(this);
        this.mImageView.setOnClickListener(this);
        this.mAddButton.setOnClickListener(this);
        this.mShareButton.setOnClickListener(this);
        setAddVisibility(!VKAccountManager.isCurrentUser(this.mOwnerId));
        this.mImageView.setOrientation(0);
        this.mRootView.setNavigationProvider(this);
        this.mToolbar = (Toolbar) $(R.id.toolbar);
        this.mToolbar.setBackgroundDrawable(null);
        this.mToolbar.setNavigationIcon(R.drawable.ic_ab_back);
        this.mToolbar.setNavigationOnClickListener(this);
        this.mToolbar.setPopupTheme(2131427815);
        this.mToolbar.setOnMenuItemClickListener(GifViewer$$Lambda$1.lambdaFactory$(this));
        invalidateMenu();
        if (this.mProvider != null) {
            this.mPreview = this.mProvider.getPreview();
            if (this.mPreview != null) {
                this.mImageView.setImageRatio(this.mPreview.getHeight() / this.mPreview.getWidth());
                this.mImageView.setImageBitmap(this.mPreview);
                animateIn();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.save) {
            saveGif();
            return true;
        }
        return true;
    }

    void invalidateMenu() {
        this.mToolbar.getMenu().clear();
        onCreateOptionsMenu(this.mToolbar.getMenu(), getActivity().getMenuInflater());
    }

    void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        if (this.mDrawable != null) {
            menu.add(0, R.id.save, 0, R.string.save).setShowAsAction(0);
        }
    }

    void animateIn() {
        this.mImageView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.gifs.GifViewer.2
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                GifViewer.this.mImageView.getViewTreeObserver().removeOnPreDrawListener(this);
                int[] viewPosition = {0, 0};
                GifViewer.this.mImageView.getLocationOnScreen(viewPosition);
                Rect originalLocation = GifViewer.this.mProvider.getViewLocation();
                int[] clip = GifViewer.this.mProvider.getClipTopBottom();
                int rectWidth = originalLocation.width();
                int rectHeight = originalLocation.height();
                float scaleX = rectWidth / GifViewer.this.mImageView.getWidth();
                float scaleY = rectHeight / GifViewer.this.mImageView.getHeight();
                float transX = originalLocation.left - viewPosition[0];
                float transY = originalLocation.top - viewPosition[1];
                float scale = Math.max(scaleX, scaleY);
                float tRatio = rectWidth / rectHeight;
                float ivRatio = GifViewer.this.mImageView.getWidth() / GifViewer.this.mImageView.getHeight();
                int clipV = 0;
                int clipH = 0;
                if (tRatio != ivRatio) {
                    if (tRatio > ivRatio) {
                        float th = GifViewer.this.mImageView.getHeight() * scale;
                        clipV = Math.round(((th - rectHeight) / 2.0f) / scale);
                        transY -= (th - rectHeight) / 2.0f;
                    } else {
                        float tw = GifViewer.this.mImageView.getWidth() * scale;
                        clipH = Math.round(((tw - rectWidth) / 2.0f) / scale);
                        transX -= (tw - rectWidth) / 2.0f;
                    }
                }
                int clipV2 = Math.max(0, clipV);
                int clipH2 = Math.max(0, clipH);
                GifViewer.this.mDragView.setPivotX(0.0f);
                GifViewer.this.mDragView.setPivotY(0.0f);
                AnimatorSet set = new AnimatorSet();
                set.playTogether(ObjectAnimator.ofFloat(GifViewer.this.mDragView, "scaleX", scale, 1.0f), ObjectAnimator.ofFloat(GifViewer.this.mDragView, "scaleY", scale, 1.0f), ObjectAnimator.ofFloat(GifViewer.this.mDragView, "translationX", transX, 0.0f), ObjectAnimator.ofFloat(GifViewer.this.mDragView, "translationY", transY, 0.0f), ObjectAnimator.ofInt(GifViewer.this.mRootView, "backgroundAlpha", 0, 255), ObjectAnimator.ofInt(GifViewer.this.mImageView, "clipTop", Math.round(clip[0] / scale) + clipV2, 0), ObjectAnimator.ofInt(GifViewer.this.mImageView, "clipBottom", Math.round(clip[1] / scale) + clipV2, 0), ObjectAnimator.ofInt(GifViewer.this.mImageView, "clipHorizontal", clipH2, 0), ObjectAnimator.ofFloat(GifViewer.this.mErrorLayout, "alpha", 0.0f, 1.0f));
                set.setDuration(300L);
                set.setInterpolator(PhotoView.interpolatorIn);
                set.start();
                return true;
            }
        });
    }

    void animateOut(final Runnable after) {
        this.mImageView.clearAnimation();
        this.mImageView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.gifs.GifViewer.3
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                GifViewer.this.mImageView.getViewTreeObserver().removeOnPreDrawListener(this);
                int[] viewPosition = {0, 0};
                GifViewer.this.mImageView.getLocationOnScreen(viewPosition);
                Rect originalLocation = GifViewer.this.mProvider.getViewLocation();
                int[] clip = GifViewer.this.mProvider.getClipTopBottom();
                int rectWidth = originalLocation.width();
                int rectHeight = originalLocation.height();
                float scaleX = rectWidth / GifViewer.this.mImageView.getWidth();
                float scaleY = rectHeight / GifViewer.this.mImageView.getHeight();
                float transX = originalLocation.left - viewPosition[0];
                float transY = originalLocation.top - viewPosition[1];
                float scale = Math.max(scaleX, scaleY);
                float tRatio = rectWidth / rectHeight;
                float ivRatio = GifViewer.this.mImageView.getWidth() / GifViewer.this.mImageView.getHeight();
                int clipV = 0;
                int clipH = 0;
                if (tRatio != ivRatio) {
                    if (tRatio > ivRatio) {
                        float th = GifViewer.this.mImageView.getHeight() * scale;
                        clipV = Math.round(((th - rectHeight) / 2.0f) / scale);
                        transY -= (th - rectHeight) / 2.0f;
                    } else {
                        float tw = GifViewer.this.mImageView.getWidth() * scale;
                        clipH = Math.round(((tw - rectWidth) / 2.0f) / scale);
                        transX -= (tw - rectWidth) / 2.0f;
                    }
                }
                GifViewer.this.mDragView.setPivotX(0.0f);
                GifViewer.this.mDragView.setPivotY(0.0f);
                AnimatorSet set = new AnimatorSet();
                set.playTogether(ObjectAnimator.ofFloat(GifViewer.this.mDragView, "scaleX", 1.0f, scale), ObjectAnimator.ofFloat(GifViewer.this.mDragView, "scaleY", 1.0f, scale), ObjectAnimator.ofFloat(GifViewer.this.mDragView, "translationX", 0.0f, transX), ObjectAnimator.ofFloat(GifViewer.this.mDragView, "translationY", 0.0f, transY), ObjectAnimator.ofInt(GifViewer.this.mRootView, "backgroundAlpha", GifViewer.this.mRootView.getBackgroundAlpha(), 0), ObjectAnimator.ofInt(GifViewer.this.mImageView, "clipTop", 0, Math.round(clip[0] / scale) + clipV), ObjectAnimator.ofInt(GifViewer.this.mImageView, "clipBottom", 0, Math.round(clip[1] / scale) + clipV), ObjectAnimator.ofInt(GifViewer.this.mImageView, "clipHorizontal", 0, clipH), ObjectAnimator.ofFloat(GifViewer.this.mErrorLayout, "alpha", 1.0f, 0.0f));
                set.setDuration(300L);
                if (after != null) {
                    set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.gifs.GifViewer.3.1
                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationEnd(Animator a) {
                            Runnable runnable = after;
                            runnable.getClass();
                            ViewUtils.post(GifViewer$3$1$$Lambda$1.lambdaFactory$(runnable));
                        }
                    });
                }
                set.setInterpolator(PhotoView.interpolatorIn);
                set.start();
                return true;
            }
        });
    }

    void setAddVisibility(boolean visible) {
        this.mAddButton.setAlpha(visible ? 1.0f : 0.4f);
        this.mAddButton.setClickable(visible);
        this.mAddButton.setImageResource(visible ? R.drawable.ic_add_large_24dp : R.drawable.ic_ab_done);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.gifs.GifViewer$4  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass4 extends AsyncTask<String, Integer, MovieDrawable> {
        String mUrl;

        AnonymousClass4() {
        }

        @Override // com.vkontakte.android.background.AsyncTask
        protected void onPreExecute() {
            GifViewer.this.mProgress.setVisibility(0);
            GifViewer.this.mProgress.setProgress(0.0d);
            GifViewer.this.mErrorLayout.setVisibility(8);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public MovieDrawable doInBackground(String... args) throws Throwable {
            String url = args[0];
            this.mUrl = url;
            String cacheKey = "doc" + GifViewer.this.mOwnerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + GifViewer.this.mDocumentId + (GifViewer.this.mAccessKey != null ? '_' + GifViewer.this.mAccessKey : "") + (GifViewer.this.ignoreCache ? "_nocache" : "");
            FileLruCache.Entry entry = GifViewer.sGifs.get(cacheKey);
            if (entry == null) {
                Response response = Network.getDefaultClient().newCall(new Request.Builder().url(url).get().build()).execute();
                ResponseBody body = response.body();
                long contentLength = body.contentLength();
                int responseCode = response.code();
                int shortCode = responseCode / 100;
                if (contentLength > 52428800) {
                    throw new IOException("File is too big");
                }
                if (contentLength < 0) {
                    throw new IOException("Content-length is " + contentLength);
                }
                if (shortCode != 1 && shortCode != 2 && shortCode != 3) {
                    throw new IOException("Invalid response code " + responseCode);
                }
                FileLruCache.Editor editor = GifViewer.sGifs.insert(cacheKey);
                OutputStream out = editor.getOutputStream();
                InputStream in = body.byteStream();
                byte[] buffer = new byte[2048];
                double transferred = 0.0d;
                int lastSentProgress = -128;
                while (true) {
                    int read = in.read(buffer);
                    if (read <= 0) {
                        break;
                    }
                    out.write(buffer, 0, read);
                    transferred += read;
                    double normalizedProgress = transferred / contentLength;
                    int signedProgress = (int) ((255.0d * normalizedProgress) - 127.0d);
                    if (signedProgress - lastSentProgress > 2) {
                        lastSentProgress = signedProgress;
                        publishProgress(Integer.valueOf(lastSentProgress));
                    }
                }
                out.flush();
                out.close();
                in.close();
                if (!isCanceled()) {
                    entry = editor.commit();
                } else {
                    throw new InterruptedException();
                }
            }
            return new MovieDrawable(entry.file.getAbsolutePath());
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public void onProgressUpdate(Integer integer) {
            double unsignedProgress = integer.intValue() + TransportMediator.KEYCODE_MEDIA_PAUSE;
            double normalizedProgress = unsignedProgress / 256.0d;
            GifViewer.this.mProgress.setProgress(normalizedProgress);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public void onPostExecute(MovieDrawable movieDrawable) {
            GifViewer.this.mProgress.setVisibility(8);
            GifViewer.this.mErrorLayout.setVisibility(8);
            GifViewer.this.mImageView.setColorFilter((ColorFilter) null);
            if (GifViewer.this.mDrawable != null) {
                GifViewer.this.mDrawable.recycle();
            }
            GifViewer.this.mDrawable = movieDrawable;
            GifViewer.this.mDrawable.setReadyCallback(GifViewer$4$$Lambda$1.lambdaFactory$(this));
            GifViewer.this.mDrawable.seek(GifViewer.this.mPosition);
            GifViewer.this.mDrawable.start();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPostExecute$0(MovieDrawable drawable) {
            GifViewer.this.mImageView.setImageRatio(drawable.getIntrinsicHeight() / drawable.getIntrinsicWidth());
            GifViewer.this.mImageView.setImageDrawable(drawable);
            GifViewer.sGifs.trackPlayEvent(GifViewer.this.mDocumentId, false);
            GifViewer.this.invalidateMenu();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public void onError(Throwable t) {
            GifViewer.this.mProgress.setVisibility(8);
            GifViewer.this.mImageView.setColorFilter(-2013265920);
            GifViewer.this.mErrorLayout.setVisibility(0);
        }
    }

    void obtainData() {
        AnonymousClass4 anonymousClass4 = new AnonymousClass4();
        String[] strArr = new String[1];
        strArr[0] = TextUtils.isEmpty(this.mVideo) ? this.mUrl : this.mVideo;
        this.mTask = anonymousClass4.execPool(strArr);
    }

    void add() {
        new DocsAdd(this.mOwnerId, this.mDocumentId, this.mAccessKey).wrapProgress(getActivity()).setCallback(new Callback<Boolean>() { // from class: com.vkontakte.android.gifs.GifViewer.5
            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                Toast.makeText(GifViewer.this.getActivity(), (int) R.string.gif_add_success, 0).show();
                GifViewer.this.setAddVisibility(false);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                APIUtils.showErrorToast(GifViewer.this.getActivity(), error.getCode(), error.message);
            }
        }).exec((Context) getActivity());
    }

    void showShareDialog() {
        Document document = new Document();
        document.did = this.mDocumentId;
        document.oid = this.mOwnerId;
        document.ext = this.mExtension;
        document.size = this.mSize;
        document.thumb = this.mThumb;
        document.access_key = this.mAccessKey;
        Sharing.from(getActivity()).withAttachment(Attachments.createInfo(document, "gifs")).share();
    }

    void saveGif() {
        File dir = new File(Environment.getExternalStorageDirectory(), "VK");
        if (!dir.exists()) {
            dir.mkdirs();
        }
        Uri uri = Uri.parse(TextUtils.isEmpty(this.mVideo) ? this.mUrl : this.mVideo);
        DownloadManager.Request request = new DownloadManager.Request(uri);
        request.setDestinationUri(Uri.fromFile(new File(dir, uri.getLastPathSegment() + (TextUtils.isEmpty(this.mVideo) ? ".gif" : ".mp4"))));
        request.setNotificationVisibility(1);
        request.allowScanningByMediaScanner();
        DownloadManager mgr = (DownloadManager) getActivity().getSystemService("download");
        if (mgr != null) {
            mgr.enqueue(request);
        }
    }

    @Override // com.vkontakte.android.gifs.VKWindow
    public void finish() {
        if (this.mProvider != null && this.mPreview != null) {
            this.mProvider.onFinish(this.mDrawable == null ? 0 : this.mDrawable.getPosition());
            animateOut(GifViewer$$Lambda$2.lambdaFactory$(this));
            return;
        }
        super.finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$finish$0() {
        super.finish();
    }

    @Override // com.vkontakte.android.gifs.GifRootLayout.Callback
    public boolean hasPreviewLocationData() {
        return this.mProvider != null && this.mProvider.hasPreviewLocationData();
    }

    @Override // com.vkontakte.android.gifs.GifRootLayout.Callback
    public Rect getViewLocation() {
        if (this.mProvider != null) {
            return this.mProvider.getViewLocation();
        }
        return null;
    }

    @Override // com.vkontakte.android.gifs.GifRootLayout.Callback
    public int[] getClipTopBottom() {
        if (this.mProvider != null) {
            return this.mProvider.getClipTopBottom();
        }
        return null;
    }

    @Override // com.vkontakte.android.gifs.GifRootLayout.Callback
    public void finishWithoutAnimation() {
        super.finish();
    }
}
