package com.vkontakte.android.attachments;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.network.Network;
import com.vk.core.widget.LifecycleHandler;
import com.vk.core.widget.LifecycleListener;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.DocAttachView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.cache.FileLruCache;
import com.vkontakte.android.cache.Gifs;
import com.vkontakte.android.gifs.GifViewer;
import com.vkontakte.android.media.AutoPlay;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.ui.RadialProgressDrawable;
import com.vkontakte.android.ui.animation.MovieDrawable;
import com.vkontakte.android.utils.Serializer;
import com.vkontakte.android.utils.Utils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
/* loaded from: classes2.dex */
public class DocumentAttachment extends Attachment implements ImageAttachment, AutoPlay {
    public String access_key;
    private AutoPlay.Listener autoPlayListener;
    private boolean autoplay;
    public int did;
    public String extension;
    private boolean failed;
    private GifViewer gifViewer;
    public int height;
    private GifHolder holder;
    public transient boolean isSingle;
    private LifecycleHandler lifecycleHandler;
    private final boolean mAutoPlay;
    private boolean mPlaying;
    private boolean mPrepared;
    private AsyncTask<?, ?, ?> mTask;
    private MovieDrawable movieDrawable;
    public int oid;
    public int size;
    public String thumb;
    public String title;
    private boolean triedToLoad;
    public String url;
    @Nullable
    public final String video;
    transient boolean wasPlayed;
    public int width;
    private static final Gifs sGifs = Gifs.get();
    public static final Serializer.Creator<DocumentAttachment> CREATOR = new Serializer.CreatorAdapter<DocumentAttachment>() { // from class: com.vkontakte.android.attachments.DocumentAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public DocumentAttachment mo1087createFromSerializer(Serializer in) {
            return new DocumentAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public DocumentAttachment[] mo1088newArray(int size) {
            return new DocumentAttachment[size];
        }
    };

    public DocumentAttachment(String _title, String _url, int _size, String _thumb, int _oid, int _did, String ext, @Nullable String _video, int _width, int _height, @Nullable String access_key) {
        this.mAutoPlay = Gifs.allowAutoPlay();
        this.title = _title;
        this.url = _url;
        this.size = _size;
        this.thumb = _thumb;
        this.oid = _oid;
        this.did = _did;
        this.extension = ext;
        this.video = _video;
        this.width = _width;
        this.height = _height;
        this.access_key = access_key;
    }

    public DocumentAttachment(Document doc) {
        this.mAutoPlay = Gifs.allowAutoPlay();
        this.title = doc.title;
        this.url = doc.url;
        this.size = doc.size;
        this.oid = doc.oid;
        this.did = doc.did;
        this.thumb = doc.thumb;
        this.extension = doc.ext;
        this.video = doc.video;
        this.width = doc.width;
        this.height = doc.height;
        this.access_key = doc.access_key;
    }

