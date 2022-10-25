package com.vkontakte.android.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.LayoutTransition;
import android.animation.ObjectAnimator;
import android.animation.TimeInterpolator;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Parcelable;
import android.support.annotation.DrawableRes;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.animation.OvershootInterpolator;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import com.facebook.common.util.UriUtil;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.transform.AttachMapPinTransform;
import com.vk.imageloader.view.VKImageView;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.attachments.AlbumAttachment;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.DocumentAttachment;
import com.vkontakte.android.attachments.FwdMessagesAttachment;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.LinkAttachment;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.attachments.PendingAttachment;
import com.vkontakte.android.attachments.PendingAudioAttachment;
import com.vkontakte.android.attachments.PendingDocumentAttachment;
import com.vkontakte.android.attachments.PendingPhotoAttachment;
import com.vkontakte.android.attachments.PendingVideoAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.attachments.PostAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.fragments.news.PollEditorFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes3.dex */
public class AttachmentsEditorView extends HorizontalScrollView {
    private ArrayList<Attachment> attachments;
    private Callback callback;
    private LinearLayout content;
    private int dragPos;
    private float dragStartX;
    private float dragStartY;
    private View dragView;
    public boolean forbidAttachmentsEdit;
    private long initTime;
    public boolean isWallPhoto;
    private float lastTouchX;
    private float lastTouchY;
    private BroadcastReceiver receiver;
    private View.OnClickListener removeClickListener;
    private View.OnClickListener retryClickListener;
    private Runnable scrollRunner;
    public int uploadOwnerId;

    /* loaded from: classes3.dex */
    public interface Callback {
        void onAllUploadsDone();

        void onAttachmentRemoved(Attachment attachment);

        void onUploadFailed();
    }

    public /* synthetic */ void lambda$new$0(View v) {
        remove((Attachment) ((View) v.getParent()).getTag());
    }

    public /* synthetic */ void lambda$new$1(View v) {
        View aview = (View) v.getParent();
        Object t = aview.getTag();
        if (t instanceof PendingAttachment) {
            Log.i("vk", "RETRY CLICK " + t);
            ViewUtils.setVisibilityAnimated(aview.findViewById(R.id.attach_progress), 0);
            ViewUtils.setVisibilityAnimated(aview.findViewById(R.id.attach_error), 8);
            if (t instanceof PendingVideoAttachment) {
                retryUploadVideo((PendingVideoAttachment) t);
                return;
            }
            ((ProgressBar) aview.findViewById(R.id.attach_progress)).setProgress(0);
            PendingAttachment attachment = (PendingAttachment) t;
            attachment.setId(Upload.getNewID());
            uploadAttachment(attachment);
        }
    }

