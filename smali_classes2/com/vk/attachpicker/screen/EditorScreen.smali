.class public Lcom/vk/attachpicker/screen/EditorScreen;
.super Lcom/vk/core/simplescreen/BaseScreen;
.source "EditorScreen.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/screen/EditorScreen$Delegate;,
        Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;
    }
.end annotation


# static fields
.field public static final SCREEN_OPEN_DURATION:J = 0x15eL


# instance fields
.field private actionAuto:Landroid/view/View;

.field private actionCrop:Landroid/view/View;

.field private actionDrawing:Landroid/view/View;

.field private actionSticker:Landroid/view/View;

.field private actionText:Landroid/view/View;

.field private actionsPanel:Landroid/view/View;

.field private attachButton:Landroid/view/View;

.field private autoBottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

.field private autoPanel:Landroid/widget/FrameLayout;

.field private autoSeekBar:Lcom/vk/attachpicker/widget/VkSeekBar;

.field private autoTextView:Landroid/widget/TextView;

.field private backgroundView:Lcom/vk/attachpicker/widget/LocalImageView;

.field private bottomShadow:Landroid/view/View;

.field private final buttonClickLock:Lcom/vk/core/util/TimeoutLock;

.field private closeButton:Landroid/view/View;

.field private closeButtonContainer:Landroid/view/View;

.field private container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

.field private controlsEnabled:Z

.field private cropBgColor:I

.field private currentCropAspectRatio:Lcom/vk/attachpicker/crop/CropAspectRatio;

.field private currentTask:Lcom/vk/attachpicker/util/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/util/AsyncTask",
            "<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

.field private final delegate:Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

.field private deleteArea:Landroid/view/View;

.field private deleteIconHover:Landroid/view/View;

.field private drawingBottomLayout:Landroid/widget/LinearLayout;

.field private drawingCancel:Landroid/widget/ImageView;

.field private drawingColorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

.field private drawingDone:Landroid/widget/ImageView;

.field private drawingEraser:Landroid/widget/ImageView;

.field private drawingPanel:Landroid/view/View;

.field private drawingUndo:Landroid/widget/ImageView;

.field private drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

.field private drawingWidth:Landroid/widget/ImageView;

.field private editorBgColor:I

.field private editorContainer:Landroid/widget/FrameLayout;

.field private final editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

.field private final entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

.field private filterTitle:Landroid/widget/TextView;

.field private final filtersList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

.field private final imageState:Lcom/vk/attachpicker/editor/ImageState;

.field private layoutPagerPosition:I

.field private final locker:Lcom/vk/attachpicker/util/OrientationLocker;

.field private mainContainer:Landroid/widget/FrameLayout;

.field private overlayContainer:Landroid/widget/FrameLayout;

.field private final pageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

.field private pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

.field private pagerState:I

.field private screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

.field private shouldPlayOpenAnimation:Z

.field private stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

.field private stickersKeyboardContainer:Landroid/widget/FrameLayout;

.field private stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

.field private tempAutoValue:F

.field private final thumb:Z

.field private tooltip:Landroid/widget/TextView;

.field private tooltipController:Lcom/vk/attachpicker/util/TooltipController;

.field private topPadding:I


# direct methods
.method public constructor <init>(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Lcom/vk/attachpicker/screen/EditorScreen$Delegate;Z)V
    .locals 4
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .param p2, "delegate"    # Lcom/vk/attachpicker/screen/EditorScreen$Delegate;
    .param p3, "thumb"    # Z

    .prologue
    const/4 v1, 0x0

    .line 156
    invoke-direct {p0}, Lcom/vk/core/simplescreen/BaseScreen;-><init>()V

    .line 79
    invoke-static {}, Lcom/vk/attachpicker/EditorAnalytics;->imageEditorAnalytics()Lcom/vk/attachpicker/EditorAnalytics;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    .line 81
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->buttonClickLock:Lcom/vk/core/util/TimeoutLock;

    .line 82
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/json/FiltersController;->filters()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->filtersList:Ljava/util/ArrayList;

    .line 83
    new-instance v0, Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-direct {v0}, Lcom/vk/attachpicker/util/OrientationLocker;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    .line 85
    iput v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->topPadding:I

    .line 107
    sget-object v0, Lcom/vk/attachpicker/crop/CropAspectRatio;->CROP_NOT_SELECTED:Lcom/vk/attachpicker/crop/CropAspectRatio;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentCropAspectRatio:Lcom/vk/attachpicker/crop/CropAspectRatio;

    .line 148
    iput v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    .line 1442
    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$23;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/EditorScreen$23;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 157
    new-instance v0, Lcom/vk/attachpicker/editor/ImageState;

    invoke-direct {v0, p1}, Lcom/vk/attachpicker/editor/ImageState;-><init>(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    .line 158
    iput-object p2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->delegate:Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

    .line 159
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 160
    iput-boolean p3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->thumb:Z

    .line 161
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->init()V

    .line 162
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/vk/attachpicker/screen/EditorScreen$Delegate;Z)V
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "delegate"    # Lcom/vk/attachpicker/screen/EditorScreen$Delegate;
    .param p3, "thumb"    # Z

    .prologue
    const/4 v1, 0x0

    .line 164
    invoke-direct {p0}, Lcom/vk/core/simplescreen/BaseScreen;-><init>()V

    .line 79
    invoke-static {}, Lcom/vk/attachpicker/EditorAnalytics;->imageEditorAnalytics()Lcom/vk/attachpicker/EditorAnalytics;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    .line 81
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->buttonClickLock:Lcom/vk/core/util/TimeoutLock;

    .line 82
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/json/FiltersController;->filters()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->filtersList:Ljava/util/ArrayList;

    .line 83
    new-instance v0, Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-direct {v0}, Lcom/vk/attachpicker/util/OrientationLocker;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    .line 85
    iput v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->topPadding:I

    .line 107
    sget-object v0, Lcom/vk/attachpicker/crop/CropAspectRatio;->CROP_NOT_SELECTED:Lcom/vk/attachpicker/crop/CropAspectRatio;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentCropAspectRatio:Lcom/vk/attachpicker/crop/CropAspectRatio;

    .line 148
    iput v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    .line 1442
    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$23;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/EditorScreen$23;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 165
    new-instance v0, Lcom/vk/attachpicker/editor/ImageState;

    invoke-direct {v0, p1}, Lcom/vk/attachpicker/editor/ImageState;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    .line 166
    iput-object p2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->delegate:Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

    .line 167
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 168
    iput-boolean p3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->thumb:Z

    .line 169
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->init()V

    .line 170
    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/drawing/DrawingView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingUndo:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/vk/attachpicker/screen/EditorScreen;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 75
    iput-boolean p1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->shouldPlayOpenAnimation:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->openAnimation()V

    return-void
.end method

