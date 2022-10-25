.class public Lcom/vk/stories/CreateAndEditStoryActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/camera/CameraObject$OnPhotoResultListener;
.implements Lcom/vk/masks/MasksView$OnMaskSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;,
        Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;,
        Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;
    }
.end annotation


# static fields
.field private static final HOURS_24:J = 0x5265c00L

.field public static final INTENT_OPEN_MASK:Ljava/lang/String; = "open_mask"

.field private static final INTENT_REQUEST_EXTERNAL_PHOTO:I = 0x1

.field private static final INTENT_REQUEST_SETTINGS:I = 0x3

.field private static final INTENT_REQUEST_SHARE_DEST:I = 0x2

.field private static final MASK_ACTION_HIDE_DELAY:J = 0xbb8L

.field private static final MASK_AUTHOR_HIDE_DELAY:J = 0x7d0L

.field private static final MESSAGE_HIDE_MASK_ACTION:I = 0x3

.field private static final MESSAGE_HIDE_MASK_AUTHOR:I = 0x1

.field private static final MESSAGE_HIDE_MASK_PROGRESS:I = 0x0

.field private static final MESSAGE_SHOW_MASK_ACTION:I = 0x2

.field private static final SCREEN_OPEN_DURATION:J = 0x15eL

.field private static final SMALL_PANEL_HEIGHT:I

.field private static final TAG:Ljava/lang/String;

.field private static final VOLUME_BUTTON_LONG_CLICK_DURATION:I = 0xc8


# instance fields
.field private bottomButtonsPanel:Landroid/widget/FrameLayout;

.field private bottomInfoContainer:Landroid/view/View;

.field private brushMarker:Lcom/vk/stories/view/BrushSelectorView;

.field private brushNeon:Lcom/vk/stories/view/BrushSelectorView;

.field private brushPen:Lcom/vk/stories/view/BrushSelectorView;

.field private final buttonClickLock:Lcom/vk/core/util/TimeoutLock;

.field private camera1View:Lcom/vk/camera/camera1/Camera1View;

.field private final cameraActionLock:Lcom/vk/core/util/TimeoutLock;

.field private cameraContainer:Landroid/widget/FrameLayout;

.field private final cameraStartRunnable:Ljava/lang/Runnable;

.field private cameraTooltip:Landroid/view/View;

.field private cameraTooltipShower:Lcom/vk/core/widget/ViewShower;

.field private captureLocation:Landroid/location/Location;

.field private closeButton:Landroid/widget/ImageView;

.field private colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

.field private controlsEnabled:Z

.field private currentMaskDownload:Lio/reactivex/disposables/Disposable;

.field private currentProgressDialog:Landroid/app/Dialog;

.field private currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

.field private final disableResultPreviewBlackBackground:Ljava/lang/Runnable;

.field private drawAction:Landroid/view/View;

.field private drawingApply:Landroid/view/View;

.field private drawingBottomPanel:Landroid/widget/FrameLayout;

.field private drawingCancel:Landroid/view/View;

.field private drawingNavPanel:Landroid/widget/FrameLayout;

.field private drawingUndoButton:Landroid/view/View;

.field private drawingUndoContainer:Landroid/view/View;

.field private drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

.field private editorActionsPanel:Landroid/widget/FrameLayout;

.field private final editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

.field private final enableResultPreviewBlackBackground:Ljava/lang/Runnable;

.field private flashButton:Landroid/widget/ImageView;

.field private flashVisible:Z

.field private galleryLastEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

.field private galleryThumbnail:Landroid/widget/ImageView;

.field private galleryThumbnailContainer:Landroid/view/View;

.field private final handler:Landroid/os/Handler;

.field private imageBitmap:Landroid/graphics/Bitmap;

.field private imageView:Lcom/vk/imageloader/view/VKImageView;

.field private isDestroyed:Z

.field private locationRetrieveAsyncTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation
.end field

.field private maskActionShower:Lcom/vk/core/widget/ViewShower;

.field private maskActionView:Landroid/widget/TextView;

.field private maskAuthorImage:Lcom/vk/imageloader/view/VKImageView;

.field private maskAuthorName:Landroid/widget/TextView;

.field private maskAuthorShower:Lcom/vk/core/widget/ViewShower;

.field private maskAuthorView:Landroid/view/View;

.field private maskClearButton:Landroid/view/View;

.field private maskProgressContainer:Landroid/view/View;

.field private final maskProgressHandler:Landroid/os/Handler;

.field private final masksContainer:Lcom/vk/masks/MasksContainer;

.field private masksLoadingErrorView:Landroid/view/View;

.field private masksLoadingView:Landroid/view/View;

.field private masksOpenButton:Landroid/view/View;

.field private masksPagerAdapter:Lcom/vk/masks/MasksPagerAdapter;

.field private masksPanel:Landroid/widget/LinearLayout;

.field private masksPanelHeader:Lcom/vk/masks/MaskTabsIndicator;

.field private masksPanelPager:Landroid/support/v4/view/ViewPager;

.field private masksPanelShower:Lcom/vk/core/widget/ViewShower;

.field private masksProgressBar:Lcom/vkontakte/android/ui/CircularProgressView;

.field private masksProgressShower:Lcom/vk/core/widget/ViewShower;

.field private final masksStatistics:Lcom/vk/masks/MasksAnalytics;

.field private masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

.field private mirror:Z

.field private mute:Z

.field private muteButton:Landroid/widget/ImageView;

.field private newMasksBadge:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

.field private onCameraTouchListener:Landroid/view/View$OnTouchListener;

.field private final onVolumeButtonLongClick:Ljava/lang/Runnable;

.field private parentView:Landroid/widget/FrameLayout;

.field private previewContainer:Landroid/widget/FrameLayout;

.field private saveButton:Landroid/view/View;

.field private screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

.field private settingsButton:Landroid/widget/ImageView;

.field private final showProgressDialogRunnable:Ljava/lang/Runnable;

.field private shutterButton:Lcom/vk/stories/view/ShutterButton;

.field private shutterButtonOnTouchListener:Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;

.field private stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

.field private final stickerListener:Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

.field private stickersAction:Landroid/view/View;

.field private stickersContainer:Landroid/widget/FrameLayout;

.field private stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

.field private stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

.field private switchCamera:Landroid/widget/ImageView;

.field private textAction:Landroid/view/View;

.field private topButtonsPanel:Landroid/widget/FrameLayout;

.field private videoFile:Ljava/io/File;

.field private videoPreview:Landroid/graphics/Bitmap;

.field private videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

.field private volumeButtonLastAction:I

.field private volumeButtonLastActionTime:J

