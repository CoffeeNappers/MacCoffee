package com.vkontakte.android;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.location.Address;
import android.location.Geocoder;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.text.ClipboardManager;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.ContextThemeWrapper;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.vk.core.util.DownloadUtils;
import com.vk.core.util.RxUtil;
import com.vk.imageloader.VKImageLoader;
import com.vk.imageloader.VKImageRequestProgress;
import com.vk.imageloader.VKImageRequestWrapper;
import com.vk.imageloader.view.VKStickerImageView;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.Photo;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.photos.PhotosCopy;
import com.vkontakte.android.api.photos.PhotosDelete;
import com.vkontakte.android.api.photos.PhotosEdit;
import com.vkontakte.android.api.photos.PhotosGetInfo;
import com.vkontakte.android.api.photos.PhotosGetTags;
import com.vkontakte.android.api.photos.PhotosMakeCover;
import com.vkontakte.android.api.photos.PhotosMove;
import com.vkontakte.android.api.wall.WallLike;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.photos.PhotoAlbumListFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.OverlayTextView;
import com.vkontakte.android.ui.PhotoView;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.utils.Utils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import me.grishka.appkit.api.APIRequest;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class PhotoViewer implements PhotoView.DismissListener, PhotoView.NavigationListener, ActivityResulter {
    public static final String ACTION_UPDATE_ALBUM_COVER = "com.vkontakte.android.UPDATE_ALBUM_COVER";
    public static final String ACTION_UPDATE_PHOTO = "com.vkontakte.android.UPDATE_PHOTO";
    private static final int SELECT_ALBUM_RESULT = 1023;
    private Activity activity;
    private PhotoAdapter adapter;
    private View bottomView;
    private PhotoViewerCallback callback;
    private OverlayTextView comments;
    private FrameLayout contentView;
    private Photo curPhoto;
    public int curPos;
    private Animator currentVisAnim;
    private TextView description;
    private GestureDetector detector;
    private int displayTotal;
    private String docUrl;
    private int fromAlbumId;
    private int fromAlbumOwner;
    private boolean isAdmin;
    private OverlayTextView likes;
    private boolean liking;
    private TextView location;
    private APIRequest photoInfoReq;
    private boolean photoLoaded;
    private PhotoView photoView;
    private OverlayTextView reposts;
    private View scrim;
    private OverlayTextView tags;
    private TagOverlayView tagsView;
    private String title;
    private Toolbar toolbar;
    boolean useBig;
    boolean useSmall;
    private Rect tmpRect = new Rect();
    private Rect tmpRect2 = new Rect();
    private ArrayList<Photo> photos = new ArrayList<>();
    private boolean controlsVisible = true;
    private float prevBgAlpha = -1.0f;
    private View.OnClickListener buttonClickListener = new View.OnClickListener() { // from class: com.vkontakte.android.PhotoViewer.1
        {
            PhotoViewer.this = this;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.photo_viewer_location /* 2131756103 */:
                    PhotoViewer.this.openLocation();
                    return;
                case R.id.photo_viewer_likes /* 2131756104 */:
                    if (PhotoViewer.this.curPhoto.albumID != Integer.MIN_VALUE) {
                        PhotoViewer.this.like(!PhotoViewer.this.curPhoto.isLiked);
                        return;
                    }
                    return;
                case R.id.photo_viewer_comments /* 2131756105 */:
                    PhotoViewer.this.openComments();
                    return;
                case R.id.photo_viewer_reposts /* 2131756106 */:
                    PhotoViewer.this.repost();
                    return;
                case R.id.photo_viewer_tags /* 2131756107 */:
                    PhotoViewer.this.showTags();
                    return;
                default:
                    return;
            }
        }
    };

    /* loaded from: classes2.dex */
    public interface PhotoViewerCallback {
        void getPhotoBounds(int i, Rect rect, Rect rect2);

        boolean isMoreAvailable();

        void loadMore();

        void onDismissed();
    }

    private String getTitleSafe() {
        return this.title.replace('/', '_');
    }

    public PhotoViewer(Activity activity, List<Photo> photos, int pos, PhotoViewerCallback callback) {
        boolean z = true;
        this.detector = new GestureDetector(this.activity, new GestureDetector.OnGestureListener() { // from class: com.vkontakte.android.PhotoViewer.2
            {
                PhotoViewer.this = this;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                return false;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public void onShowPress(MotionEvent e) {
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                PhotoViewer.this.toggleControls();
                return true;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
                return false;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public void onLongPress(MotionEvent e) {
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
                return false;
            }
        });
        this.useSmall = ((ActivityManager) VKApplication.context.getSystemService("activity")).getMemoryClass() < 20;
        if (((ActivityManager) VKApplication.context.getSystemService("activity")).getMemoryClass() < 100 || (Global.displayDensity <= 2.0f && (VKApplication.context.getResources().getConfiguration().screenLayout & 15) != 3 && (VKApplication.context.getResources().getConfiguration().screenLayout & 15) != 4)) {
            z = false;
        }
        this.useBig = z;
        this.activity = activity;
        this.callback = callback;
        this.photos.addAll(photos);
        initView(pos);
    }

    public PhotoViewer(Activity activity, String docUrl, String docTitle) {
        boolean z = true;
        this.detector = new GestureDetector(this.activity, new GestureDetector.OnGestureListener() { // from class: com.vkontakte.android.PhotoViewer.2
            {
                PhotoViewer.this = this;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                return false;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public void onShowPress(MotionEvent e) {
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                PhotoViewer.this.toggleControls();
                return true;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
                return false;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public void onLongPress(MotionEvent e) {
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
                return false;
            }
        });
        this.useSmall = ((ActivityManager) VKApplication.context.getSystemService("activity")).getMemoryClass() < 20;
        if (((ActivityManager) VKApplication.context.getSystemService("activity")).getMemoryClass() < 100 || (Global.displayDensity <= 2.0f && (VKApplication.context.getResources().getConfiguration().screenLayout & 15) != 3 && (VKApplication.context.getResources().getConfiguration().screenLayout & 15) != 4)) {
            z = false;
        }
        this.useBig = z;
        this.activity = activity;
        this.callback = new PhotoViewerCallbackAdapter();
        this.title = docTitle;
        this.docUrl = docUrl;
        this.photos.add(new Photo());
        initView(0);
        setTitle(this.title);
        this.bottomView.setVisibility(8);
    }

    public void setPosition(int pos) {
        this.photoView.setPosition(pos);
    }

    private void initView(int position) {
        this.photoView = new PhotoView(this.activity);
        PhotoView photoView = this.photoView;
        PhotoAdapter photoAdapter = new PhotoAdapter();
        this.adapter = photoAdapter;
        photoView.setAdapter(photoAdapter);
        this.photoView.setPosition(position);
        this.photoView.setDismissListener(this);
        this.photoView.setNavigationListener(this);
        final View overlay = this.photoView.getOverlayView();
        this.scrim = new View(this.activity) { // from class: com.vkontakte.android.PhotoViewer.3
            private Drawable topBg = getResources().getDrawable(R.drawable.scrim_top).mutate();
            private Drawable btmBg = getResources().getDrawable(R.drawable.scrim_bottom).mutate();
            private Paint bgPaint = new Paint();
            private Rect tmpRect = new Rect();
            private int lastAlpha = 153;

            {
                PhotoViewer.this = this;
            }

            @Override // android.view.View
            protected void onAttachedToWindow() {
                super.onAttachedToWindow();
                this.bgPaint.setColor(VKStickerImageView.OVERLAY_COLOR);
                this.topBg.setAlpha(153);
                this.btmBg.setAlpha(153);
            }

            @Override // android.view.View
            protected void onDraw(Canvas canvas) {
                if (getPaddingTop() > 0) {
                    canvas.drawRect(0.0f, 0.0f, getWidth(), getPaddingTop(), this.bgPaint);
                }
                if (getPaddingBottom() > 0) {
                    canvas.drawRect(0.0f, getHeight() - getPaddingBottom(), getWidth(), getHeight(), this.bgPaint);
                }
                if (getPaddingLeft() > 0) {
                    canvas.drawRect(0.0f, getPaddingTop(), getPaddingLeft(), getHeight() - getPaddingBottom(), this.bgPaint);
                }
                if (getPaddingRight() > 0) {
                    canvas.drawRect(getWidth() - getPaddingRight(), getPaddingTop(), getWidth(), getHeight() - getPaddingBottom(), this.bgPaint);
                }
                this.topBg.setBounds(0, 0, getWidth(), getPaddingTop() + V.dp(104.0f));
                this.topBg.draw(canvas);
                this.btmBg.setBounds(0, (getHeight() - getPaddingBottom()) - Math.min(V.dp(272.0f), PhotoViewer.this.bottomView.getHeight() + V.dp(112.0f)), getWidth(), getHeight());
                this.btmBg.draw(canvas);
            }

            public int getGradientsAlpha() {
                return this.lastAlpha;
            }

            public void setGradientsAlpha(int a) {
                this.topBg.setAlpha(a);
                this.btmBg.setAlpha(a);
                this.lastAlpha = a;
                postInvalidate();
            }
        };
        this.contentView = new FrameLayout(this.activity) { // from class: com.vkontakte.android.PhotoViewer.4
            {
                PhotoViewer.this = this;
            }

            @Override // android.view.ViewGroup, android.view.View
            protected void onAttachedToWindow() {
                super.onAttachedToWindow();
                setWillNotDraw(false);
            }

            @Override // android.view.View
            protected boolean fitSystemWindows(Rect insets) {
                super.fitSystemWindows(insets);
                getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.PhotoViewer.4.1
                    {
                        AnonymousClass4.this = this;
                    }

                    @Override // android.view.ViewTreeObserver.OnPreDrawListener
                    public boolean onPreDraw() {
                        getViewTreeObserver().removeOnPreDrawListener(this);
                        requestLayout();
                        return true;
                    }
                });
                return true;
            }

            @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
            protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
                super.onLayout(changed, left, top, right, bottom);
                overlay.setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), getPaddingBottom());
                PhotoViewer.this.photoView.setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), getPaddingBottom());
                PhotoViewer.this.scrim.setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), getPaddingBottom());
                PhotoViewer.this.photoView.layout(left, top, right, bottom);
                overlay.layout(left, top, right, bottom);
                PhotoViewer.this.scrim.layout(left, top, right, bottom);
            }

            @Override // android.widget.FrameLayout, android.view.View
            protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
                super.onMeasure(widthMeasureSpec, heightMeasureSpec);
                overlay.measure(getMeasuredWidth() | 1073741824, getMeasuredHeight() | 1073741824);
            }

            @Override // android.view.ViewGroup, android.view.View
            protected void dispatchDraw(Canvas canvas) {
                super.dispatchDraw(canvas);
            }

            @Override // android.view.ViewGroup
            public boolean onInterceptTouchEvent(MotionEvent ev) {
                if ((PhotoViewer.this.toolbar.getVisibility() != 0 || (ev.getY() >= PhotoViewer.this.toolbar.getHeight() + getPaddingTop() && ev.getY() <= (getHeight() - V.dp(48.0f)) - getPaddingBottom())) && V.findClickableChild(PhotoViewer.this.contentView, (int) ev.getX(), (int) ev.getY()) == null) {
                    PhotoViewer.this.detector.onTouchEvent(ev);
                }
                return false;
            }

            @Override // android.view.View
            public boolean onTouchEvent(MotionEvent event) {
                return PhotoViewer.this.detector.onTouchEvent(event);
            }
        };
        this.contentView.addView(this.photoView);
        this.contentView.addView(overlay);
        this.contentView.setFitsSystemWindows(true);
        this.contentView.setSystemUiVisibility(1792);
        this.contentView.setClipToPadding(false);
        this.contentView.addView(this.scrim);
        this.toolbar = new Toolbar(new ContextThemeWrapper(this.activity, (int) R.style.ActionBarTheme));
        this.toolbar.setNavigationIcon(R.drawable.ic_ab_back);
        this.toolbar.setNavigationOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.PhotoViewer.5
            {
                PhotoViewer.this = this;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PhotoViewer.this.onPrepareDismiss();
                PhotoViewer.this.dismiss();
            }
        });
        this.toolbar.setBackgroundColor(0);
        this.toolbar.setPopupTheme(2131427815);
        if (Build.VERSION.SDK_INT < 21) {
            this.toolbar.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.PhotoViewer.6
                {
                    PhotoViewer.this = this;
                }

                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    PhotoViewer.this.toolbar.getViewTreeObserver().removeOnPreDrawListener(this);
                    try {
                        Field f = PhotoViewer.this.toolbar.getClass().getDeclaredField("mTitleTextView");
                        f.setAccessible(true);
                        TextView view = (TextView) f.get(PhotoViewer.this.toolbar);
                        if (view != null) {
                            view.setTypeface(Font.Medium.typeface);
                            return false;
                        }
                        return false;
                    } catch (IllegalAccessException e) {
                        return false;
                    } catch (NoSuchFieldException e2) {
                        return false;
                    }
                }
            });
        }
        this.contentView.addView(this.toolbar, new FrameLayout.LayoutParams(-1, -2, 48));
        this.bottomView = View.inflate(this.activity, R.layout.photo_viewer_bottom, null);
        this.contentView.addView(this.bottomView, new FrameLayout.LayoutParams(-1, -2, 80));
        this.likes = (OverlayTextView) this.bottomView.findViewById(R.id.photo_viewer_likes);
        this.comments = (OverlayTextView) this.bottomView.findViewById(R.id.photo_viewer_comments);
        this.tags = (OverlayTextView) this.bottomView.findViewById(R.id.photo_viewer_tags);
        this.reposts = (OverlayTextView) this.bottomView.findViewById(R.id.photo_viewer_reposts);
        this.description = (TextView) this.bottomView.findViewById(R.id.photo_viewer_descr);
        this.location = (TextView) this.bottomView.findViewById(R.id.photo_viewer_location);
        Resources res = this.activity.getResources();
        this.location.setCompoundDrawablesWithIntrinsicBounds(new RecoloredDrawable(res.getDrawable(R.drawable.ic_place_16dp), -1711276033), (Drawable) null, (Drawable) null, (Drawable) null);
        this.likes.setSrc(new RecoloredDrawable(res.getDrawable(R.drawable.ic_like_24dp), res.getColorStateList(R.color.photo_viewer_icons)));
        this.comments.setSrc(new RecoloredDrawable(res.getDrawable(R.drawable.ic_comment_24dp), res.getColorStateList(R.color.photo_viewer_icons)));
        this.tags.setSrc(new RecoloredDrawable(res.getDrawable(R.drawable.ic_tags_24dp), res.getColorStateList(R.color.photo_viewer_icons)));
        this.reposts.setSrc(new RecoloredDrawable(res.getDrawable(R.drawable.ic_share_24dp), res.getColorStateList(R.color.photo_viewer_icons)));
        this.likes.setOnClickListener(this.buttonClickListener);
        this.comments.setOnClickListener(this.buttonClickListener);
        this.tags.setOnClickListener(this.buttonClickListener);
        this.reposts.setOnClickListener(this.buttonClickListener);
        this.location.setOnClickListener(this.buttonClickListener);
        this.contentView.setFocusable(true);
        this.contentView.setFocusableInTouchMode(true);
        this.contentView.requestFocus();
        this.contentView.setOnKeyListener(new View.OnKeyListener() { // from class: com.vkontakte.android.PhotoViewer.7
            {
                PhotoViewer.this = this;
            }

            @Override // android.view.View.OnKeyListener
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (keyCode == 4) {
                    if (event.getAction() != 1) {
                        return true;
                    }
                    PhotoViewer.this.onPrepareDismiss();
                    PhotoViewer.this.dismiss();
                    return true;
                }
                return false;
            }
        });
        onPositionChanged(position);
        onPositionConfirmed(position);
        loadUsers();
        this.toolbar.setOnMenuItemClickListener(new Toolbar.OnMenuItemClickListener() { // from class: com.vkontakte.android.PhotoViewer.8
            {
                PhotoViewer.this = this;
            }

            @Override // android.support.v7.widget.Toolbar.OnMenuItemClickListener
            public boolean onMenuItemClick(MenuItem item) {
                return PhotoViewer.this.onOptionsItemSelected(item);
            }
        });
        invalidateMenu();
        this.tagsView = new TagOverlayView(this.activity);
        this.tagsView.setVisibility(8);
        this.photoView.addOverlayView(this.tagsView);
    }

    public void invalidateMenu() {
        this.toolbar.getMenu().clear();
        onCreateOptionsMenu(this.toolbar.getMenu(), this.activity.getMenuInflater());
    }

    public void setTitle(String title) {
        this.title = title;
        this.toolbar.setTitle(title);
        onPositionChanged(this.curPos);
    }

    public void setDisplayTotal(int t) {
        this.displayTotal = t;
        onPositionChanged(this.curPos);
    }

    public void setAlbumIDs(int oid, int aid) {
        this.fromAlbumOwner = oid;
        this.fromAlbumId = aid;
    }

    public void show() {
        boolean z = true;
        WindowManager wm = (WindowManager) this.activity.getSystemService("window");
        int windowFlags = 65792;
        if (Build.VERSION.SDK_INT >= 21) {
            windowFlags = 65792 | Integer.MIN_VALUE;
        } else if (Build.VERSION.SDK_INT >= 19) {
            windowFlags = 65792 | 201326592;
        }
        WindowManager.LayoutParams lp = new WindowManager.LayoutParams(-1, -1, 2, windowFlags, 1);
        wm.addView(this.contentView, lp);
        this.tmpRect.set(0, 0, 0, 0);
        this.tmpRect2.set(0, 0, 0, 0);
        this.callback.getPhotoBounds(this.photoView.getPosition(), this.tmpRect, this.tmpRect2);
        if (!this.tmpRect.isEmpty()) {
            PhotoView photoView = this.photoView;
            Bitmap thumb = this.adapter.getThumb(this.photoView.getPosition());
            if (this.adapter.isCached(this.photoView.getPosition())) {
                z = false;
            }
            photoView.setThumb(thumb, z);
            this.photoView.animateIn(this.tmpRect, this.tmpRect2.top, this.tmpRect2.bottom);
        }
        ((ResulterProvider) this.activity).registerActivityResult(this);
    }

    public void dismiss() {
        this.tmpRect.set(0, 0, 0, 0);
        this.tmpRect2.set(0, 0, 0, 0);
        this.callback.getPhotoBounds(this.photoView.getPosition(), this.tmpRect, this.tmpRect2);
        if (!this.tmpRect.isEmpty()) {
            this.photoView.setThumb(this.adapter.getThumb(this.photoView.getPosition()), false);
            this.photoView.animateOut(this.tmpRect, this.tmpRect2.top, this.tmpRect2.bottom, PhotoViewer$$Lambda$1.lambdaFactory$(this));
            return;
        }
        ObjectAnimator oa = ObjectAnimator.ofFloat(this.contentView, "alpha", 0.0f).setDuration(300L);
        oa.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.PhotoViewer.9
            {
                PhotoViewer.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                PhotoViewer.this.doDismiss();
            }
        });
        oa.start();
    }

    public void doDismiss() {
        try {
            WindowManager wm = (WindowManager) this.activity.getSystemService("window");
            this.contentView.setVisibility(4);
            wm.removeView(this.contentView);
        } catch (IllegalArgumentException e) {
        }
        this.callback.onDismissed();
        ((ResulterProvider) this.activity).unregisterActivityResult(this);
    }

    @Override // com.vkontakte.android.ui.PhotoView.DismissListener
    public void onDismiss() {
        dismiss();
    }

    @Override // com.vkontakte.android.ui.PhotoView.DismissListener
    public void onPrepareDismiss() {
        this.tmpRect.set(0, 0, 0, 0);
        this.tmpRect2.set(0, 0, 0, 0);
        this.callback.getPhotoBounds(this.photoView.getPosition(), this.tmpRect, this.tmpRect2);
        this.tmpRect.top += this.tmpRect2.top;
        this.tmpRect.bottom -= this.tmpRect2.bottom;
        this.photoView.setThumbBounds(this.tmpRect);
        this.tagsView.setVisibility(8);
    }

    @Override // com.vkontakte.android.ui.PhotoView.DismissListener
    public void onBackgroundAlphaChanged(float alpha) {
        if (alpha != this.prevBgAlpha) {
            this.scrim.setAlpha(alpha);
            this.toolbar.setAlpha(alpha);
            this.bottomView.setAlpha(alpha);
            this.prevBgAlpha = alpha;
        }
    }

    @Override // com.vkontakte.android.ui.PhotoView.NavigationListener
    public void onPositionChanged(int pos) {
        this.curPos = pos;
        if (this.docUrl == null) {
            if (TextUtils.isEmpty(this.title)) {
                Toolbar toolbar = this.toolbar;
                Activity activity = this.activity;
                Object[] objArr = new Object[2];
                objArr[0] = Integer.valueOf(pos + 1);
                objArr[1] = Integer.valueOf(this.displayTotal > 0 ? this.displayTotal : this.photos.size());
                toolbar.setTitle(activity.getString(R.string.player_num, objArr));
            } else {
                Toolbar toolbar2 = this.toolbar;
                Activity activity2 = this.activity;
                Object[] objArr2 = new Object[2];
                objArr2[0] = Integer.valueOf(pos + 1);
                objArr2[1] = Integer.valueOf(this.displayTotal > 0 ? this.displayTotal : this.photos.size());
                toolbar2.setSubtitle(activity2.getString(R.string.player_num, objArr2));
            }
        }
        if (pos > this.photos.size() - 2 && this.callback.isMoreAvailable()) {
            this.callback.loadMore();
        }
        this.curPhoto = this.photos.get(pos);
        if (this.curPhoto.infoLoaded) {
            setBottomBarData(this.curPhoto.nLikes, this.curPhoto.nComments, this.curPhoto.nTags, this.curPhoto.nReposts, this.curPhoto.isLiked, this.curPhoto.descr);
        } else {
            setBottomBarData(0, 0, 0, 0, false, "");
        }
        if (!this.curPhoto.infoLoaded) {
            loadPhotoInfo();
        }
        this.isAdmin = this.curPhoto.ownerID == VKAccountManager.getCurrent().getUid() || (this.curPhoto.ownerID < 0 && (this.curPhoto.userID == VKAccountManager.getCurrent().getUid() || Groups.isGroupAdmin(-this.curPhoto.ownerID)));
        if (this.curPhoto.lat != -9000.0d && this.curPhoto.lon != -9000.0d) {
            this.location.setVisibility(0);
            final Photo curPhoto = this.curPhoto;
            if (curPhoto.geoAddress == null) {
                this.location.setText("");
                new Thread(new Runnable() { // from class: com.vkontakte.android.PhotoViewer.10
                    {
                        PhotoViewer.this = this;
                    }

                    @Override // java.lang.Runnable
                    public void run() {
                        if (!curPhoto.loadingAddress) {
                            curPhoto.loadingAddress = true;
                            try {
                                List<Address> addrs = new Geocoder(PhotoViewer.this.activity).getFromLocation(curPhoto.lat, curPhoto.lon, 1);
                                if (addrs.size() > 0) {
                                    Address addr = addrs.get(0);
                                    String title = (addr.getAddressLine(0) + "").trim();
                                    String address = addr.getAddressLine(1);
                                    if (addr.getPostalCode() != null) {
                                        title = title.replace(addr.getPostalCode(), "").trim();
                                        address = address.replace(addr.getPostalCode(), "").replace(",,", ",").trim();
                                    }
                                    if (!title.contains(addr.getCountryName()) && !address.contains(addr.getCountryName())) {
                                        address = address + ", " + addr.getCountryName();
                                    }
                                    curPhoto.geoAddress = title + ", " + address;
                                    PhotoViewer.this.activity.runOnUiThread(new Runnable() { // from class: com.vkontakte.android.PhotoViewer.10.1
                                        {
                                            AnonymousClass10.this = this;
                                        }

                                        @Override // java.lang.Runnable
                                        public void run() {
                                            if (PhotoViewer.this.curPhoto == curPhoto) {
                                                PhotoViewer.this.location.setText(curPhoto.geoAddress);
                                            }
                                        }
                                    });
                                }
                            } catch (Exception x) {
                                Log.w("vk", x);
                                PhotoViewer.this.activity.runOnUiThread(new Runnable() { // from class: com.vkontakte.android.PhotoViewer.10.2
                                    {
                                        AnonymousClass10.this = this;
                                    }

                                    @Override // java.lang.Runnable
                                    public void run() {
                                        if (PhotoViewer.this.curPhoto == curPhoto) {
                                            PhotoViewer.this.location.setText(curPhoto.lat + ", " + curPhoto.lon);
                                        }
                                    }
                                });
                            }
                            curPhoto.loadingAddress = false;
                        }
                    }
                }).start();
                return;
            }
            this.location.setText(curPhoto.geoAddress);
            return;
        }
        this.location.setVisibility(8);
    }

    @Override // com.vkontakte.android.ui.PhotoView.NavigationListener
    public void onPositionConfirmed(int pos) {
    }

    public void appendPhotos(List<Photo> photos) {
        this.photos.addAll(photos);
        onPositionChanged(this.curPos);
        loadUsers();
    }

    private void loadUsers() {
        ArrayList<Integer> ids = new ArrayList<>();
        Iterator<Photo> it = this.photos.iterator();
        while (it.hasNext()) {
            Photo p = it.next();
            if (p.user == null && !ids.contains(Integer.valueOf(p.userID))) {
                ids.add(Integer.valueOf(p.userID));
            }
        }
        Log.i("vk", "LOAD USERS");
        Friends.getUsers(ids, new Friends.GetUsersCallback() { // from class: com.vkontakte.android.PhotoViewer.11
            {
                PhotoViewer.this = this;
            }

            @Override // com.vkontakte.android.data.Friends.GetUsersCallback
            public void onUsersLoaded(ArrayList<UserProfile> users) {
                SparseArray<UserProfile> h = new SparseArray<>();
                Iterator<UserProfile> it2 = users.iterator();
                while (it2.hasNext()) {
                    UserProfile p2 = it2.next();
                    h.put(p2.uid, p2);
                }
                Iterator it3 = PhotoViewer.this.photos.iterator();
                while (it3.hasNext()) {
                    Photo p3 = (Photo) it3.next();
                    if (p3.user == null) {
                        p3.user = h.get(p3.userID);
                    }
                }
            }
        });
    }

    private void loadPhotoInfo() {
        if (!this.curPhoto.infoLoaded) {
            if (this.photoInfoReq != null) {
                this.photoInfoReq.cancel();
            }
            final Photo p = this.curPhoto;
            this.photoInfoReq = new PhotosGetInfo(p.ownerID, p.id, p.accessKey).setCallback(new Callback<PhotosGetInfo.Result>() { // from class: com.vkontakte.android.PhotoViewer.12
                {
                    PhotoViewer.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(PhotosGetInfo.Result r) {
                    PhotoViewer.this.photoInfoReq = null;
                    p.nLikes = r.likes;
                    p.nComments = r.comments;
                    p.nReposts = r.reposts;
                    p.nTags = r.tags;
                    p.isLiked = r.liked;
                    p.canComment = r.canComment;
                    p.infoLoaded = true;
                    PhotoViewer.this.onPositionChanged(PhotoViewer.this.curPos);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    PhotoViewer.this.photoInfoReq = null;
                }
            }).exec((Context) this.activity);
        }
    }

    private void setBottomBarData(final int likes, final int comments, final int tags, final int reposts, final boolean liked, final String descr) {
        ViewUtils.post(new Runnable() { // from class: com.vkontakte.android.PhotoViewer.13
            {
                PhotoViewer.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                int i = 0;
                PhotoViewer.this.description.setVisibility(TextUtils.isEmpty(descr) ? 8 : 0);
                PhotoViewer.this.description.setText(LinkParser.truncatePost(Global.replaceEmoji(LinkParser.parseLinks(descr)), false));
                PhotoViewer.this.likes.setSelected(liked);
                PhotoViewer.this.likes.setText(likes > 0 ? Global.formatNumber(likes) : "");
                PhotoViewer.this.comments.setText(comments > 0 ? Global.formatNumber(comments) : "");
                PhotoViewer.this.tags.setText(Global.formatNumber(tags));
                OverlayTextView overlayTextView = PhotoViewer.this.tags;
                if (tags <= 0) {
                    i = 8;
                }
                overlayTextView.setVisibility(i);
                PhotoViewer.this.reposts.setText(reposts > 0 ? Global.formatNumber(reposts) : "");
            }
        });
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        boolean z = true;
        inflater.inflate(R.menu.photo_viewer, menu);
        menu.findItem(R.id.edit).setVisible(this.curPhoto != null && this.curPhoto.id != 0 && VKAccountManager.getCurrent().getUid() > 0 && this.isAdmin && (this.curPhoto.albumID > 0 || this.curPhoto.albumID == -7 || this.curPhoto.albumID == -15));
        menu.findItem(R.id.delete).setVisible(this.curPhoto != null && this.curPhoto.id != 0 && VKAccountManager.getCurrent().getUid() > 0 && this.isAdmin);
        menu.findItem(R.id.save_to_album).setVisible((this.curPhoto == null || this.curPhoto.id == 0 || this.curPhoto.ownerID == VKAccountManager.getCurrent().getUid() || this.curPhoto.id == 0 || VKAccountManager.getCurrent().getUid() <= 0) ? false : true);
        menu.findItem(R.id.copy_link).setVisible(this.curPhoto.id != 0);
        menu.findItem(R.id.send_to_friend).setVisible(this.curPhoto.id != 0 && VKAccountManager.getCurrent().getUid() > 0);
        menu.findItem(R.id.go_to_album).setVisible(this.curPhoto.albumID > 0 || this.curPhoto.albumID == -6 || this.curPhoto.albumID == -7 || this.curPhoto.albumID == -15);
        MenuItem findItem = menu.findItem(R.id.report);
        if (this.curPhoto.ownerID == VKAccountManager.getCurrent().getUid() || this.curPhoto.id == 0 || VKAccountManager.getCurrent().getUid() <= 0) {
            z = false;
        }
        findItem.setVisible(z);
        if (this.docUrl != null) {
            menu.findItem(R.id.save).setEnabled(this.photoLoaded);
        }
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.edit) {
            if (this.curPhoto.albumID == -7) {
                editDescription();
            } else {
                showEditDialog();
            }
        }
        if (item.getItemId() == R.id.save) {
            savePhoto();
        }
        if (item.getItemId() == R.id.delete) {
            new VKAlertDialog.Builder(this.activity).setTitle(R.string.confirm).setMessage(R.string.delete_photo_confirm).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.PhotoViewer.14
                {
                    PhotoViewer.this = this;
                }

                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    PhotoViewer.this.deletePhoto();
                }
            }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
        }
        if (item.getItemId() == R.id.copy_link) {
            String ln = "https://vk.com/photo" + this.curPhoto.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.curPhoto.id;
            ClipboardManager cm = (ClipboardManager) this.activity.getSystemService("clipboard");
            cm.setText(ln);
            Toast.makeText(this.activity, (int) R.string.link_copied, 0).show();
        }
        if (item.getItemId() == R.id.send_to_friend) {
            NewsEntry e = new NewsEntry();
            e.attachments = new ArrayList<>();
            e.attachments.add(new PhotoAttachment(this.curPhoto));
            e.type = 1;
            Intent intent = new Intent(this.activity, RepostActivity.class);
            intent.putExtra(ArgKeys.POST, e);
            intent.putExtra("msg", true);
            this.activity.startActivity(intent);
        }
        if (item.getItemId() == R.id.save_to_album) {
            new PhotosCopy(this.curPhoto.ownerID, this.curPhoto.id, this.curPhoto.accessKey).setCallback(new SimpleCallback<Integer>(this.activity) { // from class: com.vkontakte.android.PhotoViewer.15
                {
                    PhotoViewer.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Integer id) {
                    Toast.makeText(PhotoViewer.this.activity, (int) R.string.saved_to_album, 0).show();
                }
            }).wrapProgress(this.activity).exec((View) this.contentView);
        }
        if (item.getItemId() == R.id.go_to_album) {
            if (this.fromAlbumId == this.curPhoto.albumID && this.fromAlbumOwner == this.curPhoto.ownerID) {
                dismiss();
            } else {
                this.activity.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/album" + this.curPhoto.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.curPhoto.albumID)));
            }
        }
        if (item.getItemId() == R.id.report) {
            Intent intent2 = new Intent(this.activity, ReportContentActivity.class);
            intent2.putExtra("itemID", this.curPhoto.id);
            intent2.putExtra("ownerID", this.curPhoto.ownerID);
            intent2.putExtra(ServerKeys.TYPE, "photo");
            intent2.putExtra("refer", "photo");
            this.activity.startActivity(intent2);
        }
        return true;
    }

    private void savePhoto() {
        String url;
        if (this.docUrl != null) {
            DownloadUtils.downloadFile(this.activity, this.title, this.docUrl);
            return;
        }
        if (this.curPhoto.getImage('w') != null) {
            url = this.curPhoto.getImage('w').url;
        } else if (this.curPhoto.getImage('z') != null) {
            url = this.curPhoto.getImage('z').url;
        } else if (this.curPhoto.getImage('y') != null) {
            url = this.curPhoto.getImage('y').url;
        } else {
            url = this.curPhoto.getImage('x').url;
        }
        DownloadUtils.downloadFile(this.activity, null, url);
    }

    public void deletePhoto() {
        new PhotosDelete(this.curPhoto.ownerID, this.curPhoto.id).setCallback(new ResultlessCallback(this.activity) { // from class: com.vkontakte.android.PhotoViewer.16
            {
                PhotoViewer.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Intent intent = new Intent(Upload.ACTION_PHOTO_REMOVED);
                intent.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, PhotoViewer.this.curPhoto.albumID);
                intent.putExtra("pid", PhotoViewer.this.curPhoto.id);
                PhotoViewer.this.activity.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                PhotoViewer.this.dismiss();
            }
        }).wrapProgress(this.activity).exec((Context) this.activity);
    }

    private void showEditDialog() {
        new VKAlertDialog.Builder(this.activity).setTitle(R.string.edit_photo).setItems(new String[]{this.activity.getString(R.string.edit_photo_description), this.activity.getString(R.string.move_to_album), this.activity.getString(R.string.make_cover)}, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.PhotoViewer.17
            {
                PhotoViewer.this = this;
            }

            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                switch (which) {
                    case 0:
                        PhotoViewer.this.editDescription();
                        return;
                    case 1:
                        PhotoViewer.this.movePhoto();
                        return;
                    case 2:
                        PhotoViewer.this.makeCover();
                        return;
                    default:
                        return;
                }
            }
        }).show();
    }

    public void editDescription() {
        final EditText ed = new EditText(this.activity);
        ed.setLines(4);
        ed.setGravity(51);
        ed.setText(this.curPhoto.descr);
        ed.setSelection(ed.getText().length());
        ed.setHint(R.string.photo_descr);
        AlertDialog dlg = new VKAlertDialog.Builder(this.activity).setTitle(R.string.edit_photo_description).setView(ed).setPositiveButton(R.string.save, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.PhotoViewer.18
            {
                PhotoViewer.this = this;
            }

            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                final String text = ed.getText().toString();
                new PhotosEdit(PhotoViewer.this.curPhoto.ownerID, PhotoViewer.this.curPhoto.id, text).setCallback(new ResultlessCallback(PhotoViewer.this.activity) { // from class: com.vkontakte.android.PhotoViewer.18.1
                    {
                        AnonymousClass18.this = this;
                    }

                    @Override // com.vkontakte.android.api.ResultlessCallback
                    public void success() {
                        PhotoViewer.this.curPhoto.descr = text;
                        PhotoViewer.this.onPositionChanged(PhotoViewer.this.curPos);
                    }
                }).wrapProgress(PhotoViewer.this.activity).exec((Context) PhotoViewer.this.activity);
            }
        }).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).create();
        dlg.setOnShowListener(new DialogInterface.OnShowListener() { // from class: com.vkontakte.android.PhotoViewer.19
            {
                PhotoViewer.this = this;
            }

            @Override // android.content.DialogInterface.OnShowListener
            public void onShow(DialogInterface dialog) {
                InputMethodManager imm = (InputMethodManager) PhotoViewer.this.activity.getSystemService("input_method");
                imm.showSoftInput(ed, 1);
            }
        });
        dlg.show();
    }

    public void movePhoto() {
        Bundle args = new Bundle();
        args.putBoolean("select_album", true);
        args.putString("title", this.activity.getString(R.string.move_to_album_title));
        args.putInt(ArgKeys.UID, this.curPhoto.ownerID);
        args.putBoolean("only_upload", true);
        new Navigator(PhotoAlbumListFragment.class, args).forResult(this.activity, SELECT_ALBUM_RESULT);
    }

    public void makeCover() {
        new PhotosMakeCover(this.curPhoto.ownerID, this.curPhoto.id, this.curPhoto.albumID).setCallback(new ResultlessCallback(this.activity) { // from class: com.vkontakte.android.PhotoViewer.20
            {
                PhotoViewer.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                char needSize = 'p';
                if (Global.displayDensity >= 1.5f) {
                    needSize = 'q';
                }
                if (Global.displayDensity >= 2.0f) {
                    needSize = 'r';
                }
                Photo photo = PhotoViewer.this.curPhoto;
                char[] cArr = new char[3];
                cArr[0] = needSize;
                cArr[1] = (Global.displayDensity < 2.0f || !NetworkStateReceiver.isHighSpeed()) ? 'm' : 'x';
                cArr[2] = 'm';
                String cover = photo.getImage(cArr).url;
                Toast.makeText(PhotoViewer.this.activity, (int) R.string.album_cover_changed, 0).show();
                Intent intent = new Intent(PhotoViewer.ACTION_UPDATE_ALBUM_COVER);
                intent.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, PhotoViewer.this.curPhoto.albumID);
                intent.putExtra("new_cover_url", cover);
                PhotoViewer.this.activity.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            }
        }).wrapProgress(this.activity).exec((Context) this.activity);
    }

    public void like(final boolean liked) {
        if (VKAuth.ensureLoggedIn(this.activity)) {
            final Photo curPhoto = this.curPhoto;
            curPhoto.isLiked = liked;
            if (liked) {
                curPhoto.nLikes++;
            } else {
                curPhoto.nLikes--;
            }
            if (!this.liking) {
                this.liking = true;
                new WallLike(liked, curPhoto.ownerID, curPhoto.id, false, 1, 0, curPhoto.accessKey).setCallback(new Callback<WallLike.Result>() { // from class: com.vkontakte.android.PhotoViewer.21
                    {
                        PhotoViewer.this = this;
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void success(WallLike.Result res) {
                        curPhoto.nLikes = res.likes;
                        if (curPhoto.postID != 0) {
                            PhotoViewer.this.broadcastUpdate();
                        }
                        PhotoViewer.this.liking = false;
                        if (curPhoto.isLiked != liked) {
                            PhotoViewer.this.contentView.post(new Runnable() { // from class: com.vkontakte.android.PhotoViewer.21.1
                                {
                                    AnonymousClass21.this = this;
                                }

                                @Override // java.lang.Runnable
                                public void run() {
                                    PhotoViewer.this.like(curPhoto.isLiked);
                                }
                            });
                        } else {
                            PhotoViewer.this.contentView.post(new Runnable() { // from class: com.vkontakte.android.PhotoViewer.21.2
                                {
                                    AnonymousClass21.this = this;
                                }

                                @Override // java.lang.Runnable
                                public void run() {
                                    PhotoViewer.this.onPositionChanged(PhotoViewer.this.curPos);
                                }
                            });
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(final VKAPIRequest.VKErrorResponse error) {
                        curPhoto.isLiked = !liked;
                        if (liked) {
                            Photo photo = curPhoto;
                            photo.nLikes--;
                        } else {
                            curPhoto.nLikes++;
                        }
                        PhotoViewer.this.liking = false;
                        PhotoViewer.this.contentView.post(new Runnable() { // from class: com.vkontakte.android.PhotoViewer.21.3
                            {
                                AnonymousClass21.this = this;
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                error.showToast(PhotoViewer.this.activity);
                                PhotoViewer.this.onPositionChanged(PhotoViewer.this.curPos);
                            }
                        });
                    }
                }).exec();
            }
        }
    }

    public void openComments() {
        if (this.curPhoto.albumID != Integer.MIN_VALUE) {
            new PostViewFragment.Builder(getCurrentPhotoAsPost()).scrollToFirstComment().loadFromBeginning().setIsPhotoViewer().go(this.activity);
        }
    }

    public void repost() {
        Sharing.from(this.activity).withAttachment(Attachments.createInfo(this.curPhoto, "photos")).withActions(Actions.createInfo(this.curPhoto)).share();
    }

    public void showTags() {
        if (this.curPhoto.nTags > 0 && this.curPhoto.tags.size() == 0) {
            new PhotosGetTags(this.curPhoto.ownerID, this.curPhoto.id, this.curPhoto.accessKey).setCallback(new SimpleCallback<ArrayList<PhotoTag>>(this.activity) { // from class: com.vkontakte.android.PhotoViewer.22
                {
                    PhotoViewer.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(ArrayList<PhotoTag> tags) {
                    PhotoViewer.this.curPhoto.tags = tags;
                    PhotoViewer.this.doShowTags();
                }
            }).wrapProgress(this.activity).exec((Context) this.activity);
        } else if (this.curPhoto.tags.size() > 0) {
            doShowTags();
        } else {
            Toast.makeText(this.activity, (int) R.string.photo_no_tags, 0).show();
        }
    }

    public void doShowTags() {
        if (this.tagsView.getVisibility() != 8) {
            this.tagsView.setVisibility(8);
            return;
        }
        toggleControls();
        this.tagsView.setVisibility(0);
    }

    public void broadcastUpdate() {
        Intent intent = new Intent(Posts.ACTION_POST_UPDATED_BROADCAST);
        intent.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, this.curPhoto.postID);
        intent.putExtra("owner_id", this.curPhoto.ownerID);
        intent.putExtra(ServerKeys.LIKES, this.curPhoto.nLikes);
        intent.putExtra("liked", this.curPhoto.isLiked);
        this.activity.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
        NewsfeedCache.update(this.curPhoto.ownerID, this.curPhoto.postID, this.curPhoto.nLikes, -1, -1, this.curPhoto.isLiked, false);
    }

    public void toggleControls() {
        int i = 8;
        if (this.tagsView.getVisibility() != 8) {
            this.tagsView.setVisibility(8);
        }
        this.controlsVisible = !this.controlsVisible;
        V.setVisibilityAnimated(this.toolbar, this.controlsVisible ? 0 : 8);
        if (TextUtils.isEmpty(this.docUrl)) {
            View view = this.bottomView;
            if (this.controlsVisible) {
                i = 0;
            }
            V.setVisibilityAnimated(view, i);
        }
        if (this.currentVisAnim != null) {
            this.currentVisAnim.cancel();
        }
        View view2 = this.scrim;
        int[] iArr = new int[1];
        iArr[0] = this.controlsVisible ? 153 : 0;
        ObjectAnimator oa = ObjectAnimator.ofInt(view2, "gradientsAlpha", iArr);
        oa.setDuration(300L);
        oa.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.PhotoViewer.23
            {
                PhotoViewer.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                PhotoViewer.this.currentVisAnim = null;
            }
        });
        oa.start();
        this.currentVisAnim = oa;
    }

    private NewsEntry getCurrentPhotoAsPost() {
        return new NewsEntry(this.curPhoto);
    }

    public void openLocation() {
        try {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("geo:" + this.curPhoto.lat + "," + this.curPhoto.lon + "?z=18&q=" + this.curPhoto.lat + "," + this.curPhoto.lon));
            this.activity.startActivity(intent);
        } catch (Throwable th) {
            ActivityUtils.requireGoogleMaps(this.activity, false);
        }
    }

    @Override // com.vkontakte.android.ui.ActivityResulter
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (reqCode == SELECT_ALBUM_RESULT && resCode == -1) {
            final PhotoAlbum album = (PhotoAlbum) data.getParcelableExtra(ArgKeys.ALBUM);
            new PhotosMove(this.curPhoto.ownerID, this.curPhoto.id, album.id).setCallback(new ResultlessCallback(this.activity) { // from class: com.vkontakte.android.PhotoViewer.24
                {
                    PhotoViewer.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    Intent intent = new Intent(Upload.ACTION_PHOTO_REMOVED);
                    intent.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, PhotoViewer.this.curPhoto.albumID);
                    intent.putExtra("pid", PhotoViewer.this.curPhoto.id);
                    PhotoViewer.this.activity.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    PhotoViewer.this.curPhoto.albumID = album.id;
                    Intent intent2 = new Intent(Upload.ACTION_PHOTO_ADDED);
                    intent2.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, PhotoViewer.this.curPhoto.albumID);
                    intent2.putExtra("photo", PhotoViewer.this.curPhoto);
                    PhotoViewer.this.activity.sendBroadcast(intent2, "com.vkontakte.android.permission.ACCESS_DATA");
                    PhotoViewer.this.dismiss();
                    Toast.makeText(PhotoViewer.this.activity, (int) R.string.photo_moved, 0).show();
                }
            }).wrapProgress(this.activity).exec((Context) this.activity);
        }
    }

    /* loaded from: classes2.dex */
    public static class PhotoViewerCallbackAdapter implements PhotoViewerCallback {
        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public boolean isMoreAvailable() {
            return false;
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void loadMore() {
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void onDismissed() {
        }
    }

    /* loaded from: classes2.dex */
    public class PhotoAdapter implements PhotoView.PhotoViewerAdapter {
        private PhotoAdapter() {
            PhotoViewer.this = r1;
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public int getCount() {
            if (PhotoViewer.this.docUrl == null) {
                return PhotoViewer.this.photos.size();
            }
            return 1;
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public boolean isPhotoLoaded(int num) {
            return false;
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public PhotoView.RunnableFuture<Bitmap> getPhoto(int num) {
            if (PhotoViewer.this.docUrl == null) {
                return new PhotoLoader((Photo) PhotoViewer.this.photos.get(num));
            }
            return new DocPhotoLoader();
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public void requestPhotoDownload(int num) {
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public float getPhotoLoadProgress(int num) {
            return 0.0f;
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public boolean shouldPreload() {
            return !Utils.isMobile();
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public boolean allowZoom(int num) {
            return true;
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public Bitmap getThumb(int num) {
            if (PhotoViewer.this.docUrl == null && num >= 0 && num < getCount()) {
                Photo ph = (Photo) PhotoViewer.this.photos.get(num);
                Iterator<Photo.Image> it = ph.sizes.iterator();
                while (it.hasNext()) {
                    Photo.Image im = it.next();
                    if (VKImageLoader.isInCache(im.url)) {
                        return (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getBitmap(Uri.parse(im.url)));
                    }
                }
                return null;
            }
            return null;
        }

        @Override // com.vkontakte.android.ui.PhotoView.PhotoViewerAdapter
        public boolean isCached(int num) {
            if (num >= 0 && num < PhotoViewer.this.photos.size()) {
                Photo photo = (Photo) PhotoViewer.this.photos.get(num);
                String url = PhotoViewer.this.useSmall ? photo.getImage('x').url : photo.getImage('y', 'x').url;
                return VKImageLoader.isInCache(url);
            }
            return false;
        }
    }

    /* loaded from: classes2.dex */
    private class PhotoLoader implements PhotoView.RunnableFuture<Bitmap> {
        private Bitmap bmp;
        private Photo photo;
        private VKImageRequestProgress progr;
        private VKImageRequestWrapper wrapper = new VKImageRequestWrapper();
        private boolean canceled = false;

        public PhotoLoader(Photo p) {
            PhotoViewer.this = r2;
            this.photo = p;
        }

        @Override // java.lang.Runnable
        public void run() {
            String url;
            this.canceled = false;
            if (PhotoViewer.this.useSmall) {
                url = this.photo.getImage('x').url;
            } else {
                url = PhotoViewer.this.useBig ? this.photo.getImage(new char[]{'z', 'y', 'x'}).url : this.photo.getImage('y', 'x').url;
            }
            this.bmp = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getVeryBigBitmap(Uri.parse(url), this.wrapper, this.progr));
        }

        @Override // java.util.concurrent.Future
        public boolean cancel(boolean mayInterruptIfRunning) {
            if (this.wrapper != null) {
                this.wrapper.cancel();
                this.canceled = true;
            }
            return true;
        }

        @Override // java.util.concurrent.Future
        /* renamed from: get */
        public Bitmap mo564get() throws InterruptedException, ExecutionException {
            return this.bmp;
        }

        @Override // java.util.concurrent.Future
        /* renamed from: get */
        public Bitmap mo565get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
            return null;
        }

        @Override // java.util.concurrent.Future
        public boolean isCancelled() {
            return this.canceled;
        }

        @Override // java.util.concurrent.Future
        public boolean isDone() {
            return this.bmp != null;
        }

        @Override // com.vkontakte.android.ui.PhotoView.RunnableFuture
        public void setProgressCallback(VKImageRequestProgress c) {
            this.progr = c;
        }
    }

    /* loaded from: classes2.dex */
    public class DocPhotoLoader implements PhotoView.RunnableFuture<Bitmap> {
        private Bitmap bmp;
        private VKImageRequestProgress progr;
        private VKImageRequestWrapper wrapper = new VKImageRequestWrapper();
        private boolean canceled = false;

        public DocPhotoLoader() {
            PhotoViewer.this = r2;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.canceled = false;
            if (PhotoViewer.this.docUrl != null) {
                this.bmp = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getVeryBigBitmap(Uri.parse(PhotoViewer.this.docUrl), this.wrapper, this.progr));
                if (this.bmp != null) {
                    PhotoViewer.this.photoLoaded = true;
                    ViewUtils.post(PhotoViewer$DocPhotoLoader$$Lambda$1.lambdaFactory$(PhotoViewer.this));
                }
            }
        }

        @Override // java.util.concurrent.Future
        public boolean cancel(boolean mayInterruptIfRunning) {
            if (this.wrapper != null) {
                this.wrapper.cancel();
                this.canceled = true;
            }
            return true;
        }

        @Override // java.util.concurrent.Future
        /* renamed from: get */
        public Bitmap mo562get() throws InterruptedException, ExecutionException {
            return this.bmp;
        }

        @Override // java.util.concurrent.Future
        /* renamed from: get */
        public Bitmap mo563get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
            return null;
        }

        @Override // java.util.concurrent.Future
        public boolean isCancelled() {
            return this.canceled;
        }

        @Override // java.util.concurrent.Future
        public boolean isDone() {
            return this.bmp != null;
        }

        @Override // com.vkontakte.android.ui.PhotoView.RunnableFuture
        public void setProgressCallback(VKImageRequestProgress c) {
            this.progr = c;
        }
    }

    /* loaded from: classes2.dex */
    public class TagOverlayView extends View {
        private Paint bgPaint;
        private Bitmap corner;
        private ColorFilter cornerNormal;
        private Paint cornerPaint;
        private ColorFilter cornerPressed;
        private Bitmap cornerTop;
        private int selectedTag;
        private boolean tagWasSelected;
        private ArrayList<Rect> tagsBounds;
        private Paint textPaint;
        private RectF tmpRect;
        private Rect tmpRect1;
        private float touchDownX;
        private float touchDownY;
        private int touchslop;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public TagOverlayView(Context context) {
            super(context);
            PhotoViewer.this = r9;
            this.tmpRect = new RectF();
            this.tagsBounds = new ArrayList<>();
            this.tmpRect1 = new Rect();
            this.selectedTag = -1;
            this.tagWasSelected = false;
            this.textPaint = new Paint(1);
            this.textPaint.setColor(-1);
            this.textPaint.setTypeface(Font.Medium.typeface);
            this.textPaint.setTextSize(V.dp(12.0f));
            this.bgPaint = new Paint(3);
            this.bgPaint.setColor(-1);
            Path corner = new Path();
            corner.moveTo(12.586f, 3.633f);
            corner.lineTo(9.414f, 0.567f);
            corner.rCubicTo(-0.781f, -0.755f, -2.045f, -0.758f, -2.829f, 0.0f);
            corner.lineTo(3.415f, 3.633f);
            corner.cubicTo(2.633f, 4.388f, 1.105f, 5.0f, 0.0f, 5.0f);
            corner.rLineTo(16.0f, 0.0f);
            corner.cubicTo(14.895f, 5.0f, 13.369f, 4.391f, 12.586f, 3.633f);
            corner.close();
            corner.computeBounds(this.tmpRect, true);
            Matrix m = new Matrix();
            m.postScale(Global.displayDensity, Global.displayDensity, 0.0f, 0.0f);
            corner.transform(m);
            corner.computeBounds(this.tmpRect, true);
            this.corner = Bitmap.createBitmap(Math.round(this.tmpRect.width()), (int) this.tmpRect.bottom, Bitmap.Config.ARGB_8888);
            new Canvas(this.corner).drawPath(corner, this.bgPaint);
            Matrix m2 = new Matrix();
            m2.setRotate(180.0f);
            this.cornerTop = Bitmap.createBitmap(this.corner, 0, 0, this.corner.getWidth(), this.corner.getHeight(), m2, false);
            this.cornerPaint = new Paint();
            this.cornerPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_OVER));
            this.cornerPressed = new PorterDuffColorFilter(-13421773, PorterDuff.Mode.SRC_IN);
            this.cornerNormal = new PorterDuffColorFilter(-654311424, PorterDuff.Mode.SRC_IN);
            this.touchslop = ViewConfiguration.get(context).getScaledTouchSlop();
        }

        @Override // android.view.View
        protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            this.tagsBounds.clear();
        }

        @Override // android.view.View
        protected void onVisibilityChanged(View changedView, int visibility) {
            super.onVisibilityChanged(changedView, visibility);
            this.tagsBounds.clear();
        }

        @Override // android.view.View
        public boolean onTouchEvent(MotionEvent event) {
            if (event.getAction() == 0) {
                float scale = ((View) getParent()).getScaleX();
                for (int i = 0; i < this.tagsBounds.size(); i++) {
                    if (this.tagsBounds.get(i).contains((int) (event.getX() * scale), (int) (event.getY() * scale)) && PhotoViewer.this.curPhoto.tags.get(i).userID != 0) {
                        this.selectedTag = i;
                        this.tagWasSelected = true;
                        getParent().requestDisallowInterceptTouchEvent(true);
                        invalidate();
                        this.touchDownX = event.getX();
                        this.touchDownY = event.getY();
                        return true;
                    }
                }
            }
            if (event.getAction() == 2 && this.tagWasSelected) {
                if (this.selectedTag != -1 && (Math.abs(this.touchDownX - event.getX()) > this.touchslop || Math.abs(this.touchDownY - event.getY()) > this.touchslop)) {
                    this.selectedTag = -1;
                    invalidate();
                }
                return true;
            } else if (event.getAction() != 1 || !this.tagWasSelected) {
                return false;
            } else {
                if (this.selectedTag != -1) {
                    playSoundEffect(0);
                    new ProfileFragment.Builder(PhotoViewer.this.curPhoto.tags.get(this.selectedTag).userID).go(getContext());
                }
                this.selectedTag = -1;
                invalidate();
                return true;
            }
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            Rect bounds;
            float x;
            float y;
            int area;
            int area2;
            int area3;
            int area4;
            int area5;
            int area6;
            int area7;
            int area8;
            float scale = ((View) getParent()).getScaleX();
            canvas.save();
            canvas.scale(1.0f / scale, 1.0f / scale);
            int i = 0;
            Iterator<PhotoTag> it = PhotoViewer.this.curPhoto.tags.iterator();
            while (it.hasNext()) {
                PhotoTag tag = it.next();
                String text = tag.userName;
                float w = this.textPaint.measureText(text);
                float x2 = (float) Math.round((((((tag.x1 / 100.0d) * canvas.getWidth()) + ((tag.x2 / 100.0d) * canvas.getWidth())) / 2.0d) * scale) - (w / 2.0f));
                float y2 = (float) Math.round((((tag.y2 / 100.0d) * canvas.getHeight()) - (this.textPaint.ascent() / scale)) * scale);
                float arrowX = x2 + (w / 2.0f);
                if (x2 < 0.0f) {
                    x2 = 0.0f;
                }
                if (x2 + w > canvas.getWidth() * scale) {
                    x2 = (canvas.getWidth() * scale) - w;
                }
                if (this.tagsBounds.size() <= i) {
                    ArrayList<Rect> arrayList = this.tagsBounds;
                    bounds = new Rect();
                    arrayList.add(bounds);
                } else {
                    bounds = this.tagsBounds.get(i);
                }
                float btmX = x2;
                float topX = x2;
                float topY = (float) Math.round((((tag.y1 / 100.0d) * canvas.getHeight()) + (this.textPaint.descent() / scale)) * scale);
                float offBtmY = 0.0f;
                float offTopY = 0.0f;
                float offBtmX = 0.0f;
                float offTopX = 0.0f;
                float areaBtm = 2.1474836E9f;
                float areaTop = 2.1474836E9f;
                bounds.set((int) x2, (int) (Math.round(this.textPaint.ascent()) + y2), (int) (x2 + w), (int) (Math.round(this.textPaint.descent()) + y2));
                bounds.inset(V.dp(-8.0f), V.dp(-5.0f));
                int maxOffX = (bounds.width() / 2) - this.corner.getWidth();
                int maxOffY = bounds.height() / 2;
                int maxX = Math.round(canvas.getWidth() * scale);
                bounds.inset(V.dp(-2.0f), V.dp(-2.0f));
                for (int j = 0; j < i; j++) {
                    Rect r = this.tagsBounds.get(j);
                    this.tmpRect1.set(r);
                    if (this.tmpRect1.intersect(bounds)) {
                        if (bounds.top < r.bottom) {
                            PhotoViewer.this.tmpRect2.set(bounds);
                            PhotoViewer.this.tmpRect2.offset(0, Math.min(maxOffY, r.bottom - bounds.top));
                            if (PhotoViewer.this.tmpRect2.intersect(r)) {
                                area8 = PhotoViewer.this.tmpRect2.width() * PhotoViewer.this.tmpRect2.height();
                            } else {
                                area8 = 0;
                            }
                            if (area8 < areaBtm) {
                                offBtmY = Math.min(maxOffY, r.bottom - bounds.top);
                                areaBtm = area8;
                            }
                        }
                        if (bounds.bottom > r.top) {
                            PhotoViewer.this.tmpRect2.set(bounds);
                            PhotoViewer.this.tmpRect2.offset(0, -Math.min(maxOffY, bounds.bottom - r.top));
                            if (PhotoViewer.this.tmpRect2.intersect(r)) {
                                area7 = PhotoViewer.this.tmpRect2.width() * PhotoViewer.this.tmpRect2.height();
                            } else {
                                area7 = 0;
                            }
                            if (area7 < areaBtm) {
                                offBtmY = -Math.min(maxOffY, bounds.bottom - r.top);
                                areaBtm = area7;
                            }
                        }
                        if (bounds.left < r.right) {
                            PhotoViewer.this.tmpRect2.set(bounds);
                            int off = Math.min(maxX - bounds.right, Math.min(maxOffX, r.right - bounds.left));
                            PhotoViewer.this.tmpRect2.offset(off, 0);
                            if (PhotoViewer.this.tmpRect2.intersect(r)) {
                                area6 = PhotoViewer.this.tmpRect2.width() * PhotoViewer.this.tmpRect2.height();
                            } else {
                                area6 = 0;
                            }
                            if (area6 < areaBtm) {
                                offBtmX = off;
                                areaBtm = area6;
                            }
                        }
                        if (bounds.right > r.left) {
                            PhotoViewer.this.tmpRect2.set(bounds);
                            int off2 = -Math.min(bounds.left, Math.min(maxOffX, bounds.right - r.left));
                            PhotoViewer.this.tmpRect2.offset(off2, 0);
                            if (PhotoViewer.this.tmpRect2.intersect(r)) {
                                area5 = PhotoViewer.this.tmpRect2.width() * PhotoViewer.this.tmpRect2.height();
                            } else {
                                area5 = 0;
                            }
                            if (area5 < areaBtm) {
                                offBtmX = off2;
                                areaBtm = area5;
                            }
                        }
                    }
                }
                bounds.set((int) x2, (int) (Math.round(this.textPaint.ascent()) + topY), (int) (x2 + w), (int) (Math.round(this.textPaint.descent()) + topY));
                bounds.inset(V.dp(-8.0f), V.dp(-5.0f));
                bounds.inset(V.dp(-2.0f), V.dp(-2.0f));
                for (int j2 = 0; j2 < i; j2++) {
                    Rect r2 = this.tagsBounds.get(j2);
                    if (Rect.intersects(r2, bounds)) {
                        if (bounds.top < r2.bottom) {
                            PhotoViewer.this.tmpRect2.set(bounds);
                            PhotoViewer.this.tmpRect2.offset(0, Math.min(maxOffY, r2.bottom - bounds.top));
                            if (PhotoViewer.this.tmpRect2.intersect(r2)) {
                                area4 = PhotoViewer.this.tmpRect2.width() * PhotoViewer.this.tmpRect2.height();
                            } else {
                                area4 = 0;
                            }
                            if (area4 < areaTop) {
                                offTopY = Math.min(maxOffY, r2.bottom - bounds.top);
                                areaTop = area4;
                            }
                        }
                        if (bounds.bottom > r2.top) {
                            PhotoViewer.this.tmpRect2.set(bounds);
                            PhotoViewer.this.tmpRect2.offset(0, -Math.min(maxOffY, bounds.bottom - r2.top));
                            if (PhotoViewer.this.tmpRect2.intersect(r2)) {
                                area3 = PhotoViewer.this.tmpRect2.width() * PhotoViewer.this.tmpRect2.height();
                            } else {
                                area3 = 0;
                            }
                            if (area3 < areaTop) {
                                offTopY = -Math.min(maxOffY, bounds.bottom - r2.top);
                                areaTop = area3;
                            }
                        }
                        if (bounds.left < r2.right) {
                            PhotoViewer.this.tmpRect2.set(bounds);
                            int off3 = Math.min(maxX - bounds.right, Math.min(maxOffX, r2.right - bounds.left));
                            PhotoViewer.this.tmpRect2.offset(off3, 0);
                            if (PhotoViewer.this.tmpRect2.intersect(r2)) {
                                area2 = PhotoViewer.this.tmpRect2.width() * PhotoViewer.this.tmpRect2.height();
                            } else {
                                area2 = 0;
                            }
                            if (area2 < areaTop) {
                                offTopX = off3;
                                areaTop = area2;
                            }
                        }
                        if (bounds.right > r2.left) {
                            PhotoViewer.this.tmpRect2.set(bounds);
                            int off4 = -Math.min(bounds.left, Math.min(maxOffX, bounds.right - r2.left));
                            PhotoViewer.this.tmpRect2.offset(off4, 0);
                            if (PhotoViewer.this.tmpRect2.intersect(r2)) {
                                area = PhotoViewer.this.tmpRect2.width() * PhotoViewer.this.tmpRect2.height();
                            } else {
                                area = 0;
                            }
                            if (area < areaTop) {
                                offTopX = off4;
                                areaTop = area;
                            }
                        }
                    }
                }
                float topX2 = topX + offTopX;
                float topY2 = topY + offTopY;
                float btmX2 = btmX + offBtmX;
                float btmY = y2 + offBtmY;
                float areaBtm2 = 0.0f;
                float areaTop2 = 0.0f;
                bounds.set((int) btmX2, ((int) btmY) + Math.round(this.textPaint.ascent()), (int) (btmX2 + w), ((int) btmY) + Math.round(this.textPaint.descent()));
                bounds.inset(V.dp(-8.0f), V.dp(-5.0f));
                for (int j3 = 0; j3 < i; j3++) {
                    this.tmpRect1.set(bounds);
                    if (this.tmpRect1.intersect(this.tagsBounds.get(j3))) {
                        areaBtm2 += this.tmpRect1.width() * this.tmpRect1.height();
                    }
                }
                bounds.set((int) topX2, ((int) topY2) + Math.round(this.textPaint.ascent()), (int) (topX2 + w), ((int) topY2) + Math.round(this.textPaint.descent()));
                bounds.inset(V.dp(-8.0f), V.dp(-5.0f));
                for (int j4 = 0; j4 < i; j4++) {
                    this.tmpRect1.set(bounds);
                    if (this.tmpRect1.intersect(this.tagsBounds.get(j4))) {
                        areaTop2 += this.tmpRect1.width() * this.tmpRect1.height();
                    }
                }
                boolean isTop = false;
                if (areaTop2 < areaBtm2) {
                    x = topX2;
                    y = topY2;
                    isTop = true;
                } else {
                    x = btmX2;
                    y = btmY;
                }
                this.tmpRect.set(x, Math.round(this.textPaint.ascent()) + y, x + w, Math.round(this.textPaint.descent()) + y);
                this.tmpRect.inset(V.dp(-8.0f), V.dp(-5.0f));
                bounds.set((int) this.tmpRect.left, (int) this.tmpRect.top, (int) this.tmpRect.right, (int) this.tmpRect.bottom);
                this.bgPaint.setColor(this.selectedTag == i ? -13421773 : -654311424);
                this.cornerPaint.setColorFilter(this.selectedTag == i ? this.cornerPressed : this.cornerNormal);
                canvas.drawRoundRect(this.tmpRect, V.dp(2.0f), V.dp(2.0f), this.bgPaint);
                if (isTop) {
                    canvas.drawBitmap(this.cornerTop, arrowX - (this.corner.getWidth() / 2), this.tmpRect.bottom, this.cornerPaint);
                } else {
                    canvas.drawBitmap(this.corner, arrowX - (this.corner.getWidth() / 2), this.tmpRect.top - this.corner.getHeight(), this.cornerPaint);
                }
                canvas.drawText(text, x, y, this.textPaint);
                i++;
            }
            canvas.restore();
        }
    }
}