.method static synthetic access$1400(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/editor/ImageState;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    return-object v0
.end method

.method static synthetic access$1502(Lcom/vk/attachpicker/screen/EditorScreen;Lcom/vk/attachpicker/util/AsyncTask;)Lcom/vk/attachpicker/util/AsyncTask;
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Lcom/vk/attachpicker/util/AsyncTask;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTask:Lcom/vk/attachpicker/util/AsyncTask;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->initUi()V

    return-void
.end method

.method static synthetic access$1700(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/stickers/EditorStickerView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->hideStickers()V

    return-void
.end method

.method static synthetic access$1900(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/stickers/StickersDrawingView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/screen/EditorScreen;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 75
    invoke-direct {p0, p1, p2}, Lcom/vk/attachpicker/screen/EditorScreen;->setEraserModeDisabled(II)V

    return-void
.end method

.method static synthetic access$2000(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->showStickerTooltip()V

    return-void
.end method

.method static synthetic access$2100(Lcom/vk/attachpicker/screen/EditorScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->trackEmoji(Z)V

    return-void
.end method

.method static synthetic access$2200(Lcom/vk/attachpicker/screen/EditorScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->trackStickers(Z)V

    return-void
.end method

.method static synthetic access$2300(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->loadImages()V

    return-void
.end method

.method static synthetic access$2400(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/util/OrientationLocker;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    return-object v0
.end method

.method static synthetic access$2501(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->finish()V

    return-void
.end method

.method static synthetic access$2600(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/screen/EditorScreen$Delegate;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->delegate:Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/vk/attachpicker/screen/EditorScreen;)F
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tempAutoValue:F

    return v0
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/screen/EditorScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    return-void
.end method

.method static synthetic access$3000(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/VkSeekBar;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoSeekBar:Lcom/vk/attachpicker/widget/VkSeekBar;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/vk/attachpicker/screen/EditorScreen;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    return v0
.end method

.method static synthetic access$3202(Lcom/vk/attachpicker/screen/EditorScreen;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # I

    .prologue
    .line 75
    iput p1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    return p1
.end method

.method static synthetic access$3300(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->updateFilter()V

    return-void
.end method

.method static synthetic access$3400(Lcom/vk/attachpicker/screen/EditorScreen;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->layoutPagerPosition:I

    return v0
.end method

.method static synthetic access$3500(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->filterTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingPanel:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/vk/attachpicker/screen/EditorScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->trackFilter(Z)V

    return-void
.end method

.method static synthetic access$3902(Lcom/vk/attachpicker/screen/EditorScreen;Lcom/vk/attachpicker/crop/CropAspectRatio;)Lcom/vk/attachpicker/crop/CropAspectRatio;
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Lcom/vk/attachpicker/crop/CropAspectRatio;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentCropAspectRatio:Lcom/vk/attachpicker/crop/CropAspectRatio;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/FiltersViewPager;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    return-object v0
.end method

.method static synthetic access$4000(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->setBackgroundBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$4100(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/graphics/RectF;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Landroid/graphics/RectF;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->cropCloseAnimation(Landroid/graphics/RectF;)V

    return-void
.end method

.method static synthetic access$4200(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/screen/EditorScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->showDeleteArea(Z)V

    return-void
.end method

.method static synthetic access$600(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->hideTooltip()V

    return-void
.end method

.method static synthetic access$700(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteIconHover:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vk/attachpicker/screen/EditorScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->hideDeleteArea(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/LocalImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->backgroundView:Lcom/vk/attachpicker/widget/LocalImageView;

    return-object v0
.end method

.method static synthetic access$lambda$0(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->onStickerClick()V

    return-void
.end method

.method static synthetic access$lambda$1(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->onTextClick()V

    return-void
.end method

.method static synthetic access$lambda$2(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->onDrawingClick()V

    return-void
.end method

.method static synthetic access$lambda$3(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->onCropClick()V

    return-void
.end method

.method static synthetic access$lambda$4(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->onAutoClick()V

    return-void
.end method

.method private bottomPanelCloseAnimation(Landroid/view/View;)V
    .locals 14
    .param p1, "panel"    # Landroid/view/View;

    .prologue
    const/16 v7, 0x8

    const/4 v13, 0x2

    const/4 v12, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 1311
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1312
    .local v0, "activity":Landroid/app/Activity;
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {v5, v0}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 1313
    invoke-direct {p0, v10}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 1315
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f09012e

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v5

    float-to-int v1, v5

    .line 1317
    .local v1, "h":I
    invoke-virtual {p1, v12}, Landroid/view/View;->setTranslationY(F)V

    .line 1318
    invoke-virtual {p1, v10}, Landroid/view/View;->setVisibility(I)V

    .line 1319
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1320
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1321
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v5, v12}, Landroid/view/View;->setAlpha(F)V

    .line 1323
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1324
    .local v3, "set1":Landroid/animation/AnimatorSet;
    new-array v5, v13, [Landroid/animation/Animator;

    sget-object v6, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v7, v11, [F

    .line 1325
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    iget v8, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v8, v8

    aput v8, v7, v10

    invoke-static {p1, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v5, v10

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v8, v11, [F

    int-to-float v9, v1

    aput v9, v8, v10

    .line 1326
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v5, v11

    .line 1324
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1328
    new-instance v5, Lcom/vk/attachpicker/screen/EditorScreen$19;

    invoke-direct {v5, p0, p1, v1}, Lcom/vk/attachpicker/screen/EditorScreen$19;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/view/View;I)V

    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1338
    sget-object v5, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1339
    const-wide/16 v6, 0xaf

    invoke-virtual {v3, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1341
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1342
    .local v4, "set2":Landroid/animation/AnimatorSet;
    const/4 v5, 0x3

    new-array v5, v5, [Landroid/animation/Animator;

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    sget-object v7, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v8, v11, [F

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v8, v10

    .line 1343
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v5, v10

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v8, v11, [F

    aput v12, v8, v10

    .line 1344
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v8, v11, [F

    aput v12, v8, v10

    .line 1345
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v5, v13

    .line 1342
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1347
    sget-object v5, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1348
    const-wide/16 v6, 0xaf

    invoke-virtual {v4, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1350
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1351
    .local v2, "set":Landroid/animation/AnimatorSet;
    new-array v5, v13, [Landroid/animation/Animator;

    aput-object v3, v5, v10

    aput-object v4, v5, v11

    invoke-virtual {v2, v5}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 1352
    new-instance v5, Lcom/vk/attachpicker/screen/EditorScreen$20;

    invoke-direct {v5, p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen$20;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;)V

    invoke-virtual {v2, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1360
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 1361
    return-void
.end method

.method private varargs bottomPanelOpenAnimation(Landroid/view/View;[Ljava/lang/Runnable;)V
    .locals 12
    .param p1, "panel"    # Landroid/view/View;
    .param p2, "runAfter"    # [Ljava/lang/Runnable;

    .prologue
    .line 1257
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1258
    .local v0, "activity":Landroid/app/Activity;
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {v5, v0}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 1259
    const/4 v5, 0x0

    invoke-direct {p0, v5}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 1261
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f09012e

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v5

    float-to-int v1, v5

    .line 1263
    .local v1, "h":I
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 1264
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1265
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1266
    const/16 v5, 0x8

    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1268
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1269
    .local v3, "set1":Landroid/animation/AnimatorSet;
    const/4 v5, 0x3

    new-array v5, v5, [Landroid/animation/Animator;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    sget-object v8, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v9, 0x1

    new-array v9, v9, [F

    const/4 v10, 0x0

    const/4 v11, 0x0

    aput v11, v9, v10

    .line 1270
    invoke-static {v7, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    sget-object v8, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v9, 0x1

    new-array v9, v9, [F

    const/4 v10, 0x0

    int-to-float v11, v1

    aput v11, v9, v10

    .line 1271
    invoke-static {v7, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    sget-object v8, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v9, 0x1

    new-array v9, v9, [F

    const/4 v10, 0x0

    int-to-float v11, v1

    aput v11, v9, v10

    .line 1272
    invoke-static {v7, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v6

    .line 1269
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1274
    sget-object v5, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1275
    const-wide/16 v6, 0xaf

    invoke-virtual {v3, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1276
    new-instance v5, Lcom/vk/attachpicker/screen/EditorScreen$17;

    invoke-direct {v5, p0, p1, v1}, Lcom/vk/attachpicker/screen/EditorScreen$17;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/view/View;I)V

    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1287
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1288
    .local v4, "set2":Landroid/animation/AnimatorSet;
    const/4 v5, 0x2

    new-array v5, v5, [Landroid/animation/Animator;

    const/4 v6, 0x0

    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v8, 0x2

    new-array v8, v8, [F

    const/4 v9, 0x0

    .line 1289
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    iget v10, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v10, v10

    aput v10, v8, v9

    const/4 v9, 0x1

    const/4 v10, 0x0

    aput v10, v8, v9

    invoke-static {p1, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    sget-object v8, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v9, 0x1

    new-array v9, v9, [F

    const/4 v10, 0x0

    .line 1290
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    iget v11, v11, Landroid/view/ViewGroup$LayoutParams;->height:I

    sub-int v11, v1, v11

    int-to-float v11, v11

    aput v11, v9, v10

    invoke-static {v7, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v6

    .line 1288
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1292
    sget-object v5, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1293
    const-wide/16 v6, 0xaf

    invoke-virtual {v4, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1295
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1296
    .local v2, "set":Landroid/animation/AnimatorSet;
    const/4 v5, 0x2

    new-array v5, v5, [Landroid/animation/Animator;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    const/4 v6, 0x1

    aput-object v4, v5, v6

    invoke-virtual {v2, v5}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 1297
    new-instance v5, Lcom/vk/attachpicker/screen/EditorScreen$18;

    invoke-direct {v5, p0, p2, v0}, Lcom/vk/attachpicker/screen/EditorScreen$18;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;[Ljava/lang/Runnable;Landroid/app/Activity;)V

    invoke-virtual {v2, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1307
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 1308
    return-void
.end method

.method private cancelAutoEnhance()V
    .locals 2

    .prologue
    .line 813
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/editor/ImageState;->getAutoEnhanceValue()F

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tempAutoValue:F

    .line 814
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;->getFilter()Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 815
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;->getFilter()Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    move-result-object v0

    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tempAutoValue:F

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;->setEnhanceIntensity(F)V

    .line 817
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoPanel:Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->bottomPanelCloseAnimation(Landroid/view/View;)V

    .line 818
    return-void
.end method

.method private cancelDrawing()V
    .locals 1

    .prologue
    .line 821
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->restoreState()V

    .line 822
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->setDrawingTouchEnabled(Z)V

    .line 823
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingPanel:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->bottomPanelCloseAnimation(Landroid/view/View;)V

    .line 824
    return-void
.end method

.method private checkButtonLock()Z
    .locals 1

    .prologue
    .line 804
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->buttonClickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 805
    const/4 v0, 0x1

    .line 808
    :goto_0
    return v0

    .line 807
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->buttonClickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 808
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private closeAnimation()V
    .locals 14

    .prologue
    .line 1202
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v7

    .line 1203
    .local v7, "activity":Landroid/app/Activity;
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {v0, v7}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 1204
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 1206
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    .line 1207
    invoke-virtual {v0}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/crop/GeometryState;->isDefaultState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1208
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->overlayContainer:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 1209
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v1}, Lcom/vk/attachpicker/editor/ImageState;->getBigBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/attachpicker/util/BitmapUtils;->getAspectRatio(Landroid/graphics/Bitmap;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->setAspectRatio(F)V

    .line 1210
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/editor/ImageState;->getBigBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->setBackgroundBitmap(Landroid/graphics/Bitmap;)V

    .line 1213
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getAspectRatio()F

    move-result v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 1214
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 1215
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1213
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v8

    .line 1218
    .local v8, "editorRect":Landroid/graphics/RectF;
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getAspectRatio()F

    move-result v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 1219
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 1220
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09012d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    add-float/2addr v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1218
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v13

    .line 1223
    .local v13, "viewerRect":Landroid/graphics/RectF;
    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float v9, v0, v1

    .line 1224
    .local v9, "scaleBefore":F
    iget v0, v13, Landroid/graphics/RectF;->top:F

    iget v1, v8, Landroid/graphics/RectF;->top:F

    sub-float v12, v0, v1

    .line 1225
    .local v12, "translationYBefore":F
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v9

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    neg-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v11, v0, v1

    .line 1227
    .local v11, "translationXBefore":F
    new-instance v10, Landroid/animation/AnimatorSet;

    invoke-direct {v10}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1228
    .local v10, "set":Landroid/animation/AnimatorSet;
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v10, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1230
    const/16 v0, 0x8

    new-array v0, v0, [Landroid/animation/Animator;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    fill-array-data v4, :array_0

    .line 1231
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->overlayContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    fill-array-data v4, :array_1

    .line 1232
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v6, v4, v5

    const/4 v5, 0x1

    aput v11, v4, v5

    .line 1233
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v6, v4, v5

    const/4 v5, 0x1

    aput v12, v4, v5

    .line 1234
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    aput v6, v4, v5

    const/4 v5, 0x1

    aput v9, v4, v5

    .line 1235
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    aput v6, v4, v5

    const/4 v5, 0x1

    aput v9, v4, v5

    .line 1236
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    .line 1237
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    aput v6, v4, v5

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    .line 1238
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    aput v6, v4, v5

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    .line 1230
    invoke-virtual {v10, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1240
    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$16;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/EditorScreen$16;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    invoke-virtual {v10, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1250
    const-wide/16 v0, 0xaf

    invoke-virtual {v10, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1251
    invoke-virtual {v10}, Landroid/animation/AnimatorSet;->start()V

    .line 1253
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->shouldPlayOpenAnimation:Z

    .line 1254
    return-void

    .line 1230
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 1231
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private cropCloseAnimation(Landroid/graphics/RectF;)V
    .locals 3
    .param p1, "cropRect"    # Landroid/graphics/RectF;

    .prologue
    .line 1401
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1402
    .local v0, "activity":Landroid/app/Activity;
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 1404
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-static {p0, p1, v0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$29;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/graphics/RectF;Landroid/app/Activity;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/util/Utils;->runOnPreDraw(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 1440
    return-void
.end method

.method private cropOpenAnimation(Ljava/lang/Runnable;)V
    .locals 14
    .param p1, "onEnd"    # Ljava/lang/Runnable;

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 1365
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 1366
    invoke-direct {p0, v11}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 1368
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getAspectRatio()F

    move-result v0

    .line 1369
    .local v0, "ar":F
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    sget v3, Lcom/vk/attachpicker/crop/RectCropOverlayView;->SIDE_PADDING:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    .line 1370
    invoke-virtual {v4}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    sget v5, Lcom/vk/attachpicker/crop/RectCropOverlayView;->SIDE_PADDING:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    sget v5, Lcom/vk/attachpicker/crop/RectCropOverlayView;->SIDE_PADDING:I

    int-to-float v5, v5

    sget v6, Lcom/vk/attachpicker/crop/RectCropOverlayView;->SIDE_PADDING:I

    int-to-float v6, v6

    .line 1369
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v7

    .line 1371
    .local v7, "cropRect":Landroid/graphics/RectF;
    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    div-float v8, v1, v2

    .line 1373
    .local v8, "scale":F
    new-instance v9, Landroid/animation/AnimatorSet;

    invoke-direct {v9}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1375
    .local v9, "set":Landroid/animation/AnimatorSet;
    const/16 v1, 0x9

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->overlayContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v12, [F

    aput v13, v4, v11

    .line 1376
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v11

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    new-array v4, v12, [F

    aput v8, v4, v11

    .line 1377
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v12

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    sget-object v4, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    new-array v5, v12, [F

    aput v8, v5, v11

    .line 1378
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v5, v12, [F

    iget v6, v7, Landroid/graphics/RectF;->top:F

    iget-object v10, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    .line 1379
    invoke-virtual {v10}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getTop()I

    move-result v10

    int-to-float v10, v10

    sub-float/2addr v6, v10

    aput v6, v5, v11

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    sget-object v4, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    new-array v5, v12, [F

    iget v6, v7, Landroid/graphics/RectF;->left:F

    iget-object v10, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    .line 1380
    invoke-virtual {v10}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getLeft()I

    move-result v10

    int-to-float v10, v10

    sub-float/2addr v6, v10

    aput v6, v5, v11

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v12, [F

    aput v13, v5, v11

    .line 1381
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v5, v12, [F

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    .line 1382
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    aput v6, v5, v11

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v5, v12, [F

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    .line 1383
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    aput v6, v5, v11

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    sget-object v4, Lcom/vk/attachpicker/widget/BgColorFrameLayout;->BACKGROUND_COLOR:Landroid/util/Property;

    new-array v5, v12, [I

    iget v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->cropBgColor:I

    aput v6, v5, v11

    .line 1384
    invoke-static {v3, v4, v5}, Lcom/vk/core/util/AnimationUtils;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1375
    invoke-virtual {v9, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1387
    sget-object v1, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v9, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1388
    const-wide/16 v2, 0xaf

    invoke-virtual {v9, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1390
    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$21;

    invoke-direct {v1, p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$21;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Ljava/lang/Runnable;)V

    invoke-virtual {v9, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1397
    invoke-virtual {v9}, Landroid/animation/AnimatorSet;->start()V

    .line 1398
    return-void
.end method

.method private getCenterFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;
    .locals 3

    .prologue
    .line 888
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->getCurrentItem()I

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v2}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getRealCount()I

    move-result v2

    rem-int v0, v1, v2

    .line 889
    .local v0, "currentPositon":I
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getFilterWrappers()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    return-object v1
.end method

.method private getLeftFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;
    .locals 3

    .prologue
    .line 879
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->getCurrentItem()I

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v2}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getRealCount()I

    move-result v2

    rem-int v0, v1, v2

    .line 880
    .local v0, "currentPositon":I
    if-nez v0, :cond_0

    .line 881
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getFilterWrappers()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v2}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getRealCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    .line 883
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getFilterWrappers()Ljava/util/ArrayList;

    move-result-object v1

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    goto :goto_0
.end method

.method private getRightFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;
    .locals 3

    .prologue
    .line 893
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->getCurrentItem()I

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v2}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getRealCount()I

    move-result v2

    rem-int v0, v1, v2

    .line 894
    .local v0, "currentPositon":I
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getRealCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    .line 895
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getFilterWrappers()Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    .line 897
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getFilterWrappers()Ljava/util/ArrayList;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    goto :goto_0
.end method

.method private hideDeleteArea(Z)V
    .locals 4
    .param p1, "animated"    # Z

    .prologue
    const/4 v1, 0x4

    const/4 v2, 0x0

    .line 523
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 543
    :goto_0
    return-void

    .line 526
    :cond_0
    if-eqz p1, :cond_1

    .line 527
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 528
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    .line 529
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 530
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$6;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/EditorScreen$6;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 531
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    .line 537
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 538
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    .line 540
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 541
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method

.method private hideStickers()V
    .locals 4

    .prologue
    .line 931
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 942
    :cond_0
    :goto_0
    return-void

    .line 934
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$11;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/EditorScreen$11;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 935
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    .line 941
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private hideTooltip()V
    .locals 1

    .prologue
    .line 480
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltipController:Lcom/vk/attachpicker/util/TooltipController;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/TooltipController;->hideTooltip()V

    .line 481
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/FiltersViewPager;->cancelFakeSwipe()V

    .line 482
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 173
    invoke-static {}, Lcom/vk/attachpicker/util/PickerStickers;->loadFromServer()V

    .line 174
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/Stickers;->checkServerUpdates()V

    .line 175
    return-void
.end method

.method private initUi()V
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 843
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 863
    :goto_0
    return-void

    .line 847
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    const v2, 0x7f100467

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 848
    .local v0, "progress":Landroid/view/View;
    if-eqz v0, :cond_1

    .line 849
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 852
    :cond_1
    new-instance v1, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    .line 853
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorContainer:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 854
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v2}, Lcom/vk/attachpicker/editor/ImageState;->getCroppedBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;->setImage(Landroid/graphics/Bitmap;)V

    .line 856
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v2}, Lcom/vk/attachpicker/editor/ImageState;->getCroppedBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/attachpicker/util/BitmapUtils;->getAspectRatio(Landroid/graphics/Bitmap;)F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->setAspectRatio(F)V

    .line 857
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v1}, Lcom/vk/attachpicker/editor/ImageState;->getCroppedBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->setBackgroundBitmap(Landroid/graphics/Bitmap;)V

    .line 858
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->updateFilter()V

    .line 860
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 862
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->showFiltersTooltip()V

    goto :goto_0
.end method

.method private isDefaultFilter()Z
    .locals 2

    .prologue
    .line 902
    const-string/jumbo v0, "FILTER_ID_ORIGINAL"

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getCenterFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    move-result-object v1

    iget-object v1, v1, Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isDrawingPanelVisible()Z
    .locals 1

    .prologue
    .line 1144
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingPanel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isEnhancePanelVisible()Z
    .locals 1

    .prologue
    .line 1140
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoPanel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$$$30(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0
    .param p0, "action"    # Ljava/lang/Runnable;
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1563
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$createView$0(Landroid/view/View;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 184
    return-void
.end method

.method static synthetic lambda$finish$21(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 792
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$updateFilter$22(Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;)Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;
    .locals 0
    .param p0, "filter"    # Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    .prologue
    .line 869
    return-object p0
.end method

.method private loadImages()V
    .locals 2

    .prologue
    .line 906
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTask:Lcom/vk/attachpicker/util/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTask:Lcom/vk/attachpicker/util/AsyncTask;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/AsyncTask;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 923
    :goto_0
    return-void

    .line 909
    :cond_0
    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$10;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/EditorScreen$10;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTask:Lcom/vk/attachpicker/util/AsyncTask;

    .line 922
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTask:Lcom/vk/attachpicker/util/AsyncTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/util/AsyncTask;->execPool([Ljava/lang/Object;)Lcom/vk/attachpicker/util/AsyncTask;

    goto :goto_0
.end method

.method private onAutoClick()V
    .locals 4

    .prologue
    .line 1110
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->hideTooltip()V

    .line 1111
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    if-eqz v0, :cond_1

    .line 1137
    :cond_0
    :goto_0
    return-void

    .line 1116
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/editor/ImageState;->getAutoEnhanceValue()F

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tempAutoValue:F

    .line 1117
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoSeekBar:Lcom/vk/attachpicker/widget/VkSeekBar;

    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tempAutoValue:F

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkSeekBar;->setValue(F)V

    .line 1118
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoPanel:Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Runnable;

    const/4 v2, 0x0

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$28;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->bottomPanelOpenAnimation(Landroid/view/View;[Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private onCropClick()V
    .locals 1

    .prologue
    .line 1063
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->hideTooltip()V

    .line 1064
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    if-eqz v0, :cond_1

    .line 1107
    :cond_0
    :goto_0
    return-void

    .line 1069
    :cond_1
    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$27;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->cropOpenAnimation(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private onDrawingClick()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1050
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->hideTooltip()V

    .line 1051
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    if-eqz v0, :cond_1

    .line 1060
    :cond_0
    :goto_0
    return-void

    .line 1056
    :cond_1
    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingUndo:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v0

    if-lez v0, :cond_2

    move v0, v1

    :goto_1
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 1057
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->saveState()V

    .line 1058
    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->setDrawingTouchEnabled(Z)V

    .line 1059
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingPanel:Landroid/view/View;

    new-array v1, v1, [Ljava/lang/Runnable;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$26;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->bottomPanelOpenAnimation(Landroid/view/View;[Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_2
    move v0, v2

    .line 1056
    goto :goto_1
.end method

.method private onStickerClick()V
    .locals 4

    .prologue
    .line 945
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->hideTooltip()V

    .line 946
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    if-eqz v1, :cond_1

    .line 1024
    :cond_0
    :goto_0
    return-void

    .line 950
    :cond_1
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 951
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 956
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    if-nez v1, :cond_2

    .line 957
    new-instance v1, Lcom/vk/attachpicker/stickers/EditorStickerView;

    new-instance v2, Lcom/vk/attachpicker/screen/EditorScreen$12;

    invoke-direct {v2, p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen$12;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;)V

    invoke-direct {v1, v0, v2}, Lcom/vk/attachpicker/stickers/EditorStickerView;-><init>(Landroid/content/Context;Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)V

    iput-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    .line 1014
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setTopPadding(I)V

    .line 1015
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setVisibility(I)V

    .line 1017
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/BgColorFrameLayout;->addView(Landroid/view/View;)V

    .line 1020
    :cond_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setAlpha(F)V

    .line 1021
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setVisibility(I)V

    .line 1022
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->checkSelection()V

    .line 1023
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0xc8

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private onTextClick()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1027
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->hideTooltip()V

    .line 1028
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerState:I

    if-eqz v0, :cond_1

    .line 1047
    :cond_0
    :goto_0
    return-void

    .line 1032
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    if-nez v0, :cond_0

    .line 1033
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1034
    new-instance v0, Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$24;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;

    move-result-object v2

    invoke-direct {v0, v4, v4, v1, v2}, Lcom/vk/attachpicker/stickers/TextStickerDialog;-><init>(ZZLandroid/content/Context;Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .line 1041
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$25;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1045
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->show()V

    goto :goto_0
.end method

.method private openAnimation()V
    .locals 14

    .prologue
    .line 1148
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v7

    .line 1149
    .local v7, "activity":Landroid/app/Activity;
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {v0, v7}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 1150
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 1152
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getAspectRatio()F

    move-result v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 1153
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 1154
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1152
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v8

    .line 1157
    .local v8, "editorRect":Landroid/graphics/RectF;
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getAspectRatio()F

    move-result v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 1158
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 1159
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09012d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    add-float/2addr v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1157
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v13

    .line 1162
    .local v13, "viewerRect":Landroid/graphics/RectF;
    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float v9, v0, v1

    .line 1163
    .local v9, "scaleBefore":F
    iget v0, v13, Landroid/graphics/RectF;->top:F

    iget v1, v8, Landroid/graphics/RectF;->top:F

    sub-float v12, v0, v1

    .line 1164
    .local v12, "translationYBefore":F
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v9

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    neg-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v11, v0, v1

    .line 1166
    .local v11, "translationXBefore":F
    new-instance v10, Landroid/animation/AnimatorSet;

    invoke-direct {v10}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1167
    .local v10, "set":Landroid/animation/AnimatorSet;
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v10, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1169
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 1170
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v12}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 1171
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v11}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 1172
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v9}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 1173
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v9}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 1174
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 1175
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 1176
    const/4 v0, 0x7

    new-array v0, v0, [Landroid/animation/Animator;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    fill-array-data v4, :array_0

    .line 1177
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v11, v4, v5

    const/4 v5, 0x1

    const/4 v6, 0x0

    aput v6, v4, v5

    .line 1178
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v12, v4, v5

    const/4 v5, 0x1

    const/4 v6, 0x0

    aput v6, v4, v5

    .line 1179
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v9, v4, v5

    const/4 v5, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    aput v6, v4, v5

    .line 1180
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    sget-object v3, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v9, v4, v5

    const/4 v5, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    aput v6, v4, v5

    .line 1181
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    .line 1182
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    aput v6, v4, v5

    const/4 v5, 0x1

    const/4 v6, 0x0

    aput v6, v4, v5

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    .line 1183
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    aput v6, v4, v5

    const/4 v5, 0x1

    const/4 v6, 0x0

    aput v6, v4, v5

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v0, v1

    .line 1176
    invoke-virtual {v10, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1185
    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$15;

    invoke-direct {v0, p0, v7}, Lcom/vk/attachpicker/screen/EditorScreen$15;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;)V

    invoke-virtual {v10, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1194
    const-wide/16 v0, 0xaf

    invoke-virtual {v10, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1195
    const-wide/16 v0, 0x10

    invoke-virtual {v10, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 1196
    invoke-virtual {v10}, Landroid/animation/AnimatorSet;->start()V

    .line 1198
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->shouldPlayOpenAnimation:Z

    .line 1199
    return-void

    .line 1176
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private renderAndFinish(Z)V
    .locals 7
    .param p1, "avatarSelection"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 547
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 548
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 697
    :goto_0
    return-void

    .line 552
    :cond_0
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v5}, Lcom/vk/attachpicker/drawing/DrawingView;->isDefault()Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v5}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->isDefault()Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    .line 553
    invoke-virtual {v5}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v5}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vk/attachpicker/crop/GeometryState;->isDefaultState()Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    .line 554
    invoke-virtual {v5}, Lcom/vk/attachpicker/editor/ImageState;->getAutoEnhanceValue()F

    move-result v5

    const v6, 0x3a83126f    # 0.001f

    cmpg-float v5, v5, v6

    if-gtz v5, :cond_5

    move v2, v3

    .line 556
    .local v2, "isDefault":Z
    :goto_1
    invoke-direct {p0, v3}, Lcom/vk/attachpicker/screen/EditorScreen;->trackStickers(Z)V

    .line 557
    invoke-direct {p0, v3}, Lcom/vk/attachpicker/screen/EditorScreen;->trackEmoji(Z)V

    .line 558
    invoke-direct {p0, v3}, Lcom/vk/attachpicker/screen/EditorScreen;->trackText(Z)V

    .line 559
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v5}, Lcom/vk/attachpicker/drawing/DrawingView;->isDefault()Z

    move-result v5

    if-nez v5, :cond_1

    .line 560
    invoke-direct {p0, v3}, Lcom/vk/attachpicker/screen/EditorScreen;->trackDraw(Z)V

    .line 562
    :cond_1
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v5}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v5}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vk/attachpicker/crop/GeometryState;->isDefaultState()Z

    move-result v5

    if-nez v5, :cond_2

    .line 563
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->trackCrop()V

    .line 565
    :cond_2
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->isDefaultFilter()Z

    move-result v5

    if-nez v5, :cond_3

    .line 566
    invoke-direct {p0, v3}, Lcom/vk/attachpicker/screen/EditorScreen;->trackFilter(Z)V

    .line 568
    :cond_3
    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v5}, Lcom/vk/attachpicker/editor/ImageState;->getAutoEnhanceValue()F

    move-result v5

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_4

    .line 569
    invoke-direct {p0, v3}, Lcom/vk/attachpicker/screen/EditorScreen;->trackEnhance(Z)V

    .line 571
    :cond_4
    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v3}, Lcom/vk/attachpicker/EditorAnalytics;->flush()V

    .line 573
    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$20;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vkontakte/android/functions/F0;

    move-result-object v1

    .line 606
    .local v1, "bitmapRenderer":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Landroid/graphics/Bitmap;>;"
    if-eqz p1, :cond_6

    .line 607
    new-instance v3, Lcom/vk/attachpicker/screen/EditorScreen$7;

    invoke-direct {v3, p0, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen$7;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;Lcom/vkontakte/android/functions/F0;)V

    new-array v4, v4, [Ljava/lang/Void;

    .line 640
    invoke-virtual {v3, v4}, Lcom/vk/attachpicker/screen/EditorScreen$7;->execPool([Ljava/lang/Object;)Lcom/vk/attachpicker/util/AsyncTask;

    goto/16 :goto_0

    .end local v1    # "bitmapRenderer":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Landroid/graphics/Bitmap;>;"
    .end local v2    # "isDefault":Z
    :cond_5
    move v2, v4

    .line 554
    goto :goto_1

    .line 642
    .restart local v1    # "bitmapRenderer":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Landroid/graphics/Bitmap;>;"
    .restart local v2    # "isDefault":Z
    :cond_6
    new-instance v3, Lcom/vk/attachpicker/screen/EditorScreen$8;

    invoke-direct {v3, p0, v0, v1, v2}, Lcom/vk/attachpicker/screen/EditorScreen$8;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;Lcom/vkontakte/android/functions/F0;Z)V

    new-array v4, v4, [Ljava/lang/Void;

    .line 693
    invoke-virtual {v3, v4}, Lcom/vk/attachpicker/screen/EditorScreen$8;->execPool([Ljava/lang/Object;)Lcom/vk/attachpicker/util/AsyncTask;

    goto/16 :goto_0
.end method

.method private setBackgroundBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 839
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->backgroundView:Lcom/vk/attachpicker/widget/LocalImageView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/widget/LocalImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 840
    return-void
.end method

.method private setControlsEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 827
    iput-boolean p1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->controlsEnabled:Z

    .line 829
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButton:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 830
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->attachButton:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 831
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionSticker:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 832
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionText:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 833
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionDrawing:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 834
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionCrop:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 835
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionAuto:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 836
    return-void
.end method

.method private setDrawingTouchEnabled(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .prologue
    .line 926
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setTouchEnabled(Z)V

    .line 927
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setTouchEnabled(Z)V

    .line 928
    return-void

    .line 927
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setEraserModeDisabled(II)V
    .locals 3
    .param p1, "brushType"    # I
    .param p2, "color"    # I

    .prologue
    .line 474
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setBrushType(I)V

    .line 475
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingColorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v0, p2}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setSelectedColor(I)V

    .line 476
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingEraser:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0f00ba

    invoke-static {v1, v2}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 477
    return-void
.end method

.method private setEraserModeEnabled()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 468
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setBrushType(I)V

    .line 469
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingColorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setSelectedColor(I)V

    .line 470
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingEraser:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0f00b6

    invoke-static {v1, v2}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 471
    return-void
.end method

.method private showDeleteArea(Z)V
    .locals 4
    .param p1, "animated"    # Z

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 507
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 508
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteIconHover:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 509
    if-eqz p1, :cond_0

    .line 510
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 511
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    .line 512
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 513
    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 514
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    .line 515
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 516
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 520
    :goto_0
    return-void

    .line 518
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method

.method private showFiltersTooltip()V
    .locals 2

    .prologue
    .line 485
    const-string/jumbo v0, "filters_tooltip"

    invoke-static {v0}, Lcom/vk/attachpicker/util/TooltipController;->shouldShowTooltip(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 486
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/FiltersViewPager;->showFakeSwipe()V

    .line 487
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltip:Landroid/widget/TextView;

    const v1, 0x7f0804ed

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 488
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltipController:Lcom/vk/attachpicker/util/TooltipController;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/TooltipController;->showTooltip()V

    .line 490
    :cond_0
    return-void
.end method

.method private showStickerTooltip()V
    .locals 2

    .prologue
    .line 493
    const-string/jumbo v0, "sticker_tooltip"

    invoke-static {v0}, Lcom/vk/attachpicker/util/TooltipController;->shouldShowTooltip(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 494
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltip:Landroid/widget/TextView;

    const v1, 0x7f0804ef

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 495
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltipController:Lcom/vk/attachpicker/util/TooltipController;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/TooltipController;->showTooltip()V

    .line 497
    :cond_0
    return-void
.end method

.method private showTextTooltip()V
    .locals 2

    .prologue
    .line 500
    const-string/jumbo v0, "text_tooltip"

    invoke-static {v0}, Lcom/vk/attachpicker/util/TooltipController;->shouldShowTooltip(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 501
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltip:Landroid/widget/TextView;

    const v1, 0x7f0804f0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 502
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltipController:Lcom/vk/attachpicker/util/TooltipController;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/TooltipController;->showTooltip()V

    .line 504
    :cond_0
    return-void
.end method

.method private trackCrop()V
    .locals 4

    .prologue
    .line 1612
    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$34;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 1613
    return-void
.end method

.method private trackDraw(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 1624
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$37;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Z)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 1625
    return-void
.end method

.method private trackEmoji(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 1586
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$32;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Z)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 1598
    return-void
.end method

.method private trackEnhance(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 1620
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$36;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Z)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 1621
    return-void
.end method

.method private trackFilter(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 1616
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$35;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Z)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 1617
    return-void
.end method

.method private trackStickers(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 1568
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$31;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Z)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 1583
    return-void
.end method

.method private trackText(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 1601
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$33;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Z)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 1609
    return-void
.end method

.method private updateFilter()V
    .locals 5

    .prologue
    .line 866
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    if-eqz v1, :cond_0

    .line 867
    new-instance v0, Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v1}, Lcom/vk/attachpicker/editor/ImageState;->getAutoFixedBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getLeftFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    move-result-object v2

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getCenterFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    move-result-object v3

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getRightFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;-><init>(Landroid/graphics/Bitmap;Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;)V

    .line 868
    .local v0, "filter":Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;
    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tempAutoValue:F

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;->setEnhanceIntensity(F)V

    .line 869
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$23;->lambdaFactory$(Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;)Lcom/vk/attachpicker/imageeditor/FilterProducer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;->setFilter(Lcom/vk/attachpicker/imageeditor/FilterProducer;)V

    .line 871
    .end local v0    # "filter":Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->getCurrentItem()I

    move-result v1

    iput v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->layoutPagerPosition:I

    .line 872
    return-void
.end method


# virtual methods
.method public final $(I)Landroid/view/View;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 1558
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/widget/BgColorFrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final $(ILjava/lang/Runnable;)Landroid/view/View;
    .locals 2
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p2, "action"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I",
            "Ljava/lang/Runnable;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 1562
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    invoke-virtual {v1, p1}, Lcom/vk/attachpicker/widget/BgColorFrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1563
    .local v0, "view":Landroid/view/View;, "TT;"
    invoke-static {p2}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$30;->lambdaFactory$(Ljava/lang/Runnable;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1564
    return-object v0
.end method

.method public createView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    const/4 v4, 0x0

    .line 179
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0f00bc

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorBgColor:I

    .line 180
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->cropBgColor:I

    .line 182
    new-instance v0, Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/widget/BgColorFrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    .line 183
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorBgColor:I

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/BgColorFrameLayout;->setBackgroundColor(I)V

    .line 184
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    invoke-static {}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$1;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/BgColorFrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    const v0, 0x7f0301a8

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 188
    const v0, 0x7f1004ac

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    .line 189
    const v0, 0x7f10015e

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButton:Landroid/view/View;

    .line 190
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    const v0, 0x7f1004ad

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersKeyboardContainer:Landroid/widget/FrameLayout;

    .line 199
    const v0, 0x7f100495

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    .line 200
    const v0, 0x7f100461

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    .line 201
    const v0, 0x7f100497

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorContainer:Landroid/widget/FrameLayout;

    .line 202
    const v0, 0x7f100496

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->overlayContainer:Landroid/widget/FrameLayout;

    .line 203
    const v0, 0x7f100179

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    .line 205
    const v0, 0x7f100499

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltip:Landroid/widget/TextView;

    .line 206
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltip:Landroid/widget/TextView;

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v1

    const/16 v2, 0x90

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 207
    new-instance v0, Lcom/vk/attachpicker/util/TooltipController;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltip:Landroid/widget/TextView;

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/util/TooltipController;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tooltipController:Lcom/vk/attachpicker/util/TooltipController;

    .line 209
    const v0, 0x7f100498

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->filterTitle:Landroid/widget/TextView;

    .line 210
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->filterTitle:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 211
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->filterTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0804d8

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    const v0, 0x7f10049a

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    .line 214
    const v0, 0x7f10049c

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->$(ILjava/lang/Runnable;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionSticker:Landroid/view/View;

    .line 215
    const v0, 0x7f10049d

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$4;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->$(ILjava/lang/Runnable;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionText:Landroid/view/View;

    .line 216
    const v0, 0x7f10049e

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$5;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->$(ILjava/lang/Runnable;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionDrawing:Landroid/view/View;

    .line 217
    const v0, 0x7f10049f

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$6;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->$(ILjava/lang/Runnable;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionCrop:Landroid/view/View;

    .line 218
    const v0, 0x7f1004a0

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$7;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->$(ILjava/lang/Runnable;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionAuto:Landroid/view/View;

    .line 219
    const v0, 0x7f10045b

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    .line 221
    const v0, 0x7f1004a5

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoPanel:Landroid/widget/FrameLayout;

    .line 222
    const v0, 0x7f1004a6

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoTextView:Landroid/widget/TextView;

    .line 223
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoTextView:Landroid/widget/TextView;

    const-string/jumbo v1, "0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    const v0, 0x7f1004a7

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/VkSeekBar;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoSeekBar:Lcom/vk/attachpicker/widget/VkSeekBar;

    .line 225
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoSeekBar:Lcom/vk/attachpicker/widget/VkSeekBar;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$8;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/VkSeekBar$OnSeekBarChangeListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkSeekBar;->setOnSeekBarChangeListener(Lcom/vk/attachpicker/widget/VkSeekBar$OnSeekBarChangeListener;)V

    .line 238
    const v0, 0x7f1004a8

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/EditorBottomPanel;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoBottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    .line 239
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoBottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$9;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setOnApplyClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoBottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$10;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setOnCancelClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    const v0, 0x7f100154

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    .line 255
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$1;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/EditorScreen$1;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setOnMotionEventListener(Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;)V

    .line 266
    const v0, 0x7f1004a9

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingPanel:Landroid/view/View;

    .line 267
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingPanel:Landroid/view/View;

    const v1, 0x7f1004aa

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingBottomLayout:Landroid/widget/LinearLayout;

    .line 268
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingBottomLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f10045c

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingCancel:Landroid/widget/ImageView;

    .line 269
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingBottomLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f10017c

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingWidth:Landroid/widget/ImageView;

    .line 270
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingBottomLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f100177

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingUndo:Landroid/widget/ImageView;

    .line 271
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingBottomLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f10045d

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingEraser:Landroid/widget/ImageView;

    .line 272
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingBottomLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f1004ab

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingDone:Landroid/widget/ImageView;

    .line 275
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingCancel:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$11;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 283
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingWidth:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$12;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingUndo:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$13;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 300
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingUndo:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$14;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnLongClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 305
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingUndo:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 308
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingEraser:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$15;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 313
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingDone:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$16;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 320
    const v0, 0x7f10017b

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/ColorSelectorView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingColorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    .line 321
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingColorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$3;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/EditorScreen$3;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setOnColorSelectedListener(Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;)V

    .line 339
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$17;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setOnTextStickerClickListener(Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;)V

    .line 383
    const v0, 0x7f100470

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/FiltersViewPager;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    .line 384
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->setPageMargin(I)V

    .line 385
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    const v1, 0x7f02033c

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->setPageMarginDrawable(I)V

    .line 387
    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->filtersList:Ljava/util/ArrayList;

    invoke-direct {v0, p0, v1}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    .line 388
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 389
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getRealCount()I

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v2}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getCount()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pagerAdapter:Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;

    invoke-virtual {v3}, Lcom/vk/attachpicker/screen/EditorScreen$FiltersAdapter;->getRealCount()I

    move-result v3

    div-int/2addr v2, v3

    mul-int/2addr v1, v2

    invoke-virtual {v0, v1, v4}, Lcom/vk/attachpicker/widget/FiltersViewPager;->setCurrentItem(IZ)V

    .line 390
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/FiltersViewPager;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 391
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 393
    const v0, 0x7f1004a1

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->attachButton:Landroid/view/View;

    .line 394
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->attachButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$18;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 398
    const v0, 0x7f1004a2

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteArea:Landroid/view/View;

    .line 399
    const v0, 0x7f1004a4

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->deleteIconHover:Landroid/view/View;

    .line 400
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$4;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/EditorScreen$4;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setOnStickerMoveListener(Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;)V

    .line 436
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$19;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View$OnTouchListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->setInterceptTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 445
    const v0, 0x7f10048b

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/LocalImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->backgroundView:Lcom/vk/attachpicker/widget/LocalImageView;

    .line 446
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    if-eqz v0, :cond_0

    .line 447
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->backgroundView:Lcom/vk/attachpicker/widget/LocalImageView;

    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$5;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/EditorScreen$5;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/LocalImageView;->setOnLoadCallback(Lcom/vk/imageloader/OnLoadCallback;)V

    .line 458
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->backgroundView:Lcom/vk/attachpicker/widget/LocalImageView;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/widget/LocalImageView;->setImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Z)V

    .line 461
    :cond_0
    invoke-direct {p0, v4}, Lcom/vk/attachpicker/screen/EditorScreen;->hideDeleteArea(Z)V

    .line 462
    invoke-direct {p0, v4}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 464
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    return-object v0
.end method

.method public finish()V
    .locals 3

    .prologue
    .line 775
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v1}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    .line 776
    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingView;->isDefault()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    .line 777
    invoke-virtual {v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->isDefault()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 778
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->isDefaultFilter()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    .line 779
    invoke-virtual {v1}, Lcom/vk/attachpicker/editor/ImageState;->getAutoEnhanceValue()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    .line 780
    invoke-virtual {v1}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v1}, Lcom/vk/attachpicker/editor/ImageState;->getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/crop/GeometryState;->isDefaultState()Z

    move-result v1

    if-nez v1, :cond_2

    .line 782
    :cond_1
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 783
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 784
    const v1, 0x7f0804cb

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 785
    const v1, 0x7f0804f4

    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$21;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 792
    const v1, 0x7f0804d6

    invoke-static {}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 793
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 801
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :goto_0
    return-void

    .line 796
    :cond_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->delegate:Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

    if-eqz v1, :cond_3

    .line 797
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->closeAnimation()V

    goto :goto_0

    .line 799
    :cond_3
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->finish()V

    goto :goto_0
.end method

.method synthetic lambda$createView$1(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 191
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    .line 192
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButton:Landroid/view/View;

    .line 193
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 194
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->finish()V

    .line 196
    :cond_0
    return-void
.end method

.method synthetic lambda$createView$10(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 314
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->saveState()V

    .line 315
    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->setDrawingTouchEnabled(Z)V

    .line 316
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingPanel:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->bottomPanelCloseAnimation(Landroid/view/View;)V

    .line 317
    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->trackDraw(Z)V

    .line 318
    return-void
.end method

.method synthetic lambda$createView$16(Lcom/vk/attachpicker/stickers/TextSticker;)V
    .locals 8
    .param p1, "textSticker"    # Lcom/vk/attachpicker/stickers/TextSticker;

    .prologue
    const/4 v1, 0x0

    .line 340
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 381
    :cond_0
    :goto_0
    return-void

    .line 343
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    if-nez v0, :cond_0

    .line 344
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 345
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$39;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Lcom/vk/attachpicker/stickers/TextSticker;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 352
    new-instance v0, Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getActivity()Landroid/app/Activity;

    move-result-object v3

    .line 353
    invoke-virtual {p1}, Lcom/vk/attachpicker/stickers/TextSticker;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/vk/attachpicker/stickers/TextSticker;->getColor()I

    move-result v5

    .line 354
    invoke-virtual {p1}, Lcom/vk/attachpicker/stickers/TextSticker;->getStickerStyle()Lcom/vk/attachpicker/stickers/StickerStyle;

    move-result-object v6

    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$40;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Lcom/vk/attachpicker/stickers/TextSticker;)Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;

    move-result-object v7

    move v2, v1

    invoke-direct/range {v0 .. v7}, Lcom/vk/attachpicker/stickers/TextStickerDialog;-><init>(ZZLandroid/content/Context;Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .line 370
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$41;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Lcom/vk/attachpicker/stickers/TextSticker;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 379
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->show()V

    goto :goto_0
.end method

.method synthetic lambda$createView$17(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 395
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->thumb:Z

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->renderAndFinish(Z)V

    .line 396
    return-void
.end method

.method synthetic lambda$createView$18(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 437
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->isDrawingPanelVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 438
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, p2}, Lcom/vk/attachpicker/drawing/DrawingView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 442
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 440
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->pager:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v0, p2}, Lcom/vk/attachpicker/widget/FiltersViewPager;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_0
.end method

.method synthetic lambda$createView$2(Lcom/vk/attachpicker/widget/VkSeekBar;F)V
    .locals 4
    .param p1, "bar"    # Lcom/vk/attachpicker/widget/VkSeekBar;
    .param p2, "value"    # F

    .prologue
    .line 226
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;->getFilter()Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 227
    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v1, p2

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    .line 228
    .local v0, "v":I
    if-nez v0, :cond_1

    .line 229
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoTextView:Landroid/widget/TextView;

    const-string/jumbo v2, "0"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    :goto_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;->getFilter()Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;->setEnhanceIntensity(F)V

    .line 234
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;->requestRender()V

    .line 236
    .end local v0    # "v":I
    :cond_0
    iput p2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tempAutoValue:F

    .line 237
    return-void

    .line 231
    .restart local v0    # "v":I
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoTextView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "+"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method synthetic lambda$createView$3(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 240
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 246
    :goto_0
    return-void

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->tempAutoValue:F

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/editor/ImageState;->setAutoEnhanceValue(F)V

    .line 244
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoPanel:Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->bottomPanelCloseAnimation(Landroid/view/View;)V

    .line 245
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->trackEnhance(Z)V

    goto :goto_0
.end method

.method synthetic lambda$createView$4(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 248
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 252
    :goto_0
    return-void

    .line 251
    :cond_0
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->cancelAutoEnhance()V

    goto :goto_0
.end method

.method synthetic lambda$createView$5(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 276
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->checkButtonLock()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 280
    :goto_0
    return-void

    .line 279
    :cond_0
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->cancelDrawing()V

    goto :goto_0
.end method

.method synthetic lambda$createView$6(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 284
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingWidth:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingColorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    .line 285
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getSelectedColor()I

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    .line 286
    invoke-virtual {v2}, Lcom/vk/attachpicker/drawing/DrawingView;->getWidthMultiplier()F

    move-result v2

    invoke-static {v2}, Lcom/vk/attachpicker/drawing/DrawingState;->findIntIndex(F)I

    move-result v2

    new-instance v3, Lcom/vk/attachpicker/screen/EditorScreen$2;

    invoke-direct {v3, p0}, Lcom/vk/attachpicker/screen/EditorScreen$2;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 284
    invoke-static {v0, v1, v2, v3}, Lcom/vk/attachpicker/widget/WidthSelectorView;->show(Landroid/view/View;IILcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;)V

    .line 293
    return-void
.end method

.method synthetic lambda$createView$7(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 297
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->undo()V

    .line 298
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingUndo:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 299
    return-void

    .line 298
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$createView$8(Landroid/view/View;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 301
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->clear()V

    .line 302
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingUndo:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 303
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$createView$9(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 309
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->setEraserModeEnabled()V

    .line 310
    return-void
.end method

.method synthetic lambda$cropCloseAnimation$29(Landroid/graphics/RectF;Landroid/app/Activity;)V
    .locals 13
    .param p1, "cropRect"    # Landroid/graphics/RectF;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 1405
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getAspectRatio()F

    move-result v0

    .line 1406
    .local v0, "ar":F
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->mainContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    move v4, v3

    move v5, v3

    move v6, v3

    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v7

    .line 1408
    .local v7, "editorRect":Landroid/graphics/RectF;
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float v8, v1, v2

    .line 1410
    .local v8, "scale":F
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    iget v2, p1, Landroid/graphics/RectF;->left:F

    iget v4, v7, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v4

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->setTranslationX(F)V

    .line 1411
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v4, v7, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v4

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->setTranslationY(F)V

    .line 1412
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v1, v8}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->setScaleX(F)V

    .line 1413
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v1, v8}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->setScaleY(F)V

    .line 1415
    new-instance v9, Landroid/animation/AnimatorSet;

    invoke-direct {v9}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1417
    .local v9, "set":Landroid/animation/AnimatorSet;
    const/16 v1, 0x9

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->overlayContainer:Landroid/widget/FrameLayout;

    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v12, [F

    aput v10, v5, v11

    .line 1418
    invoke-static {v2, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/AnimationUtils;->accelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v1, v11

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    sget-object v4, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    new-array v5, v12, [F

    aput v10, v5, v11

    .line 1419
    invoke-static {v2, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/AnimationUtils;->accelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v1, v12

    const/4 v2, 0x2

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    sget-object v5, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    new-array v6, v12, [F

    aput v10, v6, v11

    .line 1420
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->accelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v1, v2

    const/4 v2, 0x3

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    sget-object v5, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v6, v12, [F

    aput v3, v6, v11

    .line 1421
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->accelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v1, v2

    const/4 v2, 0x4

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    sget-object v5, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    new-array v6, v12, [F

    aput v3, v6, v11

    .line 1422
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->accelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v1, v2

    const/4 v2, 0x5

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v12, [F

    aput v10, v6, v11

    .line 1423
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->accelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v1, v2

    const/4 v2, 0x6

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->screenView:Lcom/vk/attachpicker/widget/BgColorFrameLayout;

    sget-object v5, Lcom/vk/attachpicker/widget/BgColorFrameLayout;->BACKGROUND_COLOR:Landroid/util/Property;

    new-array v6, v12, [I

    iget v10, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorBgColor:I

    aput v10, v6, v11

    .line 1424
    invoke-static {v4, v5, v6}, Lcom/vk/core/util/AnimationUtils;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->accelerate(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v1, v2

    const/4 v2, 0x7

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->actionsPanel:Landroid/view/View;

    sget-object v5, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v6, v12, [F

    aput v3, v6, v11

    .line 1425
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->decelerate2(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v1, v2

    const/16 v2, 0x8

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->bottomShadow:Landroid/view/View;

    sget-object v5, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v6, v12, [F

    aput v3, v6, v11

    .line 1426
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->decelerate2(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1417
    invoke-virtual {v9, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1428
    const-wide/16 v2, 0xaf

    invoke-virtual {v9, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1430
    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$22;

    invoke-direct {v1, p0, p2}, Lcom/vk/attachpicker/screen/EditorScreen$22;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;)V

    invoke-virtual {v9, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1438
    invoke-virtual {v9}, Landroid/animation/AnimatorSet;->start()V

    .line 1439
    return-void
.end method

.method synthetic lambda$finish$20(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 786
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->delegate:Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

    if-eqz v0, :cond_0

    .line 787
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->closeAnimation()V

    .line 791
    :goto_0
    return-void

    .line 789
    :cond_0
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->finish()V

    goto :goto_0
.end method

.method synthetic lambda$null$11(Lcom/vk/attachpicker/stickers/TextSticker;)V
    .locals 1
    .param p1, "textSticker"    # Lcom/vk/attachpicker/stickers/TextSticker;

    .prologue
    .line 346
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 347
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/vk/attachpicker/stickers/TextSticker;->setInEditMode(Z)V

    .line 348
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 350
    :cond_0
    return-void
.end method

.method synthetic lambda$null$12(Lcom/vk/attachpicker/stickers/TextSticker;)V
    .locals 1
    .param p1, "textSticker"    # Lcom/vk/attachpicker/stickers/TextSticker;

    .prologue
    .line 365
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/attachpicker/stickers/TextSticker;->setInEditMode(Z)V

    .line 366
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 367
    return-void
.end method

.method synthetic lambda$null$13(Lcom/vk/attachpicker/stickers/TextSticker;Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V
    .locals 4
    .param p1, "textSticker"    # Lcom/vk/attachpicker/stickers/TextSticker;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "color"    # I
    .param p4, "typeface"    # Lcom/vk/attachpicker/stickers/StickerStyle;

    .prologue
    .line 356
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->removeStickerView(Lcom/vk/attachpicker/stickers/Sticker;)V

    .line 364
    :goto_0
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$43;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Lcom/vk/attachpicker/stickers/TextSticker;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 369
    return-void

    .line 359
    :cond_0
    invoke-virtual {p1, p2}, Lcom/vk/attachpicker/stickers/TextSticker;->setText(Ljava/lang/String;)V

    .line 360
    invoke-virtual {p1, p3}, Lcom/vk/attachpicker/stickers/TextSticker;->setColor(I)V

    .line 361
    invoke-virtual {p1, p4}, Lcom/vk/attachpicker/stickers/TextSticker;->setTypeface(Lcom/vk/attachpicker/stickers/StickerStyle;)V

    goto :goto_0
.end method

.method synthetic lambda$null$14(Lcom/vk/attachpicker/stickers/TextSticker;)V
    .locals 1
    .param p1, "textSticker"    # Lcom/vk/attachpicker/stickers/TextSticker;

    .prologue
    .line 375
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/attachpicker/stickers/TextSticker;->setInEditMode(Z)V

    .line 376
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 377
    return-void
.end method

.method synthetic lambda$null$15(Lcom/vk/attachpicker/stickers/TextSticker;Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "textSticker"    # Lcom/vk/attachpicker/stickers/TextSticker;
    .param p2, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 371
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 372
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .line 374
    invoke-static {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$42;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;Lcom/vk/attachpicker/stickers/TextSticker;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 378
    return-void
.end method

.method synthetic lambda$null$27(Landroid/animation/ValueAnimator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 1123
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 1124
    .local v0, "value":F
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->autoSeekBar:Lcom/vk/attachpicker/widget/VkSeekBar;

    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/widget/VkSeekBar;->setValue(F)V

    .line 1125
    return-void
.end method

.method synthetic lambda$onAutoClick$28()V
    .locals 4

    .prologue
    .line 1119
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v1}, Lcom/vk/attachpicker/editor/ImageState;->getAutoEnhanceValue()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    .line 1120
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->setControlsEnabled(Z)V

    .line 1121
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 1122
    .local v0, "enhanceAnimation":Landroid/animation/ValueAnimator;
    invoke-static {p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$38;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1126
    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$14;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/EditorScreen$14;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1132
    sget-object v1, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1133
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1134
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 1136
    .end local v0    # "enhanceAnimation":Landroid/animation/ValueAnimator;
    :cond_0
    return-void

    .line 1121
    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
    .end array-data
.end method

.method synthetic lambda$onCropClick$26()V
    .locals 4

    .prologue
    .line 1070
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1106
    :goto_0
    return-void

    .line 1073
    :cond_0
    new-instance v0, Lcom/vk/attachpicker/screen/CropScreen;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    new-instance v2, Lcom/vk/attachpicker/screen/EditorScreen$13;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/screen/EditorScreen$13;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentCropAspectRatio:Lcom/vk/attachpicker/crop/CropAspectRatio;

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/attachpicker/screen/CropScreen;-><init>(Lcom/vk/attachpicker/editor/ImageState;Lcom/vk/attachpicker/screen/CropScreen$Delegate;Lcom/vk/attachpicker/crop/CropAspectRatio;)V

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    goto :goto_0
.end method

.method synthetic lambda$onDrawingClick$25()V
    .locals 1

    .prologue
    .line 1059
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->setDrawingTouchEnabled(Z)V

    return-void
.end method

.method synthetic lambda$onTextClick$23(Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "color"    # I
    .param p3, "typeface"    # Lcom/vk/attachpicker/stickers/StickerStyle;

    .prologue
    .line 1035
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1036
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    new-instance v1, Lcom/vk/attachpicker/stickers/TextSticker;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredWidth()I

    move-result v2

    const/16 v3, 0x40

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    sub-int/2addr v2, v3

    invoke-direct {v1, v2, p1, p2, p3}, Lcom/vk/attachpicker/stickers/TextSticker;-><init>(ILjava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->addStickerView(Lcom/vk/attachpicker/stickers/Sticker;)V

    .line 1037
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->showTextTooltip()V

    .line 1038
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/EditorScreen;->trackText(Z)V

    .line 1040
    :cond_0
    return-void
.end method

.method synthetic lambda$onTextClick$24(Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1042
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1043
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .line 1044
    return-void
.end method

.method synthetic lambda$renderAndFinish$19()Landroid/graphics/Bitmap;
    .locals 10

    .prologue
    const/16 v7, 0x438

    .line 574
    sget-object v8, Lcom/vk/core/util/GcTrigger;->DEFAULT:Lcom/vk/core/util/GcTrigger;

    invoke-interface {v8}, Lcom/vk/core/util/GcTrigger;->runGc()V

    .line 576
    iget-object v8, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v9

    if-le v9, v7, :cond_0

    const/16 v7, 0x5a0

    :cond_0
    invoke-virtual {v8, v7}, Lcom/vk/attachpicker/editor/ImageState;->getCroppedBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 577
    .local v1, "croppedBitmap":Landroid/graphics/Bitmap;
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getCenterFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    move-result-object v4

    .line 578
    .local v4, "f":Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;
    iget-object v7, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v7}, Lcom/vk/attachpicker/editor/ImageState;->getAutoEnhanceValue()F

    move-result v7

    const/4 v8, 0x0

    cmpl-float v7, v7, v8

    if-lez v7, :cond_1

    .line 579
    iget-object v7, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageState:Lcom/vk/attachpicker/editor/ImageState;

    invoke-virtual {v7}, Lcom/vk/attachpicker/editor/ImageState;->getAutoEnhanceValue()F

    move-result v7

    invoke-static {v1, v7}, Lcom/vk/attachpicker/jni/Native;->enhanceBitmap(Landroid/graphics/Bitmap;F)V

    .line 581
    :cond_1
    const-string/jumbo v7, "FILTER_ID_ORIGINAL"

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->getCenterFilter()Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;

    move-result-object v8

    iget-object v8, v8, Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;->id:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 582
    iget-object v7, v4, Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;->filter:Lcom/vk/attachpicker/imageeditor/json/ApiFilter;

    iget-object v7, v7, Lcom/vk/attachpicker/imageeditor/json/ApiFilter;->colors:Ljava/util/ArrayList;

    const/4 v8, -0x1

    const/4 v9, 0x0

    invoke-static {v7, v8, v9}, Lcom/vk/attachpicker/imageeditor/json/ApiColorPreference;->getNonDefaultColorsCount(Ljava/util/List;IZ)I

    move-result v7

    if-lez v7, :cond_2

    .line 583
    invoke-static {v4}, Lcom/vk/attachpicker/imageeditor/LutManager;->getBigLookupBitmap(Lcom/vk/attachpicker/imageeditor/json/ApiFilterWrapper;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 584
    .local v5, "lut":Landroid/graphics/Bitmap;
    invoke-static {v1, v5}, Lcom/vk/attachpicker/jni/Native;->lookupBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 585
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    .line 589
    .end local v5    # "lut":Landroid/graphics/Bitmap;
    :cond_2
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 591
    .local v0, "canvas":Landroid/graphics/Canvas;
    iget-object v7, p0, Lcom/vk/attachpicker/screen/EditorScreen;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v7}, Lcom/vk/attachpicker/drawing/DrawingView;->getDrawingStateCopy()Lcom/vk/attachpicker/drawing/DrawingState;

    move-result-object v3

    .line 592
    .local v3, "ds":Lcom/vk/attachpicker/drawing/DrawingState;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v3, v7, v8}, Lcom/vk/attachpicker/drawing/DrawingState;->handleSizeChange(FF)V

    .line 594
    new-instance v2, Lcom/vk/attachpicker/drawing/DrawingCanvas;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-direct {v2, v7, v8}, Lcom/vk/attachpicker/drawing/DrawingCanvas;-><init>(II)V

    .line 595
    .local v2, "drawingCanvas":Lcom/vk/attachpicker/drawing/DrawingCanvas;
    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->draw(Lcom/vk/attachpicker/drawing/DrawingState;)V

    .line 596
    invoke-virtual {v2, v0}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawOnCanvas(Landroid/graphics/Canvas;)V

    .line 598
    iget-object v7, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v7}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v6

    .line 599
    .local v6, "sds":Lcom/vk/attachpicker/stickers/StickersDrawingState;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-virtual {v6, v7, v8}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->handleSizeChange(II)V

    .line 600
    invoke-virtual {v6, v0}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->draw(Landroid/graphics/Canvas;)V

    .line 602
    return-object v1
.end method

.method synthetic lambda$trackCrop$34()V
    .locals 2

    .prologue
    .line 1612
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/EditorAnalytics;->logCrop(Z)V

    return-void
.end method

.method synthetic lambda$trackDraw$37(Z)V
    .locals 1
    .param p1, "isFinal"    # Z

    .prologue
    .line 1624
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/EditorAnalytics;->logDraw(Z)V

    return-void
.end method

.method synthetic lambda$trackEmoji$32(Z)V
    .locals 5
    .param p1, "isFinal"    # Z

    .prologue
    .line 1587
    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v3}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->getStickers()Ljava/util/ArrayList;

    move-result-object v2

    .line 1588
    .local v2, "stickers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/stickers/Sticker;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/stickers/Sticker;

    .line 1589
    .local v1, "s":Lcom/vk/attachpicker/stickers/Sticker;
    instance-of v4, v1, Lcom/vk/attachpicker/stickers/BitmapSticker;

    if-eqz v4, :cond_0

    move-object v0, v1

    .line 1590
    check-cast v0, Lcom/vk/attachpicker/stickers/BitmapSticker;

    .line 1591
    .local v0, "bs":Lcom/vk/attachpicker/stickers/BitmapSticker;
    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/BitmapSticker;->getMetaInfo()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 1592
    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v3, p1}, Lcom/vk/attachpicker/EditorAnalytics;->logEmoji(Z)V

    .line 1597
    .end local v0    # "bs":Lcom/vk/attachpicker/stickers/BitmapSticker;
    .end local v1    # "s":Lcom/vk/attachpicker/stickers/Sticker;
    :cond_1
    return-void
.end method

.method synthetic lambda$trackEnhance$36(Z)V
    .locals 1
    .param p1, "isFinal"    # Z

    .prologue
    .line 1620
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/EditorAnalytics;->logEnhance(Z)V

    return-void
.end method

.method synthetic lambda$trackFilter$35(Z)V
    .locals 1
    .param p1, "isFinal"    # Z

    .prologue
    .line 1616
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/EditorAnalytics;->logFilter(Z)V

    return-void
.end method

.method synthetic lambda$trackStickers$31(Z)V
    .locals 6
    .param p1, "isFinal"    # Z

    .prologue
    .line 1569
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1570
    .local v2, "stickerIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v4}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->getStickers()Ljava/util/ArrayList;

    move-result-object v3

    .line 1571
    .local v3, "stickers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/stickers/Sticker;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/stickers/Sticker;

    .line 1572
    .local v1, "s":Lcom/vk/attachpicker/stickers/Sticker;
    instance-of v5, v1, Lcom/vk/attachpicker/stickers/BitmapSticker;

    if-eqz v5, :cond_0

    move-object v0, v1

    .line 1573
    check-cast v0, Lcom/vk/attachpicker/stickers/BitmapSticker;

    .line 1574
    .local v0, "bs":Lcom/vk/attachpicker/stickers/BitmapSticker;
    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/BitmapSticker;->getMetaInfo()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 1575
    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/BitmapSticker;->getMetaInfo()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1579
    .end local v0    # "bs":Lcom/vk/attachpicker/stickers/BitmapSticker;
    .end local v1    # "s":Lcom/vk/attachpicker/stickers/Sticker;
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 1580
    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v4, v2, p1}, Lcom/vk/attachpicker/EditorAnalytics;->logStickers(Ljava/util/Collection;Z)V

    .line 1582
    :cond_2
    return-void
.end method

.method synthetic lambda$trackText$33(Z)V
    .locals 4
    .param p1, "isFinal"    # Z

    .prologue
    .line 1602
    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersDrawingView:Lcom/vk/attachpicker/stickers/StickersDrawingView;

    invoke-virtual {v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->getStickers()Ljava/util/ArrayList;

    move-result-object v1

    .line 1603
    .local v1, "stickers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/stickers/Sticker;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/stickers/Sticker;

    .line 1604
    .local v0, "s":Lcom/vk/attachpicker/stickers/Sticker;
    instance-of v3, v0, Lcom/vk/attachpicker/stickers/TextSticker;

    if-eqz v3, :cond_0

    .line 1605
    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorStatistics:Lcom/vk/attachpicker/EditorAnalytics;

    invoke-virtual {v3, p1}, Lcom/vk/attachpicker/EditorAnalytics;->logText(Z)V

    goto :goto_0

    .line 1608
    .end local v0    # "s":Lcom/vk/attachpicker/stickers/Sticker;
    :cond_1
    return-void
.end method

.method public onBackPressed()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 751
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->controlsEnabled:Z

    if-eqz v0, :cond_0

    .line 752
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 753
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->hideStickers()V

    .line 769
    :cond_0
    :goto_0
    return v1

    .line 755
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    if-eqz v0, :cond_2

    .line 756
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTextDialog:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->dismiss()V

    goto :goto_0

    .line 758
    :cond_2
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->isEnhancePanelVisible()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 759
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->cancelAutoEnhance()V

    goto :goto_0

    .line 761
    :cond_3
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->isDrawingPanelVisible()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 762
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->cancelDrawing()V

    goto :goto_0

    .line 765
    :cond_4
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->finish()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 728
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->onDestroy()V

    .line 729
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTask:Lcom/vk/attachpicker/util/AsyncTask;

    if-eqz v0, :cond_0

    .line 730
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTask:Lcom/vk/attachpicker/util/AsyncTask;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/AsyncTask;->cancel()V

    .line 731
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->currentTask:Lcom/vk/attachpicker/util/AsyncTask;

    .line 733
    :cond_0
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/LutManager;->clearCache()V

    .line 734
    return-void
.end method

.method public onGlobalLayout()V
    .locals 0

    .prologue
    .line 876
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 719
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->onPause()V

    .line 720
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    if-eqz v0, :cond_0

    .line 721
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->imageEditor:Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/imageeditor/SnapsterImageEditorView;->onPause()V

    .line 723
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->editorContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 724
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 702
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->onResume()V

    .line 703
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->shouldPlayOpenAnimation:Z

    if-nez v0, :cond_0

    .line 704
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/EditorScreen;->loadImages()V

    .line 715
    :goto_0
    return-void

    .line 706
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->container:Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/screen/EditorScreen$9;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/EditorScreen$9;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_0
.end method

.method public onTopPaddingChanged(I)V
    .locals 2
    .param p1, "topPadding"    # I

    .prologue
    const/4 v1, 0x0

    .line 738
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v0, v1, p1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 739
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    if-eqz v0, :cond_0

    .line 740
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen;->stickersView:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setTopPadding(I)V

    .line 742
    :cond_0
    iput p1, p0, Lcom/vk/attachpicker/screen/EditorScreen;->topPadding:I

    .line 747
    return-void
.end method