    public AttachmentsEditorView(Context context) {
        super(context);
        this.attachments = new ArrayList<>();
        this.forbidAttachmentsEdit = false;
        this.removeClickListener = AttachmentsEditorView$$Lambda$1.lambdaFactory$(this);
        this.retryClickListener = AttachmentsEditorView$$Lambda$2.lambdaFactory$(this);
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.1
            {
                AttachmentsEditorView.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                if (APIController.API_DEBUG) {
                    Log.i("vk", "upload state " + intent.getAction() + ", id=" + intent.getIntExtra("id", -1));
                }
                if (Upload.ACTION_UPLOAD_PROGRESS.equals(intent.getAction())) {
                    int id = intent.getIntExtra("id", 0);
                    int i = 0;
                    Iterator it = AttachmentsEditorView.this.attachments.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Attachment att = (Attachment) it.next();
                        if ((att instanceof PendingAttachment) && ((PendingAttachment) att).getUploadId() == id) {
                            View v = AttachmentsEditorView.this.findViewWithTag(att);
                            if (v == null) {
                                v = AttachmentsEditorView.this.content.getChildAt(i);
                            }
                            if (v == null) {
                                i++;
                            } else {
                                ProgressBar pb = (ProgressBar) v.findViewById(R.id.attach_progress);
                                if (pb != null) {
                                    pb.setProgress(intent.getIntExtra("done", 0));
                                    pb.setMax(intent.getIntExtra(ArgKeys.TOTAL, 0));
                                    if (APIController.API_DEBUG) {
                                        Log.i("vk", "Upload " + id + " progress: " + intent.getIntExtra("done", 0) + CameraUtilsEffects.FILE_DELIM + intent.getIntExtra(ArgKeys.TOTAL, 0));
                                    }
                                }
                            }
                        } else {
                            i++;
                        }
                    }
                }
                if (Upload.ACTION_UPLOAD_DONE.equals(intent.getAction())) {
                    int id2 = intent.getIntExtra("id", 0);
                    int i2 = 0;
                    Iterator it2 = AttachmentsEditorView.this.attachments.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            break;
                        }
                        Attachment att2 = (Attachment) it2.next();
                        if ((att2 instanceof PendingAttachment) && ((PendingAttachment) att2).getUploadId() == id2) {
                            View v2 = AttachmentsEditorView.this.findViewWithTag(att2);
                            if (v2 == null) {
                                v2 = AttachmentsEditorView.this.content.getChildAt(i2);
                            }
                            if (v2 == null) {
                                i2++;
                            } else if (v2.findViewById(R.id.attach_progress) != null) {
                                Drawable pd = ((ProgressBar) v2.findViewById(R.id.attach_progress)).getProgressDrawable();
                                if (pd instanceof CircularProgressDrawable) {
                                    ((CircularProgressDrawable) pd).playDoneAnimation();
                                    final View vv = v2;
                                    AttachmentsEditorView.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.1.1
                                        {
                                            AnonymousClass1.this = this;
                                        }

                                        @Override // java.lang.Runnable
                                        public void run() {
                                            ViewUtils.setVisibilityAnimated(vv.findViewById(R.id.attach_progress), 8);
                                        }
                                    }, 650L);
                                } else {
                                    ViewUtils.setVisibilityAnimated(v2.findViewById(R.id.attach_progress), 8);
                                }
                                Parcelable o = intent.getParcelableExtra("result");
                                Attachment na = null;
                                if (o instanceof Attachment) {
                                    na = (Attachment) o;
                                } else if (o instanceof MusicTrack) {
                                    na = new AudioAttachment((MusicTrack) o);
                                } else if (o instanceof VideoFile) {
                                    na = new VideoAttachment((VideoFile) o);
                                }
                                v2.setTag(na);
                                AttachmentsEditorView.this.attachments.set(i2, na);
                                if (APIController.API_DEBUG) {
                                    Log.i("vk", "Upload " + id2 + " done: " + intent.getParcelableExtra("result"));
                                }
                            }
                        } else {
                            i2++;
                        }
                    }
                    if (!AttachmentsEditorView.this.isUploading() && AttachmentsEditorView.this.callback != null) {
                        AttachmentsEditorView.this.callback.onAllUploadsDone();
                    }
                }
                if (Upload.ACTION_UPLOAD_FAILED.equals(intent.getAction())) {
                    int id3 = intent.getIntExtra("id", 0);
                    int i3 = 0;
                    Iterator it3 = AttachmentsEditorView.this.attachments.iterator();
                    while (it3.hasNext()) {
                        Attachment att3 = (Attachment) it3.next();
                        if ((att3 instanceof PendingAttachment) && ((PendingAttachment) att3).getUploadId() == id3) {
                            if (AttachmentsEditorView.this.callback != null) {
                                AttachmentsEditorView.this.callback.onUploadFailed();
                            }
                            View v3 = AttachmentsEditorView.this.findViewWithTag(att3);
                            if (v3 == null) {
                                v3 = AttachmentsEditorView.this.content.getChildAt(i3);
                            }
                            if (v3 != null && v3.findViewById(R.id.attach_progress) != null) {
                                ViewUtils.setVisibilityAnimated(v3.findViewById(R.id.attach_progress), 8);
                                ViewUtils.setVisibilityAnimated(v3.findViewById(R.id.attach_error), 0);
                                return;
                            }
                        } else {
                            i3++;
                        }
                    }
                }
            }
        };
        this.uploadOwnerId = 0;
        this.isWallPhoto = false;
        this.initTime = System.currentTimeMillis();
        init();
    }

    public AttachmentsEditorView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.attachments = new ArrayList<>();
        this.forbidAttachmentsEdit = false;
        this.removeClickListener = AttachmentsEditorView$$Lambda$3.lambdaFactory$(this);
        this.retryClickListener = AttachmentsEditorView$$Lambda$4.lambdaFactory$(this);
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.1
            {
                AttachmentsEditorView.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                if (APIController.API_DEBUG) {
                    Log.i("vk", "upload state " + intent.getAction() + ", id=" + intent.getIntExtra("id", -1));
                }
                if (Upload.ACTION_UPLOAD_PROGRESS.equals(intent.getAction())) {
                    int id = intent.getIntExtra("id", 0);
                    int i = 0;
                    Iterator it = AttachmentsEditorView.this.attachments.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Attachment att = (Attachment) it.next();
                        if ((att instanceof PendingAttachment) && ((PendingAttachment) att).getUploadId() == id) {
                            View v = AttachmentsEditorView.this.findViewWithTag(att);
                            if (v == null) {
                                v = AttachmentsEditorView.this.content.getChildAt(i);
                            }
                            if (v == null) {
                                i++;
                            } else {
                                ProgressBar pb = (ProgressBar) v.findViewById(R.id.attach_progress);
                                if (pb != null) {
                                    pb.setProgress(intent.getIntExtra("done", 0));
                                    pb.setMax(intent.getIntExtra(ArgKeys.TOTAL, 0));
                                    if (APIController.API_DEBUG) {
                                        Log.i("vk", "Upload " + id + " progress: " + intent.getIntExtra("done", 0) + CameraUtilsEffects.FILE_DELIM + intent.getIntExtra(ArgKeys.TOTAL, 0));
                                    }
                                }
                            }
                        } else {
                            i++;
                        }
                    }
                }
                if (Upload.ACTION_UPLOAD_DONE.equals(intent.getAction())) {
                    int id2 = intent.getIntExtra("id", 0);
                    int i2 = 0;
                    Iterator it2 = AttachmentsEditorView.this.attachments.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            break;
                        }
                        Attachment att2 = (Attachment) it2.next();
                        if ((att2 instanceof PendingAttachment) && ((PendingAttachment) att2).getUploadId() == id2) {
                            View v2 = AttachmentsEditorView.this.findViewWithTag(att2);
                            if (v2 == null) {
                                v2 = AttachmentsEditorView.this.content.getChildAt(i2);
                            }
                            if (v2 == null) {
                                i2++;
                            } else if (v2.findViewById(R.id.attach_progress) != null) {
                                Drawable pd = ((ProgressBar) v2.findViewById(R.id.attach_progress)).getProgressDrawable();
                                if (pd instanceof CircularProgressDrawable) {
                                    ((CircularProgressDrawable) pd).playDoneAnimation();
                                    final View vv = v2;
                                    AttachmentsEditorView.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.1.1
                                        {
                                            AnonymousClass1.this = this;
                                        }

                                        @Override // java.lang.Runnable
                                        public void run() {
                                            ViewUtils.setVisibilityAnimated(vv.findViewById(R.id.attach_progress), 8);
                                        }
                                    }, 650L);
                                } else {
                                    ViewUtils.setVisibilityAnimated(v2.findViewById(R.id.attach_progress), 8);
                                }
                                Parcelable o = intent.getParcelableExtra("result");
                                Attachment na = null;
                                if (o instanceof Attachment) {
                                    na = (Attachment) o;
                                } else if (o instanceof MusicTrack) {
                                    na = new AudioAttachment((MusicTrack) o);
                                } else if (o instanceof VideoFile) {
                                    na = new VideoAttachment((VideoFile) o);
                                }
                                v2.setTag(na);
                                AttachmentsEditorView.this.attachments.set(i2, na);
                                if (APIController.API_DEBUG) {
                                    Log.i("vk", "Upload " + id2 + " done: " + intent.getParcelableExtra("result"));
                                }
                            }
                        } else {
                            i2++;
                        }
                    }
                    if (!AttachmentsEditorView.this.isUploading() && AttachmentsEditorView.this.callback != null) {
                        AttachmentsEditorView.this.callback.onAllUploadsDone();
                    }
                }
                if (Upload.ACTION_UPLOAD_FAILED.equals(intent.getAction())) {
                    int id3 = intent.getIntExtra("id", 0);
                    int i3 = 0;
                    Iterator it3 = AttachmentsEditorView.this.attachments.iterator();
                    while (it3.hasNext()) {
                        Attachment att3 = (Attachment) it3.next();
                        if ((att3 instanceof PendingAttachment) && ((PendingAttachment) att3).getUploadId() == id3) {
                            if (AttachmentsEditorView.this.callback != null) {
                                AttachmentsEditorView.this.callback.onUploadFailed();
                            }
                            View v3 = AttachmentsEditorView.this.findViewWithTag(att3);
                            if (v3 == null) {
                                v3 = AttachmentsEditorView.this.content.getChildAt(i3);
                            }
                            if (v3 != null && v3.findViewById(R.id.attach_progress) != null) {
                                ViewUtils.setVisibilityAnimated(v3.findViewById(R.id.attach_progress), 8);
                                ViewUtils.setVisibilityAnimated(v3.findViewById(R.id.attach_error), 0);
                                return;
                            }
                        } else {
                            i3++;
                        }
                    }
                }
            }
        };
        this.uploadOwnerId = 0;
        this.isWallPhoto = false;
        this.initTime = System.currentTimeMillis();
        init();
    }

    public AttachmentsEditorView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.attachments = new ArrayList<>();
        this.forbidAttachmentsEdit = false;
        this.removeClickListener = AttachmentsEditorView$$Lambda$5.lambdaFactory$(this);
        this.retryClickListener = AttachmentsEditorView$$Lambda$6.lambdaFactory$(this);
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.1
            {
                AttachmentsEditorView.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                if (APIController.API_DEBUG) {
                    Log.i("vk", "upload state " + intent.getAction() + ", id=" + intent.getIntExtra("id", -1));
                }
                if (Upload.ACTION_UPLOAD_PROGRESS.equals(intent.getAction())) {
                    int id = intent.getIntExtra("id", 0);
                    int i = 0;
                    Iterator it = AttachmentsEditorView.this.attachments.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Attachment att = (Attachment) it.next();
                        if ((att instanceof PendingAttachment) && ((PendingAttachment) att).getUploadId() == id) {
                            View v = AttachmentsEditorView.this.findViewWithTag(att);
                            if (v == null) {
                                v = AttachmentsEditorView.this.content.getChildAt(i);
                            }
                            if (v == null) {
                                i++;
                            } else {
                                ProgressBar pb = (ProgressBar) v.findViewById(R.id.attach_progress);
                                if (pb != null) {
                                    pb.setProgress(intent.getIntExtra("done", 0));
                                    pb.setMax(intent.getIntExtra(ArgKeys.TOTAL, 0));
                                    if (APIController.API_DEBUG) {
                                        Log.i("vk", "Upload " + id + " progress: " + intent.getIntExtra("done", 0) + CameraUtilsEffects.FILE_DELIM + intent.getIntExtra(ArgKeys.TOTAL, 0));
                                    }
                                }
                            }
                        } else {
                            i++;
                        }
                    }
                }
                if (Upload.ACTION_UPLOAD_DONE.equals(intent.getAction())) {
                    int id2 = intent.getIntExtra("id", 0);
                    int i2 = 0;
                    Iterator it2 = AttachmentsEditorView.this.attachments.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            break;
                        }
                        Attachment att2 = (Attachment) it2.next();
                        if ((att2 instanceof PendingAttachment) && ((PendingAttachment) att2).getUploadId() == id2) {
                            View v2 = AttachmentsEditorView.this.findViewWithTag(att2);
                            if (v2 == null) {
                                v2 = AttachmentsEditorView.this.content.getChildAt(i2);
                            }
                            if (v2 == null) {
                                i2++;
                            } else if (v2.findViewById(R.id.attach_progress) != null) {
                                Drawable pd = ((ProgressBar) v2.findViewById(R.id.attach_progress)).getProgressDrawable();
                                if (pd instanceof CircularProgressDrawable) {
                                    ((CircularProgressDrawable) pd).playDoneAnimation();
                                    final View vv = v2;
                                    AttachmentsEditorView.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.1.1
                                        {
                                            AnonymousClass1.this = this;
                                        }

                                        @Override // java.lang.Runnable
                                        public void run() {
                                            ViewUtils.setVisibilityAnimated(vv.findViewById(R.id.attach_progress), 8);
                                        }
                                    }, 650L);
                                } else {
                                    ViewUtils.setVisibilityAnimated(v2.findViewById(R.id.attach_progress), 8);
                                }
                                Parcelable o = intent.getParcelableExtra("result");
                                Attachment na = null;
                                if (o instanceof Attachment) {
                                    na = (Attachment) o;
                                } else if (o instanceof MusicTrack) {
                                    na = new AudioAttachment((MusicTrack) o);
                                } else if (o instanceof VideoFile) {
                                    na = new VideoAttachment((VideoFile) o);
                                }
                                v2.setTag(na);
                                AttachmentsEditorView.this.attachments.set(i2, na);
                                if (APIController.API_DEBUG) {
                                    Log.i("vk", "Upload " + id2 + " done: " + intent.getParcelableExtra("result"));
                                }
                            }
                        } else {
                            i2++;
                        }
                    }
                    if (!AttachmentsEditorView.this.isUploading() && AttachmentsEditorView.this.callback != null) {
                        AttachmentsEditorView.this.callback.onAllUploadsDone();
                    }
                }
                if (Upload.ACTION_UPLOAD_FAILED.equals(intent.getAction())) {
                    int id3 = intent.getIntExtra("id", 0);
                    int i3 = 0;
                    Iterator it3 = AttachmentsEditorView.this.attachments.iterator();
                    while (it3.hasNext()) {
                        Attachment att3 = (Attachment) it3.next();
                        if ((att3 instanceof PendingAttachment) && ((PendingAttachment) att3).getUploadId() == id3) {
                            if (AttachmentsEditorView.this.callback != null) {
                                AttachmentsEditorView.this.callback.onUploadFailed();
                            }
                            View v3 = AttachmentsEditorView.this.findViewWithTag(att3);
                            if (v3 == null) {
                                v3 = AttachmentsEditorView.this.content.getChildAt(i3);
                            }
                            if (v3 != null && v3.findViewById(R.id.attach_progress) != null) {
                                ViewUtils.setVisibilityAnimated(v3.findViewById(R.id.attach_progress), 8);
                                ViewUtils.setVisibilityAnimated(v3.findViewById(R.id.attach_error), 0);
                                return;
                            }
                        } else {
                            i3++;
                        }
                    }
                }
            }
        };
        this.uploadOwnerId = 0;
        this.isWallPhoto = false;
        this.initTime = System.currentTimeMillis();
        init();
    }

    private void init() {
        this.content = new LinearLayout(getContext()) { // from class: com.vkontakte.android.ui.AttachmentsEditorView.2
            {
                AttachmentsEditorView.this = this;
            }

            @Override // android.view.ViewGroup, android.view.View
            public void onAttachedToWindow() {
                super.onAttachedToWindow();
                setChildrenDrawingOrderEnabled(true);
            }

            @Override // android.view.ViewGroup
            protected int getChildDrawingOrder(int count, int i) {
                if (AttachmentsEditorView.this.dragView != null && i >= AttachmentsEditorView.this.dragPos) {
                    if (i == count - 1) {
                        return AttachmentsEditorView.this.dragPos;
                    }
                    return i + 1;
                }
                return i;
            }
        };
        this.content.setOrientation(0);
        this.content.setGravity(16);
        if (Build.VERSION.SDK_INT >= 14) {
            LayoutTransition trans = new LayoutTransition();
            this.content.setLayoutTransition(trans);
            resetTransitionAnims();
        }
        addView(this.content);
        setFillViewport(true);
        setHorizontalScrollBarEnabled(false);
    }

    private void resetTransitionAnims() {
        TimeInterpolator timeInterpolator;
        LayoutTransition trans = this.content.getLayoutTransition();
        trans.setAnimateParentHierarchy(false);
        AnimatorSet animAdding = new AnimatorSet();
        animAdding.playTogether(ObjectAnimator.ofFloat((Object) null, "scaleX", 0.1f, 1.0f), ObjectAnimator.ofFloat((Object) null, "scaleY", 0.1f, 1.0f), ObjectAnimator.ofFloat((Object) null, "alpha", 0.0f, 1.0f));
        animAdding.getChildAnimations().get(0).setInterpolator(new OvershootInterpolator());
        animAdding.getChildAnimations().get(1).setInterpolator(new OvershootInterpolator());
        timeInterpolator = AttachmentsEditorView$$Lambda$7.instance;
        animAdding.getChildAnimations().get(2).setInterpolator(timeInterpolator);
        animAdding.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.3
            {
                AttachmentsEditorView.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator anim) {
                View view = (View) ((ObjectAnimator) ((AnimatorSet) anim).getChildAnimations().get(0)).getTarget();
                view.setAlpha(0.0f);
            }
        });
        trans.setAnimator(2, animAdding);
        AnimatorSet animRemoving = new AnimatorSet();
        animRemoving.playTogether(ObjectAnimator.ofFloat((Object) null, "scaleX", 1.0f, 0.1f).setDuration(300L), ObjectAnimator.ofFloat((Object) null, "scaleY", 1.0f, 0.1f).setDuration(300L), ObjectAnimator.ofFloat((Object) null, "rotation", 90.0f).setDuration(300L), ObjectAnimator.ofFloat((Object) null, "alpha", 0.0f).setDuration(300L));
        animRemoving.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.4
            {
                AttachmentsEditorView.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator anim) {
                View view = (View) ((ObjectAnimator) ((AnimatorSet) anim).getChildAnimations().get(0)).getTarget();
                view.setScaleX(1.0f);
                view.setScaleY(1.0f);
            }
        });
        trans.setAnimator(3, animRemoving);
        trans.setStartDelay(1, 150L);
        trans.setStartDelay(0, 0L);
        trans.setStartDelay(2, 500L);
        trans.setStartDelay(3, 0L);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        IntentFilter filter = new IntentFilter();
        filter.addAction(Upload.ACTION_UPLOAD_PROGRESS);
        filter.addAction(Upload.ACTION_UPLOAD_STARTED);
        filter.addAction(Upload.ACTION_UPLOAD_DONE);
        filter.addAction(Upload.ACTION_UPLOAD_FAILED);
        getContext().registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        try {
            getContext().unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    public void setCallback(Callback c) {
        this.callback = c;
    }

    public void addHidden(Attachment att) {
        Log.i("vk", "Attach editor add hidden");
        this.attachments.add(att);
    }

    public void add(Attachment att) {
        Log.i("vk", "Attach editor add");
        int idx = this.attachments.size();
        if (this.attachments.size() > 0) {
            int photos = 0;
            int albums = 0;
            int videos = 0;
            int audios = 0;
            int polls = 0;
            int docs = 0;
            int others = 0;
            int fwds = 0;
            Iterator<Attachment> it = this.attachments.iterator();
            while (it.hasNext()) {
                Attachment a = it.next();
                if (a instanceof AlbumAttachment) {
                    albums++;
                } else if ((a instanceof PhotoAttachment) || (a instanceof PendingPhotoAttachment)) {
                    photos++;
                } else if (a instanceof VideoAttachment) {
                    videos++;
                } else if (a instanceof AudioAttachment) {
                    audios++;
                } else if (a instanceof PollAttachment) {
                    polls++;
                } else if (a instanceof DocumentAttachment) {
                    docs++;
                } else if (a instanceof FwdMessagesAttachment) {
                    fwds++;
                } else {
                    others++;
                }
            }
            if (att instanceof AlbumAttachment) {
                idx = photos + albums;
            } else if ((att instanceof PhotoAttachment) || (att instanceof PendingPhotoAttachment)) {
                idx = photos;
            } else if (att instanceof VideoAttachment) {
                idx = photos + albums + videos;
            } else if (att instanceof AudioAttachment) {
                idx = photos + albums + videos + audios;
            } else if (att instanceof PollAttachment) {
                idx = photos + albums + videos + audios + polls;
            } else if (att instanceof DocumentAttachment) {
                idx = photos + albums + videos + audios + polls + docs;
            } else {
                idx = photos + albums + videos + audios + polls + docs + others;
            }
            if (att instanceof GeoAttachment) {
                idx = this.attachments.size() - fwds;
            }
        }
        this.attachments.add(idx, att);
        if (att instanceof PhotoAttachment) {
            addAttachView(createPhotoView((PhotoAttachment) att), att, idx);
        } else if (att instanceof PendingPhotoAttachment) {
            addAttachView(createPhotoView((PendingPhotoAttachment) att), att, idx);
            uploadAttachment((PendingPhotoAttachment) att);
        } else if (att instanceof AudioAttachment) {
            AudioAttachment a2 = (AudioAttachment) att;
            if (att instanceof PendingAudioAttachment) {
                addAttachView(createImagelessView(R.drawable.ic_attach_audio, a2.musicTrack.artist, a2.musicTrack.title, true), att, idx);
                uploadAttachment((PendingAudioAttachment) att);
                return;
            }
            addAttachView(createImagelessView(R.drawable.ic_attach_audio, a2.musicTrack.artist, a2.musicTrack.title, false), att, idx);
        } else if (att instanceof VideoAttachment) {
            addAttachView(createVideoView((VideoAttachment) att), att, idx);
            if (att instanceof PendingVideoAttachment) {
                uploadAttachment((PendingVideoAttachment) att);
            }
        } else if (att instanceof MarketAttachment) {
            addAttachView(createMarketView((MarketAttachment) att), att, idx);
        } else if (att instanceof DocumentAttachment) {
            DocumentAttachment a3 = (DocumentAttachment) att;
            String[] sp = a3.title.split("\\.");
            if (att instanceof PendingDocumentAttachment) {
                uploadAttachment((PendingDocumentAttachment) att);
            }
            if (a3.thumb != null && a3.thumb.length() > 0) {
                if (a3 instanceof PendingDocumentAttachment) {
                    addAttachView(createPendingDocumentView(a3, sp[sp.length - 1].toUpperCase() + ", " + Global.langFileSize(a3.size, getResources())), att, idx);
                    return;
                } else {
                    addAttachView(createDocumentView(a3, sp[sp.length - 1].toUpperCase() + ", " + Global.langFileSize(a3.size, getResources())), att, idx);
                    return;
                }
            }
            addAttachView(createImagelessView(R.drawable.ic_attach_document, a3.title, sp[sp.length - 1].toUpperCase() + ", " + Global.langFileSize(a3.size, getResources()), att instanceof PendingDocumentAttachment), att, idx);
        } else if (att instanceof GeoAttachment) {
            addAttachView(createLocationView((GeoAttachment) att), att, idx);
        } else if (att instanceof FwdMessagesAttachment) {
            addAttachView(createFwdView(((FwdMessagesAttachment) att).msgs.size()), att, idx);
        } else if (att instanceof PostAttachment) {
            NewsEntry post = ((PostAttachment) att).post;
            addAttachView(createImagelessView(R.drawable.ic_attach_post, post.displayablePreviewText.toString(), "", false), att, idx);
        } else if (att instanceof LinkAttachment) {
            LinkAttachment la = (LinkAttachment) att;
            addAttachView(createImagelessView(R.drawable.ic_attach_link, la.url.replace("http://", "").replace("https://", ""), la.title, false), att, idx);
        } else if (att instanceof PollAttachment) {
            final PollAttachment la2 = (PollAttachment) att;
            View av = createImagelessView(R.drawable.ic_attach_poll, la2.question, "", false);
            av.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.5
                {
                    AttachmentsEditorView.this = this;
                }

                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    PollEditorFragment.edit(la2).forResult(Utils.castToActivity(AttachmentsEditorView.this.getContext()), 9);
                }
            });
            addAttachView(av, att, idx);
        } else {
            Log.e("vk", "Unknown attachment: " + att);
        }
    }

    public boolean contains(Attachment a) {
        return this.attachments.contains(a);
    }

    public void remove(Attachment a) {
        int index = -1;
        int i = 0;
        while (true) {
            if (i >= this.attachments.size()) {
                break;
            } else if (this.attachments.get(i) != a) {
                i++;
            } else {
                index = i;
                break;
            }
        }
        if (index != -1) {
            remove(index);
        }
    }

    public int getCount() {
        int size = 0;
        Iterator<Attachment> it = this.attachments.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if (!(att instanceof GeoAttachment) && !(att instanceof FwdMessagesAttachment)) {
                size++;
            }
        }
        return size;
    }

    public int getRealCount() {
        return this.attachments.size();
    }

    public void clear() {
        this.content.removeAllViews();
        this.attachments.clear();
        if (this.callback != null) {
            this.callback.onAttachmentRemoved(null);
        }
    }

    public boolean isUploading() {
        Iterator<Attachment> it = this.attachments.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if (att instanceof PendingAttachment) {
                return true;
            }
        }
        return false;
    }

    public ArrayList<Attachment> getAll() {
        ArrayList<Attachment> att = new ArrayList<>();
        att.addAll(this.attachments);
        return att;
    }

    public void remove(int index) {
        Attachment att = this.attachments.remove(index);
        this.content.removeViewAt(index);
        if (this.callback != null) {
            this.callback.onAttachmentRemoved(att);
        }
        if (att instanceof PendingAttachment) {
            Upload.cancel(((PendingAttachment) att).getUploadId());
        }
    }

    public void removeWithoutCallback(int index) {
        try {
            this.content.removeViewAt(index);
            this.attachments.remove(index);
        } catch (Exception e) {
        }
    }

    public boolean containsGeoAttachment() {
        Iterator<Attachment> it = this.attachments.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if (att instanceof GeoAttachment) {
                return true;
            }
        }
        return false;
    }

    private void addAttachView(final View view, Attachment att, final int index) {
        view.setTag(att);
        if (this.forbidAttachmentsEdit) {
            View removeView = view.findViewById(R.id.attach_remove);
            removeView.setVisibility(8);
        }
        getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.6
            {
                AttachmentsEditorView.this = this;
            }

            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                AttachmentsEditorView.this.getViewTreeObserver().removeOnPreDrawListener(this);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(Global.scale(96.0f), Global.scale(72.0f));
                lp.rightMargin = Global.scale(8.0f);
                AttachmentsEditorView.this.content.addView(view, Math.min(index, AttachmentsEditorView.this.content.getChildCount()), lp);
                return true;
            }
        });
        if (System.currentTimeMillis() - this.initTime > 500 && (Math.floor(getScrollX() / 80.0f) > index || Math.ceil((getScrollX() + getWidth()) / 80.0f) < index)) {
            postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.7
                {
                    AttachmentsEditorView.this = this;
                }

                @Override // java.lang.Runnable
                public void run() {
                    AttachmentsEditorView.this.smoothScrollTo((index + 1) * Global.scale(80.0f), 0);
                }
            }, 150L);
        }
        if (Build.VERSION.SDK_INT >= 14) {
            view.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.8
                {
                    AttachmentsEditorView.this = this;
                }

                @Override // android.view.View.OnLongClickListener
                public boolean onLongClick(View v) {
                    AttachmentsEditorView.this.dragStartX = AttachmentsEditorView.this.lastTouchX;
                    AttachmentsEditorView.this.dragStartY = AttachmentsEditorView.this.lastTouchY;
                    AttachmentsEditorView.this.dragPos = 0;
                    int i = 0;
                    while (true) {
                        if (i >= AttachmentsEditorView.this.content.getChildCount()) {
                            break;
                        } else if (AttachmentsEditorView.this.content.getChildAt(i) == v) {
                            AttachmentsEditorView.this.dragPos = i;
                            break;
                        } else {
                            i++;
                        }
                    }
                    AttachmentsEditorView.this.dragView = v;
                    AttachmentsEditorView.this.content.getLayoutTransition().setAnimator(2, null);
                    AttachmentsEditorView.this.content.getLayoutTransition().setAnimator(3, null);
                    AttachmentsEditorView.this.content.getLayoutTransition().setStartDelay(1, 0L);
                    AttachmentsEditorView.this.content.getLayoutTransition().setStartDelay(0, 0L);
                    AttachmentsEditorView.this.content.getLayoutTransition().setStartDelay(2, 0L);
                    AttachmentsEditorView.this.content.getLayoutTransition().setStartDelay(3, 0L);
                    AttachmentsEditorView.this.content.invalidate();
                    v.animate().scaleX(1.1f).scaleY(1.1f).setDuration(200L).start();
                    return true;
                }
            });
        }
    }

    private View createImagelessView(@DrawableRes int icon, String title, String subtitle, boolean progress) {
        View v = inflate(getContext(), progress ? R.layout.attach_edit_imageless_progress : R.layout.attach_edit_imageless, null);
        ((android.widget.TextView) v.findViewById(R.id.attach_title)).setText(title);
        ((android.widget.TextView) v.findViewById(R.id.attach_subtitle)).setText(subtitle);
        ((ImageView) v.findViewById(R.id.attach_icon)).setImageResource(icon);
        if (progress) {
            ((ProgressBar) v.findViewById(R.id.attach_progress)).setProgressDrawable(new CircularProgressDrawable(true));
            ((ProgressBar) v.findViewById(R.id.attach_progress)).setIndeterminateDrawable(new CircularProgressDrawable(true));
            ((ProgressBar) v.findViewById(R.id.attach_progress)).setIndeterminate(false);
            v.findViewById(R.id.attach_error).setOnClickListener(this.retryClickListener);
        }
        v.findViewById(R.id.attach_remove).setOnClickListener(this.removeClickListener);
        return v;
    }

    private View createFwdView(int count) {
        View v = inflate(getContext(), R.layout.attach_edit_fwd_message, null);
        ((android.widget.TextView) v.findViewById(R.id.attach_title)).setText(getResources().getQuantityString(R.plurals.messages, count, Integer.valueOf(count)));
        ((android.widget.TextView) v.findViewById(R.id.attach_type)).setText(count + "");
        v.findViewById(R.id.attach_remove).setOnClickListener(this.removeClickListener);
        return v;
    }

    private View createVideoView(VideoAttachment att) {
        View v = inflate(getContext(), R.layout.attach_edit_video, null);
        ((android.widget.TextView) v.findViewById(R.id.attach_video_duration)).setText(String.format("%d:%02d", Integer.valueOf(att.video.duration / 60), Integer.valueOf(att.video.duration % 60)));
        VKImageView imageView = (VKImageView) v.findViewById(R.id.attach_thumb);
        imageView.load(att.video.urlBigThumb, ImageSize.VERY_SMALL);
        v.findViewById(R.id.attach_remove).setOnClickListener(this.removeClickListener);
        if (att instanceof PendingVideoAttachment) {
            ((ProgressBar) v.findViewById(R.id.attach_progress)).setProgressDrawable(new CircularProgressDrawable(true));
            ((ProgressBar) v.findViewById(R.id.attach_progress)).setIndeterminateDrawable(new CircularProgressDrawable(true));
            ((ProgressBar) v.findViewById(R.id.attach_progress)).setIndeterminate(false);
            v.findViewById(R.id.attach_progress).setVisibility(0);
            v.findViewById(R.id.attach_error).setOnClickListener(this.retryClickListener);
        }
        return v;
    }

    private String getRealPathFromURI(Uri contentUri) {
        if (contentUri.getScheme().equals(UriUtil.LOCAL_FILE_SCHEME)) {
            return contentUri.getPath();
        }
        String[] proj = {"_data"};
        Cursor cursor = getContext().getContentResolver().query(contentUri, proj, null, null, null);
        int column_index = cursor.getColumnIndexOrThrow("_data");
        cursor.moveToFirst();
        return cursor.getString(column_index);
    }

    private View createPhotoView(PendingPhotoAttachment att) {
        return createLocalImageView(att.fileUri, R.layout.attach_edit_photo);
    }

    private View createPendingDocumentView(DocumentAttachment att, String title) {
        View v = createLocalImageView(att.thumb, R.layout.attach_edit_doc_thumb);
        ((android.widget.TextView) v.findViewById(R.id.attach_title)).setText(title);
        return v;
    }

    private View createMarketView(MarketAttachment att) {
        View v = inflate(getContext(), R.layout.attach_edit_market_thumb, null);
        ((android.widget.TextView) v.findViewById(R.id.attach_title)).setText(att.good.title);
        ((android.widget.TextView) v.findViewById(R.id.attach_text)).setText(att.good.price_text);
        v.findViewById(R.id.attach_remove).setOnClickListener(this.removeClickListener);
        v.findViewById(R.id.attach_remove).setVisibility(att.canEdit ? 0 : 8);
        ((VKImageView) v.findViewById(R.id.attach_thumb)).load(att.good.thumb_photo, ImageSize.VERY_SMALL);
        return v;
    }

    private View createLocalImageView(String fileUri, int layout) {
        View v = inflate(getContext(), layout, null);
        ((ProgressBar) v.findViewById(R.id.attach_progress)).setProgressDrawable(new CircularProgressDrawable(true));
        ((ProgressBar) v.findViewById(R.id.attach_progress)).setIndeterminateDrawable(new CircularProgressDrawable(true));
        ((ProgressBar) v.findViewById(R.id.attach_progress)).setIndeterminate(false);
        ((VKImageView) v.findViewById(R.id.attach_thumb)).load(Uri.parse(fileUri), ImageSize.VERY_SMALL);
        v.findViewById(R.id.attach_remove).setOnClickListener(this.removeClickListener);
        v.findViewById(R.id.attach_error).setOnClickListener(this.retryClickListener);
        return v;
    }

    private View createPhotoView(PhotoAttachment att) {
        View v = inflate(getContext(), R.layout.attach_edit_photo, null);
        v.findViewById(R.id.attach_progress).setVisibility(8);
        ((VKImageView) v.findViewById(R.id.attach_thumb)).load(att.getImageURL(), ImageSize.VERY_SMALL);
        v.findViewById(R.id.attach_remove).setOnClickListener(this.removeClickListener);
        return v;
    }

    private View createDocumentView(DocumentAttachment att, String title) {
        View v = inflate(getContext(), R.layout.attach_edit_doc_thumb, null);
        v.findViewById(R.id.attach_progress).setVisibility(8);
        ((android.widget.TextView) v.findViewById(R.id.attach_title)).setText(title);
        ((VKImageView) v.findViewById(R.id.attach_thumb)).load(att.thumb, ImageSize.VERY_SMALL);
        v.findViewById(R.id.attach_remove).setOnClickListener(this.removeClickListener);
        return v;
    }

    private View createLocationView(GeoAttachment att) {
        View v = inflate(getContext(), R.layout.attach_edit_photo, null);
        v.findViewById(R.id.attach_progress).setVisibility(8);
        ((VKImageView) v.findViewById(R.id.attach_thumb)).setPostprocessor(new AttachMapPinTransform(Global.scale(96.0f), Global.scale(72.0f), ContextCompat.getDrawable(getContext(), R.drawable.ic_map_pin_small)));
        ((VKImageView) v.findViewById(R.id.attach_thumb)).load(Global.getStaticMapURL(att.lat, att.lon, 96, 72, 14), ImageSize.VERY_SMALL);
        v.findViewById(R.id.attach_remove).setOnClickListener(this.removeClickListener);
        return v;
    }

    private void uploadAttachment(final PendingAttachment attachment) {
        postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.AttachmentsEditorView.9
            {
                AttachmentsEditorView.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (attachment instanceof PendingPhotoAttachment) {
                    PendingPhotoAttachment photoAttachment = (PendingPhotoAttachment) attachment;
                    photoAttachment.setWallPhoto(AttachmentsEditorView.this.isWallPhoto);
                    photoAttachment.setOwnerId(AttachmentsEditorView.this.uploadOwnerId);
                }
                Context context = AttachmentsEditorView.this.getContext();
                Upload.start(context, attachment.mo901createUploadTask(context));
            }
        }, 300L);
    }

    private void retryUploadVideo(PendingVideoAttachment att) {
        postDelayed(AttachmentsEditorView$$Lambda$8.lambdaFactory$(this, att), 300L);
    }

    public /* synthetic */ void lambda$retryUploadVideo$3(PendingVideoAttachment att) {
        Upload.retry(getContext(), att.getId());
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent ev) {
        this.lastTouchX = ev.getX();
        this.lastTouchY = ev.getY();
        if (this.dragView != null) {
            if (ev.getAction() == 2) {
                updateDragPosition();
                return true;
            } else if (ev.getAction() != 1 && ev.getAction() != 3) {
                return true;
            } else {
                resetTransitionAnims();
                this.dragView.animate().scaleX(1.0f).scaleY(1.0f).translationX(0.0f).translationY(0.0f).setDuration(200L).start();
                this.dragView = null;
                return true;
            }
        }
        return super.dispatchTouchEvent(ev);
    }

    public void updateDragPosition() {
        this.dragView.setTranslationX(this.lastTouchX - this.dragStartX);
        this.dragView.setTranslationY(this.lastTouchY - this.dragStartY);
        float dpos = (this.dragView.getLeft() + this.dragView.getTranslationX()) / this.dragView.getWidth();
        int rdpos = Math.round(dpos);
        if (rdpos != this.dragPos && rdpos >= 0 && rdpos < this.content.getChildCount() && canReorder(this.attachments.get(this.dragPos), this.attachments.get(rdpos))) {
            this.content.removeView(this.dragView);
            this.content.addView(this.dragView, rdpos);
            Attachment a = this.attachments.get(this.dragPos);
            Attachment b = this.attachments.get(rdpos);
            this.attachments.set(rdpos, a);
            this.attachments.set(this.dragPos, b);
            this.dragView.setTranslationX(this.dragView.getTranslationX() - ((rdpos - this.dragPos) * this.dragView.getWidth()));
            this.dragStartX += (rdpos - this.dragPos) * this.dragView.getWidth();
            this.dragPos = rdpos;
        }
        if (((this.dragView.getLeft() + this.dragView.getTranslationX()) + ((this.dragView.getWidth() / 3) * 2)) - getScrollX() > getWidth()) {
            if (this.scrollRunner == null) {
                this.scrollRunner = new ScrollRunner(1);
                post(this.scrollRunner);
            }
        } else if (((this.dragView.getLeft() + this.dragView.getTranslationX()) + (this.dragView.getWidth() / 3)) - getScrollX() < 0.0f) {
            if (this.scrollRunner == null) {
                this.scrollRunner = new ScrollRunner(-1);
                post(this.scrollRunner);
            }
        } else if (this.scrollRunner != null) {
            removeCallbacks(this.scrollRunner);
            this.scrollRunner = null;
        }
    }

    private boolean canReorder(Attachment a, Attachment b) {
        boolean z = true;
        if (!(a instanceof FwdMessagesAttachment) && !(a instanceof GeoAttachment)) {
            if (a instanceof AlbumAttachment) {
                return b instanceof AlbumAttachment;
            }
            if ((a instanceof PhotoAttachment) || (a instanceof PendingPhotoAttachment)) {
                return (b instanceof PhotoAttachment) || (b instanceof PendingPhotoAttachment);
            } else if (a instanceof VideoAttachment) {
                return b instanceof VideoAttachment;
            } else {
                if (a instanceof AudioAttachment) {
                    return b instanceof AudioAttachment;
                }
                if (a instanceof PollAttachment) {
                    return b instanceof PollAttachment;
                }
                if (a instanceof DocumentAttachment) {
                    return b instanceof DocumentAttachment;
                }
                if ((b instanceof PhotoAttachment) || (b instanceof VideoAttachment) || (b instanceof AudioAttachment) || (b instanceof PollAttachment) || (b instanceof DocumentAttachment)) {
                    z = false;
                }
                return z;
            }
        }
        return false;
    }

    /* loaded from: classes3.dex */
    public class ScrollRunner implements Runnable {
        int k;

        public ScrollRunner(int _k) {
            AttachmentsEditorView.this = r2;
            this.k = 1;
            this.k = _k;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (AttachmentsEditorView.this.dragView != null) {
                if (AttachmentsEditorView.this.getScrollX() != AttachmentsEditorView.this.content.getWidth() - AttachmentsEditorView.this.getWidth() || this.k <= 0) {
                    if (AttachmentsEditorView.this.getScrollX() != 0 || this.k >= 0) {
                        AttachmentsEditorView.this.scrollBy(Global.scale(this.k * 2), 0);
                        AttachmentsEditorView.this.dragStartX -= Global.scale(this.k * 2);
                        AttachmentsEditorView.this.updateDragPosition();
                        AttachmentsEditorView.this.postDelayed(this, 10L);
                    }
                }
            }
        }
    }
}
