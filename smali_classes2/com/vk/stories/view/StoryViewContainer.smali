.class public Lcom/vk/stories/view/StoryViewContainer;
.super Landroid/widget/FrameLayout;
.source "StoryViewContainer.java"

# interfaces
.implements Lcom/vk/stories/view/StoryView$StoryViewCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/view/StoryViewContainer$ControlCallback;,
        Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;,
        Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;
    }
.end annotation


# static fields
.field private static final MESSAGE_REQUEST_CODE:I = 0x4d

.field private static final handler:Landroid/os/Handler;

.field private static final volumeHandler:Landroid/os/Handler;


# instance fields
.field private final BACK_AREA_WIDTH:I

.field private adapter:Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

.field private final containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

.field private currentIdlePagerPosition:I

.field private currentPagerState:I

.field private final enabledSwipeDownToClose:Z

.field private errorImage:Landroid/widget/ImageView;

.field private errorMessageView:Landroid/widget/LinearLayout;

.field private errorText:Landroid/widget/TextView;

.field private final hideVolumeControl:Ljava/lang/Runnable;

.field private loadingAvatar:Lcom/vk/imageloader/view/VKImageView;

.field private loadingBackgroundImage:Lcom/vk/imageloader/view/VKImageView;

.field private loadingClose:Landroid/view/View;

.field private loadingLayout:Landroid/widget/FrameLayout;

.field private loadingProgress:Landroid/widget/ProgressBar;

.field private loadingTitle:Landroid/widget/TextView;

.field private messageText:Ljava/lang/String;

.field private onSwipeTouchListener:Lcom/vk/core/widget/OnSwipeTouchListener;

.field private final openStory:Ljava/lang/String;

.field private final openStoryUid:I

.field private pager:Lcom/vk/stories/view/StoriesViewPager;

.field private recipient:Lcom/vkontakte/android/UserProfile;

.field private final showVolumeControl:Ljava/lang/Runnable;

.field private final sourceType:Lcom/vk/stories/StoriesController$SourceType;

.field private storiesContainers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;"
        }
    .end annotation
.end field

.field private final swipeClickLock:Lcom/vk/core/util/TimeoutLock;

.field private final uploadDoneListener:Lcom/vk/attachpicker/events/NotificationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/events/NotificationListener",
            "<",
            "Lcom/vk/stories/StoriesController$StoryUpload;",
            ">;"
        }
    .end annotation
.end field

.field private final uploadErrorListener:Lcom/vk/attachpicker/events/NotificationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/events/NotificationListener",
            "<",
            "Lcom/vk/stories/StoriesController$StoryUpload;",
            ">;"
        }
    .end annotation
.end field

.field private final uploadProgressListener:Lcom/vk/attachpicker/events/NotificationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/events/NotificationListener",
            "<",
            "Lcom/vk/stories/StoriesController$StoryUpload;",
            ">;"
        }
    .end annotation
.end field

.field private volumeControlView:Lcom/vk/stories/view/VolumeControlView;

