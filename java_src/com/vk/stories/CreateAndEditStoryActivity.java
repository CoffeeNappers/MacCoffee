package com.vk.stories;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.location.Location;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AlertDialog;
import android.text.TextUtils;
import android.util.Log;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import bolts.Task;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.imagepipeline.postprocessors.IterativeBoxBlurPostProcessor;
import com.vk.analytics.Analytics;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.EditorAnalytics;
import com.vk.attachpicker.PhotoVideoAttachActivity;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.drawing.DrawingCanvas;
import com.vk.attachpicker.drawing.DrawingState;
import com.vk.attachpicker.drawing.DrawingView;
import com.vk.attachpicker.mediastore.AlbumEntry;
import com.vk.attachpicker.mediastore.MediaStoreController;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.stickers.BitmapSticker;
import com.vk.attachpicker.stickers.EditorStickerView;
import com.vk.attachpicker.stickers.Sticker;
import com.vk.attachpicker.stickers.StickerStyle;
import com.vk.attachpicker.stickers.StickersDrawingState;
import com.vk.attachpicker.stickers.StickersDrawingView;
import com.vk.attachpicker.stickers.TextSticker;
import com.vk.attachpicker.stickers.TextStickerDialog;
import com.vk.attachpicker.util.BitmapUtils;
import com.vk.attachpicker.util.CameraUtils;
import com.vk.attachpicker.util.LocationUtils;
import com.vk.attachpicker.util.PickerStickers;
import com.vk.attachpicker.util.Prefs;
import com.vk.attachpicker.widget.ColorSelectorView;
import com.vk.attachpicker.widget.LoadingDialog;
import com.vk.attachpicker.widget.RobotoMediumTextView;
import com.vk.attachpicker.widget.TextureVideoView;
import com.vk.attachpicker.widget.WidthSelectorView;
import com.vk.camera.CameraMode;
import com.vk.camera.CameraObject;
import com.vk.camera.CameraPrefs;
import com.vk.camera.Utils;
import com.vk.camera.camera1.Camera1View;
import com.vk.camera.camera1.CameraHolder;
import com.vk.core.network.RxFileDownloader;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.GcTrigger;
import com.vk.core.util.Screen;
import com.vk.core.util.TimeoutLock;
import com.vk.core.util.ToastUtils;
import com.vk.core.widget.OnSwipeTouchListener;
import com.vk.core.widget.OnTouchDownListener;
import com.vk.core.widget.ViewShower;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.VKImageLoader;
import com.vk.imageloader.view.VKImageView;
import com.vk.masks.MaskTabsIndicator;
import com.vk.masks.MasksAnalytics;
import com.vk.masks.MasksContainer;
import com.vk.masks.MasksController;
import com.vk.masks.MasksPagerAdapter;
import com.vk.masks.MasksView;
import com.vk.masks.model.Mask;
import com.vk.masks.model.MaskSection;
import com.vk.media.utils.MediaUtils;
import com.vk.stories.StoriesProcessor;
import com.vk.stories.model.StoryUploadParams;
import com.vk.stories.util.VideoCompressor;
import com.vk.stories.view.BrushSelectorView;
import com.vk.stories.view.ShutterButton;
import com.vk.stories.view.StickerDeleteAreaView;
import com.vk.stories.view.StoriesGestureDetectorCompat;
import com.vk.stories.view.VerticalPagerIndicator;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.masks.MasksGetById;
import com.vkontakte.android.api.masks.MasksHasNew;
import com.vkontakte.android.api.masks.MasksMarkSectionAsViewed;
import com.vkontakte.android.api.masks.MasksResponse;
import com.vkontakte.android.api.photos.PhotosAddEditorRecentSticker;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.WebViewFragment;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.ui.CircularProgressView;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes2.dex */
public class CreateAndEditStoryActivity extends VKActivity implements CameraObject.OnPhotoResultListener, MasksView.OnMaskSelectedListener {
    private static final long HOURS_24 = 86400000;
    public static final String INTENT_OPEN_MASK = "open_mask";
    private static final int INTENT_REQUEST_EXTERNAL_PHOTO = 1;
    private static final int INTENT_REQUEST_SETTINGS = 3;
    private static final int INTENT_REQUEST_SHARE_DEST = 2;
    private static final long MASK_ACTION_HIDE_DELAY = 3000;
    private static final long MASK_AUTHOR_HIDE_DELAY = 2000;
    private static final int MESSAGE_HIDE_MASK_ACTION = 3;
    private static final int MESSAGE_HIDE_MASK_AUTHOR = 1;
    private static final int MESSAGE_HIDE_MASK_PROGRESS = 0;
    private static final int MESSAGE_SHOW_MASK_ACTION = 2;
    private static final long SCREEN_OPEN_DURATION = 350;
    private static final int VOLUME_BUTTON_LONG_CLICK_DURATION = 200;
    private FrameLayout bottomButtonsPanel;
    private View bottomInfoContainer;
    private BrushSelectorView brushMarker;
    private BrushSelectorView brushNeon;
    private BrushSelectorView brushPen;
    private Camera1View camera1View;
    private FrameLayout cameraContainer;
    private View cameraTooltip;
    private ViewShower cameraTooltipShower;
    private Location captureLocation;
    private ImageView closeButton;
    private ColorSelectorView colorSelectorView;
    private boolean controlsEnabled;
    private Disposable currentMaskDownload;
    private Dialog currentProgressDialog;
    private TextStickerDialog currentTextDialog;
    private View drawAction;
    private View drawingApply;
    private FrameLayout drawingBottomPanel;
    private View drawingCancel;
    private FrameLayout drawingNavPanel;
    private View drawingUndoButton;
    private View drawingUndoContainer;
    private DrawingView drawingView;
    private FrameLayout editorActionsPanel;
    private ImageView flashButton;
    private boolean flashVisible;
    private MediaStoreEntry galleryLastEntry;
    private ImageView galleryThumbnail;
    private View galleryThumbnailContainer;
    private Bitmap imageBitmap;
    private VKImageView imageView;
    private boolean isDestroyed;
    private AsyncTask<Void, Void, Location> locationRetrieveAsyncTask;
    private ViewShower maskActionShower;
    private TextView maskActionView;
    private VKImageView maskAuthorImage;
    private TextView maskAuthorName;
    private ViewShower maskAuthorShower;
    private View maskAuthorView;
    private View maskClearButton;
    private View maskProgressContainer;
    private View masksLoadingErrorView;
    private View masksLoadingView;
    private View masksOpenButton;
    private MasksPagerAdapter masksPagerAdapter;
    private LinearLayout masksPanel;
    private MaskTabsIndicator masksPanelHeader;
    private ViewPager masksPanelPager;
    private ViewShower masksPanelShower;
    private CircularProgressView masksProgressBar;
    private ViewShower masksProgressShower;
    private VerticalPagerIndicator masksVerticalPagerIndicator;
    private boolean mirror;
    private boolean mute;
    private ImageView muteButton;
    private RobotoMediumTextView newMasksBadge;
    private View.OnTouchListener onCameraTouchListener;
    private FrameLayout parentView;
    private FrameLayout previewContainer;
    private View saveButton;
    private ImageView settingsButton;
    private ShutterButton shutterButton;
    private ShutterButtonOnTouchListener shutterButtonOnTouchListener;
    private StickerDeleteAreaView stickerDeleteArea;
    private View stickersAction;
    private FrameLayout stickersContainer;
    private StickersDrawingView stickersDrawingView;
    private EditorStickerView stickersView;
    private ImageView switchCamera;
    private View textAction;
    private FrameLayout topButtonsPanel;
    private File videoFile;
    private Bitmap videoPreview;
    private TextureVideoView videoView;
    private ImageView widthSelectorBtn;
    private static final String TAG = CreateAndEditStoryActivity.class.getSimpleName();
    private static final int SMALL_PANEL_HEIGHT = Screen.dp(96);
    private final EditorAnalytics editorStatistics = EditorAnalytics.storiesAnalytics();
    private final MasksAnalytics masksStatistics = MasksAnalytics.masksAnalytics();
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final TimeoutLock buttonClickLock = new TimeoutLock(500);
    private final TimeoutLock cameraActionLock = new TimeoutLock(500);
    private ScreenState screenState = ScreenState.CAMERA;
    private final Runnable showProgressDialogRunnable = new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.1
        @Override // java.lang.Runnable
        public void run() {
            if (CreateAndEditStoryActivity.this.currentProgressDialog != null) {
                CreateAndEditStoryActivity.this.currentProgressDialog.dismiss();
            }
            CreateAndEditStoryActivity.this.currentProgressDialog = LoadingDialog.getInstance(CreateAndEditStoryActivity.this, Integer.valueOf((int) R.string.story_saving));
            CreateAndEditStoryActivity.this.currentProgressDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.1.1
                @Override // android.content.DialogInterface.OnDismissListener
                public void onDismiss(DialogInterface dialog) {
                    CreateAndEditStoryActivity.this.currentProgressDialog = null;
                }
            });
            CreateAndEditStoryActivity.this.currentProgressDialog.show();
        }
    };
    private int volumeButtonLastAction = -1;
    private long volumeButtonLastActionTime = -1;
    private final Runnable onVolumeButtonLongClick = new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.2
        @Override // java.lang.Runnable
        public void run() {
            if (CreateAndEditStoryActivity.this.screenState == ScreenState.CAMERA) {
                CreateAndEditStoryActivity.this.setCameraButtonEnabled(false);
                CreateAndEditStoryActivity.this.cameraActionStartRecording();
            }
        }
    };
    private final Handler maskProgressHandler = new Handler(Looper.getMainLooper()) { // from class: com.vk.stories.CreateAndEditStoryActivity.3
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what == 0) {
                CreateAndEditStoryActivity.this.masksProgressShower.hide(true);
            } else if (msg.what == 1) {
                CreateAndEditStoryActivity.this.maskAuthorShower.hide(true);
            } else if (msg.what == 2) {
                CreateAndEditStoryActivity.this.maskActionShower.show();
            } else if (msg.what == 3) {
                CreateAndEditStoryActivity.this.maskActionShower.hide(true);
            }
        }
    };
    private final MasksContainer masksContainer = new MasksContainer();
    private final Runnable enableResultPreviewBlackBackground = new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.10
        @Override // java.lang.Runnable
        public void run() {
            CreateAndEditStoryActivity.this.previewContainer.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        }
    };
    private final Runnable disableResultPreviewBlackBackground = new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.11
        @Override // java.lang.Runnable
        public void run() {
            CreateAndEditStoryActivity.this.previewContainer.setBackgroundColor(0);
        }
    };
    private final Runnable cameraStartRunnable = new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.77
        @Override // java.lang.Runnable
        public void run() {
            if (!CreateAndEditStoryActivity.this.isDestroyed) {
                CreateAndEditStoryActivity.this.camera1View = new Camera1View(CreateAndEditStoryActivity.this) { // from class: com.vk.stories.CreateAndEditStoryActivity.77.1
                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.vk.camera.camera1.Camera1View, com.vk.camera.BaseCameraView
                    public void onSingleTap(int x, int y) {
                        if (CreateAndEditStoryActivity.this.masksPanelVisible()) {
                            CreateAndEditStoryActivity.this.hideMasksPanel(true);
                        } else {
                            super.onSingleTap(x, y);
                        }
                    }
                };
                CreateAndEditStoryActivity.this.camera1View.setExternalTouchListener(CreateAndEditStoryActivity.this.onCameraTouchListener);
                CreateAndEditStoryActivity.this.camera1View.setOnCameraResultListener(CreateAndEditStoryActivity.this);
                CreateAndEditStoryActivity.this.camera1View.setMaxRecordingLengthMs(StoriesProcessor.MAX_VIDEO_LENGTH);
                CreateAndEditStoryActivity.this.camera1View.setRecordingCallback(new CameraObject.OnRecordingCallback() { // from class: com.vk.stories.CreateAndEditStoryActivity.77.2
                    @Override // com.vk.camera.CameraObject.OnRecordingCallback
                    public void onStart() {
                        CreateAndEditStoryActivity.this.shutterButton.setRedProgress(0.0f);
                    }

                    @Override // com.vk.camera.CameraObject.OnRecordingCallback
                    public void onProgress(long recorded, long max) {
                        float progress = ((float) recorded) / ((float) max);
                        CreateAndEditStoryActivity.this.shutterButton.setRedProgress(progress);
                    }

                    @Override // com.vk.camera.CameraObject.OnRecordingCallback
                    public void onCancel() {
                        CreateAndEditStoryActivity.this.shutterButton.setRedProgress(0.0f);
                        CreateAndEditStoryActivity.this.setVideoRecording(true, false);
                        CreateAndEditStoryActivity.this.shutterButton.toPhotoShutter(true);
                    }

                    @Override // com.vk.camera.CameraObject.OnRecordingCallback
                    public void onFinish(File file) {
                        CreateAndEditStoryActivity.this.onVideoFileReady(file);
                    }

                    @Override // com.vk.camera.CameraObject.OnRecordingCallback
                    public void onInfo(int what, int extra) {
                        if (what == 800) {
                            CreateAndEditStoryActivity.this.stopRecording();
                        }
                    }

                    @Override // com.vk.camera.CameraObject.OnRecordingCallback
                    public void onError(int what, int extra) {
                        if (extra == 2) {
                            CameraPrefs.instance().useMediaRecorder(true);
                            CreateAndEditStoryActivity.this.finish();
                        }
                        Log.e(CreateAndEditStoryActivity.TAG, "onError what=" + what + ", extra=" + extra);
                    }
                });
                CreateAndEditStoryActivity.this.cameraContainer.addView(CreateAndEditStoryActivity.this.camera1View);
                CreateAndEditStoryActivity.this.postDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.77.3
                    @Override // java.lang.Runnable
                    public void run() {
                        CreateAndEditStoryActivity.this.initFlashButton();
                    }
                }, 300L);
            }
        }
    };
    private final EditorStickerView.Listener stickerListener = new EditorStickerView.Listener() { // from class: com.vk.stories.CreateAndEditStoryActivity.93
        private void loadAndShow(String url, final boolean emoji, final String metaInfo) {
            final Handler handler = new Handler(Looper.getMainLooper());
            final AtomicReference<Dialog> dialog = new AtomicReference<>();
            final Runnable dialogShow = new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.93.1
                @Override // java.lang.Runnable
                public void run() {
                    dialog.set(LoadingDialog.getInstance(CreateAndEditStoryActivity.this, Integer.valueOf((int) R.string.picker_loading)));
                    ((Dialog) dialog.get()).show();
                }
            };
            VKImageLoader.getBitmap(Uri.parse(url)).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Bitmap>() { // from class: com.vk.stories.CreateAndEditStoryActivity.93.2
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Bitmap bitmap) throws Exception {
                    handler.removeCallbacks(dialogShow);
                    LoadingDialog.dismissLoadingDialog((Dialog) dialog.get());
                    CreateAndEditStoryActivity.this.hideStickers();
                    int maxWidth = Math.min(CreateAndEditStoryActivity.this.stickersDrawingView.getMeasuredWidth(), CreateAndEditStoryActivity.this.stickersDrawingView.getMeasuredHeight());
                    if (emoji) {
                        maxWidth /= 2;
                    }
                    CreateAndEditStoryActivity.this.stickersDrawingView.addStickerView(new BitmapSticker(bitmap, maxWidth, metaInfo));
                    if (emoji) {
                        CreateAndEditStoryActivity.this.trackEmoji(false);
                    } else {
                        CreateAndEditStoryActivity.this.trackStickers(false);
                    }
                }
            }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.93.3
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Throwable throwable) throws Exception {
                    handler.removeCallbacks(dialogShow);
                    LoadingDialog.dismissLoadingDialog((Dialog) dialog.get());
                    Toast.makeText(CreateAndEditStoryActivity.this, (int) R.string.picker_loading_sticker_error, 0).show();
                    if (emoji) {
                        CreateAndEditStoryActivity.this.trackEmoji(false);
                    } else {
                        CreateAndEditStoryActivity.this.trackStickers(false);
                    }
                }
            });
        }

        @Override // com.vk.attachpicker.stickers.EditorStickerView.Listener
        public void onStickerSelected(int packId, int stickerId, String url, String stickerReferrer) {
            new PhotosAddEditorRecentSticker(stickerId).exec();
            loadAndShow(url, false, packId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + stickerId);
        }

        @Override // com.vk.attachpicker.stickers.EditorStickerView.Listener
        public void close() {
            CreateAndEditStoryActivity.this.hideStickers();
        }

        @Override // com.vk.attachpicker.stickers.EditorStickerView.Listener
        public void onEmojiSelected(String emoji) {
            loadAndShow(emoji, true, null);
        }

        @Override // com.vk.attachpicker.stickers.EditorStickerView.Listener
        public void onMaskSelected(String path, int id) {
            loadAndShow(path, true, String.valueOf(id));
        }
    };

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum MasksState {
        MASKS,
        LOADING,
        ERROR
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum ScreenState {
        CAMERA,
        EDITOR,
        DRAWING,
        STICKERS_SELECTION
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        overridePendingTransition(0, 0);
        this.onCameraTouchListener = createOnCameraTouchListener();
        setContentView(R.layout.activity_create_and_edit_story);
        this.parentView = (FrameLayout) findViewById(R.id.fl_parent);
        initCameraViewPart();
        initEditorPartView();
        initMasksUIPart();
        setCameraState();
        PickerStickers.loadFromServer();
        Stickers.get().checkServerUpdates();
        final String maskId = getIntent().getStringExtra(INTENT_OPEN_MASK);
        if (!TextUtils.isEmpty(maskId)) {
            this.handler.postDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.4
                @Override // java.lang.Runnable
                public void run() {
                    CreateAndEditStoryActivity.this.openMaskById(maskId);
                }
            }, 500L);
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        if (this.camera1View != null) {
            this.camera1View.clear();
        }
        if (this.screenState == ScreenState.CAMERA) {
            startCamera();
            setCameraState();
            setVideoRecording(false, false);
            if (masksPanelVisible()) {
                this.shutterButton.toMasksShutter(false);
            } else {
                this.shutterButton.toPhotoShutter(false);
            }
            if (!Prefs.storiesPrefs().getBoolean("story_video_tooltip")) {
                this.cameraTooltipShower.show();
            }
        }
        if (this.videoView != null) {
            this.videoView.start();
        }
        showLastPhotoVideoIcon();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        stopCamera(false);
        if (this.videoView != null) {
            this.videoView.pause();
        }
        Utils.keepScreenOn(this, false);
        super.onPause();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        dropState();
        if (isMasksAvailable()) {
            MasksController.getInstance().disposeMasksEngineModelGet();
        }
        super.onDestroy();
    }

    @Override // android.support.v7.app.AppCompatActivity, android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent event) {
        int action = event.getAction();
        int keyCode = event.getKeyCode();
        if (this.screenState == ScreenState.CAMERA && (keyCode == 24 || keyCode == 25)) {
            if (!this.shutterButtonOnTouchListener.isConfirmedLongTap()) {
                dispatchVolumeButton(action);
            }
            return true;
        }
        return super.dispatchKeyEvent(event);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (this.controlsEnabled) {
            if (this.screenState == ScreenState.DRAWING) {
                if (this.drawingView.isDefault()) {
                    closeDrawing();
                } else {
                    this.drawingView.undo();
                }
            } else if (this.screenState == ScreenState.STICKERS_SELECTION) {
                hideStickers();
            } else if (this.screenState == ScreenState.EDITOR) {
                if (!checkButtonLock()) {
                    if (isDefaultEditorState()) {
                        editorToCamera(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.5
                            @Override // java.lang.Runnable
                            public void run() {
                                CreateAndEditStoryActivity.this.disableResultPreview();
                                CreateAndEditStoryActivity.this.dropState();
                            }
                        });
                        return;
                    }
                    VKAlertDialog.Builder builder = new VKAlertDialog.Builder(this);
                    builder.setTitle(R.string.confirm);
                    builder.setMessage(R.string.picker_editor_exit_confirm);
                    builder.setPositiveButton(R.string.picker_yes, new DialogInterface.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.6
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int which) {
                            CreateAndEditStoryActivity.this.editorToCamera(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.6.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    CreateAndEditStoryActivity.this.disableResultPreview();
                                    CreateAndEditStoryActivity.this.dropState();
                                }
                            });
                        }
                    });
                    builder.setNegativeButton(R.string.picker_no, new DialogInterface.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.7
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                        }
                    });
                    builder.show();
                }
            } else if (this.screenState == ScreenState.CAMERA && masksPanelVisible()) {
                hideMasksPanel(true);
            } else {
                finish();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1) {
            if (requestCode == 1 && this.screenState == ScreenState.CAMERA) {
                Bundle resultBundle = data.getBundleExtra(AttachIntent.RESULT_ATTACHMENTS);
                if (resultBundle != null) {
                    ArrayList<Uri> files = resultBundle.getParcelableArrayList(AttachIntent.RESULT_FILES);
                    boolean[] videoFlags = resultBundle.getBooleanArray(AttachIntent.RESULT_VIDEO_FLAGS);
                    if (files != null && files.size() != 0 && videoFlags != null && videoFlags.length != 0) {
                        this.screenState = ScreenState.EDITOR;
                        this.previewContainer.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
                        this.previewContainer.setVisibility(0);
                        dropState();
                        onMaskSelected(0, null);
                        if (videoFlags[0]) {
                            this.videoFile = new File(files.get(0).getPath());
                            enableResultPreview();
                        } else {
                            enableResultPreview();
                            this.imageView.setPostprocessor(new IterativeBoxBlurPostProcessor(1, 20), null);
                            this.imageView.load(files.get(0), ImageSize.SMALL, files.get(0), ImageSize.BIG);
                            VKImageLoader.getBitmap(files.get(0), StoriesProcessor.MAX_PHOTO_WIDTH, StoriesProcessor.MAX_PHOTO_HEIGHT, VKImageLoader.AUTO_ROTATION_FLAG, null, null, null).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Bitmap>() { // from class: com.vk.stories.CreateAndEditStoryActivity.8
                                @Override // io.reactivex.functions.Consumer
                                public void accept(@NonNull Bitmap bitmap) throws Exception {
                                    CreateAndEditStoryActivity.this.imageBitmap = bitmap;
                                }
                            }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.9
                                @Override // io.reactivex.functions.Consumer
                                public void accept(@NonNull Throwable throwable) throws Exception {
                                    CreateAndEditStoryActivity.this.editorToCamera(null);
                                }
                            });
                        }
                        cameraToEditor(false);
                    }
                }
            } else if (requestCode == 2) {
                finish();
            } else if (requestCode == 3) {
                finish();
            }
        }
    }

    private boolean isDefaultEditorState() {
        return (this.drawingView == null || this.drawingView.isDefault()) && (this.stickersDrawingView == null || this.stickersDrawingView.isDefault());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setControlsEnabled(boolean camera, boolean editor, boolean drawing) {
        boolean z = false;
        this.controlsEnabled = camera || editor || drawing;
        this.shutterButton.setEnabled(camera || editor);
        this.closeButton.setEnabled(camera || editor);
        this.flashButton.setEnabled(camera);
        this.settingsButton.setEnabled(camera);
        this.switchCamera.setEnabled(camera);
        this.galleryThumbnail.setEnabled(camera);
        this.muteButton.setEnabled(editor);
        this.saveButton.setEnabled(editor);
        this.stickersAction.setEnabled(editor);
        this.textAction.setEnabled(editor);
        this.drawAction.setEnabled(editor);
        this.drawingCancel.setEnabled(drawing);
        this.drawingApply.setEnabled(drawing);
        View view = this.drawingUndoButton;
        if (drawing && this.drawingView.getHistorySize() > 0) {
            z = true;
        }
        view.setEnabled(z);
        this.widthSelectorBtn.setEnabled(drawing);
        this.colorSelectorView.setEnabled(drawing);
        this.brushPen.setEnabled(drawing);
        this.brushMarker.setEnabled(drawing);
        this.brushNeon.setEnabled(drawing);
        setCameraButtonEnabled(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setDrawingTouches(boolean stickers, boolean draw) {
        this.stickersDrawingView.setTouchEnabled(stickers);
        this.drawingView.setTouchEnabled(draw);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCameraButtonEnabled(boolean enabled) {
        if (this.shutterButtonOnTouchListener != null) {
            this.shutterButtonOnTouchListener.setEnabled(enabled);
        }
    }

    private void setCameraState() {
        this.screenState = ScreenState.CAMERA;
        setControlsEnabled(true, false, false);
        setDrawingTouches(false, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dropState() {
        this.videoFile = null;
        this.imageBitmap = null;
        this.videoPreview = null;
        this.mirror = false;
        this.mute = false;
        if (this.locationRetrieveAsyncTask != null) {
            this.locationRetrieveAsyncTask.cancel(true);
            this.locationRetrieveAsyncTask = null;
        }
        this.captureLocation = null;
        this.drawingView.clear();
        this.stickersDrawingView.clear();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void retrieveLocation() {
        if (this.locationRetrieveAsyncTask == null) {
            this.locationRetrieveAsyncTask = new AsyncTask<Void, Void, Location>() { // from class: com.vk.stories.CreateAndEditStoryActivity.12
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // android.os.AsyncTask
                public Location doInBackground(Void... params) {
                    return LocationUtils.getLastKnownLocation();
                }

                /* JADX INFO: Access modifiers changed from: protected */
                @Override // android.os.AsyncTask
                public void onPostExecute(Location location) {
                    CreateAndEditStoryActivity.this.captureLocation = location;
                    CreateAndEditStoryActivity.this.locationRetrieveAsyncTask = null;
                }
            };
            this.locationRetrieveAsyncTask.execute(new Void[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void enableResultPreview() {
        this.previewContainer.setVisibility(0);
        this.drawingView.setVisibility(0);
        this.stickersContainer.setVisibility(0);
        this.stickersDrawingView.setVisibility(0);
        cancel(this.enableResultPreviewBlackBackground);
        cancel(this.disableResultPreviewBlackBackground);
        if (this.videoFile != null) {
            this.editorStatistics.type("video");
            this.videoView = new TextureVideoView(this);
            this.videoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.13
                @Override // android.media.MediaPlayer.OnPreparedListener
                public void onPrepared(MediaPlayer mp) {
                    CreateAndEditStoryActivity.this.editorStatistics.length(mp.getDuration() / 1000);
                }
            });
            if (this.mirror) {
                this.videoView.setScaleX(-1.0f);
            }
            this.videoView.setLoop(true);
            this.videoView.setScaleType(TextureVideoView.ScaleType.CENTER_CROP);
            this.videoView.setVideoURI(Uri.fromFile(this.videoFile));
            postDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.14
                @Override // java.lang.Runnable
                public void run() {
                    if (CreateAndEditStoryActivity.this.videoView != null) {
                        CreateAndEditStoryActivity.this.videoView.start();
                    }
                }
            }, 300L);
            this.previewContainer.addView(this.videoView);
            this.muteButton.setVisibility(0);
            Task.call(new Callable<Object>() { // from class: com.vk.stories.CreateAndEditStoryActivity.15
                @Override // java.util.concurrent.Callable
                public Object call() throws Exception {
                    CreateAndEditStoryActivity.this.initVideoPreview();
                    return null;
                }
            });
        } else {
            this.editorStatistics.type("photo");
            this.editorStatistics.length(3);
            this.imageView = new VKImageView(this);
            this.imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
            this.imageView.setActualScaleType(ScalingUtils.ScaleType.CENTER_CROP);
            this.previewContainer.addView(this.imageView);
            if (this.imageBitmap != null) {
                this.imageView.setImageBitmap(this.imageBitmap);
            }
            this.muteButton.setVisibility(8);
        }
        if (isMasksAvailable()) {
            MasksController.getInstance().raiseMask(this.masksContainer.selectedMask());
        }
        postDelayed(this.enableResultPreviewBlackBackground, 300L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void disableResultPreview() {
        cancel(this.enableResultPreviewBlackBackground);
        cancel(this.disableResultPreviewBlackBackground);
        this.previewContainer.setBackgroundColor(0);
        this.videoView = null;
        this.imageView = null;
        this.previewContainer.removeAllViews();
        this.drawingView.setVisibility(8);
        this.stickersDrawingView.setVisibility(8);
        this.stickersContainer.setVisibility(8);
        this.previewContainer.setVisibility(8);
    }

    private void showProgressDialog(long delay) {
        this.handler.removeCallbacks(this.showProgressDialogRunnable);
        this.handler.postDelayed(this.showProgressDialogRunnable, delay);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideProgressDialog() {
        this.handler.removeCallbacks(this.showProgressDialogRunnable);
        if (this.currentProgressDialog != null) {
            this.currentProgressDialog.dismiss();
            this.currentProgressDialog = null;
        }
    }

    private float publishAspectRatio() {
        return Screen.realWidth() / Screen.realHeight();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initVideoPreview() {
        if (this.videoFile != null && this.videoFile.exists()) {
            try {
                MediaUtils.VideoInfo preview = MediaUtils.getVideoPreview(Uri.fromFile(this.videoFile));
                if (preview != null && preview.preview != null) {
                    int[] size = StoriesProcessor.videoSize(publishAspectRatio(), preview.getWidth(), preview.getHeight());
                    this.videoPreview = BitmapUtils.centerCropBitmap(preview.preview, size[0], size[1], this.mirror);
                }
            } catch (Exception e) {
                Log.d("tmp", "", e);
            }
        }
    }

    private Bitmap getVideoPreview() {
        if (this.videoPreview == null) {
            initVideoPreview();
        }
        return this.videoPreview;
    }

    private Bitmap getOverlayBitmap(boolean forVideo) {
        int[] size;
        if (isDefaultEditorState()) {
            return null;
        }
        float publishAspectRatio = publishAspectRatio();
        if (forVideo && this.videoView != null) {
            size = StoriesProcessor.videoSize(publishAspectRatio, this.videoView.getVideoWidth(), this.videoView.getVideoHeight());
        } else {
            size = StoriesProcessor.imageSize(publishAspectRatio);
        }
        Bitmap bitmap = Bitmap.createBitmap(size[0], size[1], Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        DrawingState ds = this.drawingView.getDrawingStateCopy();
        ds.handleSizeChange(size[0], size[1]);
        DrawingCanvas drawingCanvas = new DrawingCanvas(bitmap);
        drawingCanvas.draw(ds);
        StickersDrawingState sds = this.stickersDrawingView.getDrawingState();
        sds.handleSizeChange(size[0], size[1]);
        sds.draw(canvas);
        return bitmap;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doSave() {
        if (!checkButtonLock()) {
            flushStatistics();
            if (this.imageBitmap != null) {
                showProgressDialog(500L);
                int[] size = StoriesProcessor.imageSize(publishAspectRatio());
                StoriesProcessor.processImage(this.imageBitmap, getOverlayBitmap(false), size[0], size[1], false, new StoriesProcessor.ImageProcessingCallback() { // from class: com.vk.stories.CreateAndEditStoryActivity.16
                    @Override // com.vk.stories.StoriesProcessor.ImageProcessingCallback
                    public void onSuccess(File file) {
                        CreateAndEditStoryActivity.this.hideProgressDialog();
                        CameraUtils.addMediaToGallery(CreateAndEditStoryActivity.this, file, null);
                        Toast.makeText(CreateAndEditStoryActivity.this, (int) R.string.photo_saved, 0).show();
                    }

                    @Override // com.vk.stories.StoriesProcessor.ImageProcessingCallback
                    public void onFailure() {
                        CreateAndEditStoryActivity.this.hideProgressDialog();
                        Toast.makeText(CreateAndEditStoryActivity.this, (int) R.string.error, 0).show();
                    }
                });
            } else if (this.videoFile != null) {
                final ProgressDialog dialog = new ProgressDialog(this);
                dialog.setMessage(getString(R.string.video_saving));
                dialog.setProgressStyle(1);
                dialog.setMax(100);
                dialog.setIndeterminate(false);
                dialog.setCancelable(true);
                dialog.setCanceledOnTouchOutside(false);
                dialog.show();
                VideoCompressor.VideoCompressorParameters params = new VideoCompressor.VideoCompressorParameters(this.videoFile).mirror(this.mirror).disableAudio(this.mute).aspectRatio(publishAspectRatio()).maxSize(1280);
                final VideoCompressor.RenderTask future = VideoCompressor.render(params, false, getOverlayBitmap(true), new VideoCompressor.CompressDelegate() { // from class: com.vk.stories.CreateAndEditStoryActivity.17
                    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
                    public void onProgress(int progress) {
                        dialog.setProgress(progress);
                    }

                    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
                    public void onBytes(int bytes) {
                    }

                    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
                    public void onFinish(long time, File resultFile) {
                        ToastUtils.showToast((int) R.string.video_saved);
                        dialog.dismiss();
                        CameraUtils.addMediaToGallery(CreateAndEditStoryActivity.this, resultFile, null);
                    }

                    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
                    public void onCancel() {
                    }

                    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
                    public void onError(Exception e) {
                        Analytics.logException(e);
                        ToastUtils.showToast(CreateAndEditStoryActivity.this.getString(R.string.video_save_error));
                        dialog.dismiss();
                    }
                });
                dialog.setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.18
                    @Override // android.content.DialogInterface.OnCancelListener
                    public void onCancel(DialogInterface dialogInterface) {
                        if (future != null) {
                            future.cancel();
                        }
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doShare() {
        if (!checkButtonLock()) {
            flushStatistics();
            showProgressDialog(500L);
            if (this.imageBitmap != null) {
                int[] size = StoriesProcessor.imageSize(publishAspectRatio());
                StoriesProcessor.processImage(this.imageBitmap, getOverlayBitmap(false), size[0], size[1], true, new StoriesProcessor.ImageProcessingCallback() { // from class: com.vk.stories.CreateAndEditStoryActivity.19
                    @Override // com.vk.stories.StoriesProcessor.ImageProcessingCallback
                    public void onSuccess(File file) {
                        CreateAndEditStoryActivity.this.hideProgressDialog();
                        Intent intent = new Intent(CreateAndEditStoryActivity.this, ShareStoryActivity.class);
                        intent.putExtra(ShareStoryActivity.INTENT_IMAGE_FILE, file);
                        intent.putExtra(ShareStoryActivity.INTENT_STORY_UPLOAD_PARAM, CreateAndEditStoryActivity.this.storyUploadParams());
                        CreateAndEditStoryActivity.this.startActivityForResult(intent, 2);
                        if (Prefs.storiesPrefs().getBoolean("save_stories")) {
                            CameraUtils.savePhotoAsync(file);
                        }
                    }

                    @Override // com.vk.stories.StoriesProcessor.ImageProcessingCallback
                    public void onFailure() {
                        CreateAndEditStoryActivity.this.hideProgressDialog();
                        Toast.makeText(CreateAndEditStoryActivity.this, (int) R.string.error, 0).show();
                    }
                });
            } else if (this.videoFile != null && this.videoView != null) {
                int[] size2 = StoriesProcessor.videoSize(publishAspectRatio(), this.videoView.getVideoWidth(), this.videoView.getVideoHeight());
                final VideoCompressor.VideoCompressorParameters params = new VideoCompressor.VideoCompressorParameters(this.videoFile).mirror(this.mirror).disableAudio(this.mute).aspectRatio(publishAspectRatio()).maxSize(1280);
                Bitmap overlay = getOverlayBitmap(true);
                Bitmap videoFrame = getVideoPreview();
                StoriesProcessor.saveOverlayImage(overlay, videoFrame, size2[0], size2[1], new StoriesProcessor.ImageProcessingCallback2() { // from class: com.vk.stories.CreateAndEditStoryActivity.20
                    @Override // com.vk.stories.StoriesProcessor.ImageProcessingCallback2
                    public void onSuccess(File overlay1, File videoPreview1) {
                        CreateAndEditStoryActivity.this.hideProgressDialog();
                        params.imageFile(overlay1);
                        params.previewFile(videoPreview1);
                        Intent intent = new Intent(CreateAndEditStoryActivity.this, ShareStoryActivity.class);
                        intent.putExtra(ShareStoryActivity.INTENT_VIDEO_RENDER_PARAMS, params);
                        intent.putExtra(ShareStoryActivity.INTENT_STORY_UPLOAD_PARAM, CreateAndEditStoryActivity.this.storyUploadParams());
                        CreateAndEditStoryActivity.this.startActivityForResult(intent, 2);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public StoryUploadParams storyUploadParams() {
        StoryUploadParams params = new StoryUploadParams();
        if (this.captureLocation != null) {
            params.setLocation(this.captureLocation);
        }
        if (this.masksContainer.selectedMask() != null) {
            params.setMaskId(this.masksContainer.selectedMask().getFullId());
            params.setSectionId(this.masksContainer.selectedSectionId());
        }
        if (this.camera1View != null) {
            if (this.camera1View.getCurrentMode() == CameraMode.BACK) {
                params.setCameraType(StoryUploadParams.CameraType.BACK);
            } else {
                params.setCameraType(StoryUploadParams.CameraType.FRONT);
            }
        }
        return params;
    }

    private void initCameraViewPart() {
        this.bottomInfoContainer = findViewById(R.id.ll_bottom_info_container);
        this.cameraContainer = (FrameLayout) findViewById(R.id.fl_camera_container);
        this.galleryThumbnailContainer = findViewById(R.id.iv_gallery_thumbnail_container);
        this.galleryThumbnail = (ImageView) findViewById(R.id.iv_gallery_thumbnail);
        this.closeButton = (ImageView) findViewById(R.id.iv_close);
        this.flashButton = (ImageView) findViewById(R.id.iv_flash);
        this.settingsButton = (ImageView) findViewById(R.id.iv_settings);
        this.switchCamera = (ImageView) findViewById(R.id.iv_switch_camera);
        this.shutterButton = (ShutterButton) findViewById(R.id.shutter_button);
        this.cameraTooltip = findViewById(R.id.tv_camera_tooltip);
        this.cameraTooltipShower = new ViewShower(this.cameraTooltip);
        this.cameraTooltip.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.21
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                CreateAndEditStoryActivity.this.hideCameraTooltip();
            }
        });
        this.galleryThumbnail.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.22
            @Override // android.view.View.OnClickListener
            public void onClick(View v1) {
                if (!CreateAndEditStoryActivity.this.checkButtonLock() && !CreateAndEditStoryActivity.this.isRecording()) {
                    Intent intent = new Intent(CreateAndEditStoryActivity.this, PhotoVideoAttachActivity.class);
                    intent.putExtra(AttachIntent.INTENT_SINGLE_MODE, true);
                    intent.putExtra("media_type", 111);
                    intent.putExtra(AttachIntent.INTENT_CAMERA_ENABLED, false);
                    intent.putExtra(AttachIntent.INTENT_PREVENT_STYLING_PHOTO, true);
                    intent.putExtra(AttachIntent.INTENT_PREVENT_STYLING_VIDEO, false);
                    intent.putExtra(AttachIntent.INTENT_BIG_PREVIEWS, true);
                    intent.putExtra(AttachIntent.INTENT_ONLY_LAST_N_MILLISECONDS, 86400000L);
                    intent.putExtra(AttachIntent.INTENT_VIDEO_MAX_LENGTH_MS, StoriesProcessor.MAX_VIDEO_LENGTH);
                    intent.putExtra(AttachIntent.INTENT_STATIC_HEADER_TITLE, CreateAndEditStoryActivity.this.getString(R.string.picker_last_24_hours));
                    CreateAndEditStoryActivity.this.startActivityForResult(intent, 1);
                }
            }
        });
        this.closeButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.23
            @Override // android.view.View.OnClickListener
            public void onClick(View v1) {
                if (!CreateAndEditStoryActivity.this.isRecording()) {
                    CreateAndEditStoryActivity.this.onBackPressed();
                }
            }
        });
        this.flashButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.24
            @Override // android.view.View.OnClickListener
            public void onClick(View v1) {
                if (!CreateAndEditStoryActivity.this.isRecording()) {
                    if (CreateAndEditStoryActivity.this.camera1View.getFlashMode() == 2) {
                        CreateAndEditStoryActivity.this.flashButton.setImageResource(R.drawable.ic_flash_off_shadow_48dp);
                        CreateAndEditStoryActivity.this.camera1View.setFlashMode(0);
                        return;
                    }
                    CreateAndEditStoryActivity.this.flashButton.setImageResource(R.drawable.ic_flash_on_shadow_48dp);
                    CreateAndEditStoryActivity.this.camera1View.setFlashMode(2);
                }
            }
        });
        this.settingsButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.25
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Intent intent = new Intent(CreateAndEditStoryActivity.this, StorySettingsActivity.class);
                intent.putExtra(StorySettingsActivity.INTENT_FROM_CREATE_STORY, true);
                CreateAndEditStoryActivity.this.startActivityForResult(intent, 3);
            }
        });
        initSwitchCameraButton();
        initFlashButton();
        showLastPhotoVideoIcon();
        startCamera();
        this.shutterButtonOnTouchListener = new ShutterButtonOnTouchListener(this);
        this.shutterButton.setOnTouchListener(this.shutterButtonOnTouchListener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideCameraTooltip() {
        this.cameraTooltipShower.hide(true);
        Prefs.storiesPrefs().edit().putBoolean("story_video_tooltip", true).apply();
    }

    private void initSwitchCameraButton() {
        if (CameraHolder.instance().getNumberOfCameras() > 1) {
            this.switchCamera.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.26
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    if (!CreateAndEditStoryActivity.this.isRecording() && !CreateAndEditStoryActivity.this.cameraActionLock.isLocked() && CreateAndEditStoryActivity.this.screenState == ScreenState.CAMERA) {
                        CreateAndEditStoryActivity.this.cameraActionLock.lock();
                        CreateAndEditStoryActivity.this.camera1View.changeCamera();
                        CreateAndEditStoryActivity.this.initFlashButton();
                    }
                }
            });
        } else {
            this.switchCamera.setVisibility(8);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initFlashButton() {
        if (CameraHolder.instance().currentCameraHasFlash()) {
            this.flashButton.setVisibility(0);
        } else {
            this.flashButton.setVisibility(8);
        }
        this.flashVisible = CameraHolder.instance().currentCameraHasFlash();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showLastPhotoVideoIcon() {
        if (this.screenState == ScreenState.CAMERA) {
            if (masksPanelVisible()) {
                this.galleryThumbnailContainer.setAlpha(0.0f);
            }
            ArrayList<AlbumEntry> lastPhotoVideo = MediaStoreController.lastLoadedPhotoVideo();
            if (lastPhotoVideo != null && lastPhotoVideo.size() > 0 && lastPhotoVideo.get(0) != null && lastPhotoVideo.get(0).getMediaStoreEntry() != null && System.currentTimeMillis() - lastPhotoVideo.get(0).getMediaStoreEntry().dateTaken < 86400000) {
                this.galleryLastEntry = lastPhotoVideo.get(0).getMediaStoreEntry();
                this.galleryThumbnailContainer.setVisibility(0);
            } else {
                this.galleryLastEntry = null;
                this.galleryThumbnailContainer.setVisibility(8);
            }
            MediaStoreController.load(111, new MediaStoreController.MediaStoreCallback() { // from class: com.vk.stories.CreateAndEditStoryActivity.27
                @Override // com.vk.attachpicker.mediastore.MediaStoreController.MediaStoreCallback
                public void onLoaded(ArrayList<AlbumEntry> mediaStore) {
                    if (mediaStore == null || mediaStore.size() <= 0 || mediaStore.get(0) == null || mediaStore.get(0).getMediaStoreEntry() == null || System.currentTimeMillis() - mediaStore.get(0).getMediaStoreEntry().dateTaken >= 86400000) {
                        CreateAndEditStoryActivity.this.galleryLastEntry = null;
                        CreateAndEditStoryActivity.this.galleryThumbnailContainer.setVisibility(8);
                        return;
                    }
                    CreateAndEditStoryActivity.this.galleryLastEntry = mediaStore.get(0).getMediaStoreEntry();
                    CreateAndEditStoryActivity.this.galleryThumbnailContainer.setVisibility(0);
                }
            });
        }
    }

    private View.OnTouchListener createOnCameraTouchListener() {
        OnSwipeTouchListener onSwipeTouchListener = new OnSwipeTouchListener(this, Screen.dp(40), new OnTouchDownListener.DownUpListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.28
            @Override // com.vk.core.widget.OnTouchDownListener.DownUpListener
            public void onDown(int x, int y) {
            }

            @Override // com.vk.core.widget.OnTouchDownListener.DownUpListener
            public void onUp(int x, int y) {
            }

            @Override // com.vk.core.widget.OnTouchDownListener.DownUpListener
            public void onClick(int x, int y) {
            }
        });
        onSwipeTouchListener.setGestureListener(new OnSwipeTouchListener.OnSwipeGestureListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.29
            @Override // com.vk.core.widget.OnSwipeTouchListener.OnSwipeGestureListener
            public void onSwipeLeft() {
            }

            @Override // com.vk.core.widget.OnSwipeTouchListener.OnSwipeGestureListener
            public void onSwipeTop() {
                if (CreateAndEditStoryActivity.this.masksContainer.selectedMask() != null || !CreateAndEditStoryActivity.this.isMasksAvailable()) {
                    if (CreateAndEditStoryActivity.this.masksPanelVisible()) {
                        CreateAndEditStoryActivity.this.hideMasksPanel(true);
                    } else {
                        CreateAndEditStoryActivity.this.showNextMask();
                    }
                } else if (CreateAndEditStoryActivity.this.masksPanelVisible()) {
                    CreateAndEditStoryActivity.this.hideMasksPanel(true);
                } else {
                    CreateAndEditStoryActivity.this.openMasksPanel();
                }
            }

            @Override // com.vk.core.widget.OnSwipeTouchListener.OnSwipeGestureListener
            public void onSwipeRight() {
            }

            @Override // com.vk.core.widget.OnSwipeTouchListener.OnSwipeGestureListener
            public void onSwipeBottom() {
                if (CreateAndEditStoryActivity.this.masksPanelVisible()) {
                    CreateAndEditStoryActivity.this.hideMasksPanel(true);
                } else {
                    CreateAndEditStoryActivity.this.showPrevMask();
                }
            }
        });
        return onSwipeTouchListener;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isMasksAvailable() {
        return MasksController.getInstance().isMasksAvailable();
    }

    private void initMasksUIPart() {
        this.maskProgressContainer = findViewById(R.id.fl_mask_progress);
        this.masksProgressBar = (CircularProgressView) findViewById(R.id.cpb_mask_load_progress);
        this.masksProgressShower = new ViewShower(this.maskProgressContainer);
        this.maskAuthorView = findViewById(R.id.fl_mask_author);
        this.maskAuthorShower = new ViewShower(this.maskAuthorView);
        this.maskAuthorImage = (VKImageView) this.maskAuthorView.findViewById(R.id.iv_mask_author);
        this.maskAuthorName = (TextView) this.maskAuthorView.findViewById(R.id.tv_mask_author);
        this.maskActionView = (TextView) findViewById(R.id.tv_mask_action);
        this.maskActionShower = new ViewShower(this.maskActionView);
        this.masksPanel = (LinearLayout) findViewById(R.id.ll_masks_panel);
        this.masksPanel.setVisibility(8);
        this.maskProgressContainer.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.30
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                CreateAndEditStoryActivity.this.onMaskSelected(0, null);
            }
        });
        this.masksPanelShower = new ViewShower(this.masksPanel) { // from class: com.vk.stories.CreateAndEditStoryActivity.31
            @Override // com.vk.core.widget.ViewShower
            public Animator createShowAnimator(View view) {
                ObjectAnimator oa = ObjectAnimator.ofFloat(view, View.TRANSLATION_Y, 0.0f);
                oa.setDuration(225L);
                oa.setInterpolator(AnimationUtils.decelerationCurve);
                return oa;
            }

            @Override // com.vk.core.widget.ViewShower
            public Animator createHideAnimator(View view) {
                ObjectAnimator oa = ObjectAnimator.ofFloat(view, View.TRANSLATION_Y, view.getHeight());
                oa.setDuration(225L);
                oa.setInterpolator(AnimationUtils.accelerationCurve);
                return oa;
            }

            @Override // com.vk.core.widget.ViewShower
            public void dropViewState(View v) {
                v.setTranslationY(CreateAndEditStoryActivity.this.getResources().getDimension(R.dimen.masks_panel_height));
            }
        };
        this.maskClearButton = findViewById(R.id.iv_clear_mask);
        this.maskClearButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.32
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                CreateAndEditStoryActivity.this.onMaskSelected(0, null);
            }
        });
        this.masksOpenButton = findViewById(R.id.fl_masks_open);
        if (isMasksAvailable()) {
            this.masksOpenButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.33
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    CreateAndEditStoryActivity.this.openMasksPanel();
                }
            });
        } else {
            this.masksOpenButton.setVisibility(8);
        }
        this.newMasksBadge = (RobotoMediumTextView) findViewById(R.id.tv_new_masks_badge);
        this.masksLoadingErrorView = findViewById(R.id.fl_masks_loading_error);
        this.masksLoadingErrorView.findViewById(R.id.tv_retry).setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.34
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                CreateAndEditStoryActivity.this.reloadMaskSections(false);
            }
        });
        this.masksLoadingView = findViewById(R.id.tv_masks_loading);
        this.masksPanelHeader = (MaskTabsIndicator) findViewById(R.id.rv_mask_panel_header);
        this.masksPanelPager = (ViewPager) findViewById(R.id.vp_mask_panel_pager);
        this.masksPanelPager.setPageMargin(Screen.dp(10));
        this.masksPagerAdapter = new MasksPagerAdapter(this, this.masksContainer, this);
        this.masksPanelPager.setAdapter(this.masksPagerAdapter);
        this.masksPanelPager.addOnPageChangeListener(this.masksPanelHeader);
        this.masksPanelHeader.setPager(this.masksPanelPager);
        this.masksVerticalPagerIndicator = (VerticalPagerIndicator) findViewById(R.id.vpi_masks);
        this.masksPanelPager.addOnPageChangeListener(new ViewPager.SimpleOnPageChangeListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.35
            @Override // android.support.v4.view.ViewPager.SimpleOnPageChangeListener, android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
                CreateAndEditStoryActivity.this.markMaskSectionAsViewed(CreateAndEditStoryActivity.this.masksPagerAdapter.getSection(position));
            }
        });
        reloadMaskSections(false);
        reloadMasksNewBadge();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openMaskById(final String maskId) {
        if (isMasksAvailable()) {
            reloadLocalMasks(false);
            if (this.currentMaskDownload != null) {
                this.currentMaskDownload.dispose();
                this.currentMaskDownload = null;
            }
            hideMaskAuthorWithDelay(100L);
            hideMasksProgress();
            registerDisposable(LocationUtils.getLastKnownLocationRx().flatMap(new Function<Location, ObservableSource<? extends MasksResponse>>() { // from class: com.vk.stories.CreateAndEditStoryActivity.39
                @Override // io.reactivex.functions.Function
                /* renamed from: apply  reason: avoid collision after fix types in other method */
                public ObservableSource<? extends MasksResponse> mo1190apply(@NonNull Location location) throws Exception {
                    return location == LocationUtils.NO_LOCATION ? new MasksGetById(maskId).toObservable() : new MasksGetById(maskId, location.getLatitude(), location.getLongitude()).toObservable();
                }
            }).map(new Function<MasksResponse, Mask>() { // from class: com.vk.stories.CreateAndEditStoryActivity.38
                @Override // io.reactivex.functions.Function
                /* renamed from: apply  reason: avoid collision after fix types in other method */
                public Mask mo1190apply(@NonNull MasksResponse masks) throws Exception {
                    return (Mask) masks.masks.get(0);
                }
            }).subscribe(new Consumer<Mask>() { // from class: com.vk.stories.CreateAndEditStoryActivity.36
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Mask mask) throws Exception {
                    MasksController.getInstance().raiseMask(mask);
                    CreateAndEditStoryActivity.this.notifyMasksChanged();
                    CreateAndEditStoryActivity.this.onMaskSelected(-1, mask);
                }
            }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.37
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Throwable throwable) throws Exception {
                    CreateAndEditStoryActivity.this.onMaskOpenFailed();
                }
            }));
        }
    }

    @Override // com.vk.masks.MasksView.OnMaskSelectedListener
    public void onMaskSelected(final int sectionId, Mask mask) {
        if (isMasksAvailable()) {
            if (mask == this.masksContainer.selectedMask() || (mask != null && mask.equals(this.masksContainer.selectedMask()))) {
                this.masksStatistics.endMaskUsage();
                mask = null;
            }
            if (mask != null && mask.isDisabled()) {
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                if (mask.disableReason.hasTitle()) {
                    builder.setTitle(mask.disableReason.title);
                }
                builder.setMessage(mask.disableReason.subtitle);
                if (mask.disableReason.hasUrl()) {
                    final String moreInfoUrl = mask.disableReason.url;
                    builder.setPositiveButton(getString(R.string.masks_more_info).toUpperCase(), new DialogInterface.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.40
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int which) {
                            new WebViewFragment.Builder(moreInfoUrl).go(CreateAndEditStoryActivity.this);
                        }
                    });
                    builder.setNegativeButton(getString(R.string.cancel).toUpperCase(), new DialogInterface.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.41
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                        }
                    });
                } else {
                    builder.setPositiveButton(getString(R.string.ok).toUpperCase(), new DialogInterface.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.42
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                        }
                    });
                }
                builder.show();
                return;
            }
            this.masksStatistics.endMaskUsage();
            if (this.currentMaskDownload != null) {
                this.masksStatistics.trackMaskLoadingCanceled(this.masksContainer.selectedMask());
                this.currentMaskDownload.dispose();
                this.currentMaskDownload = null;
            }
            hideMaskAuthorWithDelay(500L);
            forceHideMaskAction(true);
            setSelectedMask(sectionId, mask);
            if (mask != null) {
                final Mask finalMask = mask;
                this.masksProgressBar.setProgressNoAnim(0.01f);
                final boolean needDownload = MasksController.getInstance().needDownload(mask);
                if (needDownload) {
                    showMasksProgress();
                    showMaskAuthor(finalMask);
                }
                final long firstProgressTime = SystemClock.elapsedRealtime();
                this.currentMaskDownload = registerDisposable(MasksController.getInstance().getMask(mask).doOnDispose(new Action() { // from class: com.vk.stories.CreateAndEditStoryActivity.45
                    @Override // io.reactivex.functions.Action
                    public void run() throws Exception {
                        CreateAndEditStoryActivity.this.currentMaskDownload = null;
                        CreateAndEditStoryActivity.this.hideMasksProgress();
                        CreateAndEditStoryActivity.this.hideMaskAuthorWithDelay(0L);
                    }
                }).subscribe(new Consumer<RxFileDownloader.DownloadEvent>() { // from class: com.vk.stories.CreateAndEditStoryActivity.43
                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull RxFileDownloader.DownloadEvent downloadEvent) throws Exception {
                        long maskAuthorHideDelay;
                        if (downloadEvent.isDoneEvent()) {
                            CreateAndEditStoryActivity.this.masksStatistics.trackMaskLoadingSuccess(finalMask);
                            if (needDownload) {
                                CreateAndEditStoryActivity.this.reloadLocalMasks(true);
                            } else {
                                CreateAndEditStoryActivity.this.checkMaskForUpdates(finalMask);
                            }
                            long downloadStop = SystemClock.elapsedRealtime();
                            CreateAndEditStoryActivity.this.maskClearButton.setVisibility(0);
                            CreateAndEditStoryActivity.this.notifyMasksChanged();
                            CreateAndEditStoryActivity.this.hideMasksProgress();
                            if (needDownload) {
                                long maskAuthorOnScreenDuration = downloadStop - firstProgressTime;
                                if (maskAuthorOnScreenDuration >= CreateAndEditStoryActivity.MASK_AUTHOR_HIDE_DELAY) {
                                    maskAuthorHideDelay = 0;
                                } else {
                                    maskAuthorHideDelay = CreateAndEditStoryActivity.MASK_AUTHOR_HIDE_DELAY - maskAuthorOnScreenDuration;
                                }
                                CreateAndEditStoryActivity.this.hideMaskAuthorWithDelay(maskAuthorHideDelay);
                            } else {
                                maskAuthorHideDelay = 0;
                            }
                            if (finalMask.hasHint()) {
                                CreateAndEditStoryActivity.this.showAndHideMaskAction(finalMask, 600 + maskAuthorHideDelay);
                            }
                            if (CreateAndEditStoryActivity.this.camera1View != null) {
                                CreateAndEditStoryActivity.this.masksStatistics.startMaskUsage(sectionId, finalMask.getFullId());
                                CreateAndEditStoryActivity.this.camera1View.setEffect(downloadEvent.resultFile.getName());
                            }
                            CreateAndEditStoryActivity.this.currentMaskDownload = null;
                            return;
                        }
                        CreateAndEditStoryActivity.this.masksProgressBar.setProgress(downloadEvent.progress);
                        CreateAndEditStoryActivity.this.maskProgressHandler.removeMessages(1);
                    }
                }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.44
                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull Throwable throwable) throws Exception {
                        CreateAndEditStoryActivity.this.masksStatistics.trackMaskLoadingFailed(finalMask);
                        CreateAndEditStoryActivity.this.onMaskOpenFailed();
                    }
                }));
                return;
            }
            hideMaskAuthorWithDelay(0L);
            this.maskClearButton.setVisibility(8);
            if (this.camera1View != null) {
                this.camera1View.setEffect(null);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onMaskOpenFailed() {
        this.currentMaskDownload = null;
        setSelectedMask(0, null);
        this.maskClearButton.setVisibility(8);
        if (this.camera1View != null) {
            this.camera1View.setEffect(null);
        }
        hideMaskAuthorWithDelay(0L);
        hideMasksProgress();
        notifyMasksChanged();
        ToastUtils.showToast((int) R.string.masks_mask_error);
    }

    @Override // com.vk.masks.MasksView.OnMaskSelectedListener
    public void onMasksListUpdated(int sectionId) {
        if (this.masksContainer.selectedSectionId() == sectionId) {
            if (this.masksContainer.selectedMask() != null) {
                this.masksVerticalPagerIndicator.setVisibility(0);
                ArrayList<Mask> masks = this.masksContainer.masksListForSectionId(this.masksContainer.selectedSectionId());
                if (this.masksVerticalPagerIndicator.getItemsCount() != masks.size()) {
                    this.masksVerticalPagerIndicator.setItemsCount(masks.size());
                }
                this.masksVerticalPagerIndicator.setCurrentPosition(masks.indexOf(this.masksContainer.selectedMask()), true);
                return;
            }
            this.masksVerticalPagerIndicator.setVisibility(8);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean masksIndicatorShouldBeVisible() {
        return this.masksContainer.selectedMask() != null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void markMaskSectionAsViewed(MaskSection section) {
        if (!section.isRecentSection() && section.hasNew && isMasksAvailable()) {
            registerDisposable(MasksController.getInstance().markSectionAsViewed(section.id).subscribe(new Consumer<MasksMarkSectionAsViewed.Response>() { // from class: com.vk.stories.CreateAndEditStoryActivity.46
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull MasksMarkSectionAsViewed.Response response) throws Exception {
                    CreateAndEditStoryActivity.this.setNewMasksBadge(response.hasNewBadge);
                    CreateAndEditStoryActivity.this.setMasksSections(response.sections, true);
                }
            }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.47
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Throwable throwable) throws Exception {
                }
            }));
        }
    }

    private void reloadMasksNewBadge() {
        registerDisposable(new MasksHasNew().toObservable().subscribe(new Consumer<Integer>() { // from class: com.vk.stories.CreateAndEditStoryActivity.48
            @Override // io.reactivex.functions.Consumer
            public void accept(@NonNull Integer o) throws Exception {
                CreateAndEditStoryActivity.this.setNewMasksBadge(o.intValue());
            }
        }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.49
            @Override // io.reactivex.functions.Consumer
            public void accept(@NonNull Throwable throwable) throws Exception {
                CreateAndEditStoryActivity.this.newMasksBadge.setVisibility(8);
            }
        }));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setNewMasksBadge(int o) {
        if (o > 0) {
            this.newMasksBadge.setText(String.valueOf(o));
            this.newMasksBadge.setVisibility(0);
            return;
        }
        this.newMasksBadge.setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void reloadMaskSections(boolean onlyCache) {
        if (isMasksAvailable()) {
            if (!onlyCache) {
                setMasksState(MasksState.LOADING);
            }
            registerDisposable(MasksController.getInstance().getSections(onlyCache).subscribe(new Consumer<ArrayList<MaskSection>>() { // from class: com.vk.stories.CreateAndEditStoryActivity.50
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull ArrayList<MaskSection> maskSections) throws Exception {
                    CreateAndEditStoryActivity.this.setMasksSections(maskSections, false);
                }
            }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.51
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Throwable throwable) throws Exception {
                    if (CreateAndEditStoryActivity.this.masksPagerAdapter.getCount() == 0) {
                        CreateAndEditStoryActivity.this.setMasksState(MasksState.ERROR);
                    } else {
                        CreateAndEditStoryActivity.this.setMasksState(MasksState.MASKS);
                    }
                }
            }));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMasksSections(ArrayList<MaskSection> sections, boolean forceUpdate) {
        this.masksPanelHeader.setSections(sections);
        this.masksPagerAdapter.setSections(sections, forceUpdate || sections.size() != this.masksPagerAdapter.getCount());
        setMasksState(MasksState.MASKS);
        reloadLocalMasks(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMasksState(MasksState masksState) {
        if (masksState == MasksState.ERROR) {
            this.masksLoadingErrorView.setVisibility(0);
            this.masksPanelHeader.setVisibility(8);
            this.masksPanelPager.setVisibility(8);
            this.masksLoadingView.setVisibility(8);
        } else if (masksState == MasksState.LOADING) {
            this.masksLoadingErrorView.setVisibility(8);
            this.masksPanelHeader.setVisibility(8);
            this.masksPanelPager.setVisibility(8);
            this.masksLoadingView.setVisibility(0);
        } else if (masksState == MasksState.MASKS) {
            this.masksLoadingErrorView.setVisibility(8);
            this.masksPanelHeader.setVisibility(0);
            this.masksPanelPager.setVisibility(0);
            this.masksLoadingView.setVisibility(8);
        }
    }

    private void showMasksProgress() {
        forceHideMaskAction(false);
        this.maskProgressHandler.removeMessages(0);
        this.masksProgressShower.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideMasksProgress() {
        if (!this.maskProgressHandler.hasMessages(0)) {
            this.maskProgressHandler.sendMessage(Message.obtain(this.maskProgressHandler, 0));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showAndHideMaskAction(Mask mask, long showDelay) {
        this.maskActionView.setText(mask.userHint);
        this.maskProgressHandler.removeMessages(2);
        this.maskProgressHandler.removeMessages(3);
        this.maskProgressHandler.sendMessageDelayed(Message.obtain(this.maskProgressHandler, 2), showDelay);
        this.maskProgressHandler.sendMessageDelayed(Message.obtain(this.maskProgressHandler, 3), MASK_ACTION_HIDE_DELAY + showDelay);
    }

    private void showMaskAuthor(final Mask mask) {
        if (mask != null && mask.hasAuthor()) {
            this.maskAuthorImage.load(mask.getAuthorAvatarUrl());
            this.maskAuthorName.setText(getString(R.string.masks_author, new Object[]{mask.getAuthorName()}));
            this.maskAuthorView.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.52
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    new ProfileFragment.Builder(mask.ownerId).go(CreateAndEditStoryActivity.this);
                }
            });
            forceHideMaskAction(false);
            this.maskProgressHandler.removeMessages(1);
            this.maskAuthorShower.show();
            return;
        }
        this.maskAuthorImage.clear();
        this.maskAuthorName.setText("");
        this.maskAuthorView.setOnClickListener(null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideMaskAuthorWithDelay(long delay) {
        this.maskProgressHandler.removeMessages(1);
        this.maskProgressHandler.sendMessageDelayed(Message.obtain(this.maskProgressHandler, 1), delay);
    }

    private void forceHideMaskAction(boolean anim) {
        this.maskProgressHandler.removeMessages(2);
        this.maskProgressHandler.removeMessages(3);
        this.maskActionShower.cancelAllRunningAnimations();
        if (anim) {
            this.maskActionShower.hide(true);
            return;
        }
        this.maskActionView.setVisibility(8);
        this.maskActionView.setAlpha(0.0f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openMasksPanel() {
        int neededIndex;
        if (this.masksContainer.selectedMask() != null && (neededIndex = this.masksPagerAdapter.findIndexBySectionId(this.masksContainer.selectedSectionId())) >= 0 && neededIndex != this.masksPanelPager.getCurrentItem()) {
            this.masksPanelPager.setCurrentItem(neededIndex, Math.abs(neededIndex - this.masksPanelPager.getCurrentItem()) <= 1);
        }
        hideCameraTooltip();
        showMasksPanel(true);
        if (this.camera1View != null && this.masksContainer.selectedMask() == null) {
            this.camera1View.setEffect(null);
        }
        if (isMasksAvailable()) {
            registerDisposable(MasksController.getInstance().getEngineModel().subscribe(new Consumer<RxFileDownloader.DownloadEvent>() { // from class: com.vk.stories.CreateAndEditStoryActivity.53
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull RxFileDownloader.DownloadEvent downloadEvent) throws Exception {
                }
            }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.54
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Throwable throwable) throws Exception {
                }
            }));
        }
    }

    private void showMasksPanel(boolean animated) {
        setControlsEnabled(false, false, false);
        this.masksPanelShower.show();
        this.shutterButton.toMasksShutter(animated);
        AnimatorSet set = new AnimatorSet();
        set.playTogether(ObjectAnimator.ofFloat(this.galleryThumbnailContainer, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.switchCamera, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.masksOpenButton, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.masksVerticalPagerIndicator, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.bottomInfoContainer, View.TRANSLATION_Y, -Screen.dp(64)).setDuration(195L));
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.55
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CreateAndEditStoryActivity.this.setInvisible(CreateAndEditStoryActivity.this.galleryThumbnailContainer, CreateAndEditStoryActivity.this.switchCamera, CreateAndEditStoryActivity.this.masksOpenButton);
                CreateAndEditStoryActivity.this.setControlsEnabled(true, false, false);
            }
        });
        set.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideMasksPanel(boolean animated) {
        setControlsEnabled(false, false, false);
        this.masksPanelShower.hide(true);
        this.shutterButton.toPhotoShutter(animated);
        setVisibleNoAlpha(this.switchCamera, this.masksOpenButton);
        if (this.galleryLastEntry != null) {
            setVisibleNoAlpha(this.galleryThumbnailContainer);
        } else {
            setInvisible(this.galleryThumbnailContainer);
        }
        AnimatorSet set = new AnimatorSet();
        set.playTogether(ObjectAnimator.ofFloat(this.galleryThumbnailContainer, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.switchCamera, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.masksOpenButton, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.masksVerticalPagerIndicator, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.bottomInfoContainer, View.TRANSLATION_Y, 0.0f).setDuration(195L));
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.56
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CreateAndEditStoryActivity.this.setControlsEnabled(true, false, false);
                CreateAndEditStoryActivity.this.reloadMaskSections(true);
            }
        });
        set.start();
    }

    public void notifyMasksChanged() {
        for (int i = 0; i < this.masksPanelPager.getChildCount(); i++) {
            MasksView mv = (MasksView) this.masksPanelPager.getChildAt(i);
            mv.notifyDataSetChanged();
        }
    }

    public void checkMaskForUpdates(final Mask mask) {
        Observable<Mask> observable = MasksController.getInstance().checkMaskForUpdates(mask);
        if (observable != null) {
            registerDisposable(observable.subscribe(new Consumer<Mask>() { // from class: com.vk.stories.CreateAndEditStoryActivity.57
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Mask serverMask) throws Exception {
                    if (serverMask.updateTime > mask.updateTime) {
                        CreateAndEditStoryActivity.this.reloadLocalMasks(true);
                    }
                }
            }, new Consumer<Throwable>() { // from class: com.vk.stories.CreateAndEditStoryActivity.58
                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Throwable throwable) throws Exception {
                }
            }));
        }
    }

    public void reloadLocalMasks(boolean reloadSections) {
        this.masksContainer.masksListForSectionId(-1).clear();
        this.masksContainer.masksListForSectionId(-1).addAll(MasksController.getInstance().recentMasks().masks);
        if (reloadSections) {
            reloadMaskSections(true);
        }
        for (int i = 0; i < this.masksPanelPager.getChildCount(); i++) {
            MasksView mv = (MasksView) this.masksPanelPager.getChildAt(i);
            mv.reloadIfLocal();
        }
    }

    public void setSelectedMask(int sectionId, Mask mask) {
        this.masksContainer.selectedMask(mask);
        this.masksContainer.selectedSectionId(sectionId);
        this.masksPagerAdapter.setSelectedMask(mask);
        for (int i = 0; i < this.masksPanelPager.getChildCount(); i++) {
            MasksView mv = (MasksView) this.masksPanelPager.getChildAt(i);
            mv.setSelectedMask(mask);
        }
        onMasksListUpdated(this.masksContainer.selectedSectionId());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean masksPanelVisible() {
        return this.masksPanel != null && this.masksPanel.getVisibility() == 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showNextMask() {
        if (isMasksAvailable() && !isRecording() && this.masksContainer.selectedMask() != null) {
            ArrayList<Mask> selectedMasksSection = this.masksContainer.masksListForSectionId(this.masksContainer.selectedSectionId());
            int currentPosition = selectedMasksSection.indexOf(this.masksContainer.selectedMask());
            for (int i = currentPosition + 1; i < selectedMasksSection.size(); i++) {
                if (i >= 0 && i < selectedMasksSection.size()) {
                    Mask mask = selectedMasksSection.get(i);
                    if (mask.isSupported() && !mask.isDisabled()) {
                        onMaskSelected(this.masksContainer.selectedSectionId(), mask);
                        return;
                    }
                }
            }
            openMasksPanel();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showPrevMask() {
        if (isMasksAvailable() && !isRecording() && this.masksContainer.selectedMask() != null) {
            ArrayList<Mask> selectedMasksSection = this.masksContainer.masksListForSectionId(this.masksContainer.selectedSectionId());
            int currentPosition = selectedMasksSection.indexOf(this.masksContainer.selectedMask());
            for (int i = currentPosition - 1; i >= 0; i--) {
                if (i >= 0 && i < selectedMasksSection.size()) {
                    Mask mask = selectedMasksSection.get(i);
                    if (mask.isSupported() && !mask.isDisabled()) {
                        onMaskSelected(this.masksContainer.selectedSectionId(), mask);
                        return;
                    }
                }
            }
        }
    }

    private void initEditorPartView() {
        this.topButtonsPanel = (FrameLayout) findViewById(R.id.fl_top_buttons_panel);
        this.bottomButtonsPanel = (FrameLayout) findViewById(R.id.fl_bottom_buttons_panel);
        this.shutterButton = (ShutterButton) findViewById(R.id.shutter_button);
        this.previewContainer = (FrameLayout) findViewById(R.id.fl_preview_container);
        this.editorActionsPanel = (FrameLayout) findViewById(R.id.ll_editor_actions_panel);
        this.muteButton = (ImageView) findViewById(R.id.iv_mute);
        this.saveButton = findViewById(R.id.iv_download);
        this.muteButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.59
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                boolean z = true;
                CreateAndEditStoryActivity.this.mute = !CreateAndEditStoryActivity.this.mute;
                if (CreateAndEditStoryActivity.this.videoView != null) {
                    TextureVideoView textureVideoView = CreateAndEditStoryActivity.this.videoView;
                    if (CreateAndEditStoryActivity.this.mute) {
                        z = false;
                    }
                    textureVideoView.setSound(z);
                }
                if (CreateAndEditStoryActivity.this.mute) {
                    CreateAndEditStoryActivity.this.muteButton.setImageResource(R.drawable.ic_unmute_shadow_48dp);
                } else {
                    CreateAndEditStoryActivity.this.muteButton.setImageResource(R.drawable.ic_mute_shadow_48dp);
                }
            }
        });
        this.saveButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.60
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CreateAndEditStoryActivity.this.doSave();
            }
        });
        initActionsUi();
        initDrawingUi();
        initStickersUI();
    }

    private void initActionsUi() {
        this.drawAction = this.bottomButtonsPanel.findViewById(R.id.iv_draw);
        this.stickersAction = this.bottomButtonsPanel.findViewById(R.id.iv_stickers);
        this.textAction = this.bottomButtonsPanel.findViewById(R.id.iv_text);
        this.stickersAction.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.61
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (!CreateAndEditStoryActivity.this.checkButtonLock()) {
                    CreateAndEditStoryActivity.this.onStickerClick();
                }
            }
        });
        this.drawAction.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.62
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (!CreateAndEditStoryActivity.this.checkButtonLock()) {
                    CreateAndEditStoryActivity.this.openDrawing();
                }
            }
        });
        this.textAction.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.63
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (!CreateAndEditStoryActivity.this.checkButtonLock()) {
                    CreateAndEditStoryActivity.this.onTextClick();
                }
            }
        });
    }

    private void initDrawingUi() {
        this.drawingBottomPanel = (FrameLayout) findViewById(R.id.fl_draw_panel);
        this.drawingView = (DrawingView) findViewById(R.id.dv_drawing);
        this.drawingUndoContainer = findViewById(R.id.fl_drawing_undo);
        this.drawingUndoButton = findViewById(R.id.iv_drawing_undo);
        this.colorSelectorView = (ColorSelectorView) findViewById(R.id.ccv_drawing_color_selector);
        this.widthSelectorBtn = (ImageView) findViewById(R.id.iv_drawing_width);
        this.drawingNavPanel = (FrameLayout) findViewById(R.id.fl_draw_nav_panel);
        this.brushPen = (BrushSelectorView) this.drawingNavPanel.findViewById(R.id.bsv_pen);
        this.brushMarker = (BrushSelectorView) this.drawingNavPanel.findViewById(R.id.bsv_marker);
        this.brushNeon = (BrushSelectorView) this.drawingNavPanel.findViewById(R.id.bsv_neon);
        this.drawingCancel = this.drawingNavPanel.findViewById(R.id.iv_cancel);
        this.drawingApply = this.drawingNavPanel.findViewById(R.id.iv_apply);
        this.colorSelectorView.setOnColorSelectedListener(new ColorSelectorView.OnColorSelectedListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.64
            @Override // com.vk.attachpicker.widget.ColorSelectorView.OnColorSelectedListener
            public void onColorSelected(int color) {
                CreateAndEditStoryActivity.this.drawingView.setColor(color);
                CreateAndEditStoryActivity.this.selectBrush(CreateAndEditStoryActivity.this.drawingView.getBrushType());
            }

            @Override // com.vk.attachpicker.widget.ColorSelectorView.OnColorSelectedListener
            public void onBrushTypeSelected(int brushType) {
            }
        });
        this.widthSelectorBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.65
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                WidthSelectorView.show(CreateAndEditStoryActivity.this.widthSelectorBtn, CreateAndEditStoryActivity.this.colorSelectorView.getSelectedColor(), DrawingState.findIntIndex(CreateAndEditStoryActivity.this.drawingView.getWidthMultiplier()), new WidthSelectorView.OnWidthSelectedListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.65.1
                    @Override // com.vk.attachpicker.widget.WidthSelectorView.OnWidthSelectedListener
                    public void onWidthSelected(int widthIndex) {
                        CreateAndEditStoryActivity.this.drawingView.setWidthMultiplier(DrawingState.WIDTH[widthIndex]);
                    }
                });
            }
        });
        this.drawingCancel.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.66
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CreateAndEditStoryActivity.this.cancelDrawing();
            }
        });
        this.drawingApply.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.67
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CreateAndEditStoryActivity.this.closeDrawing();
            }
        });
        this.brushPen.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.68
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CreateAndEditStoryActivity.this.selectBrush(1);
            }
        });
        this.brushMarker.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.69
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CreateAndEditStoryActivity.this.selectBrush(2);
            }
        });
        this.brushNeon.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.70
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CreateAndEditStoryActivity.this.selectBrush(3);
            }
        });
        selectBrush(1);
        this.drawingUndoButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.71
            @Override // android.view.View.OnClickListener
            public void onClick(View v1) {
                CreateAndEditStoryActivity.this.drawingView.undo();
                CreateAndEditStoryActivity.this.drawingUndoButton.setEnabled(CreateAndEditStoryActivity.this.drawingView.getHistorySize() > 0);
            }
        });
        this.drawingUndoButton.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.72
            @Override // android.view.View.OnLongClickListener
            public boolean onLongClick(View v1) {
                CreateAndEditStoryActivity.this.drawingView.clear();
                CreateAndEditStoryActivity.this.drawingUndoButton.setEnabled(false);
                return true;
            }
        });
        this.drawingView.setOnMotionEventListener(new DrawingView.OnMotionEventListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.73
            @Override // com.vk.attachpicker.drawing.DrawingView.OnMotionEventListener
            public void onDown() {
                CreateAndEditStoryActivity.this.drawingUndoButton.setEnabled(CreateAndEditStoryActivity.this.drawingView.getHistorySize() > 0);
                CreateAndEditStoryActivity.this.hideDrawingUI();
            }

            @Override // com.vk.attachpicker.drawing.DrawingView.OnMotionEventListener
            public void onUp() {
                CreateAndEditStoryActivity.this.showDrawingUI();
            }
        });
        this.drawingUndoButton.setEnabled(false);
    }

    private void initStickersUI() {
        this.stickersDrawingView = (StickersDrawingView) findViewById(R.id.sdv_stickers);
        this.stickersDrawingView.addRemoveArea(81, Screen.dp(82), Screen.dp(98));
        this.stickersContainer = (FrameLayout) findViewById(R.id.fl_stickers_container);
        this.stickerDeleteArea = (StickerDeleteAreaView) findViewById(R.id.stickers_delete_area);
        this.stickersDrawingView.setOnStickerMoveListener(new StickersDrawingView.OnStickerMoveListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.74
            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onStartMove() {
                CreateAndEditStoryActivity.this.setControlsEnabled(false, false, false);
                CreateAndEditStoryActivity.this.showDeleteArea();
                CreateAndEditStoryActivity.this.hideEditorUI();
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onEnterRemoveArea() {
                CreateAndEditStoryActivity.this.stickerDeleteArea.openedState();
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onLeaveRemoveArea() {
                CreateAndEditStoryActivity.this.stickerDeleteArea.closedState();
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onUp() {
                CreateAndEditStoryActivity.this.setControlsEnabled(false, true, false);
                CreateAndEditStoryActivity.this.hideDeleteArea();
                if (CreateAndEditStoryActivity.this.currentTextDialog == null) {
                    CreateAndEditStoryActivity.this.showEditorUI();
                }
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onTwoFingerGesture() {
                CreateAndEditStoryActivity.this.setControlsEnabled(false, false, false);
                CreateAndEditStoryActivity.this.hideDeleteArea();
                CreateAndEditStoryActivity.this.hideEditorUI();
            }
        });
        this.stickersDrawingView.setOnTextStickerClickListener(new AnonymousClass75());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.stories.CreateAndEditStoryActivity$75  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass75 implements StickersDrawingView.OnTextStickerClickListener {
        AnonymousClass75() {
        }

        @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnTextStickerClickListener
        public void onClick(final TextSticker textSticker) {
            if (!CreateAndEditStoryActivity.this.checkButtonLock() && CreateAndEditStoryActivity.this.currentTextDialog == null) {
                CreateAndEditStoryActivity.this.hideEditorUI();
                Picker.runDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.75.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (CreateAndEditStoryActivity.this.currentTextDialog != null && CreateAndEditStoryActivity.this.currentTextDialog.isShowing()) {
                            textSticker.setInEditMode(true);
                            CreateAndEditStoryActivity.this.stickersDrawingView.invalidate();
                        }
                    }
                }, 100L);
                CreateAndEditStoryActivity.this.currentTextDialog = new TextStickerDialog(true, true, CreateAndEditStoryActivity.this, textSticker.getText(), textSticker.getColor(), textSticker.getStickerStyle(), new TextStickerDialog.TextStickerDialogCallback() { // from class: com.vk.stories.CreateAndEditStoryActivity.75.2
                    @Override // com.vk.attachpicker.stickers.TextStickerDialog.TextStickerDialogCallback
                    public void onApply(String text, int color, StickerStyle typeface) {
                        if (TextUtils.isEmpty(text)) {
                            CreateAndEditStoryActivity.this.stickersDrawingView.removeStickerView(textSticker);
                        } else {
                            textSticker.setText(text);
                            textSticker.setColor(color);
                            textSticker.setTypeface(typeface);
                        }
                        Picker.runDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.75.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                textSticker.setInEditMode(false);
                                CreateAndEditStoryActivity.this.stickersDrawingView.invalidate();
                            }
                        }, 100L);
                    }
                });
                CreateAndEditStoryActivity.this.currentTextDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.75.3
                    @Override // android.content.DialogInterface.OnDismissListener
                    public void onDismiss(DialogInterface dialog) {
                        CreateAndEditStoryActivity.this.showEditorUI();
                        CreateAndEditStoryActivity.this.currentTextDialog = null;
                        Picker.runDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.75.3.1
                            @Override // java.lang.Runnable
                            public void run() {
                                textSticker.setInEditMode(false);
                                CreateAndEditStoryActivity.this.stickersDrawingView.invalidate();
                            }
                        }, 100L);
                    }
                });
                CreateAndEditStoryActivity.this.currentTextDialog.show();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showDrawingUI() {
        this.drawingBottomPanel.animate().setDuration(195L).setStartDelay(0L).alpha(1.0f).start();
        this.drawingUndoButton.animate().setDuration(195L).setStartDelay(0L).alpha(1.0f).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideDrawingUI() {
        this.drawingBottomPanel.animate().setDuration(195L).setStartDelay(100L).alpha(0.0f).start();
        this.drawingUndoButton.animate().setDuration(195L).setStartDelay(100L).alpha(0.0f).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showEditorUI() {
        this.topButtonsPanel.animate().setDuration(195L).alpha(1.0f).start();
        this.bottomButtonsPanel.animate().setDuration(195L).alpha(1.0f).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideEditorUI() {
        this.topButtonsPanel.animate().setDuration(195L).alpha(0.0f).start();
        this.bottomButtonsPanel.animate().setDuration(195L).alpha(0.0f).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showDeleteArea() {
        this.stickerDeleteArea.setVisibility(0);
        this.stickerDeleteArea.setAlpha(0.0f);
        this.stickerDeleteArea.setProgress(0.0f);
        this.stickerDeleteArea.animate().alpha(1.0f).setInterpolator(AnimationUtils.accelerateInterpolator).setListener(null).setDuration(195L).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideDeleteArea() {
        if (this.stickerDeleteArea.getVisibility() != 8) {
            this.stickerDeleteArea.setAlpha(1.0f);
            this.stickerDeleteArea.animate().alpha(0.0f).setInterpolator(AnimationUtils.accelerateInterpolator).setListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.76
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    CreateAndEditStoryActivity.this.stickerDeleteArea.setVisibility(8);
                }
            }).setDuration(195L).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isRecording() {
        return this.camera1View != null && this.camera1View.isRecording();
    }

    private void startCamera() {
        cancel(this.cameraStartRunnable);
        if (this.camera1View != null) {
            this.camera1View.start();
        } else {
            postDelayed(this.cameraStartRunnable, 300L);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopCamera(boolean keep) {
        cancel(this.cameraStartRunnable);
        if (this.camera1View != null) {
            this.camera1View.stop(keep);
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.vk.stories.CreateAndEditStoryActivity$78] */
    @Override // com.vk.camera.CameraObject.OnPhotoResultListener
    public void onReady(final byte[] jpegData) {
        new AsyncTask<Void, Void, Bitmap>() { // from class: com.vk.stories.CreateAndEditStoryActivity.78
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Bitmap doInBackground(Void... params) {
                try {
                    return BitmapUtils.processCameraBitmap(jpegData, CameraHolder.instance().currentCameraFrontal());
                } catch (Throwable th) {
                    GcTrigger.DEFAULT.runGc();
                    try {
                        return BitmapUtils.processCameraBitmap(jpegData, CameraHolder.instance().currentCameraFrontal());
                    } catch (Throwable th2) {
                        return null;
                    }
                }
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public void onPostExecute(Bitmap bitmap) {
                if (bitmap != null) {
                    CreateAndEditStoryActivity.this.dropState();
                    CreateAndEditStoryActivity.this.retrieveLocation();
                    CreateAndEditStoryActivity.this.imageBitmap = bitmap;
                    CreateAndEditStoryActivity.this.enableResultPreview();
                    CreateAndEditStoryActivity.this.cameraToEditor(true);
                }
            }
        }.execute(new Void[0]);
    }

    private void takePhoto() {
        if (this.camera1View != null) {
            this.camera1View.takePicture();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startRecording() {
        if (this.camera1View != null) {
            this.camera1View.startRecording();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopRecording() {
        if (this.camera1View != null) {
            this.camera1View.stopRecording();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onVideoFileReady(final File video) {
        this.handler.postDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.79
            @Override // java.lang.Runnable
            public void run() {
                CreateAndEditStoryActivity.this.dropState();
                CreateAndEditStoryActivity.this.videoFile = video;
                CreateAndEditStoryActivity.this.mirror = CameraHolder.instance().currentCameraFrontal();
                CreateAndEditStoryActivity.this.mute = false;
                CreateAndEditStoryActivity.this.enableResultPreview();
                CreateAndEditStoryActivity.this.cameraToEditor(true);
                CreateAndEditStoryActivity.this.retrieveLocation();
            }
        }, 100L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cameraActionTakePhoto() {
        if (!this.cameraActionLock.isLocked() && this.screenState == ScreenState.CAMERA) {
            this.cameraActionLock.lock();
            takePhoto();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cameraActionStartRecording() {
        if (!this.cameraActionLock.isLocked() && this.screenState == ScreenState.CAMERA) {
            this.cameraActionLock.lock();
            setVideoRecording(true, true);
            this.shutterButton.toRecordingShutter(true).addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.80
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    CreateAndEditStoryActivity.this.startRecording();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cameraActionStopRecording() {
        if (this.camera1View != null && this.camera1View.isRecording()) {
            stopRecording();
        }
    }

    private void dispatchVolumeButton(int action) {
        if (action != this.volumeButtonLastAction) {
            long elapsed = SystemClock.elapsedRealtime();
            cancel(this.onVolumeButtonLongClick);
            if (action == 0) {
                postDelayed(this.onVolumeButtonLongClick, 200L);
            } else if (action == 1) {
                if (elapsed - this.volumeButtonLastActionTime < 200) {
                    cameraActionTakePhoto();
                } else {
                    cameraActionStopRecording();
                }
            }
            this.volumeButtonLastAction = action;
            this.volumeButtonLastActionTime = elapsed;
        }
    }

    private void resetVolumeButtonAction() {
        this.volumeButtonLastAction = -1;
        this.volumeButtonLastActionTime = -1L;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ShutterButtonOnTouchListener extends GestureDetector.SimpleOnGestureListener implements View.OnTouchListener {
        boolean confirmedLongTap;
        private float downY;
        private float prevY;
        final StoriesGestureDetectorCompat storiesGestureDetectorCompat;
        private final float fullZoomDistance = Screen.dp((int) AnimationUtils.DELAY_MID);
        private final float zoomThreshold = Screen.dp(32);
        private boolean enabled = true;

        public ShutterButtonOnTouchListener(Context context) {
            this.storiesGestureDetectorCompat = new StoriesGestureDetectorCompat(context, this);
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            if (!this.enabled) {
                return true;
            }
            int action = event.getAction() & 255;
            if (action == 0 && !CreateAndEditStoryActivity.this.shutterButton.canHandleTouch(event)) {
                return false;
            }
            if (action == 0) {
                this.downY = event.getY();
                CreateAndEditStoryActivity.this.hideCameraTooltip();
                CreateAndEditStoryActivity.this.shutterButton.setPressed(true);
            } else if (action == 1 || action == 3) {
                CreateAndEditStoryActivity.this.shutterButton.setPressed(false);
            }
            if (this.confirmedLongTap && ((action == 3 || action == 1) && CreateAndEditStoryActivity.this.camera1View != null && CreateAndEditStoryActivity.this.camera1View.isRecording())) {
                CreateAndEditStoryActivity.this.cameraActionStopRecording();
            }
            if (action == 3 || action == 1) {
                this.confirmedLongTap = false;
            }
            this.storiesGestureDetectorCompat.onTouchEvent(event);
            if (CreateAndEditStoryActivity.this.camera1View != null && CreateAndEditStoryActivity.this.camera1View.isRecording() && this.downY - event.getY() >= this.zoomThreshold) {
                float zoomDelta = (-(event.getY() - this.prevY)) / this.fullZoomDistance;
                CreateAndEditStoryActivity.this.camera1View.setZoomLevel(CreateAndEditStoryActivity.this.camera1View.getZoomLevel() + zoomDelta);
            }
            this.prevY = event.getY();
            return true;
        }

        public boolean isConfirmedLongTap() {
            return this.confirmedLongTap;
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onDown(MotionEvent e) {
            return true;
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public void onShowPress(MotionEvent e) {
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
        public boolean onDoubleTap(MotionEvent e) {
            if (CreateAndEditStoryActivity.this.screenState == ScreenState.CAMERA) {
                CreateAndEditStoryActivity.this.cameraActionStartRecording();
                return true;
            }
            return true;
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
        public boolean onSingleTapConfirmed(MotionEvent e) {
            if (CreateAndEditStoryActivity.this.screenState == ScreenState.CAMERA) {
                if (CreateAndEditStoryActivity.this.camera1View == null || !CreateAndEditStoryActivity.this.camera1View.isRecording()) {
                    if (CreateAndEditStoryActivity.this.camera1View != null) {
                        CreateAndEditStoryActivity.this.cameraActionTakePhoto();
                        return true;
                    }
                    return true;
                }
                CreateAndEditStoryActivity.this.cameraActionStopRecording();
                return true;
            }
            CreateAndEditStoryActivity.this.doShare();
            return true;
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
            return false;
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public void onLongPress(MotionEvent e) {
            this.confirmedLongTap = true;
            if (CreateAndEditStoryActivity.this.screenState == ScreenState.CAMERA) {
                CreateAndEditStoryActivity.this.cameraActionStartRecording();
            } else if (CreateAndEditStoryActivity.this.screenState == ScreenState.EDITOR) {
                CreateAndEditStoryActivity.this.doShare();
            }
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
            return false;
        }

        public boolean isEnabled() {
            return this.enabled;
        }

        public void setEnabled(boolean enabled) {
            this.enabled = enabled;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVideoRecording(boolean animated, boolean isRecording) {
        if (animated) {
            this.masksPanelShower.hide(true);
            this.maskAuthorShower.hide(true);
            this.maskActionShower.hide(true);
            AnimatorSet set = new AnimatorSet();
            if (isRecording) {
                this.shutterButton.setRedProgress(0.0f);
                AnimatorSet set1 = new AnimatorSet();
                set1.playTogether(ObjectAnimator.ofFloat(this.closeButton, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.flashButton, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.settingsButton, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.galleryThumbnailContainer, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.switchCamera, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.masksOpenButton, View.ALPHA, 0.0f).setDuration(195L), ObjectAnimator.ofFloat(this.masksVerticalPagerIndicator, View.ALPHA, 0.0f).setDuration(195L));
                set.playSequentially(set1);
            } else {
                AnimatorSet set2 = new AnimatorSet();
                set2.playTogether(ObjectAnimator.ofFloat(this.closeButton, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.flashButton, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.settingsButton, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.galleryThumbnailContainer, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.masksOpenButton, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.masksVerticalPagerIndicator, View.ALPHA, 1.0f).setDuration(195L), ObjectAnimator.ofFloat(this.switchCamera, View.ALPHA, 1.0f).setDuration(195L));
                set.playSequentially(set2);
            }
            set.start();
        } else if (isRecording) {
            this.masksPanel.setVisibility(8);
            this.closeButton.setAlpha(0.0f);
            this.flashButton.setAlpha(0.0f);
            this.settingsButton.setAlpha(0.0f);
            this.galleryThumbnailContainer.setAlpha(0.0f);
            this.masksPanel.setAlpha(0.0f);
            this.switchCamera.setAlpha(0.0f);
            this.masksOpenButton.setAlpha(0.0f);
            this.masksVerticalPagerIndicator.setAlpha(0.0f);
            this.maskAuthorView.setAlpha(0.0f);
        } else {
            this.closeButton.setAlpha(1.0f);
            this.flashButton.setAlpha(1.0f);
            this.settingsButton.setAlpha(1.0f);
            this.galleryThumbnailContainer.setAlpha(1.0f);
            this.masksPanel.setAlpha(1.0f);
            this.switchCamera.setAlpha(1.0f);
            this.masksOpenButton.setAlpha(1.0f);
            this.masksVerticalPagerIndicator.setAlpha(1.0f);
            this.maskAuthorView.setAlpha(0.0f);
            this.maskActionView.setAlpha(0.0f);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean checkButtonLock() {
        if (this.buttonClickLock.isLocked()) {
            return true;
        }
        this.buttonClickLock.lock();
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void selectBrush(int brushType) {
        this.drawingView.setBrushType(brushType);
        if (brushType == 1) {
            this.brushPen.setColor(this.drawingView.getColor());
            this.brushMarker.setColorNone();
            this.brushNeon.setColorNone();
        } else if (brushType == 2) {
            this.brushPen.setColorNone();
            this.brushMarker.setColor(this.drawingView.getColor());
            this.brushNeon.setColorNone();
        } else if (brushType == 3) {
            this.brushPen.setColorNone();
            this.brushMarker.setColorNone();
            this.brushNeon.setColor(this.drawingView.getColor());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelDrawing() {
        this.drawingView.restoreState();
        closeDrawing();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVisibleNoAlpha(View... v) {
        for (int i = 0; i < v.length; i++) {
            if (v[i] != null) {
                v[i].setAlpha(0.0f);
                v[i].setVisibility(0);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setInvisible(View... v) {
        for (int i = 0; i < v.length; i++) {
            if (v[i] != null) {
                v[i].setVisibility(8);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cameraToEditor(boolean animated) {
        this.screenState = ScreenState.EDITOR;
        hideCameraTooltip();
        this.masksStatistics.flush();
        if (animated) {
            setControlsEnabled(false, false, false);
            this.masksPanelShower.hide(true);
            this.maskAuthorShower.hide(true);
            this.maskActionShower.hide(true);
            AnimatorSet set1 = new AnimatorSet();
            set1.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.flashButton, View.ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.settingsButton, View.ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.switchCamera, View.ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.galleryThumbnailContainer, View.ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.masksOpenButton, View.ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.bottomInfoContainer, View.TRANSLATION_Y, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.masksVerticalPagerIndicator, View.ALPHA, 0.0f).setDuration(195L)));
            set1.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.81
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    if (CreateAndEditStoryActivity.this.videoFile != null) {
                        CreateAndEditStoryActivity.this.muteButton.setImageResource(R.drawable.ic_mute_shadow_48dp);
                        CreateAndEditStoryActivity.this.setVisibleNoAlpha(CreateAndEditStoryActivity.this.muteButton, CreateAndEditStoryActivity.this.saveButton, CreateAndEditStoryActivity.this.editorActionsPanel);
                    } else {
                        CreateAndEditStoryActivity.this.setVisibleNoAlpha(CreateAndEditStoryActivity.this.saveButton, CreateAndEditStoryActivity.this.editorActionsPanel);
                    }
                    CreateAndEditStoryActivity.this.setInvisible(CreateAndEditStoryActivity.this.settingsButton, CreateAndEditStoryActivity.this.flashButton, CreateAndEditStoryActivity.this.switchCamera, CreateAndEditStoryActivity.this.galleryThumbnailContainer, CreateAndEditStoryActivity.this.masksOpenButton, CreateAndEditStoryActivity.this.masksVerticalPagerIndicator);
                }
            });
            AnimatorSet set2 = new AnimatorSet();
            set2.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.closeButton, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.muteButton, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.saveButton, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.editorActionsPanel, View.ALPHA, 1.0f).setDuration(195L)));
            AnimatorSet set = new AnimatorSet();
            set.playSequentially(set1, set2);
            set.start();
            this.shutterButton.toArrowShutter(true).addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.82
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    CreateAndEditStoryActivity.this.stopCamera(true);
                    CreateAndEditStoryActivity.this.setControlsEnabled(false, true, false);
                    CreateAndEditStoryActivity.this.setDrawingTouches(true, false);
                }
            });
            return;
        }
        this.masksPanel.setVisibility(8);
        if (this.videoFile != null) {
            this.muteButton.setImageResource(R.drawable.ic_mute_shadow_48dp);
            setVisibleNoAlpha(this.muteButton, this.saveButton, this.editorActionsPanel);
        } else {
            setVisibleNoAlpha(this.saveButton, this.editorActionsPanel);
        }
        setInvisible(this.settingsButton, this.flashButton, this.switchCamera, this.galleryThumbnailContainer, this.masksOpenButton, this.masksVerticalPagerIndicator, this.maskAuthorView, this.maskActionView);
        this.closeButton.setAlpha(1.0f);
        this.muteButton.setAlpha(1.0f);
        this.saveButton.setAlpha(1.0f);
        this.editorActionsPanel.setAlpha(1.0f);
        this.shutterButton.toArrowShutter(false);
        stopCamera(true);
        setControlsEnabled(false, true, false);
        setDrawingTouches(true, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void editorToCamera(final Runnable onFinish) {
        this.screenState = ScreenState.CAMERA;
        setDrawingTouches(false, false);
        setControlsEnabled(false, false, false);
        reloadMaskSections(true);
        resetVolumeButtonAction();
        startCamera();
        this.editorStatistics.clear();
        this.masksStatistics.clear();
        AnimatorSet set1 = new AnimatorSet();
        set1.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.muteButton, View.ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.saveButton, View.ALPHA, 0.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.editorActionsPanel, View.ALPHA, 0.0f).setDuration(195L)));
        set1.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.83
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CreateAndEditStoryActivity.this.setVisibleNoAlpha(CreateAndEditStoryActivity.this.settingsButton, CreateAndEditStoryActivity.this.switchCamera);
                CreateAndEditStoryActivity.this.setInvisible(CreateAndEditStoryActivity.this.muteButton, CreateAndEditStoryActivity.this.saveButton, CreateAndEditStoryActivity.this.editorActionsPanel);
                if (CreateAndEditStoryActivity.this.flashVisible) {
                    CreateAndEditStoryActivity.this.setVisibleNoAlpha(CreateAndEditStoryActivity.this.flashButton);
                } else {
                    CreateAndEditStoryActivity.this.setInvisible(CreateAndEditStoryActivity.this.flashButton);
                }
                if (CreateAndEditStoryActivity.this.isMasksAvailable()) {
                    CreateAndEditStoryActivity.this.setVisibleNoAlpha(CreateAndEditStoryActivity.this.masksOpenButton);
                } else {
                    CreateAndEditStoryActivity.this.setInvisible(CreateAndEditStoryActivity.this.masksOpenButton);
                }
                if (!CreateAndEditStoryActivity.this.isMasksAvailable() || !CreateAndEditStoryActivity.this.masksIndicatorShouldBeVisible()) {
                    CreateAndEditStoryActivity.this.setInvisible(CreateAndEditStoryActivity.this.masksVerticalPagerIndicator);
                } else {
                    CreateAndEditStoryActivity.this.setVisibleNoAlpha(CreateAndEditStoryActivity.this.masksVerticalPagerIndicator);
                }
                if (CreateAndEditStoryActivity.this.galleryLastEntry != null) {
                    CreateAndEditStoryActivity.this.setVisibleNoAlpha(CreateAndEditStoryActivity.this.galleryThumbnailContainer);
                } else {
                    CreateAndEditStoryActivity.this.setInvisible(CreateAndEditStoryActivity.this.galleryThumbnailContainer);
                }
            }
        });
        AnimatorSet set2 = new AnimatorSet();
        set2.playTogether(AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.flashButton, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.settingsButton, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.switchCamera, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.galleryThumbnailContainer, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.masksOpenButton, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.masksVerticalPagerIndicator, View.ALPHA, 1.0f).setDuration(195L)), AnimationUtils.standartCurve(ObjectAnimator.ofFloat(this.bottomInfoContainer, View.TRANSLATION_Y, 0.0f).setDuration(195L)));
        AnimatorSet set = new AnimatorSet();
        set.playSequentially(set1, set2);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.84
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                if (onFinish != null) {
                    onFinish.run();
                }
                CreateAndEditStoryActivity.this.setControlsEnabled(true, false, false);
                CreateAndEditStoryActivity.this.showLastPhotoVideoIcon();
            }
        });
        set.start();
        this.shutterButton.toPhotoShutter(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openDrawing() {
        this.screenState = ScreenState.DRAWING;
        this.drawingUndoButton.setEnabled(this.drawingView.getHistorySize() > 0);
        this.drawingView.saveState();
        setControlsEnabled(false, false, false);
        this.bottomButtonsPanel.setTranslationY(0.0f);
        this.bottomButtonsPanel.setVisibility(0);
        this.topButtonsPanel.setAlpha(1.0f);
        this.topButtonsPanel.setVisibility(0);
        AnimatorSet set1 = new AnimatorSet();
        set1.playTogether(ObjectAnimator.ofFloat(this.bottomButtonsPanel, View.TRANSLATION_Y, SMALL_PANEL_HEIGHT), ObjectAnimator.ofFloat(this.topButtonsPanel, View.ALPHA, 0.0f));
        set1.setInterpolator(AnimationUtils.accelerateInterpolator);
        set1.setDuration(175L);
        set1.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.85
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CreateAndEditStoryActivity.this.bottomButtonsPanel.setVisibility(8);
                CreateAndEditStoryActivity.this.topButtonsPanel.setVisibility(8);
                CreateAndEditStoryActivity.this.drawingBottomPanel.setTranslationY(CreateAndEditStoryActivity.SMALL_PANEL_HEIGHT);
                CreateAndEditStoryActivity.this.drawingBottomPanel.setVisibility(0);
                CreateAndEditStoryActivity.this.drawingUndoContainer.setAlpha(0.0f);
                CreateAndEditStoryActivity.this.drawingUndoContainer.setVisibility(0);
            }
        });
        AnimatorSet set2 = new AnimatorSet();
        set2.playTogether(ObjectAnimator.ofFloat(this.drawingBottomPanel, View.TRANSLATION_Y, 0.0f), ObjectAnimator.ofFloat(this.drawingUndoContainer, View.ALPHA, 1.0f));
        set2.setInterpolator(AnimationUtils.decelerateInterpolator);
        set2.setDuration(175L);
        AnimatorSet set = new AnimatorSet();
        set.playSequentially(set1, set2);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.86
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CreateAndEditStoryActivity.this.setDrawingTouches(false, true);
                CreateAndEditStoryActivity.this.setControlsEnabled(false, false, true);
            }
        });
        set.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeDrawing() {
        this.screenState = ScreenState.EDITOR;
        trackDraw(false);
        setControlsEnabled(false, false, false);
        this.drawingBottomPanel.setTranslationY(0.0f);
        this.drawingBottomPanel.setVisibility(0);
        this.topButtonsPanel.setVisibility(8);
        this.bottomButtonsPanel.setVisibility(8);
        AnimatorSet set1 = new AnimatorSet();
        set1.playTogether(ObjectAnimator.ofFloat(this.drawingBottomPanel, View.TRANSLATION_Y, SMALL_PANEL_HEIGHT), ObjectAnimator.ofFloat(this.drawingUndoContainer, View.ALPHA, 0.0f));
        set1.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.87
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CreateAndEditStoryActivity.this.drawingBottomPanel.setVisibility(8);
                CreateAndEditStoryActivity.this.drawingUndoContainer.setVisibility(8);
                CreateAndEditStoryActivity.this.bottomButtonsPanel.setVisibility(0);
                CreateAndEditStoryActivity.this.bottomButtonsPanel.setTranslationY(CreateAndEditStoryActivity.SMALL_PANEL_HEIGHT);
                CreateAndEditStoryActivity.this.topButtonsPanel.setVisibility(0);
                CreateAndEditStoryActivity.this.topButtonsPanel.setAlpha(0.0f);
            }
        });
        set1.setInterpolator(AnimationUtils.accelerateInterpolator);
        set1.setDuration(175L);
        AnimatorSet set2 = new AnimatorSet();
        set2.playTogether(ObjectAnimator.ofFloat(this.bottomButtonsPanel, View.TRANSLATION_Y, 0.0f), ObjectAnimator.ofFloat(this.topButtonsPanel, View.ALPHA, 1.0f));
        set2.setInterpolator(AnimationUtils.decelerateInterpolator);
        set2.setDuration(175L);
        AnimatorSet set = new AnimatorSet();
        set.playSequentially(set1, set2);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.88
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CreateAndEditStoryActivity.this.setDrawingTouches(true, false);
                CreateAndEditStoryActivity.this.setControlsEnabled(false, true, false);
            }
        });
        set.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideStickers() {
        this.screenState = ScreenState.EDITOR;
        if (this.stickersView != null && this.stickersView.getVisibility() != 8) {
            this.stickersView.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.CreateAndEditStoryActivity.89
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    CreateAndEditStoryActivity.this.stickersView.setVisibility(8);
                }
            }).setDuration(200L).start();
            showEditorUI();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onStickerClick() {
        this.screenState = ScreenState.STICKERS_SELECTION;
        if (this.stickersView == null) {
            this.stickersView = new EditorStickerView(this, this.stickerListener);
            this.stickersView.setTopPadding(0);
            this.stickersContainer.addView(this.stickersView);
        }
        this.stickersView.setAlpha(0.0f);
        this.stickersView.setVisibility(0);
        this.stickersView.checkSelection();
        postDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.90
            @Override // java.lang.Runnable
            public void run() {
                CreateAndEditStoryActivity.this.stickersView.animate().alpha(1.0f).setListener(null).setDuration(200L).start();
                CreateAndEditStoryActivity.this.hideEditorUI();
            }
        }, 32L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onTextClick() {
        if (this.currentTextDialog == null) {
            hideEditorUI();
            this.currentTextDialog = new TextStickerDialog(true, true, this, new TextStickerDialog.TextStickerDialogCallback() { // from class: com.vk.stories.CreateAndEditStoryActivity.91
                @Override // com.vk.attachpicker.stickers.TextStickerDialog.TextStickerDialogCallback
                public void onApply(String text, int color, StickerStyle typeface) {
                    if (!TextUtils.isEmpty(text)) {
                        CreateAndEditStoryActivity.this.stickersDrawingView.addStickerView(new TextSticker(CreateAndEditStoryActivity.this.stickersDrawingView.getMeasuredWidth() - Screen.dp(64), text, color, typeface));
                        CreateAndEditStoryActivity.this.trackText(false);
                    }
                }
            });
            this.currentTextDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.vk.stories.CreateAndEditStoryActivity.92
                @Override // android.content.DialogInterface.OnDismissListener
                public void onDismiss(DialogInterface dialog) {
                    CreateAndEditStoryActivity.this.showEditorUI();
                    CreateAndEditStoryActivity.this.currentTextDialog = null;
                }
            });
            this.currentTextDialog.show();
        }
    }

    public void post(Runnable r) {
        this.handler.post(r);
    }

    public void postDelayed(Runnable r, long delay) {
        this.handler.postDelayed(r, delay);
    }

    public void cancel(Runnable r) {
        this.handler.removeCallbacks(r);
    }

    private void flushStatistics() {
        trackStickers(true);
        trackEmoji(true);
        trackText(true);
        if (!this.drawingView.isDefault()) {
            trackDraw(true);
        }
        this.editorStatistics.flush();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void trackStickers(final boolean isFinal) {
        Picker.runDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.94
            @Override // java.lang.Runnable
            public void run() {
                ArrayList<String> stickerIds = new ArrayList<>();
                ArrayList<Sticker> stickers = CreateAndEditStoryActivity.this.stickersDrawingView.getDrawingState().getStickers();
                Iterator<Sticker> it = stickers.iterator();
                while (it.hasNext()) {
                    Sticker s = it.next();
                    if (s instanceof BitmapSticker) {
                        BitmapSticker bs = (BitmapSticker) s;
                        if (bs.getMetaInfo() != null) {
                            stickerIds.add(bs.getMetaInfo());
                        }
                    }
                }
                if (stickerIds.size() > 0) {
                    CreateAndEditStoryActivity.this.editorStatistics.logStickers(stickerIds, isFinal);
                }
            }
        }, 100L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void trackEmoji(final boolean isFinal) {
        Picker.runDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.95
            @Override // java.lang.Runnable
            public void run() {
                ArrayList<Sticker> stickers = CreateAndEditStoryActivity.this.stickersDrawingView.getDrawingState().getStickers();
                Iterator<Sticker> it = stickers.iterator();
                while (it.hasNext()) {
                    Sticker s = it.next();
                    if (s instanceof BitmapSticker) {
                        BitmapSticker bs = (BitmapSticker) s;
                        if (bs.getMetaInfo() == null) {
                            CreateAndEditStoryActivity.this.editorStatistics.logEmoji(isFinal);
                            return;
                        }
                    }
                }
            }
        }, 100L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void trackText(final boolean isFinal) {
        Picker.runDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.96
            @Override // java.lang.Runnable
            public void run() {
                ArrayList<Sticker> stickers = CreateAndEditStoryActivity.this.stickersDrawingView.getDrawingState().getStickers();
                Iterator<Sticker> it = stickers.iterator();
                while (it.hasNext()) {
                    Sticker s = it.next();
                    if (s instanceof TextSticker) {
                        CreateAndEditStoryActivity.this.editorStatistics.logText(isFinal);
                    }
                }
            }
        }, 100L);
    }

    private void trackDraw(final boolean isFinal) {
        Picker.runDelayed(new Runnable() { // from class: com.vk.stories.CreateAndEditStoryActivity.97
            @Override // java.lang.Runnable
            public void run() {
                CreateAndEditStoryActivity.this.editorStatistics.logDraw(isFinal);
            }
        }, 100L);
    }
}