.field private widthSelectorBtn:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 134
    const-class v0, Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity;->TAG:Ljava/lang/String;

    .line 141
    const/16 v0, 0x60

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/stories/CreateAndEditStoryActivity;->SMALL_PANEL_HEIGHT:I

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x1f4

    .line 130
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 159
    invoke-static {}, Lcom/vk/attachpicker/EditorAnalytics;->storiesAnalytics()Lcom/vk/attachpicker/EditorAnalytics;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    .line 160
    invoke-static {}, Lcom/vk/masks/MasksAnalytics;->masksAnalytics()Lcom/vk/masks/MasksAnalytics;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksStatistics:Lcom/vk/masks/MasksAnalytics;

    .line 162
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    .line 163
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->buttonClickLock:Lcom/vk/core/util/TimeoutLock;

    .line 164
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionLock:Lcom/vk/core/util/TimeoutLock;

    .line 167
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 171
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$1;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->showProgressDialogRunnable:Ljava/lang/Runnable;

    .line 189
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->volumeButtonLastAction:I

    .line 190
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->volumeButtonLastActionTime:J

    .line 191
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$2;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$2;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->onVolumeButtonLongClick:Ljava/lang/Runnable;

    .line 275
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$3;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity$3;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    .line 293
    new-instance v0, Lcom/vk/masks/MasksContainer;

    invoke-direct {v0}, Lcom/vk/masks/MasksContainer;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    .line 538
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$10;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$10;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreviewBlackBackground:Ljava/lang/Runnable;

    .line 545
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$11;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$11;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->disableResultPreviewBlackBackground:Ljava/lang/Runnable;

    .line 2222
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$77;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraStartRunnable:Ljava/lang/Runnable;

    .line 3004
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$93;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$93;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerListener:Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/app/Dialog;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentProgressDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Landroid/app/Dialog;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentProgressDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->editorToCamera(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$10000(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->stopCamera(Z)V

    return-void
.end method

.method static synthetic access$10100(Lcom/vk/stories/CreateAndEditStoryActivity;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Lcom/vk/stories/CreateAndEditStoryActivity;->setDrawingTouches(ZZ)V

    return-void
.end method

.method static synthetic access$10200(Lcom/vk/stories/CreateAndEditStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashVisible:Z

    return v0
.end method

.method static synthetic access$10300(Lcom/vk/stories/CreateAndEditStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->masksIndicatorShouldBeVisible()Z

    move-result v0

    return v0
.end method

.method static synthetic access$10400(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showLastPhotoVideoIcon()V

    return-void
.end method

.method static synthetic access$10500(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$10600(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$10700()I
    .locals 1

    .prologue
    .line 130
    sget v0, Lcom/vk/stories/CreateAndEditStoryActivity;->SMALL_PANEL_HEIGHT:I

    return v0
.end method

.method static synthetic access$10800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingBottomPanel:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$10900(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoContainer:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$11000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/EditorStickerView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$11100(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->trackText(Z)V

    return-void
.end method

.method static synthetic access$11200(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideStickers()V

    return-void
.end method

.method static synthetic access$11300(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->trackEmoji(Z)V

    return-void
.end method

.method static synthetic access$11400(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->trackStickers(Z)V

    return-void
.end method

.method static synthetic access$1200(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/location/Location;)Landroid/location/Location;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Landroid/location/Location;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->captureLocation:Landroid/location/Location;

    return-object p1
.end method

.method static synthetic access$1402(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/os/AsyncTask;)Landroid/os/AsyncTask;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Landroid/os/AsyncTask;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->locationRetrieveAsyncTask:Landroid/os/AsyncTask;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/EditorAnalytics;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/widget/TextureVideoView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initVideoPreview()V

    return-void
.end method

.method static synthetic access$1800(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideProgressDialog()V

    return-void
.end method

.method static synthetic access$1900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/model/StoryUploadParams;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->storyUploadParams()Lcom/vk/stories/model/StoryUploadParams;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setCameraButtonEnabled(Z)V

    return-void
.end method

.method static synthetic access$2000(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideCameraTooltip()V

    return-void
.end method

.method static synthetic access$2100(Lcom/vk/stories/CreateAndEditStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->checkButtonLock()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2200(Lcom/vk/stories/CreateAndEditStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isRecording()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    return-object v0
.end method

.method static synthetic access$2302(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/camera1/Camera1View;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    return-object p1
.end method

.method static synthetic access$2400(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/util/TimeoutLock;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionLock:Lcom/vk/core/util/TimeoutLock;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initFlashButton()V

    return-void
.end method

.method static synthetic access$2700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryLastEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    return-object v0
.end method

.method static synthetic access$2702(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryLastEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    return-object p1
.end method

.method static synthetic access$2800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksContainer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionStartRecording()V

    return-void
.end method

.method static synthetic access$3000(Lcom/vk/stories/CreateAndEditStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$3100(Lcom/vk/stories/CreateAndEditStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelVisible()Z

    move-result v0

    return v0
.end method

.method static synthetic access$3200(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMasksPanel(Z)V

    return-void
.end method

.method static synthetic access$3300(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->openMasksPanel()V

    return-void
.end method

.method static synthetic access$3400(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showNextMask()V

    return-void
.end method

.method static synthetic access$3500(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showPrevMask()V

    return-void
.end method

.method static synthetic access$3600(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadMaskSections(Z)V

    return-void
.end method

.method static synthetic access$3700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksPagerAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPagerAdapter:Lcom/vk/masks/MasksPagerAdapter;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/MaskSection;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Lcom/vk/masks/model/MaskSection;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->markMaskSectionAsViewed(Lcom/vk/masks/model/MaskSection;)V

    return-void
.end method

.method static synthetic access$3900(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->onMaskOpenFailed()V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/widget/ViewShower;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksProgressShower:Lcom/vk/core/widget/ViewShower;

    return-object v0
.end method

.method static synthetic access$4000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksAnalytics;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksStatistics:Lcom/vk/masks/MasksAnalytics;

    return-object v0
.end method

.method static synthetic access$4100(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskClearButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMasksProgress()V

    return-void
.end method

.method static synthetic access$4300(Lcom/vk/stories/CreateAndEditStoryActivity;J)V
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # J

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMaskAuthorWithDelay(J)V

    return-void
.end method

.method static synthetic access$4400(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;J)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Lcom/vk/masks/model/Mask;
    .param p2, "x2"    # J

    .prologue
    .line 130
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/stories/CreateAndEditStoryActivity;->showAndHideMaskAction(Lcom/vk/masks/model/Mask;J)V

    return-void
.end method

.method static synthetic access$4502(Lcom/vk/stories/CreateAndEditStoryActivity;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic access$4600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vkontakte/android/ui/CircularProgressView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksProgressBar:Lcom/vkontakte/android/ui/CircularProgressView;

    return-object v0
.end method

.method static synthetic access$4700(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4800(Lcom/vk/stories/CreateAndEditStoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setNewMasksBadge(I)V

    return-void
.end method

.method static synthetic access$4900(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/util/ArrayList;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Ljava/util/ArrayList;
    .param p2, "x2"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Lcom/vk/stories/CreateAndEditStoryActivity;->setMasksSections(Ljava/util/ArrayList;Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/widget/ViewShower;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorShower:Lcom/vk/core/widget/ViewShower;

    return-object v0
.end method

.method static synthetic access$5000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/widget/RobotoMediumTextView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->newMasksBadge:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    return-object v0
.end method

.method static synthetic access$5100(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setMasksState(Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;)V

    return-void
.end method

.method static synthetic access$5200(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5400(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # [Landroid/view/View;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setInvisible([Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$5500(Lcom/vk/stories/CreateAndEditStoryActivity;ZZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    return-void
.end method

.method static synthetic access$5600(Lcom/vk/stories/CreateAndEditStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mute:Z

    return v0
.end method

.method static synthetic access$5602(Lcom/vk/stories/CreateAndEditStoryActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    iput-boolean p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mute:Z

    return p1
.end method

.method static synthetic access$5700(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5800(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->doSave()V

    return-void
.end method

.method static synthetic access$5900(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->onStickerClick()V

    return-void
.end method

.method static synthetic access$600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/widget/ViewShower;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionShower:Lcom/vk/core/widget/ViewShower;

    return-object v0
.end method

.method static synthetic access$6000(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->openDrawing()V

    return-void
.end method

.method static synthetic access$6100(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->onTextClick()V

    return-void
.end method

.method static synthetic access$6200(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/drawing/DrawingView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    return-object v0
.end method

.method static synthetic access$6300(Lcom/vk/stories/CreateAndEditStoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->selectBrush(I)V

    return-void
.end method

.method static synthetic access$6400(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->widthSelectorBtn:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$6500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/widget/ColorSelectorView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    return-object v0
.end method

.method static synthetic access$6600(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cancelDrawing()V

    return-void
.end method

.method static synthetic access$6700(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->closeDrawing()V

    return-void
.end method

.method static synthetic access$6800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$6900(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideDrawingUI()V

    return-void
.end method

.method static synthetic access$700(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->openMaskById(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$7000(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showDrawingUI()V

    return-void
.end method

.method static synthetic access$7100(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showDeleteArea()V

    return-void
.end method

.method static synthetic access$7200(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideEditorUI()V

    return-void
.end method

.method static synthetic access$7300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/StickerDeleteAreaView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    return-object v0
.end method

.method static synthetic access$7400(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideDeleteArea()V

    return-void
.end method

.method static synthetic access$7500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/TextStickerDialog;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    return-object v0
.end method

.method static synthetic access$7502(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/attachpicker/stickers/TextStickerDialog;)Lcom/vk/attachpicker/stickers/TextStickerDialog;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    return-object p1
.end method

.method static synthetic access$7600(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showEditorUI()V

    return-void
.end method

.method static synthetic access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    return-object v0
.end method

.method static synthetic access$7800(Lcom/vk/stories/CreateAndEditStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->isDestroyed:Z

    return v0
.end method

.method static synthetic access$7900(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View$OnTouchListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->onCameraTouchListener:Landroid/view/View$OnTouchListener;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->disableResultPreview()V

    return-void
.end method

.method static synthetic access$8000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/ShutterButton;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    return-object v0
.end method

.method static synthetic access$8100(Lcom/vk/stories/CreateAndEditStoryActivity;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Lcom/vk/stories/CreateAndEditStoryActivity;->setVideoRecording(ZZ)V

    return-void
.end method

.method static synthetic access$8200(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/io/File;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->onVideoFileReady(Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$8300(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->stopRecording()V

    return-void
.end method

.method static synthetic access$8400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$8500(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraContainer:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$8600(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->retrieveLocation()V

    return-void
.end method

.method static synthetic access$8700(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreview()V

    return-void
.end method

.method static synthetic access$8800(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraToEditor(Z)V

    return-void
.end method

.method static synthetic access$8900(Lcom/vk/stories/CreateAndEditStoryActivity;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$8902(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/io/File;)Ljava/io/File;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    return-object p1
.end method

.method static synthetic access$900(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->dropState()V

    return-void
.end method

.method static synthetic access$9002(Lcom/vk/stories/CreateAndEditStoryActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 130
    iput-boolean p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mirror:Z

    return p1
.end method

.method static synthetic access$9100(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->startRecording()V

    return-void
.end method

.method static synthetic access$9200(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionStopRecording()V

    return-void
.end method

.method static synthetic access$9300(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionTakePhoto()V

    return-void
.end method

.method static synthetic access$9400(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->doShare()V

    return-void
.end method

.method static synthetic access$9500(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$9600(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorActionsPanel:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$9700(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p1, "x1"    # [Landroid/view/View;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setVisibleNoAlpha([Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$9800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$9900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/VerticalPagerIndicator;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    return-object v0
.end method

.method private cameraActionStartRecording()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 2367
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-eq v0, v1, :cond_1

    .line 2379
    :cond_0
    :goto_0
    return-void

    .line 2370
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 2372
    invoke-direct {p0, v2, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->setVideoRecording(ZZ)V

    .line 2373
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/ShutterButton;->toRecordingShutter(Z)Landroid/animation/AnimatorSet;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$80;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$80;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_0
.end method

.method private cameraActionStopRecording()V
    .locals 1

    .prologue
    .line 2382
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2383
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->stopRecording()V

    .line 2385
    :cond_0
    return-void
.end method

.method private cameraActionTakePhoto()V
    .locals 2

    .prologue
    .line 2358
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-eq v0, v1, :cond_1

    .line 2364
    :cond_0
    :goto_0
    return-void

    .line 2361
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 2363
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->takePhoto()V

    goto :goto_0
.end method

.method private cameraToEditor(Z)V
    .locals 14
    .param p1, "animated"    # Z

    .prologue
    const/4 v13, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    const-wide/16 v10, 0xc3

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 2669
    sget-object v3, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 2671
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideCameraTooltip()V

    .line 2674
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksStatistics:Lcom/vk/masks/MasksAnalytics;

    invoke-virtual {v3}, Lcom/vk/masks/MasksAnalytics;->flush()V

    .line 2676
    if-eqz p1, :cond_0

    .line 2677
    invoke-direct {p0, v8, v8, v8}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    .line 2678
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v3, v9}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 2679
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v3, v9}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 2680
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v3, v9}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 2682
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2683
    .local v1, "set1":Landroid/animation/AnimatorSet;
    const/4 v3, 0x7

    new-array v3, v3, [Landroid/animation/Animator;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v13, v6, v8

    .line 2684
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v13, v6, v8

    .line 2685
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v9

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v13, v7, v8

    .line 2686
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v13, v7, v8

    .line 2687
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v13, v7, v8

    .line 2688
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomInfoContainer:Landroid/view/View;

    sget-object v6, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v7, v9, [F

    aput v13, v7, v8

    .line 2689
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v13, v7, v8

    .line 2690
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    .line 2683
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2693
    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$81;

    invoke-direct {v3, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$81;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2707
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2708
    .local v2, "set2":Landroid/animation/AnimatorSet;
    const/4 v3, 0x4

    new-array v3, v3, [Landroid/animation/Animator;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v12, v6, v8

    .line 2709
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v12, v6, v8

    .line 2710
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v9

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v12, v7, v8

    .line 2711
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorActionsPanel:Landroid/widget/FrameLayout;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v12, v7, v8

    .line 2712
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    .line 2708
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2715
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2716
    .local v0, "set":Landroid/animation/AnimatorSet;
    const/4 v3, 0x2

    new-array v3, v3, [Landroid/animation/Animator;

    aput-object v1, v3, v8

    aput-object v2, v3, v9

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 2717
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 2719
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v3, v9}, Lcom/vk/stories/view/ShutterButton;->toArrowShutter(Z)Landroid/animation/AnimatorSet;

    move-result-object v3

    new-instance v4, Lcom/vk/stories/CreateAndEditStoryActivity$82;

    invoke-direct {v4, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$82;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2747
    .end local v0    # "set":Landroid/animation/AnimatorSet;
    .end local v1    # "set1":Landroid/animation/AnimatorSet;
    .end local v2    # "set2":Landroid/animation/AnimatorSet;
    :goto_0
    return-void

    .line 2728
    :cond_0
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 2729
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    if-eqz v3, :cond_1

    .line 2730
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    const v4, 0x7f02021b

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2731
    const/4 v3, 0x3

    new-array v3, v3, [Landroid/view/View;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    aput-object v4, v3, v9

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorActionsPanel:Landroid/widget/FrameLayout;

    aput-object v5, v3, v4

    invoke-direct {p0, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->setVisibleNoAlpha([Landroid/view/View;)V

    .line 2735
    :goto_1
    const/16 v3, 0x8

    new-array v3, v3, [Landroid/view/View;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    aput-object v4, v3, v9

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    aput-object v5, v3, v4

    const/4 v4, 0x4

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    aput-object v5, v3, v4

    const/4 v4, 0x5

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    aput-object v5, v3, v4

    const/4 v4, 0x7

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionView:Landroid/widget/TextView;

    aput-object v5, v3, v4

    invoke-direct {p0, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->setInvisible([Landroid/view/View;)V

    .line 2737
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    invoke-virtual {v3, v12}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2738
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    invoke-virtual {v3, v12}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2739
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    invoke-virtual {v3, v12}, Landroid/view/View;->setAlpha(F)V

    .line 2740
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorActionsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v12}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 2742
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v3, v8}, Lcom/vk/stories/view/ShutterButton;->toArrowShutter(Z)Landroid/animation/AnimatorSet;

    .line 2743
    invoke-direct {p0, v9}, Lcom/vk/stories/CreateAndEditStoryActivity;->stopCamera(Z)V

    .line 2744
    invoke-direct {p0, v8, v9, v8}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    .line 2745
    invoke-direct {p0, v9, v8}, Lcom/vk/stories/CreateAndEditStoryActivity;->setDrawingTouches(ZZ)V

    goto :goto_0

    .line 2733
    :cond_1
    const/4 v3, 0x2

    new-array v3, v3, [Landroid/view/View;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorActionsPanel:Landroid/widget/FrameLayout;

    aput-object v4, v3, v9

    invoke-direct {p0, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->setVisibleNoAlpha([Landroid/view/View;)V

    goto :goto_1
.end method

.method private cancelDrawing()V
    .locals 1

    .prologue
    .line 2643
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->restoreState()V

    .line 2644
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->closeDrawing()V

    .line 2645
    return-void
.end method

.method private checkButtonLock()Z
    .locals 1

    .prologue
    .line 2617
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->buttonClickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2618
    const/4 v0, 0x1

    .line 2621
    :goto_0
    return v0

    .line 2620
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->buttonClickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 2621
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private closeDrawing()V
    .locals 12

    .prologue
    const/16 v4, 0x8

    const/4 v11, 0x2

    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 2887
    sget-object v3, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 2889
    invoke-direct {p0, v8}, Lcom/vk/stories/CreateAndEditStoryActivity;->trackDraw(Z)V

    .line 2891
    invoke-direct {p0, v8, v8, v8}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    .line 2893
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingBottomPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v10}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 2894
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingBottomPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v8}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2896
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2897
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2899
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2900
    .local v1, "set1":Landroid/animation/AnimatorSet;
    new-array v3, v11, [Landroid/animation/Animator;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingBottomPanel:Landroid/widget/FrameLayout;

    sget-object v5, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v6, v9, [F

    sget v7, Lcom/vk/stories/CreateAndEditStoryActivity;->SMALL_PANEL_HEIGHT:I

    int-to-float v7, v7

    aput v7, v6, v8

    .line 2901
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoContainer:Landroid/view/View;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v10, v6, v8

    .line 2902
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v9

    .line 2900
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2904
    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$87;

    invoke-direct {v3, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$87;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2917
    sget-object v3, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2918
    const-wide/16 v4, 0xaf

    invoke-virtual {v1, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 2920
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2921
    .local v2, "set2":Landroid/animation/AnimatorSet;
    new-array v3, v11, [Landroid/animation/Animator;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    sget-object v5, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v6, v9, [F

    aput v10, v6, v8

    .line 2922
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    const/high16 v7, 0x3f800000    # 1.0f

    aput v7, v6, v8

    .line 2923
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v9

    .line 2921
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2925
    sget-object v3, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2926
    const-wide/16 v4, 0xaf

    invoke-virtual {v2, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 2928
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2929
    .local v0, "set":Landroid/animation/AnimatorSet;
    new-array v3, v11, [Landroid/animation/Animator;

    aput-object v1, v3, v8

    aput-object v2, v3, v9

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 2930
    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$88;

    invoke-direct {v3, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$88;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2937
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 2938
    return-void
.end method

.method private createOnCameraTouchListener()Landroid/view/View$OnTouchListener;
    .locals 3

    .prologue
    .line 1119
    new-instance v0, Lcom/vk/core/widget/OnSwipeTouchListener;

    const/16 v1, 0x28

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$28;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$28;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-direct {v0, p0, v1, v2}, Lcom/vk/core/widget/OnSwipeTouchListener;-><init>(Landroid/content/Context;ILcom/vk/core/widget/OnTouchDownListener$DownUpListener;)V

    .line 1135
    .local v0, "onSwipeTouchListener":Lcom/vk/core/widget/OnSwipeTouchListener;
    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$29;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$29;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/OnSwipeTouchListener;->setGestureListener(Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;)V

    .line 1170
    return-object v0
.end method

.method private disableResultPreview()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x8

    .line 702
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreviewBlackBackground:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cancel(Ljava/lang/Runnable;)V

    .line 703
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->disableResultPreviewBlackBackground:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cancel(Ljava/lang/Runnable;)V

    .line 704
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 706
    iput-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    .line 707
    iput-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 708
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 710
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/drawing/DrawingView;->setVisibility(I)V

    .line 711
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setVisibility(I)V

    .line 712
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 713
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 714
    return-void
.end method

.method private dispatchVolumeButton(I)V
    .locals 6
    .param p1, "action"    # I

    .prologue
    const-wide/16 v4, 0xc8

    .line 2388
    iget v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->volumeButtonLastAction:I

    if-ne p1, v2, :cond_0

    .line 2409
    :goto_0
    return-void

    .line 2392
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 2394
    .local v0, "elapsed":J
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->onVolumeButtonLongClick:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->cancel(Ljava/lang/Runnable;)V

    .line 2395
    if-nez p1, :cond_2

    .line 2396
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->onVolumeButtonLongClick:Ljava/lang/Runnable;

    invoke-virtual {p0, v2, v4, v5}, Lcom/vk/stories/CreateAndEditStoryActivity;->postDelayed(Ljava/lang/Runnable;J)V

    .line 2407
    :cond_1
    :goto_1
    iput p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->volumeButtonLastAction:I

    .line 2408
    iput-wide v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->volumeButtonLastActionTime:J

    goto :goto_0

    .line 2398
    :cond_2
    const/4 v2, 0x1

    if-ne p1, v2, :cond_1

    .line 2399
    iget-wide v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->volumeButtonLastActionTime:J

    sub-long v2, v0, v2

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    .line 2400
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionTakePhoto()V

    goto :goto_1

    .line 2402
    :cond_3
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionStopRecording()V

    goto :goto_1
.end method

.method private doSave()V
    .locals 10

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 788
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->checkButtonLock()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 867
    :cond_0
    :goto_0
    return-void

    .line 792
    :cond_1
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->flushStatistics()V

    .line 794
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 795
    const-wide/16 v0, 0x1f4

    invoke-direct {p0, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->showProgressDialog(J)V

    .line 797
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->publishAspectRatio()F

    move-result v0

    invoke-static {v0}, Lcom/vk/stories/StoriesProcessor;->imageSize(F)[I

    move-result-object v9

    .line 798
    .local v9, "size":[I
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0, v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->getOverlayBitmap(Z)Landroid/graphics/Bitmap;

    move-result-object v1

    aget v2, v9, v4

    aget v3, v9, v3

    new-instance v5, Lcom/vk/stories/CreateAndEditStoryActivity$16;

    invoke-direct {v5, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$16;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-static/range {v0 .. v5}, Lcom/vk/stories/StoriesProcessor;->processImage(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V

    goto :goto_0

    .line 813
    .end local v9    # "size":[I
    :cond_2
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 814
    new-instance v6, Landroid/app/ProgressDialog;

    invoke-direct {v6, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 815
    .local v6, "dialog":Landroid/app/ProgressDialog;
    const v0, 0x7f080764

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 816
    invoke-virtual {v6, v3}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 817
    const/16 v0, 0x64

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setMax(I)V

    .line 818
    invoke-virtual {v6, v4}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 819
    invoke-virtual {v6, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 820
    invoke-virtual {v6, v4}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 821
    invoke-virtual {v6}, Landroid/app/ProgressDialog;->show()V

    .line 823
    new-instance v0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    invoke-direct {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;-><init>(Ljava/io/File;)V

    iget-boolean v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mirror:Z

    .line 824
    invoke-virtual {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->mirror(Z)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mute:Z

    .line 825
    invoke-virtual {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->disableAudio(Z)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v0

    .line 826
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->publishAspectRatio()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->aspectRatio(F)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v0

    const/16 v1, 0x500

    .line 827
    invoke-virtual {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->maxSize(I)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v8

    .line 828
    .local v8, "params":Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    invoke-direct {p0, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->getOverlayBitmap(Z)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$17;

    invoke-direct {v1, p0, v6}, Lcom/vk/stories/CreateAndEditStoryActivity$17;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/app/ProgressDialog;)V

    invoke-static {v8, v4, v0, v1}, Lcom/vk/stories/util/VideoCompressor;->render(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;ZLandroid/graphics/Bitmap;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Lcom/vk/stories/util/VideoCompressor$RenderTask;

    move-result-object v7

    .line 858
    .local v7, "future":Lcom/vk/stories/util/VideoCompressor$RenderTask;
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$18;

    invoke-direct {v0, p0, v7}, Lcom/vk/stories/CreateAndEditStoryActivity$18;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/stories/util/VideoCompressor$RenderTask;)V

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0
.end method

.method private doShare()V
    .locals 10

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 870
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->checkButtonLock()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 930
    :cond_0
    :goto_0
    return-void

    .line 874
    :cond_1
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->flushStatistics()V

    .line 876
    const-wide/16 v0, 0x1f4

    invoke-direct {p0, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->showProgressDialog(J)V

    .line 877
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 878
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->publishAspectRatio()F

    move-result v0

    invoke-static {v0}, Lcom/vk/stories/StoriesProcessor;->imageSize(F)[I

    move-result-object v8

    .line 879
    .local v8, "size":[I
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->getOverlayBitmap(Z)Landroid/graphics/Bitmap;

    move-result-object v1

    aget v2, v8, v3

    aget v3, v8, v4

    new-instance v5, Lcom/vk/stories/CreateAndEditStoryActivity$19;

    invoke-direct {v5, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$19;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-static/range {v0 .. v5}, Lcom/vk/stories/StoriesProcessor;->processImage(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V

    goto :goto_0

    .line 903
    .end local v8    # "size":[I
    :cond_2
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    if-eqz v0, :cond_0

    .line 904
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->publishAspectRatio()F

    move-result v0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->getVideoWidth()I

    move-result v1

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->getVideoHeight()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/vk/stories/StoriesProcessor;->videoSize(FII)[I

    move-result-object v8

    .line 906
    .restart local v8    # "size":[I
    new-instance v0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    invoke-direct {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;-><init>(Ljava/io/File;)V

    iget-boolean v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mirror:Z

    .line 907
    invoke-virtual {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->mirror(Z)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mute:Z

    .line 908
    invoke-virtual {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->disableAudio(Z)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v0

    .line 909
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->publishAspectRatio()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->aspectRatio(F)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v0

    const/16 v1, 0x500

    .line 910
    invoke-virtual {v0, v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->maxSize(I)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v7

    .line 912
    .local v7, "params":Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    invoke-direct {p0, v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->getOverlayBitmap(Z)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 913
    .local v6, "overlay":Landroid/graphics/Bitmap;
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->getVideoPreview()Landroid/graphics/Bitmap;

    move-result-object v9

    .line 915
    .local v9, "videoFrame":Landroid/graphics/Bitmap;
    aget v0, v8, v3

    aget v1, v8, v4

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$20;

    invoke-direct {v2, p0, v7}, Lcom/vk/stories/CreateAndEditStoryActivity$20;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)V

    invoke-static {v6, v9, v0, v1, v2}, Lcom/vk/stories/StoriesProcessor;->saveOverlayImage(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;)V

    goto :goto_0
.end method

.method private dropState()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 609
    iput-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    .line 610
    iput-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageBitmap:Landroid/graphics/Bitmap;

    .line 611
    iput-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoPreview:Landroid/graphics/Bitmap;

    .line 612
    iput-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mirror:Z

    .line 613
    iput-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mute:Z

    .line 614
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->locationRetrieveAsyncTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    .line 615
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->locationRetrieveAsyncTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 616
    iput-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->locationRetrieveAsyncTask:Landroid/os/AsyncTask;

    .line 618
    :cond_0
    iput-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->captureLocation:Landroid/location/Location;

    .line 619
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->clear()V

    .line 620
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->clear()V

    .line 621
    return-void
.end method

.method private editorToCamera(Ljava/lang/Runnable;)V
    .locals 14
    .param p1, "onFinish"    # Ljava/lang/Runnable;

    .prologue
    const/4 v13, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    const-wide/16 v10, 0xc3

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 2750
    sget-object v3, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 2751
    invoke-direct {p0, v8, v8}, Lcom/vk/stories/CreateAndEditStoryActivity;->setDrawingTouches(ZZ)V

    .line 2752
    invoke-direct {p0, v8, v8, v8}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    .line 2753
    invoke-direct {p0, v9}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadMaskSections(Z)V

    .line 2754
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->resetVolumeButtonAction()V

    .line 2755
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->startCamera()V

    .line 2758
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v3}, Lcom/vk/attachpicker/EditorAnalytics;->clear()V

    .line 2759
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksStatistics:Lcom/vk/masks/MasksAnalytics;

    invoke-virtual {v3}, Lcom/vk/masks/MasksAnalytics;->clear()V

    .line 2761
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2762
    .local v1, "set1":Landroid/animation/AnimatorSet;
    const/4 v3, 0x3

    new-array v3, v3, [Landroid/animation/Animator;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v13, v6, v8

    .line 2763
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v13, v6, v8

    .line 2764
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v9

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorActionsPanel:Landroid/widget/FrameLayout;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v13, v7, v8

    .line 2765
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    .line 2762
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2767
    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$83;

    invoke-direct {v3, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$83;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2799
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2800
    .local v2, "set2":Landroid/animation/AnimatorSet;
    const/4 v3, 0x7

    new-array v3, v3, [Landroid/animation/Animator;

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v12, v6, v8

    .line 2801
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v9, [F

    aput v12, v6, v8

    .line 2802
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v9

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v12, v7, v8

    .line 2803
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v12, v7, v8

    .line 2804
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v12, v7, v8

    .line 2805
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v9, [F

    aput v12, v7, v8

    .line 2806
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomInfoContainer:Landroid/view/View;

    sget-object v6, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v7, v9, [F

    aput v13, v7, v8

    .line 2807
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    .line 2800
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2810
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2811
    .local v0, "set":Landroid/animation/AnimatorSet;
    const/4 v3, 0x2

    new-array v3, v3, [Landroid/animation/Animator;

    aput-object v1, v3, v8

    aput-object v2, v3, v9

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 2812
    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$84;

    invoke-direct {v3, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$84;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2822
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 2824
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v3, v9}, Lcom/vk/stories/view/ShutterButton;->toPhotoShutter(Z)Landroid/animation/AnimatorSet;

    .line 2825
    return-void
.end method

.method private enableResultPreview()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x12c

    const/4 v2, 0x0

    .line 642
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 643
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/drawing/DrawingView;->setVisibility(I)V

    .line 644
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 645
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setVisibility(I)V

    .line 646
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreviewBlackBackground:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cancel(Ljava/lang/Runnable;)V

    .line 647
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->disableResultPreviewBlackBackground:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cancel(Ljava/lang/Runnable;)V

    .line 649
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    if-eqz v0, :cond_2

    .line 650
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    const-string/jumbo v1, "video"

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/EditorAnalytics;->type(Ljava/lang/String;)V

    .line 652
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    .line 653
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$13;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$13;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 659
    iget-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mirror:Z

    if-eqz v0, :cond_0

    .line 660
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setScaleX(F)V

    .line 662
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setLoop(Z)V

    .line 663
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    sget-object v1, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER_CROP:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setScaleType(Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;)V

    .line 664
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 665
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$14;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$14;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {p0, v0, v4, v5}, Lcom/vk/stories/CreateAndEditStoryActivity;->postDelayed(Ljava/lang/Runnable;J)V

    .line 671
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 672
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 674
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$15;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$15;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-static {v0}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;)Lbolts/Task;

    .line 694
    :goto_0
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 695
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksController;->raiseMask(Lcom/vk/masks/model/Mask;)V

    .line 698
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreviewBlackBackground:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, v4, v5}, Lcom/vk/stories/CreateAndEditStoryActivity;->postDelayed(Ljava/lang/Runnable;J)V

    .line 699
    return-void

    .line 682
    :cond_2
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    const-string/jumbo v1, "photo"

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/EditorAnalytics;->type(Ljava/lang/String;)V

    .line 683
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/EditorAnalytics;->length(I)V

    .line 685
    new-instance v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v0, p0}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 686
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageView:Lcom/vk/imageloader/view/VKImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 687
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageView:Lcom/vk/imageloader/view/VKImageView;

    sget-object v1, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 688
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 689
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    .line 690
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 692
    :cond_3
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method private flushStatistics()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 3096
    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->trackStickers(Z)V

    .line 3097
    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->trackEmoji(Z)V

    .line 3098
    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->trackText(Z)V

    .line 3099
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->isDefault()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3100
    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->trackDraw(Z)V

    .line 3102
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v0}, Lcom/vk/attachpicker/EditorAnalytics;->flush()V

    .line 3103
    return-void
.end method

.method private forceHideMaskAction(Z)V
    .locals 2
    .param p1, "anim"    # Z

    .prologue
    .line 1660
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1661
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1662
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v0}, Lcom/vk/core/widget/ViewShower;->cancelAllRunningAnimations()V

    .line 1663
    if-eqz p1, :cond_0

    .line 1664
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionShower:Lcom/vk/core/widget/ViewShower;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 1669
    :goto_0
    return-void

    .line 1666
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1667
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    goto :goto_0
.end method

.method private getOverlayBitmap(Z)Landroid/graphics/Bitmap;
    .locals 12
    .param p1, "forVideo"    # Z

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 755
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isDefaultEditorState()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 756
    const/4 v0, 0x0

    .line 784
    :goto_0
    return-object v0

    .line 759
    :cond_0
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->publishAspectRatio()F

    move-result v4

    .line 763
    .local v4, "publishAspectRatio":F
    if-eqz p1, :cond_1

    iget-object v7, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    if-eqz v7, :cond_1

    .line 764
    iget-object v7, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v7}, Lcom/vk/attachpicker/widget/TextureVideoView;->getVideoWidth()I

    move-result v7

    iget-object v8, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v8}, Lcom/vk/attachpicker/widget/TextureVideoView;->getVideoHeight()I

    move-result v8

    invoke-static {v4, v7, v8}, Lcom/vk/stories/StoriesProcessor;->videoSize(FII)[I

    move-result-object v6

    .line 770
    .local v6, "size":[I
    :goto_1
    aget v7, v6, v10

    aget v8, v6, v11

    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v8, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 771
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 774
    .local v1, "canvas":Landroid/graphics/Canvas;
    iget-object v7, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v7}, Lcom/vk/attachpicker/drawing/DrawingView;->getDrawingStateCopy()Lcom/vk/attachpicker/drawing/DrawingState;

    move-result-object v3

    .line 775
    .local v3, "ds":Lcom/vk/attachpicker/drawing/DrawingState;
    aget v7, v6, v10

    int-to-float v7, v7

    aget v8, v6, v11

    int-to-float v8, v8

    invoke-virtual {v3, v7, v8}, Lcom/vk/attachpicker/drawing/DrawingState;->handleSizeChange(FF)V

    .line 776
    new-instance v2, Lcom/vk/attachpicker/drawing/DrawingCanvas;

    invoke-direct {v2, v0}, Lcom/vk/attachpicker/drawing/DrawingCanvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 777
    .local v2, "drawingCanvas":Lcom/vk/attachpicker/drawing/DrawingCanvas;
    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->draw(Lcom/vk/attachpicker/drawing/DrawingState;)V

    .line 780
    iget-object v7, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v7}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v5

    .line 781
    .local v5, "sds":Lcom/vk/attachpicker/stickers/StickersDrawingState;
    aget v7, v6, v10

    aget v8, v6, v11

    invoke-virtual {v5, v7, v8}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->handleSizeChange(II)V

    .line 782
    invoke-virtual {v5, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 766
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    .end local v2    # "drawingCanvas":Lcom/vk/attachpicker/drawing/DrawingCanvas;
    .end local v3    # "ds":Lcom/vk/attachpicker/drawing/DrawingState;
    .end local v5    # "sds":Lcom/vk/attachpicker/stickers/StickersDrawingState;
    .end local v6    # "size":[I
    :cond_1
    invoke-static {v4}, Lcom/vk/stories/StoriesProcessor;->imageSize(F)[I

    move-result-object v6

    .restart local v6    # "size":[I
    goto :goto_1
.end method

.method private getVideoPreview()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 748
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoPreview:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 749
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initVideoPreview()V

    .line 751
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoPreview:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method private hideCameraTooltip()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1040
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraTooltipShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v0, v2}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 1041
    invoke-static {}, Lcom/vk/attachpicker/util/Prefs;->storiesPrefs()Lcom/vk/attachpicker/util/Prefs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/Prefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "story_video_tooltip"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1042
    return-void
.end method

.method private hideDeleteArea()V
    .locals 4

    .prologue
    .line 2180
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    invoke-virtual {v0}, Lcom/vk/stories/view/StickerDeleteAreaView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 2196
    :goto_0
    return-void

    .line 2183
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/StickerDeleteAreaView;->setAlpha(F)V

    .line 2184
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    .line 2185
    invoke-virtual {v0}, Lcom/vk/stories/view/StickerDeleteAreaView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 2186
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    .line 2187
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$76;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$76;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2188
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc3

    .line 2194
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 2195
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private hideDrawingUI()V
    .locals 6

    .prologue
    const-wide/16 v4, 0xc3

    const-wide/16 v2, 0x64

    const/4 v1, 0x0

    .line 2152
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingBottomPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2153
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2154
    return-void
.end method

.method private hideEditorUI()V
    .locals 4

    .prologue
    const-wide/16 v2, 0xc3

    const/4 v1, 0x0

    .line 2162
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2163
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2164
    return-void
.end method

.method private hideMaskAuthorWithDelay(J)V
    .locals 3
    .param p1, "delay"    # J

    .prologue
    const/4 v2, 0x1

    .line 1655
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 1656
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1657
    return-void
.end method

.method private hideMasksPanel(Z)V
    .locals 11
    .param p1, "animated"    # Z

    .prologue
    const/4 v5, 0x2

    const/high16 v10, 0x3f800000    # 1.0f

    const-wide/16 v8, 0xc3

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1728
    invoke-direct {p0, v7, v7, v7}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    .line 1729
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v1, v6}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 1730
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v1, p1}, Lcom/vk/stories/view/ShutterButton;->toPhotoShutter(Z)Landroid/animation/AnimatorSet;

    .line 1732
    new-array v1, v5, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    aput-object v2, v1, v7

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    aput-object v2, v1, v6

    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setVisibleNoAlpha([Landroid/view/View;)V

    .line 1733
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryLastEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    if-eqz v1, :cond_0

    .line 1734
    new-array v1, v6, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    aput-object v2, v1, v7

    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setVisibleNoAlpha([Landroid/view/View;)V

    .line 1738
    :goto_0
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1739
    .local v0, "set":Landroid/animation/AnimatorSet;
    const/4 v1, 0x5

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v6, [F

    aput v10, v4, v7

    .line 1740
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v6, [F

    aput v10, v4, v7

    .line 1741
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v6, [F

    aput v10, v4, v7

    .line 1742
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v5

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v6, [F

    aput v10, v5, v7

    .line 1743
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomInfoContainer:Landroid/view/View;

    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v5, v6, [F

    const/4 v6, 0x0

    aput v6, v5, v7

    .line 1744
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1739
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1746
    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$56;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$56;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1753
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 1754
    return-void

    .line 1736
    .end local v0    # "set":Landroid/animation/AnimatorSet;
    :cond_0
    new-array v1, v6, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    aput-object v2, v1, v7

    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setInvisible([Landroid/view/View;)V

    goto :goto_0
.end method

.method private hideMasksProgress()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1615
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1616
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1618
    :cond_0
    return-void
.end method

.method private hideProgressDialog()V
    .locals 2

    .prologue
    .line 722
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->showProgressDialogRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 723
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentProgressDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 724
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 725
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentProgressDialog:Landroid/app/Dialog;

    .line 727
    :cond_0
    return-void
.end method

.method private hideStickers()V
    .locals 4

    .prologue
    .line 2941
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 2943
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 2956
    :cond_0
    :goto_0
    return-void

    .line 2946
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$89;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$89;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2947
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    .line 2953
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2955
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showEditorUI()V

    goto :goto_0
.end method

.method private initActionsUi()V
    .locals 2

    .prologue
    .line 1898
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    const v1, 0x7f100175

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawAction:Landroid/view/View;

    .line 1899
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    const v1, 0x7f100173

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersAction:Landroid/view/View;

    .line 1900
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    const v1, 0x7f100174

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->textAction:Landroid/view/View;

    .line 1903
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersAction:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$61;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$61;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1913
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawAction:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$62;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$62;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1923
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->textAction:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$63;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$63;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1932
    return-void
.end method

.method private initCameraViewPart()V
    .locals 2

    .prologue
    .line 956
    const v0, 0x7f100168

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomInfoContainer:Landroid/view/View;

    .line 957
    const v0, 0x7f100152

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraContainer:Landroid/widget/FrameLayout;

    .line 958
    const v0, 0x7f10016f

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    .line 959
    const v0, 0x7f100170

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnail:Landroid/widget/ImageView;

    .line 960
    const v0, 0x7f10015e

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    .line 961
    const v0, 0x7f10015f

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    .line 962
    const v0, 0x7f100160

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    .line 963
    const v0, 0x7f10016e

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    .line 964
    const v0, 0x7f100171

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/ShutterButton;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    .line 965
    const v0, 0x7f10016c

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraTooltip:Landroid/view/View;

    .line 966
    new-instance v0, Lcom/vk/core/widget/ViewShower;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraTooltip:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/vk/core/widget/ViewShower;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraTooltipShower:Lcom/vk/core/widget/ViewShower;

    .line 967
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraTooltip:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$21;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$21;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 974
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnail:Landroid/widget/ImageView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$22;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$22;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 996
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$23;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$23;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1005
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$24;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$24;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1020
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$25;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$25;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1029
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initSwitchCameraButton()V

    .line 1030
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initFlashButton()V

    .line 1031
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showLastPhotoVideoIcon()V

    .line 1032
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->startCamera()V

    .line 1034
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;

    invoke-direct {v0, p0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButtonOnTouchListener:Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;

    .line 1035
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButtonOnTouchListener:Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/ShutterButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1037
    return-void
.end method

.method private initDrawingUi()V
    .locals 2

    .prologue
    .line 1935
    const v0, 0x7f10017a

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingBottomPanel:Landroid/widget/FrameLayout;

    .line 1936
    const v0, 0x7f100154

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    .line 1937
    const v0, 0x7f100176

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoContainer:Landroid/view/View;

    .line 1938
    const v0, 0x7f100177

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    .line 1939
    const v0, 0x7f10017b

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/ColorSelectorView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    .line 1940
    const v0, 0x7f10017c

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->widthSelectorBtn:Landroid/widget/ImageView;

    .line 1941
    const v0, 0x7f10017d

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingNavPanel:Landroid/widget/FrameLayout;

    .line 1942
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingNavPanel:Landroid/widget/FrameLayout;

    const v1, 0x7f100180

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/BrushSelectorView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushPen:Lcom/vk/stories/view/BrushSelectorView;

    .line 1943
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingNavPanel:Landroid/widget/FrameLayout;

    const v1, 0x7f100181

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/BrushSelectorView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushMarker:Lcom/vk/stories/view/BrushSelectorView;

    .line 1944
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingNavPanel:Landroid/widget/FrameLayout;

    const v1, 0x7f100182

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/BrushSelectorView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushNeon:Lcom/vk/stories/view/BrushSelectorView;

    .line 1945
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingNavPanel:Landroid/widget/FrameLayout;

    const v1, 0x7f10017e

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingCancel:Landroid/view/View;

    .line 1946
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingNavPanel:Landroid/widget/FrameLayout;

    const v1, 0x7f10017f

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingApply:Landroid/view/View;

    .line 1948
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$64;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$64;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setOnColorSelectedListener(Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;)V

    .line 1960
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->widthSelectorBtn:Landroid/widget/ImageView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$65;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$65;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1975
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingCancel:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$66;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$66;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1981
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingApply:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$67;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$67;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1987
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushPen:Lcom/vk/stories/view/BrushSelectorView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$68;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$68;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/BrushSelectorView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1993
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushMarker:Lcom/vk/stories/view/BrushSelectorView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$69;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$69;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/BrushSelectorView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1999
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushNeon:Lcom/vk/stories/view/BrushSelectorView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$70;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$70;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/BrushSelectorView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2005
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->selectBrush(I)V

    .line 2007
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$71;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$71;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2014
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$72;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$72;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 2022
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$73;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$73;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setOnMotionEventListener(Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;)V

    .line 2034
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 2035
    return-void
.end method

.method private initEditorPartView()V
    .locals 2

    .prologue
    .line 1861
    const v0, 0x7f10015d

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    .line 1862
    const v0, 0x7f10016d

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    .line 1863
    const v0, 0x7f100171

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/ShutterButton;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    .line 1864
    const v0, 0x7f100153

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    .line 1865
    const v0, 0x7f100172

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->editorActionsPanel:Landroid/widget/FrameLayout;

    .line 1867
    const v0, 0x7f100162

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    .line 1868
    const v0, 0x7f100161

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    .line 1870
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$59;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$59;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1885
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$60;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$60;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1892
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initActionsUi()V

    .line 1893
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initDrawingUi()V

    .line 1894
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initStickersUI()V

    .line 1895
    return-void
.end method

.method private initFlashButton()V
    .locals 2

    .prologue
    .line 1067
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->currentCameraHasFlash()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1068
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1072
    :goto_0
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->currentCameraHasFlash()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashVisible:Z

    .line 1073
    return-void

    .line 1070
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method private initMasksUIPart()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 1182
    const v0, 0x7f10015a

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressContainer:Landroid/view/View;

    .line 1183
    const v0, 0x7f10015b

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/CircularProgressView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksProgressBar:Lcom/vkontakte/android/ui/CircularProgressView;

    .line 1184
    new-instance v0, Lcom/vk/core/widget/ViewShower;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressContainer:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/vk/core/widget/ViewShower;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksProgressShower:Lcom/vk/core/widget/ViewShower;

    .line 1186
    const v0, 0x7f100156

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    .line 1187
    new-instance v0, Lcom/vk/core/widget/ViewShower;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/vk/core/widget/ViewShower;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorShower:Lcom/vk/core/widget/ViewShower;

    .line 1188
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    const v1, 0x7f100157

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorImage:Lcom/vk/imageloader/view/VKImageView;

    .line 1189
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    const v1, 0x7f100158

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorName:Landroid/widget/TextView;

    .line 1191
    const v0, 0x7f100159

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionView:Landroid/widget/TextView;

    .line 1192
    new-instance v0, Lcom/vk/core/widget/ViewShower;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionView:Landroid/widget/TextView;

    invoke-direct {v0, v1}, Lcom/vk/core/widget/ViewShower;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionShower:Lcom/vk/core/widget/ViewShower;

    .line 1194
    const v0, 0x7f100163

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    .line 1195
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1197
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressContainer:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$30;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$30;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1204
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$31;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    invoke-direct {v0, p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity$31;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/view/View;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelShower:Lcom/vk/core/widget/ViewShower;

    .line 1227
    const v0, 0x7f10016a

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskClearButton:Landroid/view/View;

    .line 1228
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskClearButton:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$32;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$32;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1235
    const v0, 0x7f100169

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    .line 1236
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1237
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$33;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$33;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1247
    :goto_0
    const v0, 0x7f10016b

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->newMasksBadge:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    .line 1250
    const v0, 0x7f100164

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingErrorView:Landroid/view/View;

    .line 1251
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingErrorView:Landroid/view/View;

    const v1, 0x7f100340

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$34;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$34;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1257
    const v0, 0x7f100165

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingView:Landroid/view/View;

    .line 1258
    const v0, 0x7f100166

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/MaskTabsIndicator;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelHeader:Lcom/vk/masks/MaskTabsIndicator;

    .line 1259
    const v0, 0x7f100167

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    .line 1260
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    const/16 v1, 0xa

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setPageMargin(I)V

    .line 1261
    new-instance v0, Lcom/vk/masks/MasksPagerAdapter;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-direct {v0, p0, v1, p0}, Lcom/vk/masks/MasksPagerAdapter;-><init>(Landroid/content/Context;Lcom/vk/masks/MasksContainer;Lcom/vk/masks/MasksView$OnMaskSelectedListener;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPagerAdapter:Lcom/vk/masks/MasksPagerAdapter;

    .line 1262
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPagerAdapter:Lcom/vk/masks/MasksPagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 1263
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelHeader:Lcom/vk/masks/MaskTabsIndicator;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 1264
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelHeader:Lcom/vk/masks/MaskTabsIndicator;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MaskTabsIndicator;->setPager(Landroid/support/v4/view/ViewPager;)V

    .line 1266
    const v0, 0x7f10015c

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/VerticalPagerIndicator;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    .line 1269
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$35;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$35;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 1276
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadMaskSections(Z)V

    .line 1277
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadMasksNewBadge()V

    .line 1278
    return-void

    .line 1244
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0
.end method

.method private initStickersUI()V
    .locals 4

    .prologue
    .line 2038
    const v0, 0x7f100155

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    .line 2039
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    const/16 v1, 0x51

    const/16 v2, 0x52

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    const/16 v3, 0x62

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->addRemoveArea(III)V

    .line 2040
    const v0, 0x7f100179

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersContainer:Landroid/widget/FrameLayout;

    .line 2041
    const v0, 0x7f100178

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/StickerDeleteAreaView;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    .line 2043
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$74;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$74;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setOnStickerMoveListener(Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;)V

    .line 2083
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$75;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$75;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setOnTextStickerClickListener(Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;)V

    .line 2144
    return-void
.end method

.method private initSwitchCameraButton()V
    .locals 2

    .prologue
    .line 1045
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->getNumberOfCameras()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 1046
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$26;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$26;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1064
    :goto_0
    return-void

    .line 1062
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method private initVideoPreview()V
    .locals 7

    .prologue
    .line 734
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 736
    :try_start_0
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/media/utils/MediaUtils;->getVideoPreview(Landroid/net/Uri;)Lcom/vk/media/utils/MediaUtils$VideoInfo;

    move-result-object v1

    .line 737
    .local v1, "preview":Lcom/vk/media/utils/MediaUtils$VideoInfo;
    if-eqz v1, :cond_0

    iget-object v3, v1, Lcom/vk/media/utils/MediaUtils$VideoInfo;->preview:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_0

    .line 738
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->publishAspectRatio()F

    move-result v3

    invoke-virtual {v1}, Lcom/vk/media/utils/MediaUtils$VideoInfo;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Lcom/vk/media/utils/MediaUtils$VideoInfo;->getHeight()I

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/vk/stories/StoriesProcessor;->videoSize(FII)[I

    move-result-object v2

    .line 739
    .local v2, "size":[I
    iget-object v3, v1, Lcom/vk/media/utils/MediaUtils$VideoInfo;->preview:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    aget v4, v2, v4

    const/4 v5, 0x1

    aget v5, v2, v5

    iget-boolean v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->mirror:Z

    invoke-static {v3, v4, v5, v6}, Lcom/vk/attachpicker/util/BitmapUtils;->centerCropBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoPreview:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 745
    .end local v1    # "preview":Lcom/vk/media/utils/MediaUtils$VideoInfo;
    .end local v2    # "size":[I
    :cond_0
    :goto_0
    return-void

    .line 741
    :catch_0
    move-exception v0

    .line 742
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v3, "tmp"

    const-string/jumbo v4, ""

    invoke-static {v3, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private isDefaultEditorState()Z
    .locals 1

    .prologue
    .line 553
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->isDefault()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    .line 554
    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->isDefault()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isMasksAvailable()Z
    .locals 1

    .prologue
    .line 1178
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksController;->isMasksAvailable()Z

    move-result v0

    return v0
.end method

.method private isRecording()Z
    .locals 1

    .prologue
    .line 2203
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private markMaskSectionAsViewed(Lcom/vk/masks/model/MaskSection;)V
    .locals 3
    .param p1, "section"    # Lcom/vk/masks/model/MaskSection;

    .prologue
    .line 1507
    invoke-virtual {p1}, Lcom/vk/masks/model/MaskSection;->isRecentSection()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p1, Lcom/vk/masks/model/MaskSection;->hasNew:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1508
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    iget v1, p1, Lcom/vk/masks/model/MaskSection;->id:I

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksController;->markSectionAsViewed(I)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$46;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$46;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$47;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$47;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1509
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 1508
    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1522
    :cond_0
    return-void
.end method

.method private masksIndicatorShouldBeVisible()Z
    .locals 1

    .prologue
    .line 1503
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v0}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private masksPanelVisible()Z
    .locals 1

    .prologue
    .line 1813
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onMaskOpenFailed()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1473
    iput-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    .line 1474
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->setSelectedMask(ILcom/vk/masks/model/Mask;)V

    .line 1475
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskClearButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1476
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    .line 1477
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0, v2}, Lcom/vk/camera/camera1/Camera1View;->setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;

    .line 1479
    :cond_0
    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMaskAuthorWithDelay(J)V

    .line 1480
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMasksProgress()V

    .line 1481
    invoke-virtual {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->notifyMasksChanged()V

    .line 1482
    const v0, 0x7f080352

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 1483
    return-void
.end method

.method private onStickerClick()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 2959
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->STICKERS_SELECTION:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 2961
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    if-nez v0, :cond_0

    .line 2962
    new-instance v0, Lcom/vk/attachpicker/stickers/EditorStickerView;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerListener:Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

    invoke-direct {v0, p0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;-><init>(Landroid/content/Context;Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    .line 2963
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setTopPadding(I)V

    .line 2964
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersContainer:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 2967
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setAlpha(F)V

    .line 2968
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setVisibility(I)V

    .line 2969
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->checkSelection()V

    .line 2971
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$90;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$90;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    const-wide/16 v2, 0x20

    invoke-virtual {p0, v0, v2, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->postDelayed(Ljava/lang/Runnable;J)V

    .line 2978
    return-void
.end method

.method private onTextClick()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 2981
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    if-nez v0, :cond_0

    .line 2982
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideEditorUI()V

    .line 2983
    new-instance v0, Lcom/vk/attachpicker/stickers/TextStickerDialog;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$91;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$91;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-direct {v0, v2, v2, p0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;-><init>(ZZLandroid/content/Context;Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .line 2993
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$92;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$92;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 3000
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->show()V

    .line 3002
    :cond_0
    return-void
.end method

.method private onVideoFileReady(Ljava/io/File;)V
    .locals 4
    .param p1, "video"    # Ljava/io/File;

    .prologue
    .line 2343
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$79;

    invoke-direct {v1, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$79;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/io/File;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2355
    return-void
.end method

.method private openDrawing()V
    .locals 13

    .prologue
    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v11, 0x2

    const/4 v10, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 2832
    sget-object v3, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->DRAWING:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 2834
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v3}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v3

    if-lez v3, :cond_0

    move v3, v4

    :goto_0
    invoke-virtual {v6, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 2835
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v3}, Lcom/vk/attachpicker/drawing/DrawingView;->saveState()V

    .line 2838
    invoke-direct {p0, v5, v5, v5}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    .line 2840
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v10}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 2841
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v5}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2842
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v12}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 2843
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v5}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2845
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2846
    .local v1, "set1":Landroid/animation/AnimatorSet;
    new-array v3, v11, [Landroid/animation/Animator;

    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v8, v4, [F

    sget v9, Lcom/vk/stories/CreateAndEditStoryActivity;->SMALL_PANEL_HEIGHT:I

    int-to-float v9, v9

    aput v9, v8, v5

    .line 2847
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v3, v5

    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    sget-object v7, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v8, v4, [F

    aput v10, v8, v5

    .line 2848
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v3, v4

    .line 2846
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2850
    sget-object v3, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2851
    const-wide/16 v6, 0xaf

    invoke-virtual {v1, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 2852
    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$85;

    invoke-direct {v3, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$85;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2866
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2867
    .local v2, "set2":Landroid/animation/AnimatorSet;
    new-array v3, v11, [Landroid/animation/Animator;

    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingBottomPanel:Landroid/widget/FrameLayout;

    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v8, v4, [F

    aput v10, v8, v5

    .line 2868
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v3, v5

    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoContainer:Landroid/view/View;

    sget-object v7, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v8, v4, [F

    aput v12, v8, v5

    .line 2869
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v3, v4

    .line 2867
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2871
    sget-object v3, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2872
    const-wide/16 v6, 0xaf

    invoke-virtual {v2, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 2874
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2875
    .local v0, "set":Landroid/animation/AnimatorSet;
    new-array v3, v11, [Landroid/animation/Animator;

    aput-object v1, v3, v5

    aput-object v2, v3, v4

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 2876
    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$86;

    invoke-direct {v3, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$86;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2883
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 2884
    return-void

    .end local v0    # "set":Landroid/animation/AnimatorSet;
    .end local v1    # "set1":Landroid/animation/AnimatorSet;
    .end local v2    # "set2":Landroid/animation/AnimatorSet;
    :cond_0
    move v3, v5

    .line 2834
    goto/16 :goto_0
.end method

.method private openMaskById(Ljava/lang/String;)V
    .locals 3
    .param p1, "maskId"    # Ljava/lang/String;

    .prologue
    .line 1281
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1329
    :goto_0
    return-void

    .line 1286
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadLocalMasks(Z)V

    .line 1289
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    .line 1290
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1291
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    .line 1293
    :cond_1
    const-wide/16 v0, 0x64

    invoke-direct {p0, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMaskAuthorWithDelay(J)V

    .line 1294
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMasksProgress()V

    .line 1298
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocationRx()Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$39;

    invoke-direct {v1, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$39;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/String;)V

    .line 1299
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$38;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$38;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1309
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$36;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$36;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$37;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$37;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1315
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 1297
    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    goto :goto_0
.end method

.method private openMasksPanel()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 1673
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1674
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPagerAdapter:Lcom/vk/masks/MasksPagerAdapter;

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v3}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/vk/masks/MasksPagerAdapter;->findIndexBySectionId(I)I

    move-result v0

    .line 1675
    .local v0, "neededIndex":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 1676
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    sub-int v1, v0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-gt v1, v2, :cond_3

    move v1, v2

    :goto_0
    invoke-virtual {v3, v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 1680
    .end local v0    # "neededIndex":I
    :cond_0
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideCameraTooltip()V

    .line 1681
    invoke-direct {p0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->showMasksPanel(Z)V

    .line 1684
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1685
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/camera/camera1/Camera1View;->setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;

    .line 1688
    :cond_1
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1689
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/masks/MasksController;->getEngineModel()Lio/reactivex/Observable;

    move-result-object v1

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$53;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$53;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$54;

    invoke-direct {v3, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$54;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1690
    invoke-virtual {v1, v2, v3}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v1

    .line 1689
    invoke-virtual {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1701
    :cond_2
    return-void

    .line 1676
    .restart local v0    # "neededIndex":I
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private publishAspectRatio()F
    .locals 2

    .prologue
    .line 730
    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-static {}, Lcom/vk/core/util/Screen;->realHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method private reloadMaskSections(Z)V
    .locals 3
    .param p1, "onlyCache"    # Z

    .prologue
    .line 1551
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1552
    if-nez p1, :cond_0

    .line 1553
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->LOADING:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    invoke-direct {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->setMasksState(Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;)V

    .line 1555
    :cond_0
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    .line 1556
    invoke-virtual {v0, p1}, Lcom/vk/masks/MasksController;->getSections(Z)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$50;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$50;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$51;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$51;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1557
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 1555
    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1575
    :cond_1
    return-void
.end method

.method private reloadMasksNewBadge()V
    .locals 3

    .prologue
    .line 1525
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksHasNew;

    invoke-direct {v0}, Lcom/vkontakte/android/api/masks/MasksHasNew;-><init>()V

    .line 1526
    invoke-virtual {v0}, Lcom/vkontakte/android/api/masks/MasksHasNew;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$48;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$48;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$49;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$49;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1527
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 1525
    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1539
    return-void
.end method

.method private resetVolumeButtonAction()V
    .locals 2

    .prologue
    .line 2412
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->volumeButtonLastAction:I

    .line 2413
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->volumeButtonLastActionTime:J

    .line 2414
    return-void
.end method

.method private retrieveLocation()V
    .locals 2

    .prologue
    .line 624
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->locationRetrieveAsyncTask:Landroid/os/AsyncTask;

    if-nez v0, :cond_0

    .line 625
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$12;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$12;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->locationRetrieveAsyncTask:Landroid/os/AsyncTask;

    .line 637
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->locationRetrieveAsyncTask:Landroid/os/AsyncTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 639
    :cond_0
    return-void
.end method

.method private selectBrush(I)V
    .locals 2
    .param p1, "brushType"    # I

    .prologue
    .line 2626
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setBrushType(I)V

    .line 2627
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 2628
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushPen:Lcom/vk/stories/view/BrushSelectorView;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingView;->getColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/BrushSelectorView;->setColor(I)V

    .line 2629
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushMarker:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0}, Lcom/vk/stories/view/BrushSelectorView;->setColorNone()V

    .line 2630
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushNeon:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0}, Lcom/vk/stories/view/BrushSelectorView;->setColorNone()V

    .line 2640
    :cond_0
    :goto_0
    return-void

    .line 2631
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 2632
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushPen:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0}, Lcom/vk/stories/view/BrushSelectorView;->setColorNone()V

    .line 2633
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushMarker:Lcom/vk/stories/view/BrushSelectorView;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingView;->getColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/BrushSelectorView;->setColor(I)V

    .line 2634
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushNeon:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0}, Lcom/vk/stories/view/BrushSelectorView;->setColorNone()V

    goto :goto_0

    .line 2635
    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 2636
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushPen:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0}, Lcom/vk/stories/view/BrushSelectorView;->setColorNone()V

    .line 2637
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushMarker:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0}, Lcom/vk/stories/view/BrushSelectorView;->setColorNone()V

    .line 2638
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushNeon:Lcom/vk/stories/view/BrushSelectorView;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingView;->getColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/BrushSelectorView;->setColor(I)V

    goto :goto_0
.end method

.method private setCameraButtonEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 597
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButtonOnTouchListener:Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;

    if-eqz v0, :cond_0

    .line 598
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButtonOnTouchListener:Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;

    invoke-virtual {v0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->setEnabled(Z)V

    .line 600
    :cond_0
    return-void
.end method

.method private setCameraState()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 603
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 604
    const/4 v0, 0x1

    invoke-direct {p0, v0, v1, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    .line 605
    invoke-direct {p0, v1, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setDrawingTouches(ZZ)V

    .line 606
    return-void
.end method

.method private setControlsEnabled(ZZZ)V
    .locals 4
    .param p1, "camera"    # Z
    .param p2, "editor"    # Z
    .param p3, "drawing"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 558
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    if-eqz p3, :cond_4

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->controlsEnabled:Z

    .line 561
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    if-nez p1, :cond_1

    if-eqz p2, :cond_5

    :cond_1
    move v0, v2

    :goto_1
    invoke-virtual {v3, v0}, Lcom/vk/stories/view/ShutterButton;->setEnabled(Z)V

    .line 562
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    if-nez p1, :cond_2

    if-eqz p2, :cond_6

    :cond_2
    move v0, v2

    :goto_2
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 565
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 566
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 567
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 568
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnail:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 571
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->muteButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 572
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->saveButton:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 573
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersAction:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 574
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->textAction:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 575
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawAction:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 578
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingCancel:Landroid/view/View;

    invoke-virtual {v0, p3}, Landroid/view/View;->setEnabled(Z)V

    .line 579
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingApply:Landroid/view/View;

    invoke-virtual {v0, p3}, Landroid/view/View;->setEnabled(Z)V

    .line 580
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    if-eqz p3, :cond_3

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v3}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v3

    if-lez v3, :cond_3

    move v1, v2

    :cond_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 581
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->widthSelectorBtn:Landroid/widget/ImageView;

    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 582
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v0, p3}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setEnabled(Z)V

    .line 583
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushPen:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0, p3}, Lcom/vk/stories/view/BrushSelectorView;->setEnabled(Z)V

    .line 584
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushMarker:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0, p3}, Lcom/vk/stories/view/BrushSelectorView;->setEnabled(Z)V

    .line 585
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->brushNeon:Lcom/vk/stories/view/BrushSelectorView;

    invoke-virtual {v0, p3}, Lcom/vk/stories/view/BrushSelectorView;->setEnabled(Z)V

    .line 588
    invoke-direct {p0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->setCameraButtonEnabled(Z)V

    .line 589
    return-void

    :cond_4
    move v0, v1

    .line 558
    goto :goto_0

    :cond_5
    move v0, v1

    .line 561
    goto :goto_1

    :cond_6
    move v0, v1

    .line 562
    goto :goto_2
.end method

.method private setDrawingTouches(ZZ)V
    .locals 1
    .param p1, "stickers"    # Z
    .param p2, "draw"    # Z

    .prologue
    .line 592
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setTouchEnabled(Z)V

    .line 593
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, p2}, Lcom/vk/attachpicker/drawing/DrawingView;->setTouchEnabled(Z)V

    .line 594
    return-void
.end method

.method private varargs setInvisible([Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # [Landroid/view/View;

    .prologue
    .line 2661
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 2662
    aget-object v1, p1, v0

    if-eqz v1, :cond_0

    .line 2663
    aget-object v1, p1, v0

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2661
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2666
    :cond_1
    return-void
.end method

.method private setMasksSections(Ljava/util/ArrayList;Z)V
    .locals 4
    .param p2, "forceUpdate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    const/4 v1, 0x0

    .line 1578
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelHeader:Lcom/vk/masks/MaskTabsIndicator;

    invoke-virtual {v0, p1}, Lcom/vk/masks/MaskTabsIndicator;->setSections(Ljava/util/ArrayList;)V

    .line 1579
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPagerAdapter:Lcom/vk/masks/MasksPagerAdapter;

    if-nez p2, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPagerAdapter:Lcom/vk/masks/MasksPagerAdapter;

    invoke-virtual {v3}, Lcom/vk/masks/MasksPagerAdapter;->getCount()I

    move-result v3

    if-eq v0, v3, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, p1, v0}, Lcom/vk/masks/MasksPagerAdapter;->setSections(Ljava/util/ArrayList;Z)V

    .line 1580
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->MASKS:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    invoke-direct {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->setMasksState(Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;)V

    .line 1581
    invoke-virtual {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadLocalMasks(Z)V

    .line 1582
    return-void

    :cond_1
    move v0, v1

    .line 1579
    goto :goto_0
.end method

.method private setMasksState(Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;)V
    .locals 3
    .param p1, "masksState"    # Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x8

    .line 1585
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->ERROR:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    if-ne p1, v0, :cond_1

    .line 1586
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingErrorView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1587
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelHeader:Lcom/vk/masks/MaskTabsIndicator;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MaskTabsIndicator;->setVisibility(I)V

    .line 1588
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setVisibility(I)V

    .line 1589
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1604
    :cond_0
    :goto_0
    return-void

    .line 1591
    :cond_1
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->LOADING:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    if-ne p1, v0, :cond_2

    .line 1592
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingErrorView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1593
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelHeader:Lcom/vk/masks/MaskTabsIndicator;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MaskTabsIndicator;->setVisibility(I)V

    .line 1594
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setVisibility(I)V

    .line 1595
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 1597
    :cond_2
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->MASKS:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    if-ne p1, v0, :cond_0

    .line 1598
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingErrorView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1599
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelHeader:Lcom/vk/masks/MaskTabsIndicator;

    invoke-virtual {v0, v2}, Lcom/vk/masks/MaskTabsIndicator;->setVisibility(I)V

    .line 1600
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->setVisibility(I)V

    .line 1601
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksLoadingView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private setNewMasksBadge(I)V
    .locals 2
    .param p1, "o"    # I

    .prologue
    .line 1542
    if-lez p1, :cond_0

    .line 1543
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->newMasksBadge:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1544
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->newMasksBadge:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setVisibility(I)V

    .line 1548
    :goto_0
    return-void

    .line 1546
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->newMasksBadge:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setVisibility(I)V

    goto :goto_0
.end method

.method private setVideoRecording(ZZ)V
    .locals 10
    .param p1, "animated"    # Z
    .param p2, "isRecording"    # Z

    .prologue
    .line 2547
    if-eqz p1, :cond_1

    .line 2548
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelShower:Lcom/vk/core/widget/ViewShower;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 2549
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorShower:Lcom/vk/core/widget/ViewShower;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 2550
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionShower:Lcom/vk/core/widget/ViewShower;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 2552
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2553
    .local v0, "set":Landroid/animation/AnimatorSet;
    if-eqz p2, :cond_0

    .line 2554
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 2555
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2556
    .local v1, "set1":Landroid/animation/AnimatorSet;
    const/4 v3, 0x7

    new-array v3, v3, [Landroid/animation/Animator;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/4 v9, 0x0

    aput v9, v7, v8

    .line 2557
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/4 v9, 0x0

    aput v9, v7, v8

    .line 2558
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/4 v9, 0x0

    aput v9, v7, v8

    .line 2559
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/4 v9, 0x0

    aput v9, v7, v8

    .line 2560
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/4 v9, 0x0

    aput v9, v7, v8

    .line 2561
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/4 v9, 0x0

    aput v9, v7, v8

    .line 2562
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/4 v9, 0x0

    aput v9, v7, v8

    .line 2563
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    .line 2556
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2566
    const/4 v3, 0x1

    new-array v3, v3, [Landroid/animation/Animator;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 2582
    .end local v1    # "set1":Landroid/animation/AnimatorSet;
    :goto_0
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 2609
    .end local v0    # "set":Landroid/animation/AnimatorSet;
    :goto_1
    return-void

    .line 2570
    .restart local v0    # "set":Landroid/animation/AnimatorSet;
    :cond_0
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 2571
    .local v2, "set2":Landroid/animation/AnimatorSet;
    const/4 v3, 0x7

    new-array v3, v3, [Landroid/animation/Animator;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v7, v8

    .line 2572
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v7, v8

    .line 2573
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v7, v8

    .line 2574
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v7, v8

    .line 2575
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v7, v8

    .line 2576
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v7, v8

    .line 2577
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x1

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v7, v8

    .line 2578
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v3, v4

    .line 2571
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2580
    const/4 v3, 0x1

    new-array v3, v3, [Landroid/animation/Animator;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    goto/16 :goto_0

    .line 2585
    .end local v0    # "set":Landroid/animation/AnimatorSet;
    .end local v2    # "set2":Landroid/animation/AnimatorSet;
    :cond_1
    if-eqz p2, :cond_2

    .line 2586
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 2587
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2588
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2589
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2590
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 2591
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 2592
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2593
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 2594
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->setAlpha(F)V

    .line 2595
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    goto/16 :goto_1

    .line 2597
    :cond_2
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->closeButton:Landroid/widget/ImageView;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2598
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->flashButton:Landroid/widget/ImageView;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2599
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->settingsButton:Landroid/widget/ImageView;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2600
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 2601
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanel:Landroid/widget/LinearLayout;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 2602
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 2603
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 2604
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->setAlpha(F)V

    .line 2605
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 2606
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setAlpha(F)V

    goto/16 :goto_1
.end method

.method private varargs setVisibleNoAlpha([Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # [Landroid/view/View;

    .prologue
    .line 2652
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 2653
    aget-object v1, p1, v0

    if-eqz v1, :cond_0

    .line 2654
    aget-object v1, p1, v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 2655
    aget-object v1, p1, v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2652
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2658
    :cond_1
    return-void
.end method

.method private showAndHideMaskAction(Lcom/vk/masks/model/Mask;J)V
    .locals 4
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;
    .param p2, "showDelay"    # J

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x2

    .line 1621
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskActionView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vk/masks/model/Mask;->userHint:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1623
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 1624
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1626
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1627
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-static {v1, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0xbb8

    add-long/2addr v2, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1628
    return-void
.end method

.method private showDeleteArea()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 2167
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/StickerDeleteAreaView;->setVisibility(I)V

    .line 2168
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/StickerDeleteAreaView;->setAlpha(F)V

    .line 2169
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/StickerDeleteAreaView;->setProgress(F)V

    .line 2170
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->stickerDeleteArea:Lcom/vk/stories/view/StickerDeleteAreaView;

    .line 2171
    invoke-virtual {v0}, Lcom/vk/stories/view/StickerDeleteAreaView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 2172
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    .line 2173
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 2174
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc3

    .line 2175
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 2176
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2177
    return-void
.end method

.method private showDrawingUI()V
    .locals 6

    .prologue
    const-wide/16 v4, 0xc3

    const-wide/16 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 2147
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingBottomPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2148
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingUndoButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2149
    return-void
.end method

.method private showEditorUI()V
    .locals 4

    .prologue
    const-wide/16 v2, 0xc3

    const/high16 v1, 0x3f800000    # 1.0f

    .line 2157
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->topButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2158
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomButtonsPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 2159
    return-void
.end method

.method private showLastPhotoVideoIcon()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1076
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v2, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-eq v1, v2, :cond_0

    .line 1116
    :goto_0
    return-void

    .line 1080
    :cond_0
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1081
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 1084
    :cond_1
    invoke-static {}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedPhotoVideo()Ljava/util/ArrayList;

    move-result-object v0

    .line 1085
    .local v0, "lastPhotoVideo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    if-eqz v0, :cond_2

    .line 1086
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 1087
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1088
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v1}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1089
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v1}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v1

    iget-wide v4, v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->dateTaken:J

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x5265c00

    cmp-long v1, v2, v4

    if-gez v1, :cond_2

    .line 1090
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v1}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryLastEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 1093
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1098
    :goto_1
    const/16 v1, 0x6f

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$27;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$27;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-static {v1, v2}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->load(ILcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V

    goto :goto_0

    .line 1095
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryLastEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 1096
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method private showMaskAuthor(Lcom/vk/masks/model/Mask;)V
    .locals 6
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1631
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->hasAuthor()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1632
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorImage:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1633
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorName:Landroid/widget/TextView;

    const v1, 0x7f08034e

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getAuthorName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1634
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$52;

    invoke-direct {v1, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$52;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1642
    invoke-direct {p0, v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->forceHideMaskAction(Z)V

    .line 1644
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-virtual {v0, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 1645
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v0}, Lcom/vk/core/widget/ViewShower;->show()V

    .line 1652
    :goto_0
    return-void

    .line 1647
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorImage:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    .line 1648
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorName:Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1649
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskAuthorView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method private showMasksPanel(Z)V
    .locals 11
    .param p1, "animated"    # Z

    .prologue
    const/4 v10, 0x0

    const-wide/16 v8, 0xc3

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1704
    invoke-direct {p0, v7, v7, v7}, Lcom/vk/stories/CreateAndEditStoryActivity;->setControlsEnabled(ZZZ)V

    .line 1706
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v1}, Lcom/vk/core/widget/ViewShower;->show()V

    .line 1707
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v1, p1}, Lcom/vk/stories/view/ShutterButton;->toMasksShutter(Z)Landroid/animation/AnimatorSet;

    .line 1709
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1710
    .local v0, "set":Landroid/animation/AnimatorSet;
    const/4 v1, 0x5

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->galleryThumbnailContainer:Landroid/view/View;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v6, [F

    aput v10, v4, v7

    .line 1711
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->switchCamera:Landroid/widget/ImageView;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v6, [F

    aput v10, v4, v7

    .line 1712
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksOpenButton:Landroid/view/View;

    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v6, [F

    aput v10, v5, v7

    .line 1713
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v6, [F

    aput v10, v5, v7

    .line 1714
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->bottomInfoContainer:Landroid/view/View;

    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v5, v6, [F

    const/16 v6, 0x40

    .line 1715
    invoke-static {v6}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v6

    neg-int v6, v6

    int-to-float v6, v6

    aput v6, v5, v7

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1710
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1717
    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$55;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$55;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1724
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 1725
    return-void
.end method

.method private showMasksProgress()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1608
    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->forceHideMaskAction(Z)V

    .line 1610
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskProgressHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1611
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksProgressShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v0}, Lcom/vk/core/widget/ViewShower;->show()V

    .line 1612
    return-void
.end method

.method private showNextMask()V
    .locals 6

    .prologue
    .line 1817
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1835
    :cond_0
    :goto_0
    return-void

    .line 1820
    :cond_1
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isRecording()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v4}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 1821
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v5}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/vk/masks/MasksContainer;->masksListForSectionId(I)Ljava/util/ArrayList;

    move-result-object v3

    .line 1822
    .local v3, "selectedMasksSection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v4}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 1823
    .local v0, "currentPosition":I
    add-int/lit8 v1, v0, 0x1

    .local v1, "i":I
    :goto_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 1824
    if-ltz v1, :cond_2

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 1825
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/masks/model/Mask;

    .line 1826
    .local v2, "mask":Lcom/vk/masks/model/Mask;
    invoke-virtual {v2}, Lcom/vk/masks/model/Mask;->isSupported()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lcom/vk/masks/model/Mask;->isDisabled()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1827
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v4}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v4

    invoke-virtual {p0, v4, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->onMaskSelected(ILcom/vk/masks/model/Mask;)V

    goto :goto_0

    .line 1823
    .end local v2    # "mask":Lcom/vk/masks/model/Mask;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1833
    :cond_3
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->openMasksPanel()V

    goto :goto_0
.end method

.method private showPrevMask()V
    .locals 6

    .prologue
    .line 1838
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1854
    :cond_0
    :goto_0
    return-void

    .line 1841
    :cond_1
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isRecording()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v4}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 1842
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    iget-object v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v5}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/vk/masks/MasksContainer;->masksListForSectionId(I)Ljava/util/ArrayList;

    move-result-object v3

    .line 1843
    .local v3, "selectedMasksSection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v4}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 1844
    .local v0, "currentPosition":I
    add-int/lit8 v1, v0, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_0

    .line 1845
    if-ltz v1, :cond_2

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 1846
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/masks/model/Mask;

    .line 1847
    .local v2, "mask":Lcom/vk/masks/model/Mask;
    invoke-virtual {v2}, Lcom/vk/masks/model/Mask;->isSupported()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lcom/vk/masks/model/Mask;->isDisabled()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1848
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v4}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v4

    invoke-virtual {p0, v4, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->onMaskSelected(ILcom/vk/masks/model/Mask;)V

    goto :goto_0

    .line 1844
    .end local v2    # "mask":Lcom/vk/masks/model/Mask;
    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method

.method private showProgressDialog(J)V
    .locals 3
    .param p1, "delay"    # J

    .prologue
    .line 717
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->showProgressDialogRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 718
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->showProgressDialogRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 719
    return-void
.end method

.method private startCamera()V
    .locals 4

    .prologue
    .line 2207
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraStartRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cancel(Ljava/lang/Runnable;)V

    .line 2208
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    .line 2209
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->start()V

    .line 2213
    :goto_0
    return-void

    .line 2211
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraStartRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x12c

    invoke-virtual {p0, v0, v2, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0
.end method

.method private startRecording()V
    .locals 1

    .prologue
    .line 2331
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    .line 2332
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->startRecording()Z

    .line 2334
    :cond_0
    return-void
.end method

.method private stopCamera(Z)V
    .locals 1
    .param p1, "keep"    # Z

    .prologue
    .line 2216
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraStartRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->cancel(Ljava/lang/Runnable;)V

    .line 2217
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    .line 2218
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0, p1}, Lcom/vk/camera/camera1/Camera1View;->stop(Z)V

    .line 2220
    :cond_0
    return-void
.end method

.method private stopRecording()V
    .locals 1

    .prologue
    .line 2337
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    .line 2338
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->stopRecording()V

    .line 2340
    :cond_0
    return-void
.end method

.method private storyUploadParams()Lcom/vk/stories/model/StoryUploadParams;
    .locals 3

    .prologue
    .line 933
    new-instance v0, Lcom/vk/stories/model/StoryUploadParams;

    invoke-direct {v0}, Lcom/vk/stories/model/StoryUploadParams;-><init>()V

    .line 934
    .local v0, "params":Lcom/vk/stories/model/StoryUploadParams;
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->captureLocation:Landroid/location/Location;

    if-eqz v1, :cond_0

    .line 935
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->captureLocation:Landroid/location/Location;

    invoke-virtual {v0, v1}, Lcom/vk/stories/model/StoryUploadParams;->setLocation(Landroid/location/Location;)Lcom/vk/stories/model/StoryUploadParams;

    .line 937
    :cond_0
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 938
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/model/StoryUploadParams;->setMaskId(Ljava/lang/String;)Lcom/vk/stories/model/StoryUploadParams;

    .line 939
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/model/StoryUploadParams;->setSectionId(I)Lcom/vk/stories/model/StoryUploadParams;

    .line 941
    :cond_1
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v1, :cond_2

    .line 942
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/Camera1View;->getCurrentMode()Lcom/vk/camera/CameraMode;

    move-result-object v1

    sget-object v2, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    if-ne v1, v2, :cond_3

    .line 943
    sget-object v1, Lcom/vk/stories/model/StoryUploadParams$CameraType;->BACK:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    invoke-virtual {v0, v1}, Lcom/vk/stories/model/StoryUploadParams;->setCameraType(Lcom/vk/stories/model/StoryUploadParams$CameraType;)Lcom/vk/stories/model/StoryUploadParams;

    .line 948
    :cond_2
    :goto_0
    return-object v0

    .line 945
    :cond_3
    sget-object v1, Lcom/vk/stories/model/StoryUploadParams$CameraType;->FRONT:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    invoke-virtual {v0, v1}, Lcom/vk/stories/model/StoryUploadParams;->setCameraType(Lcom/vk/stories/model/StoryUploadParams$CameraType;)Lcom/vk/stories/model/StoryUploadParams;

    goto :goto_0
.end method

.method private takePhoto()V
    .locals 1

    .prologue
    .line 2325
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    .line 2326
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->takePicture()V

    .line 2328
    :cond_0
    return-void
.end method

.method private trackDraw(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 3159
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$97;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$97;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 3165
    return-void
.end method

.method private trackEmoji(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 3127
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$95;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$95;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 3142
    return-void
.end method

.method private trackStickers(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 3106
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$94;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$94;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 3124
    return-void
.end method

.method private trackText(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 3145
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$96;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$96;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 3156
    return-void
.end method


# virtual methods
.method public cancel(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 3091
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3092
    return-void
.end method

.method public checkMaskForUpdates(Lcom/vk/masks/model/Mask;)V
    .locals 3
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 1764
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vk/masks/MasksController;->checkMaskForUpdates(Lcom/vk/masks/model/Mask;)Lio/reactivex/Observable;

    move-result-object v0

    .line 1765
    .local v0, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/vk/masks/model/Mask;>;"
    if-eqz v0, :cond_0

    .line 1766
    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$57;

    invoke-direct {v1, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$57;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;)V

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$58;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$58;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1783
    :cond_0
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 397
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 398
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    .line 399
    .local v1, "keyCode":I
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v3, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v2, v3, :cond_2

    const/16 v2, 0x18

    if-eq v1, v2, :cond_0

    const/16 v2, 0x19

    if-ne v1, v2, :cond_2

    .line 401
    :cond_0
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButtonOnTouchListener:Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;

    invoke-virtual {v2}, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->isConfirmedLongTap()Z

    move-result v2

    if-nez v2, :cond_1

    .line 402
    invoke-direct {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->dispatchVolumeButton(I)V

    .line 404
    :cond_1
    const/4 v2, 0x1

    .line 406
    :goto_0
    return v2

    :cond_2
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v2

    goto :goto_0
.end method

.method public notifyMasksChanged()V
    .locals 3

    .prologue
    .line 1757
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 1758
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/masks/MasksView;

    .line 1759
    .local v1, "mv":Lcom/vk/masks/MasksView;
    invoke-virtual {v1}, Lcom/vk/masks/MasksView;->notifyDataSetChanged()V

    .line 1757
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1761
    .end local v1    # "mv":Lcom/vk/masks/MasksView;
    :cond_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 11
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v10, 0x0

    .line 472
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 473
    if-ne p1, v3, :cond_3

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v0, v1, :cond_3

    .line 474
    const-string/jumbo v0, "result_attachments"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    .line 475
    .local v8, "resultBundle":Landroid/os/Bundle;
    if-eqz v8, :cond_0

    .line 476
    const-string/jumbo v0, "result_files"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 477
    .local v7, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    const-string/jumbo v0, "result_video_flags"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getBooleanArray(Ljava/lang/String;)[Z

    move-result-object v9

    .line 478
    .local v9, "videoFlags":[Z
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_0

    if-eqz v9, :cond_0

    array-length v0, v9

    if-nez v0, :cond_1

    .line 532
    .end local v7    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .end local v8    # "resultBundle":Landroid/os/Bundle;
    .end local v9    # "videoFlags":[Z
    :cond_0
    :goto_0
    return-void

    .line 483
    .restart local v7    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .restart local v8    # "resultBundle":Landroid/os/Bundle;
    .restart local v9    # "videoFlags":[Z
    :cond_1
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 486
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 487
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->previewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v10}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 490
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->dropState()V

    .line 491
    invoke-virtual {p0, v10, v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->onMaskSelected(ILcom/vk/masks/model/Mask;)V

    .line 493
    aget-boolean v0, v9, v10

    if-eqz v0, :cond_2

    .line 494
    new-instance v1, Ljava/io/File;

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoFile:Ljava/io/File;

    .line 495
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreview()V

    .line 524
    :goto_1
    invoke-direct {p0, v10}, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraToEditor(Z)V

    goto :goto_0

    .line 497
    :cond_2
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreview()V

    .line 498
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v1, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;

    const/16 v2, 0x14

    invoke-direct {v1, v3, v2}, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;-><init>(II)V

    invoke-virtual {v0, v1, v4}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 499
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    sget-object v3, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    sget-object v5, Lcom/vk/imageloader/ImageSize;->BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v2, v0, v3, v1, v5}, Lcom/vk/imageloader/view/VKImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    .line 502
    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    const/16 v1, 0x438

    const/16 v2, 0x780

    const v3, 0x17280

    move-object v5, v4

    move-object v6, v4

    .line 501
    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;

    move-result-object v0

    .line 507
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 508
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$8;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$8;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$9;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$9;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 509
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 526
    .end local v7    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .end local v8    # "resultBundle":Landroid/os/Bundle;
    .end local v9    # "videoFlags":[Z
    :cond_3
    const/4 v0, 0x2

    if-ne p1, v0, :cond_4

    .line 527
    invoke-virtual {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->finish()V

    goto/16 :goto_0

    .line 528
    :cond_4
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 529
    invoke-virtual {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->finish()V

    goto/16 :goto_0
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    .line 412
    iget-boolean v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->controlsEnabled:Z

    if-nez v1, :cond_1

    .line 468
    :cond_0
    :goto_0
    return-void

    .line 416
    :cond_1
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v2, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->DRAWING:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v1, v2, :cond_3

    .line 417
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingView;->isDefault()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 418
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->closeDrawing()V

    goto :goto_0

    .line 420
    :cond_2
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingView;->undo()V

    goto :goto_0

    .line 423
    :cond_3
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v2, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->STICKERS_SELECTION:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v1, v2, :cond_4

    .line 424
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideStickers()V

    goto :goto_0

    .line 426
    :cond_4
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v2, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v1, v2, :cond_6

    .line 427
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->checkButtonLock()Z

    move-result v1

    if-nez v1, :cond_0

    .line 431
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isDefaultEditorState()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 432
    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$5;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$5;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->editorToCamera(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 440
    :cond_5
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 441
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 442
    const v1, 0x7f0804cb

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 443
    const v1, 0x7f0804f4

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$6;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$6;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 455
    const v1, 0x7f0804d6

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$7;

    invoke-direct {v2, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$7;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 461
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 463
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :cond_6
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v2, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v1, v2, :cond_7

    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelVisible()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 464
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMasksPanel(Z)V

    goto :goto_0

    .line 466
    :cond_7
    invoke-virtual {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x0

    .line 319
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 320
    invoke-virtual {p0, v1, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->overridePendingTransition(II)V

    .line 321
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->createOnCameraTouchListener()Landroid/view/View$OnTouchListener;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->onCameraTouchListener:Landroid/view/View$OnTouchListener;

    .line 323
    const v1, 0x7f03001c

    invoke-virtual {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->setContentView(I)V

    .line 324
    const v1, 0x7f100151

    invoke-virtual {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->parentView:Landroid/widget/FrameLayout;

    .line 326
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initCameraViewPart()V

    .line 327
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initEditorPartView()V

    .line 328
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->initMasksUIPart()V

    .line 329
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->setCameraState()V

    .line 332
    invoke-static {}, Lcom/vk/attachpicker/util/PickerStickers;->loadFromServer()V

    .line 333
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/Stickers;->checkServerUpdates()V

    .line 336
    invoke-virtual {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "open_mask"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 337
    .local v0, "maskId":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 338
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/vk/stories/CreateAndEditStoryActivity$4;

    invoke-direct {v2, p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity$4;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/String;)V

    const-wide/16 v4, 0x1f4

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 345
    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 388
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->dropState()V

    .line 389
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 390
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksController;->disposeMasksEngineModelGet()V

    .line 392
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 393
    return-void
.end method

.method public onMaskSelected(ILcom/vk/masks/model/Mask;)V
    .locals 10
    .param p1, "sectionId"    # I
    .param p2, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    const/4 v6, 0x0

    .line 1333
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->isMasksAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1470
    :cond_0
    :goto_0
    return-void

    .line 1336
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v0}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v0

    if-eq p2, v0, :cond_2

    if-eqz p2, :cond_3

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v0}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/vk/masks/model/Mask;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1337
    :cond_2
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksStatistics:Lcom/vk/masks/MasksAnalytics;

    invoke-virtual {v0}, Lcom/vk/masks/MasksAnalytics;->endMaskUsage()V

    .line 1338
    const/4 p2, 0x0

    .line 1340
    :cond_3
    if-eqz p2, :cond_6

    invoke-virtual {p2}, Lcom/vk/masks/model/Mask;->isDisabled()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1341
    new-instance v7, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v7, p0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1342
    .local v7, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    iget-object v0, p2, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    invoke-virtual {v0}, Lcom/vk/masks/model/Mask$DisableReason;->hasTitle()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1343
    iget-object v0, p2, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    iget-object v0, v0, Lcom/vk/masks/model/Mask$DisableReason;->title:Ljava/lang/String;

    invoke-virtual {v7, v0}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 1345
    :cond_4
    iget-object v0, p2, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    iget-object v0, v0, Lcom/vk/masks/model/Mask$DisableReason;->subtitle:Ljava/lang/String;

    invoke-virtual {v7, v0}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 1347
    iget-object v0, p2, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    invoke-virtual {v0}, Lcom/vk/masks/model/Mask$DisableReason;->hasUrl()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1348
    iget-object v0, p2, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    iget-object v8, v0, Lcom/vk/masks/model/Mask$DisableReason;->url:Ljava/lang/String;

    .line 1349
    .local v8, "moreInfoUrl":Ljava/lang/String;
    const v0, 0x7f080353

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$40;

    invoke-direct {v1, p0, v8}, Lcom/vk/stories/CreateAndEditStoryActivity$40;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/String;)V

    invoke-virtual {v7, v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 1355
    const v0, 0x7f08011f

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$41;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$41;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v7, v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 1369
    .end local v8    # "moreInfoUrl":Ljava/lang/String;
    :goto_1
    invoke-virtual {v7}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    goto :goto_0

    .line 1362
    :cond_5
    const v0, 0x7f080479

    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$42;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$42;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    invoke-virtual {v7, v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    goto :goto_1

    .line 1371
    .end local v7    # "builder":Landroid/support/v7/app/AlertDialog$Builder;
    :cond_6
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksStatistics:Lcom/vk/masks/MasksAnalytics;

    invoke-virtual {v0}, Lcom/vk/masks/MasksAnalytics;->endMaskUsage()V

    .line 1373
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_7

    .line 1374
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksStatistics:Lcom/vk/masks/MasksAnalytics;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksAnalytics;->trackMaskLoadingCanceled(Lcom/vk/masks/model/Mask;)V

    .line 1375
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1376
    iput-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    .line 1378
    :cond_7
    const-wide/16 v0, 0x1f4

    invoke-direct {p0, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMaskAuthorWithDelay(J)V

    .line 1379
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->forceHideMaskAction(Z)V

    .line 1380
    invoke-virtual {p0, p1, p2}, Lcom/vk/stories/CreateAndEditStoryActivity;->setSelectedMask(ILcom/vk/masks/model/Mask;)V

    .line 1382
    if-eqz p2, :cond_9

    .line 1383
    move-object v2, p2

    .line 1384
    .local v2, "finalMask":Lcom/vk/masks/model/Mask;
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksProgressBar:Lcom/vkontakte/android/ui/CircularProgressView;

    const v1, 0x3c23d70a    # 0.01f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressView;->setProgressNoAnim(F)V

    .line 1386
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/vk/masks/MasksController;->needDownload(Lcom/vk/masks/model/Mask;)Z

    move-result v3

    .line 1387
    .local v3, "needDownload":Z
    if-eqz v3, :cond_8

    .line 1388
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showMasksProgress()V

    .line 1389
    invoke-direct {p0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->showMaskAuthor(Lcom/vk/masks/model/Mask;)V

    .line 1392
    :cond_8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 1393
    .local v4, "firstProgressTime":J
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/vk/masks/MasksController;->getMask(Lcom/vk/masks/model/Mask;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$45;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$45;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1394
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->doOnDispose(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v9

    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$43;

    move-object v1, p0

    move v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/vk/stories/CreateAndEditStoryActivity$43;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;ZJI)V

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$44;

    invoke-direct {v1, p0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity$44;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;)V

    .line 1402
    invoke-virtual {v9, v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 1393
    invoke-virtual {p0, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->currentMaskDownload:Lio/reactivex/disposables/Disposable;

    goto/16 :goto_0

    .line 1463
    .end local v2    # "finalMask":Lcom/vk/masks/model/Mask;
    .end local v3    # "needDownload":Z
    .end local v4    # "firstProgressTime":J
    :cond_9
    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->hideMaskAuthorWithDelay(J)V

    .line 1464
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->maskClearButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1465
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    .line 1466
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0, v6}, Lcom/vk/camera/camera1/Camera1View;->setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;

    goto/16 :goto_0
.end method

.method public onMasksListUpdated(I)V
    .locals 4
    .param p1, "sectionId"    # I

    .prologue
    .line 1487
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v1

    if-eq v1, p1, :cond_0

    .line 1500
    :goto_0
    return-void

    .line 1490
    :cond_0
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v1}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1491
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/stories/view/VerticalPagerIndicator;->setVisibility(I)V

    .line 1492
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v2}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/masks/MasksContainer;->masksListForSectionId(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 1493
    .local v0, "masks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-virtual {v1}, Lcom/vk/stories/view/VerticalPagerIndicator;->getItemsCount()I

    move-result v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eq v1, v2, :cond_1

    .line 1494
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/stories/view/VerticalPagerIndicator;->setItemsCount(I)V

    .line 1496
    :cond_1
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v2}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->setCurrentPosition(IZ)V

    goto :goto_0

    .line 1498
    .end local v0    # "masks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    :cond_2
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksVerticalPagerIndicator:Lcom/vk/stories/view/VerticalPagerIndicator;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/vk/stories/view/VerticalPagerIndicator;->setVisibility(I)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 378
    invoke-direct {p0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->stopCamera(Z)V

    .line 379
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    if-eqz v0, :cond_0

    .line 380
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->pause()V

    .line 382
    :cond_0
    invoke-static {p0, v1}, Lcom/vk/camera/Utils;->keepScreenOn(Landroid/app/Activity;Z)V

    .line 383
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onPause()V

    .line 384
    return-void
.end method

.method public onReady([B)V
    .locals 2
    .param p1, "jpegData"    # [B

    .prologue
    .line 2294
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$78;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$78;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity;[B)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 2321
    invoke-virtual {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity$78;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 2322
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 349
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 350
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    if-eqz v0, :cond_0

    .line 351
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->camera1View:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->clear()V

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->screenState:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v0, v1, :cond_1

    .line 354
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->startCamera()V

    .line 357
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->setCameraState()V

    .line 358
    invoke-direct {p0, v2, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->setVideoRecording(ZZ)V

    .line 359
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelVisible()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 360
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/ShutterButton;->toMasksShutter(Z)Landroid/animation/AnimatorSet;

    .line 365
    :goto_0
    invoke-static {}, Lcom/vk/attachpicker/util/Prefs;->storiesPrefs()Lcom/vk/attachpicker/util/Prefs;

    move-result-object v0

    const-string/jumbo v1, "story_video_tooltip"

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/util/Prefs;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 366
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->cameraTooltipShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v0}, Lcom/vk/core/widget/ViewShower;->show()V

    .line 369
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    if-eqz v0, :cond_2

    .line 370
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->start()V

    .line 373
    :cond_2
    invoke-direct {p0}, Lcom/vk/stories/CreateAndEditStoryActivity;->showLastPhotoVideoIcon()V

    .line 374
    return-void

    .line 362
    :cond_3
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->shutterButton:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/ShutterButton;->toPhotoShutter(Z)Landroid/animation/AnimatorSet;

    goto :goto_0
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 3083
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 3084
    return-void
.end method

.method public postDelayed(Ljava/lang/Runnable;J)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J

    .prologue
    .line 3087
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 3088
    return-void
.end method

.method public reloadLocalMasks(Z)V
    .locals 4
    .param p1, "reloadSections"    # Z

    .prologue
    const/4 v3, -0x1

    .line 1786
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v2, v3}, Lcom/vk/masks/MasksContainer;->masksListForSectionId(I)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 1787
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v2, v3}, Lcom/vk/masks/MasksContainer;->masksListForSectionId(I)Ljava/util/ArrayList;

    move-result-object v2

    .line 1788
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/masks/MasksController;->recentMasks()Lcom/vkontakte/android/api/masks/MasksResponse;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/api/masks/MasksResponse;->masks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1790
    if-eqz p1, :cond_0

    .line 1791
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadMaskSections(Z)V

    .line 1794
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 1795
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/masks/MasksView;

    .line 1796
    .local v1, "mv":Lcom/vk/masks/MasksView;
    invoke-virtual {v1}, Lcom/vk/masks/MasksView;->reloadIfLocal()V

    .line 1794
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1798
    .end local v1    # "mv":Lcom/vk/masks/MasksView;
    :cond_1
    return-void
.end method

.method public setSelectedMask(ILcom/vk/masks/model/Mask;)V
    .locals 3
    .param p1, "sectionId"    # I
    .param p2, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 1801
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v2, p2}, Lcom/vk/masks/MasksContainer;->selectedMask(Lcom/vk/masks/model/Mask;)V

    .line 1802
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v2, p1}, Lcom/vk/masks/MasksContainer;->selectedSectionId(I)V

    .line 1804
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPagerAdapter:Lcom/vk/masks/MasksPagerAdapter;

    invoke-virtual {v2, p2}, Lcom/vk/masks/MasksPagerAdapter;->setSelectedMask(Lcom/vk/masks/model/Mask;)V

    .line 1805
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 1806
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksPanelPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/masks/MasksView;

    .line 1807
    .local v1, "mv":Lcom/vk/masks/MasksView;
    invoke-virtual {v1, p2}, Lcom/vk/masks/MasksView;->setSelectedMask(Lcom/vk/masks/model/Mask;)V

    .line 1805
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1809
    .end local v1    # "mv":Lcom/vk/masks/MasksView;
    :cond_0
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity;->masksContainer:Lcom/vk/masks/MasksContainer;

    invoke-virtual {v2}, Lcom/vk/masks/MasksContainer;->selectedSectionId()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->onMasksListUpdated(I)V

    .line 1810
    return-void
.end method