.field private volumeControlViewShower:Lcom/vk/core/widget/ViewShower;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 62
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vk/stories/view/StoryViewContainer;->handler:Landroid/os/Handler;

    .line 63
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vk/stories/view/StoryViewContainer;->volumeHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/stories/StoriesController$SourceType;ZLcom/vk/stories/view/StoryViewContainer$ControlCallback;Ljava/util/ArrayList;ILjava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sourceType"    # Lcom/vk/stories/StoriesController$SourceType;
    .param p3, "enabledSwipeDownToClose"    # Z
    .param p4, "containerCallback"    # Lcom/vk/stories/view/StoryViewContainer$ControlCallback;
    .param p6, "openStoryUid"    # I
    .param p7, "openStory"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/vk/stories/StoriesController$SourceType;",
            "Z",
            "Lcom/vk/stories/view/StoryViewContainer$ControlCallback;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 111
    .local p5, "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 59
    const/16 v0, 0x58

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryViewContainer;->BACK_AREA_WIDTH:I

    .line 61
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1e

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->swipeClickLock:Lcom/vk/core/util/TimeoutLock;

    .line 65
    new-instance v0, Lcom/vk/stories/view/StoryViewContainer$1;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryViewContainer$1;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->showVolumeControl:Ljava/lang/Runnable;

    .line 71
    new-instance v0, Lcom/vk/stories/view/StoryViewContainer$2;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryViewContainer$2;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->hideVolumeControl:Ljava/lang/Runnable;

    .line 78
    invoke-static {p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/attachpicker/events/NotificationListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadProgressListener:Lcom/vk/attachpicker/events/NotificationListener;

    .line 79
    invoke-static {p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/attachpicker/events/NotificationListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadDoneListener:Lcom/vk/attachpicker/events/NotificationListener;

    .line 80
    invoke-static {p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$3;->lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/attachpicker/events/NotificationListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadErrorListener:Lcom/vk/attachpicker/events/NotificationListener;

    .line 114
    iput-object p2, p0, Lcom/vk/stories/view/StoryViewContainer;->sourceType:Lcom/vk/stories/StoriesController$SourceType;

    .line 115
    iput-boolean p3, p0, Lcom/vk/stories/view/StoryViewContainer;->enabledSwipeDownToClose:Z

    .line 116
    iput-object p4, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    .line 117
    iput-object p5, p0, Lcom/vk/stories/view/StoryViewContainer;->storiesContainers:Ljava/util/ArrayList;

    .line 118
    iput p6, p0, Lcom/vk/stories/view/StoryViewContainer;->openStoryUid:I

    .line 119
    iput-object p7, p0, Lcom/vk/stories/view/StoryViewContainer;->openStory:Ljava/lang/String;

    .line 122
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/16 v1, 0x67

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadProgressListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 123
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/16 v1, 0x66

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadDoneListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 124
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/16 v1, 0x68

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadErrorListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 126
    invoke-direct {p0}, Lcom/vk/stories/view/StoryViewContainer;->init()V

    .line 127
    return-void
.end method

.method static synthetic access$000(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/core/widget/ViewShower;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->volumeControlViewShower:Lcom/vk/core/widget/ViewShower;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/stories/view/StoryViewContainer;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget v0, p0, Lcom/vk/stories/view/StoryViewContainer;->BACK_AREA_WIDTH:I

    return v0
.end method

.method static synthetic access$1100(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vk/stories/view/StoryViewContainer;->showBackGradient()V

    return-void
.end method

.method static synthetic access$1200(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/core/util/TimeoutLock;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->swipeClickLock:Lcom/vk/core/util/TimeoutLock;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;
    .param p1, "x1"    # Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/vk/stories/view/StoryViewContainer;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryViewContainer;->enabledSwipeDownToClose:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/StoriesController$SourceType;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->sourceType:Lcom/vk/stories/StoriesController$SourceType;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/core/widget/OnSwipeTouchListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->onSwipeTouchListener:Lcom/vk/core/widget/OnSwipeTouchListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vk/stories/view/StoryViewContainer;->resetStoryTimers()V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/stories/view/StoryViewContainer;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget v0, p0, Lcom/vk/stories/view/StoryViewContainer;->currentPagerState:I

    return v0
.end method

.method static synthetic access$302(Lcom/vk/stories/view/StoryViewContainer;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;
    .param p1, "x1"    # I

    .prologue
    .line 55
    iput p1, p0, Lcom/vk/stories/view/StoryViewContainer;->currentPagerState:I

    return p1
.end method

.method static synthetic access$400(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vk/stories/view/StoryViewContainer;->hideBackGradient()V

    return-void
.end method

.method static synthetic access$500(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoriesViewPager;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/stories/view/StoryViewContainer;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->storiesContainers:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoryViewContainer$ControlCallback;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    return-object v0
.end method

.method static synthetic access$802(Lcom/vk/stories/view/StoryViewContainer;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;
    .param p1, "x1"    # I

    .prologue
    .line 55
    iput p1, p0, Lcom/vk/stories/view/StoryViewContainer;->currentIdlePagerPosition:I

    return p1
.end method

.method static synthetic access$900(Lcom/vk/stories/view/StoryViewContainer;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method private dispatchUploadDone(Lcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 1
    .param p1, "su"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 486
    invoke-static {p1}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$18;->lambdaFactory$(Lcom/vk/stories/StoriesController$StoryUpload;)Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 487
    return-void
.end method

.method private dispatchUploadError(Lcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 1
    .param p1, "su"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 490
    invoke-static {p1}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$19;->lambdaFactory$(Lcom/vk/stories/StoriesController$StoryUpload;)Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 491
    return-void
.end method

.method private dispatchUploadProgress(Lcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 1
    .param p1, "su"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 482
    invoke-static {p1}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$17;->lambdaFactory$(Lcom/vk/stories/StoriesController$StoryUpload;)Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 483
    return-void
.end method

.method private hideBackGradient()V
    .locals 1

    .prologue
    .line 329
    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$10;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 330
    return-void
.end method

.method private init()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 130
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030021

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 131
    invoke-direct {p0}, Lcom/vk/stories/view/StoryViewContainer;->initTouchListener()V

    .line 133
    new-instance v1, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;-><init>(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/view/StoryViewContainer$1;)V

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->adapter:Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

    .line 134
    const v1, 0x7f10018c

    invoke-virtual {p0, v1}, Lcom/vk/stories/view/StoryViewContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/view/StoriesViewPager;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    .line 135
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->adapter:Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

    invoke-virtual {v1, v2}, Lcom/vk/stories/view/StoriesViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 136
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    const/4 v2, 0x1

    new-instance v3, Lcom/vk/stories/view/StoryPageTransformer;

    invoke-direct {v3}, Lcom/vk/stories/view/StoryPageTransformer;-><init>()V

    invoke-virtual {v1, v2, v3}, Lcom/vk/stories/view/StoriesViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 137
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    new-instance v2, Lcom/vk/stories/view/StoryViewContainer$3;

    invoke-direct {v2, p0}, Lcom/vk/stories/view/StoryViewContainer$3;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    invoke-virtual {v1, v2}, Lcom/vk/stories/view/StoriesViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 173
    const v1, 0x7f100196

    invoke-virtual {p0, v1}, Lcom/vk/stories/view/StoryViewContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/view/VolumeControlView;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->volumeControlView:Lcom/vk/stories/view/VolumeControlView;

    .line 174
    new-instance v1, Lcom/vk/core/widget/ViewShower;

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->volumeControlView:Lcom/vk/stories/view/VolumeControlView;

    invoke-direct {v1, v2}, Lcom/vk/core/widget/ViewShower;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->volumeControlViewShower:Lcom/vk/core/widget/ViewShower;

    .line 176
    const v1, 0x7f10018d

    invoke-virtual {p0, v1}, Lcom/vk/stories/view/StoryViewContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    .line 177
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$4;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 178
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f100190

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingAvatar:Lcom/vk/imageloader/view/VKImageView;

    .line 179
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f100191

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingTitle:Landroid/widget/TextView;

    .line 180
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f10018e

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingBackgroundImage:Lcom/vk/imageloader/view/VKImageView;

    .line 181
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f100193

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->errorMessageView:Landroid/widget/LinearLayout;

    .line 182
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->errorMessageView:Landroid/widget/LinearLayout;

    const v2, 0x7f100194

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->errorImage:Landroid/widget/ImageView;

    .line 183
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->errorMessageView:Landroid/widget/LinearLayout;

    const v2, 0x7f100195

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->errorText:Landroid/widget/TextView;

    .line 185
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f100192

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingProgress:Landroid/widget/ProgressBar;

    .line 186
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/4 v2, -0x1

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 187
    const v1, 0x7f10015e

    invoke-virtual {p0, v1}, Lcom/vk/stories/view/StoryViewContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingClose:Landroid/view/View;

    .line 188
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingClose:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$5;->lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->storiesContainers:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    .line 194
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->storiesContainers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 195
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->storiesContainers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v1

    iget v2, p0, Lcom/vk/stories/view/StoryViewContainer;->openStoryUid:I

    if-ne v1, v2, :cond_1

    .line 196
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v1, v0, v4}, Lcom/vk/stories/view/StoriesViewPager;->setCurrentItem(IZ)V

    .line 197
    iput v0, p0, Lcom/vk/stories/view/StoryViewContainer;->currentIdlePagerPosition:I

    .line 216
    .end local v0    # "i":I
    :cond_0
    :goto_1
    return-void

    .line 194
    .restart local v0    # "i":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 202
    .end local v0    # "i":I
    :cond_2
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->openStory:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 203
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 205
    new-instance v1, Lcom/vkontakte/android/api/stories/StoriesGetById;

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->openStory:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/stories/StoriesGetById;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/vkontakte/android/api/stories/StoriesGetById;->toObservable()Lio/reactivex/Observable;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 206
    invoke-virtual {v1, v2, v3, v4}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v1

    .line 207
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$6;->lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;)Lio/reactivex/functions/Consumer;

    move-result-object v2

    invoke-static {p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$7;->lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;)Lio/reactivex/functions/Consumer;

    move-result-object v3

    .line 208
    invoke-virtual {v1, v2, v3}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 214
    :cond_3
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    invoke-interface {v1}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    goto :goto_1
.end method

.method private initTouchListener()V
    .locals 3

    .prologue
    .line 264
    new-instance v0, Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/vk/stories/view/StoryViewContainer$5;

    invoke-direct {v2, p0}, Lcom/vk/stories/view/StoryViewContainer$5;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    invoke-direct {v0, v1, v2}, Lcom/vk/core/widget/OnSwipeTouchListener;-><init>(Landroid/content/Context;Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->onSwipeTouchListener:Lcom/vk/core/widget/OnSwipeTouchListener;

    .line 297
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->onSwipeTouchListener:Lcom/vk/core/widget/OnSwipeTouchListener;

    new-instance v1, Lcom/vk/stories/view/StoryViewContainer$6;

    invoke-direct {v1, p0}, Lcom/vk/stories/view/StoryViewContainer$6;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/OnSwipeTouchListener;->setGestureListener(Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;)V

    .line 322
    return-void
.end method

.method private iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V
    .locals 3
    .param p1, "storyViewCallback"    # Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    .prologue
    .line 494
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v2}, Lcom/vk/stories/view/StoriesViewPager;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 495
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v2, v0}, Lcom/vk/stories/view/StoriesViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/view/StoryView;

    .line 496
    .local v1, "sv":Lcom/vk/stories/view/StoryView;
    invoke-interface {p1, v1}, Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;->storyView(Lcom/vk/stories/view/StoryView;)V

    .line 494
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 498
    .end local v1    # "sv":Lcom/vk/stories/view/StoryView;
    :cond_0
    return-void
.end method

.method static synthetic lambda$dispatchUploadDone$17(Lcom/vk/stories/StoriesController$StoryUpload;Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "su"    # Lcom/vk/stories/StoriesController$StoryUpload;
    .param p1, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 486
    invoke-virtual {p1, p0}, Lcom/vk/stories/view/StoryView;->setUploadDone(Lcom/vk/stories/StoriesController$StoryUpload;)V

    return-void
.end method

.method static synthetic lambda$dispatchUploadError$18(Lcom/vk/stories/StoriesController$StoryUpload;Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "su"    # Lcom/vk/stories/StoriesController$StoryUpload;
    .param p1, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 490
    invoke-virtual {p1, p0}, Lcom/vk/stories/view/StoryView;->setUploadFailed(Lcom/vk/stories/StoriesController$StoryUpload;)V

    return-void
.end method

.method static synthetic lambda$dispatchUploadProgress$16(Lcom/vk/stories/StoriesController$StoryUpload;Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "su"    # Lcom/vk/stories/StoriesController$StoryUpload;
    .param p1, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 482
    invoke-virtual {p1, p0}, Lcom/vk/stories/view/StoryView;->setUploadProgress(Lcom/vk/stories/StoriesController$StoryUpload;)V

    return-void
.end method

.method static synthetic lambda$hideBackGradient$9(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 329
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->hideBackGradient()V

    return-void
.end method

.method static synthetic lambda$init$3(Landroid/view/View;)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 177
    return-void
.end method

.method static synthetic lambda$onDestroy$12(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 403
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->destroy()V

    return-void
.end method

.method static synthetic lambda$onPause$11(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 396
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->onPause()V

    return-void
.end method

.method static synthetic lambda$onResume$10(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 391
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->onResume()V

    return-void
.end method

.method static synthetic lambda$pauseStory$14(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 474
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->pause()V

    return-void
.end method

.method static synthetic lambda$playStory$13(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 470
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->play()V

    return-void
.end method

.method static synthetic lambda$resetStoryTimers$15(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 478
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->resetProgress()V

    return-void
.end method

.method static synthetic lambda$showBackGradient$8(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 325
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->showBackGradient()V

    return-void
.end method

.method private openNewMessage(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 456
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->recipient:Lcom/vkontakte/android/UserProfile;

    if-nez v1, :cond_0

    .line 457
    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer;->messageText:Ljava/lang/String;

    .line 458
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    new-instance v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;-><init>()V

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->setSelectMode()Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const/16 v3, 0x4d

    invoke-interface {v1, v2, v3}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->startForResult(Landroid/content/Intent;I)V

    .line 464
    :goto_0
    return-void

    .line 460
    :cond_0
    new-instance v1, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->recipient:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v3, p0, Lcom/vk/stories/view/StoryViewContainer;->recipient:Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->recipient:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 461
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setText(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v0

    .line 462
    .local v0, "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.method private resetStoryTimers()V
    .locals 1

    .prologue
    .line 478
    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$16;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 479
    return-void
.end method

.method private showBackGradient()V
    .locals 1

    .prologue
    .line 325
    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$9;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 326
    return-void
.end method

.method private showStory(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 6
    .param p1, "result"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    const/4 v4, 0x0

    .line 219
    if-eqz p1, :cond_5

    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    if-eqz v2, :cond_5

    .line 220
    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v2

    if-nez v2, :cond_1

    .line 221
    :cond_0
    const v2, 0x7f0806cc

    invoke-static {v2}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 222
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    invoke-interface {v2}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    .line 261
    :goto_0
    return-void

    .line 224
    :cond_1
    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoriesContainer;

    iget-object v2, v2, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoryEntry;

    iget-boolean v2, v2, Lcom/vk/stories/model/StoryEntry;->expired:Z

    if-nez v2, :cond_2

    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoriesContainer;

    iget-object v2, v2, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoryEntry;

    iget-boolean v2, v2, Lcom/vk/stories/model/StoryEntry;->isPrivate:Z

    if-eqz v2, :cond_4

    .line 225
    :cond_2
    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoriesContainer;

    .line 226
    .local v1, "sc":Lcom/vk/stories/model/StoriesContainer;
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingAvatar:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 227
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingTitle:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorFullName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingBackgroundImage:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2, v4}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 229
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->errorMessageView:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 230
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingProgress:Landroid/widget/ProgressBar;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 232
    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoriesContainer;

    iget-object v2, v2, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoryEntry;

    iget-boolean v2, v2, Lcom/vk/stories/model/StoryEntry;->expired:Z

    if-eqz v2, :cond_3

    .line 233
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->errorImage:Landroid/widget/ImageView;

    const v3, 0x7f0202b8

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 234
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->errorText:Landroid/widget/TextView;

    const v3, 0x7f0806cd

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 240
    :goto_1
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingBackgroundImage:Lcom/vk/imageloader/view/VKImageView;

    sget-object v3, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->INSTANCE_5:Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 241
    iget-object v3, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingBackgroundImage:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, v1, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v2, v4}, Lcom/vk/stories/model/StoryEntry;->getImageSmall(Z)Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/vk/imageloader/ImageSize;->BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v3, v2, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 243
    invoke-static {p0, v1}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$8;->lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/model/StoriesContainer;)Landroid/view/View$OnClickListener;

    move-result-object v0

    .line 244
    .local v0, "openProfileListener":Landroid/view/View$OnClickListener;
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingAvatar:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2, v0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 245
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingTitle:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/vk/stories/view/StoryViewContainer;->onSwipeTouchListener:Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto/16 :goto_0

    .line 236
    .end local v0    # "openProfileListener":Landroid/view/View$OnClickListener;
    :cond_3
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->errorImage:Landroid/widget/ImageView;

    const v3, 0x7f0202b7

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 237
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->errorText:Landroid/widget/TextView;

    const v3, 0x7f0806d3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 249
    .end local v1    # "sc":Lcom/vk/stories/model/StoriesContainer;
    :cond_4
    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    iput-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->storiesContainers:Ljava/util/ArrayList;

    .line 250
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->adapter:Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

    invoke-virtual {v2}, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->notifyDataSetChanged()V

    .line 251
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->loadingLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Lcom/vk/stories/view/StoryViewContainer$4;

    invoke-direct {v3, p0}, Lcom/vk/stories/view/StoryViewContainer$4;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const-wide/16 v4, 0xe1

    .line 256
    invoke-virtual {v2, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    goto/16 :goto_0

    .line 259
    :cond_5
    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    invoke-interface {v2}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    goto/16 :goto_0
.end method


# virtual methods
.method public deleteStory(Lcom/vk/stories/model/StoriesContainer;)V
    .locals 2
    .param p1, "storiesContainer"    # Lcom/vk/stories/model/StoriesContainer;

    .prologue
    .line 447
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->adapter:Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->getCount()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->adapter:Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->getCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 448
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    .line 453
    :goto_0
    return-void

    .line 450
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->storiesContainers:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 451
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->adapter:Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public doDispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 12
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/16 v11, 0x19

    const/16 v10, 0x18

    const/4 v8, 0x0

    .line 344
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 345
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    .line 347
    .local v2, "keyCode":I
    if-eq v2, v10, :cond_0

    if-ne v2, v11, :cond_1

    .line 349
    :cond_0
    const/4 v6, 0x3

    .line 350
    .local v6, "streamType":I
    :try_start_0
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v8

    const-string/jumbo v9, "audio"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    .line 351
    .local v1, "am":Landroid/media/AudioManager;
    const/4 v8, 0x3

    invoke-virtual {v1, v8}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v4

    .line 352
    .local v4, "maxLevel":I
    const/4 v8, 0x3

    invoke-virtual {v1, v8}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v7

    .line 354
    .local v7, "volumeLevel":I
    if-ne v2, v10, :cond_2

    if-nez v0, :cond_2

    .line 355
    add-int/lit8 v8, v7, 0x1

    const/4 v9, 0x0

    invoke-static {v8, v9, v4}, Lcom/vk/attachpicker/util/Utils;->clamp(III)I

    move-result v5

    .line 362
    .local v5, "newVolumeLevel":I
    :goto_0
    int-to-float v8, v5

    int-to-float v9, v4

    div-float v3, v8, v9

    .line 364
    .local v3, "levelNormalized":F
    const/4 v8, 0x3

    const/4 v9, 0x0

    invoke-virtual {v1, v8, v5, v9}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 365
    iget-object v8, p0, Lcom/vk/stories/view/StoryViewContainer;->volumeControlView:Lcom/vk/stories/view/VolumeControlView;

    invoke-virtual {v8, v3}, Lcom/vk/stories/view/VolumeControlView;->setVolumeLevel(F)V

    .line 367
    sget-object v8, Lcom/vk/stories/view/StoryViewContainer;->volumeHandler:Landroid/os/Handler;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 368
    sget-object v8, Lcom/vk/stories/view/StoryViewContainer;->volumeHandler:Landroid/os/Handler;

    iget-object v9, p0, Lcom/vk/stories/view/StoryViewContainer;->showVolumeControl:Ljava/lang/Runnable;

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 369
    sget-object v8, Lcom/vk/stories/view/StoryViewContainer;->volumeHandler:Landroid/os/Handler;

    iget-object v9, p0, Lcom/vk/stories/view/StoryViewContainer;->hideVolumeControl:Ljava/lang/Runnable;

    const-wide/16 v10, 0x7d0

    invoke-virtual {v8, v9, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 375
    .end local v1    # "am":Landroid/media/AudioManager;
    .end local v3    # "levelNormalized":F
    .end local v4    # "maxLevel":I
    .end local v5    # "newVolumeLevel":I
    .end local v7    # "volumeLevel":I
    :goto_1
    const/4 v8, 0x1

    .line 377
    .end local v6    # "streamType":I
    :cond_1
    return v8

    .line 356
    .restart local v1    # "am":Landroid/media/AudioManager;
    .restart local v4    # "maxLevel":I
    .restart local v6    # "streamType":I
    .restart local v7    # "volumeLevel":I
    :cond_2
    if-ne v2, v11, :cond_3

    if-nez v0, :cond_3

    .line 357
    add-int/lit8 v8, v7, -0x1

    const/4 v9, 0x0

    invoke-static {v8, v9, v4}, Lcom/vk/attachpicker/util/Utils;->clamp(III)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .restart local v5    # "newVolumeLevel":I
    goto :goto_0

    .line 359
    .end local v5    # "newVolumeLevel":I
    :cond_3
    move v5, v7

    .restart local v5    # "newVolumeLevel":I
    goto :goto_0

    .line 370
    .end local v1    # "am":Landroid/media/AudioManager;
    .end local v4    # "maxLevel":I
    .end local v5    # "newVolumeLevel":I
    .end local v7    # "volumeLevel":I
    :catch_0
    move-exception v8

    goto :goto_1
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 411
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    .line 412
    return-void
.end method

.method public getCurrentIdlePagerPosition()I
    .locals 1

    .prologue
    .line 416
    iget v0, p0, Lcom/vk/stories/view/StoryViewContainer;->currentIdlePagerPosition:I

    return v0
.end method

.method public getCurrentStoryAuthorUid()I
    .locals 3

    .prologue
    .line 337
    :try_start_0
    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->storiesContainers:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getCurrentIdlePagerPosition()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 339
    :goto_0
    return v1

    .line 338
    :catch_0
    move-exception v0

    .line 339
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method synthetic lambda$init$4(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    .line 190
    return-void
.end method

.method synthetic lambda$init$5(Ljava/lang/Object;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 208
    check-cast p1, Lcom/vk/stories/model/GetStoriesResponse;

    .end local p1    # "response":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lcom/vk/stories/view/StoryViewContainer;->showStory(Lcom/vk/stories/model/GetStoriesResponse;)V

    return-void
.end method

.method synthetic lambda$init$6(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 210
    const v0, 0x7f0806cf

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 211
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    .line 212
    return-void
.end method

.method synthetic lambda$new$0(IILcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 0
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .param p3, "eventArgs"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 78
    invoke-direct {p0, p3}, Lcom/vk/stories/view/StoryViewContainer;->dispatchUploadProgress(Lcom/vk/stories/StoriesController$StoryUpload;)V

    return-void
.end method

.method synthetic lambda$new$1(IILcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 0
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .param p3, "eventArgs"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 79
    invoke-direct {p0, p3}, Lcom/vk/stories/view/StoryViewContainer;->dispatchUploadDone(Lcom/vk/stories/StoriesController$StoryUpload;)V

    return-void
.end method

.method synthetic lambda$new$2(IILcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 0
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .param p3, "eventArgs"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 80
    invoke-direct {p0, p3}, Lcom/vk/stories/view/StoryViewContainer;->dispatchUploadError(Lcom/vk/stories/StoriesController$StoryUpload;)V

    return-void
.end method

.method synthetic lambda$showStory$7(Lcom/vk/stories/model/StoriesContainer;Landroid/view/View;)V
    .locals 2
    .param p1, "sc"    # Lcom/vk/stories/model/StoriesContainer;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 243
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method public nextStory()V
    .locals 3

    .prologue
    .line 437
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoriesViewPager;->getCurrentItem()I

    move-result v0

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->adapter:Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 438
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoriesViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vk/stories/view/StoriesViewPager;->setCurrentItem(IZ)V

    .line 439
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoriesViewPager;->lockTouches()V

    .line 443
    :goto_0
    return-void

    .line 441
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->containerCallback:Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 382
    const/16 v0, 0x4d

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 383
    const-string/jumbo v0, "profile"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->recipient:Lcom/vkontakte/android/UserProfile;

    .line 384
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->messageText:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->openNewMessage(Ljava/lang/String;)V

    .line 386
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 400
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadProgressListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 401
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadDoneListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 402
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->uploadErrorListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 403
    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$13;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 404
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 395
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/camera/Utils;->keepScreenOn(Landroid/app/Activity;Z)V

    .line 396
    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$12;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 397
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 389
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/camera/Utils;->keepScreenOn(Landroid/app/Activity;Z)V

    .line 390
    invoke-direct {p0}, Lcom/vk/stories/view/StoryViewContainer;->resetStoryTimers()V

    .line 391
    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$11;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 392
    return-void
.end method

.method public pauseStory()V
    .locals 1

    .prologue
    .line 474
    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$15;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 475
    return-void
.end method

.method public playStory()V
    .locals 1

    .prologue
    .line 470
    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$14;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryViewContainer;->iterateAllStoryViews(Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V

    .line 471
    return-void
.end method

.method public prevStory()V
    .locals 3

    .prologue
    .line 429
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoriesViewPager;->getCurrentItem()I

    move-result v0

    if-lez v0, :cond_0

    .line 430
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoriesViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vk/stories/view/StoriesViewPager;->setCurrentItem(IZ)V

    .line 431
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer;->pager:Lcom/vk/stories/view/StoriesViewPager;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoriesViewPager;->lockTouches()V

    .line 433
    :cond_0
    return-void
.end method

.method public shareStory(Ljava/lang/String;Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "photo"    # Ljava/lang/String;
    .param p3, "entry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 421
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    const-string/jumbo v1, "stories"

    .line 422
    invoke-static {p1, p2, p3, v1}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Ljava/lang/String;Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 423
    invoke-static {}, Lcom/vk/sharing/action/Actions;->createInfoExcludeRepost()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 424
    invoke-virtual {v0}, Lcom/vk/sharing/Sharing$Builder;->share()V

    .line 425
    return-void
.end method