    public DocumentAttachment(Serializer in) {
        this(in.readString(), in.readString(), in.readInt(), in.readString(), in.readInt(), in.readInt(), in.readString(), in.readString(), in.readInt(), in.readInt(), in.readString());
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    @SuppressLint({"SetTextI18n"})
    public View getViewForList(final Context context, View reuse) {
        this.holder = null;
        if (!TextUtils.isEmpty(this.thumb)) {
            if (!TextUtils.isEmpty(this.video) && this.isSingle) {
                View vav = reuse == null ? getReusableView(context, "animation") : reuse;
                if (vav == null || !(vav.getTag() instanceof GifHolder)) {
                    this.holder = new GifHolder(vav, vav.getTag().toString());
                    vav.setTag(this.holder);
                } else {
                    this.holder = (GifHolder) vav.getTag();
                }
                this.holder.bind(this);
                return vav;
            }
            DocAttachView av = (DocAttachView) getReusableView(context, "doc_thumb");
            av.setLayoutParams(new FlowLayout.LayoutParams(V.dp(8.0f), V.dp(8.0f)));
            av.setData(this);
            return av;
        }
        View v = reuse == null ? getReusableView(context, "common") : reuse;
        ((ImageView) v.findViewById(R.id.attach_icon)).setImageResource(ViewUtils.getResFromTheme(context, R.attr.ic_attach_document));
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.title);
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(context.getResources().getString(R.string.doc) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + Global.langFileSize(this.size, context.getResources()));
        if (this.url != null && this.url.length() > 0) {
            v.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.attachments.DocumentAttachment.2
                @Override // android.view.View.OnClickListener
                public void onClick(View v2) {
                    if (DocumentAttachment.this.url != null && DocumentAttachment.this.url.length() > 0) {
                        try {
                            context.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(DocumentAttachment.this.url)));
                        } catch (Exception e) {
                        }
                    }
                }
            });
        }
        return v;
    }

    public void serializeTo(Serializer s) {
        s.writeString(this.title);
        s.writeString(this.url);
        s.writeInt(this.size);
        s.writeString(this.thumb);
        s.writeInt(this.oid);
        s.writeInt(this.did);
        s.writeString(this.extension);
        s.writeString(this.video);
        s.writeInt(this.width);
        s.writeInt(this.height);
        s.writeString(this.access_key);
    }

    public String toString() {
        return "doc" + this.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.did + (this.access_key != null ? EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.access_key : "");
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        if (TextUtils.isEmpty(this.thumb) || TextUtils.isEmpty(this.video) || !this.isSingle) {
            return null;
        }
        FlowLayout.LayoutParams lp = new FlowLayout.LayoutParams();
        lp.width = -1;
        lp.height = -2;
        return lp;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return this.thumb;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        if (view != null) {
            if ((!(view.getTag() instanceof GifHolder) || this.movieDrawable == null) && this.thumb != null) {
                ((VKImageView) view.findViewById(R.id.att_doc_thumb)).load(getImageURL());
            }
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void setListener(AutoPlay.Listener listener) {
        this.autoPlayListener = listener;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void removeListener(AutoPlay.Listener listener) {
        if (this.autoPlayListener == listener) {
            this.autoPlayListener = null;
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public AutoPlay.Type getType() {
        return AutoPlay.Type.GIF;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void detachSurface() {
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public boolean canAutoPlay() {
        return this.isSingle && !TextUtils.isEmpty(this.thumb) && !TextUtils.isEmpty(this.video);
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public boolean isPrepared() {
        return this.mPrepared;
    }

    public boolean isPlaying() {
        return this.mPlaying;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public boolean isComplete() {
        return false;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void prepare() {
        start(true);
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void waiting() {
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void play(boolean delay) {
        if (this.gifViewer == null) {
            if (!this.wasPlayed) {
                sGifs.trackPlayEvent(this.did, this.autoplay);
            }
            this.wasPlayed = true;
            if (this.movieDrawable != null) {
                this.movieDrawable.start();
                this.mPlaying = true;
                if (this.holder != null && this.movieDrawable.isReady()) {
                    this.holder.mImageView.setImageDrawable(this.movieDrawable);
                    this.holder.showDone();
                }
            }
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void pause() {
        this.mPlaying = false;
        if (this.movieDrawable != null) {
            this.movieDrawable.stop();
        }
        if (!this.mAutoPlay && this.holder != null && this.gifViewer == null) {
            this.holder.showInitialLayout();
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public void stop() {
        this.mPlaying = false;
        this.mPrepared = false;
        if (this.mTask != null) {
            this.mTask.cancel();
            this.mTask = null;
        }
        if (this.movieDrawable != null) {
            this.movieDrawable.recycle();
            this.movieDrawable = null;
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public int getScreenCenterDistance() {
        if (this.holder != null && this.holder.mAttachment == this) {
            return this.holder.getScreenCenterDistance();
        }
        return -1;
    }

    @Override // com.vkontakte.android.media.AutoPlay
    public float getPercentageOnScreen() {
        if (this.holder != null && this.holder.mAttachment == this) {
            return this.holder.getPercentageOnScreen();
        }
        return 0.0f;
    }

    void start(boolean autoplay) {
        if (this.mTask == null || !this.mTask.isRunning()) {
            if (this.holder != null) {
                this.holder.mImageView.cancel();
            }
            this.triedToLoad = true;
            this.autoplay = autoplay;
            this.mTask = new AnonymousClass3().execPool(this.video, toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.attachments.DocumentAttachment$3  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass3 extends AsyncTask<String, Integer, MovieDrawable> {
        String mUrl;

        AnonymousClass3() {
        }

        @Override // com.vkontakte.android.background.AsyncTask
        protected void onPreExecute() {
            if (!DocumentAttachment.this.wasPlayed && DocumentAttachment.this.holder != null) {
                DocumentAttachment.this.holder.showProgress();
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public MovieDrawable doInBackground(String... args) throws Throwable {
            String url = args[0];
            this.mUrl = url;
            String documentId = args[1];
            FileLruCache.Entry entry = DocumentAttachment.sGifs.get(documentId);
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
                if (shortCode == 1 || shortCode == 2 || shortCode == 3) {
                    FileLruCache.Editor editor = DocumentAttachment.sGifs.insert(documentId);
                    OutputStream out = editor.getOutputStream();
                    InputStream in = body.byteStream();
                    byte[] buffer = new byte[1024];
                    double transferred = 0.0d;
                    int lastSentProgress = 0;
                    while (true) {
                        int read = in.read(buffer);
                        if (read <= 0) {
                            break;
                        }
                        out.write(buffer, 0, read);
                        transferred += read;
                        double normalizedProgress = transferred / contentLength;
                        int signedProgress = (int) (100.0d * normalizedProgress);
                        if (signedProgress != lastSentProgress) {
                            lastSentProgress = signedProgress;
                            publishProgress(Integer.valueOf(lastSentProgress));
                        }
                    }
                    in.close();
                    out.close();
                    if (!isCanceled()) {
                        entry = editor.commit();
                    } else {
                        throw new InterruptedException();
                    }
                } else {
                    throw new IOException("Invalid response code " + responseCode);
                }
            }
            return new MovieDrawable(entry.file.getAbsolutePath());
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public void onProgressUpdate(Integer progress) {
            if (DocumentAttachment.this.holder != null) {
                DocumentAttachment.this.holder.setProgress(progress.intValue());
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public void onPostExecute(MovieDrawable movieDrawable) {
            DocumentAttachment.this.failed = false;
            DocumentAttachment.this.mPrepared = true;
            if (DocumentAttachment.this.holder != null) {
                DocumentAttachment.this.holder.showDone();
            }
            if (DocumentAttachment.this.movieDrawable != null) {
                DocumentAttachment.this.movieDrawable.recycle();
            }
            DocumentAttachment.this.movieDrawable = movieDrawable;
            movieDrawable.setReadyCallback(DocumentAttachment$3$$Lambda$1.lambdaFactory$(this));
            if (!DocumentAttachment.this.canAutoPlay() || DocumentAttachment.this.autoPlayListener == null) {
                DocumentAttachment.this.mPlaying = true;
                movieDrawable.start();
            } else if (DocumentAttachment.this.mAutoPlay) {
                DocumentAttachment.this.autoPlayListener.onReady(DocumentAttachment.this);
            } else {
                DocumentAttachment.this.autoPlayListener.playPrepared(DocumentAttachment.this);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPostExecute$0(MovieDrawable drawable) {
            if (DocumentAttachment.this.holder != null) {
                DocumentAttachment.this.holder.showDone();
                DocumentAttachment.this.holder.mImageView.setImageDrawable(drawable);
            }
            if (!DocumentAttachment.this.canAutoPlay()) {
                if (!DocumentAttachment.this.wasPlayed) {
                    DocumentAttachment.sGifs.trackPlayEvent(DocumentAttachment.this.did, false);
                }
                DocumentAttachment.this.wasPlayed = true;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public void onError(Throwable t) {
            DocumentAttachment.this.failed = true;
            if (DocumentAttachment.this.holder != null) {
                DocumentAttachment.this.holder.showError();
            }
        }
    }

    public int getPosition() {
        if (this.movieDrawable == null) {
            return 0;
        }
        return this.movieDrawable.getPosition();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class GifHolder extends AttachmentViewHolder implements View.OnAttachStateChangeListener, View.OnClickListener {
        boolean attached;
        UsableRecyclerView listView;
        DocumentAttachment mAttachment;
        final View mBackground;
        final View mError;
        final VKImageView mImageView;
        final View mPlayButton;
        final ProgressBar mProgress;
        final RadialProgressDrawable mProgressDrawable;
        final TextView mSize;
        AsyncTask<?, ?, ?> mTask;

        public GifHolder(View view, String tag) {
            super(tag);
            this.mProgressDrawable = new RadialProgressDrawable();
            this.attached = false;
            this.mImageView = (VKImageView) view.findViewById(R.id.att_doc_thumb);
            this.mSize = (TextView) view.findViewById(R.id.att_doc_title);
            this.mProgress = (ProgressBar) view.findViewById(R.id.progress);
            this.mPlayButton = view.findViewById(R.id.play);
            this.mBackground = view.findViewById(R.id.background);
            this.mError = view.findViewById(R.id.error);
            this.mProgressDrawable.setProgressColor(-1);
            this.mProgress.setProgressDrawable(this.mProgressDrawable);
            view.addOnAttachStateChangeListener(this);
            view.setOnClickListener(this);
        }

        void bind(final DocumentAttachment item) {
            this.mAttachment = item;
            if (item.movieDrawable != null && item.movieDrawable.isReady()) {
                this.mImageView.setImageDrawable(item.movieDrawable);
            } else {
                this.mImageView.load(item.thumb);
            }
            float ratio = item.width / item.height;
            this.mImageView.setAspectRatio(Math.max(0.75f, ratio));
            if (ratio < 0.75f) {
                this.mImageView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.attachments.DocumentAttachment.GifHolder.1
                    @Override // android.view.ViewTreeObserver.OnPreDrawListener
                    public boolean onPreDraw() {
                        GifHolder.this.mImageView.getViewTreeObserver().removeOnPreDrawListener(this);
                        int displayedWidth = (GifHolder.this.mImageView.getHeight() * item.width) / item.height;
                        int offset = (GifHolder.this.mImageView.getWidth() - displayedWidth) / 2;
                        ((ViewGroup.MarginLayoutParams) GifHolder.this.mSize.getLayoutParams()).leftMargin += offset;
                        GifHolder.this.mSize.requestLayout();
                        return true;
                    }
                });
            }
            showInitialLayout();
        }

        @Override // android.view.View.OnClickListener
        public void onClick(final View view) {
            boolean z = false;
            Activity activity = Utils.castToActivity(view.getContext());
            if (this.mAttachment.lifecycleHandler == null) {
                this.mAttachment.lifecycleHandler = LifecycleHandler.install(activity);
                this.mAttachment.lifecycleHandler.setLifecycleListener(new LifecycleListener() { // from class: com.vkontakte.android.attachments.DocumentAttachment.GifHolder.2
                    @Override // com.vk.core.widget.LifecycleListener
                    public void onActivityResumed(@NonNull Activity activity2) {
                        if (GifHolder.this.mAttachment.movieDrawable != null) {
                            GifHolder.this.mAttachment.movieDrawable.start();
                        }
                    }

                    @Override // com.vk.core.widget.LifecycleListener
                    public void onActivityPaused(@NonNull Activity activity2) {
                        if (GifHolder.this.mAttachment.movieDrawable != null) {
                            GifHolder.this.mAttachment.movieDrawable.stop();
                        }
                    }
                });
            }
            if (!this.mAttachment.triedToLoad || (!this.mAttachment.failed && !this.mAttachment.isPlaying())) {
                this.mAttachment.start(false);
                return;
            }
            final int[] locationInWindow = new int[2];
            DocumentAttachment documentAttachment = this.mAttachment;
            DocumentAttachment documentAttachment2 = this.mAttachment;
            GifViewer.Provider provider = new GifViewer.Provider() { // from class: com.vkontakte.android.attachments.DocumentAttachment.GifHolder.3
                @Override // com.vkontakte.android.gifs.GifViewer.Provider
                public boolean hasPreviewLocationData() {
                    view.getLocationOnScreen(locationInWindow);
                    return GifHolder.this.attached && !((locationInWindow[0] == 0 && locationInWindow[1] == 0) || getPreview() == null);
                }

                @Override // com.vkontakte.android.gifs.GifViewer.Provider
                public Rect getViewLocation() {
                    view.getLocationOnScreen(locationInWindow);
                    Rect rect = new Rect(locationInWindow[0], locationInWindow[1], locationInWindow[0] + view.getWidth(), locationInWindow[1] + view.getHeight());
                    if (GifHolder.this.mAttachment.height / GifHolder.this.mAttachment.width > 1.333f) {
                        int displayedWidth = (view.getHeight() * GifHolder.this.mAttachment.width) / GifHolder.this.mAttachment.height;
                        rect.inset((view.getWidth() - displayedWidth) / 2, 0);
                    }
                    return rect;
                }

                @Override // com.vkontakte.android.gifs.GifViewer.Provider
                public int[] getClipTopBottom() {
                    int i = 0;
                    Point offset = V.getViewOffset(view, GifHolder.this.listView);
                    int[] iArr = new int[2];
                    iArr[0] = offset.y < 0 ? -offset.y : 0;
                    if (offset.y + view.getHeight() > GifHolder.this.listView.getHeight()) {
                        i = (offset.y + view.getHeight()) - GifHolder.this.listView.getHeight();
                    }
                    iArr[1] = i;
                    return iArr;
                }

                @Override // com.vkontakte.android.gifs.GifViewer.Provider
                public Bitmap getPreview() {
                    if (GifHolder.this.mAttachment.movieDrawable != null) {
                        return GifHolder.this.mAttachment.movieDrawable.getRenderingBitmap();
                    }
                    Drawable drawable = GifHolder.this.mImageView.getDrawable();
                    if (drawable instanceof BitmapDrawable) {
                        return ((BitmapDrawable) drawable).getBitmap();
                    }
                    return null;
                }

                @Override // com.vkontakte.android.gifs.GifViewer.Provider
                public void onFinish(int position) {
                    if (GifHolder.this.mAttachment != null) {
                        GifHolder.this.mAttachment.gifViewer = null;
                        if (GifHolder.this.mAttachment.movieDrawable != null) {
                            GifHolder.this.mAttachment.movieDrawable.seek(position);
                        }
                        GifHolder.this.mAttachment.play(false);
                    }
                }
            };
            if (this.mTask != null && this.mTask.isRunning()) {
                z = true;
            }
            documentAttachment.gifViewer = GifViewer.create(activity, documentAttachment2, provider, z);
            this.mAttachment.pause();
            this.mAttachment.gifViewer.show();
        }

        int getScreenCenterDistance() {
            if (this.listView == null || this.mImageView == null) {
                return -1;
            }
            int[] location = new int[2];
            this.listView.getLocationOnScreen(location);
            int parentTop = location[1];
            int parentBottom = parentTop + this.listView.getHeight();
            this.mImageView.getLocationOnScreen(location);
            int childTop = location[1];
            int childHeight = this.mImageView.getHeight();
            int childBottom = childTop + childHeight;
            int parentCenter = parentTop + ((parentBottom - parentTop) / 2);
            int childCenter = childTop + ((childBottom - childTop) / 2);
            return Math.abs(childCenter - parentCenter);
        }

        float getPercentageOnScreen() {
            float diff;
            if (this.listView == null || this.mImageView == null) {
                return 0.0f;
            }
            int[] location = new int[2];
            this.listView.getLocationOnScreen(location);
            int parentTop = location[1];
            int parentBottom = parentTop + this.listView.getHeight();
            this.mImageView.getLocationOnScreen(location);
            int childTop = location[1];
            int childHeight = this.mImageView.getHeight();
            int childBottom = childTop + childHeight;
            if (childTop < parentTop) {
                diff = Math.abs(parentTop - childBottom);
            } else {
                diff = Math.abs(childTop - parentBottom);
            }
            return Math.min(1.0f, diff / childHeight);
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewAttachedToWindow(View view) {
            this.attached = true;
            if (this.listView == null) {
                this.listView = (UsableRecyclerView) view.getRootView().findViewById(R.id.list);
            }
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewDetachedFromWindow(View v) {
            this.attached = false;
            if (this.mAttachment.autoPlayListener == null) {
                this.mAttachment.stop();
            }
        }

        void showInitialLayout() {
            if ((!this.mAttachment.wasPlayed && !this.mAttachment.isPrepared()) || (this.mAttachment.wasPlayed && !this.mAttachment.mAutoPlay)) {
                this.mError.setVisibility(8);
                showPlayButton();
                updateSubtitle();
                this.mImageView.load(this.mAttachment.thumb);
                return;
            }
            showDone();
        }

        void showPlayButton() {
            this.mProgress.setVisibility(0);
            this.mPlayButton.setVisibility(0);
            this.mBackground.setVisibility(0);
            this.mProgressDrawable.setThickness(1.5f);
            this.mProgress.setProgress(100);
            this.mProgressDrawable.setProgress(1.0f, false);
        }

        void showProgress() {
            this.mProgress.setVisibility(0);
            this.mPlayButton.setVisibility(8);
            this.mBackground.setVisibility(0);
            this.mError.setVisibility(8);
            this.mProgressDrawable.setThickness(3.0f);
            this.mProgressDrawable.setProgress(0.0f, false);
        }

        void setProgress(int progress) {
            this.mProgress.setProgress(progress);
        }

        void showDone() {
            this.mProgress.setVisibility(8);
            this.mPlayButton.setVisibility(8);
            this.mBackground.setVisibility(8);
            this.mError.setVisibility(8);
            updateSubtitle(true);
        }

        void showError() {
            this.mProgress.setVisibility(0);
            this.mProgressDrawable.setThickness(1.5f);
            this.mProgress.setProgress(100);
            this.mProgressDrawable.setProgress(1.0f, false);
            this.mPlayButton.setVisibility(8);
            this.mBackground.setVisibility(0);
            this.mError.setVisibility(0);
            updateSubtitle();
        }

        void updateSubtitle() {
            updateSubtitle(DocumentAttachment.sGifs.contains(this.mAttachment.toString()) || this.mAttachment.mAutoPlay);
        }

        void updateSubtitle(boolean compact) {
            if (compact) {
                this.mSize.setText("GIF");
            } else {
                this.mSize.setText("GIF, " + Global.langFileSize(this.mAttachment.size, this.mImageView.getResources()));
            }
        }
    }
}
