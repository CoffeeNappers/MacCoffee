.class public Lcom/vk/stories/view/StoryView;
.super Landroid/widget/FrameLayout;
.source "StoryView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/view/StoryView$StoryViewCallback;
    }
.end annotation


# static fields
.field private static final PHOTO_STORY_DURATION:J = 0xbb8L

.field private static final PRELOAD_COUNT:I = 0x3

.field private static final STORY_IMAGE_SIZE:Lcom/vk/imageloader/ImageSize;

.field private static final UPLOAD_FAILURE_VIEW_BG_COLOR:I = -0xcccccd


# instance fields
.field private avatarImageView:Lcom/vk/imageloader/view/VKImageView;

.field private backGradient:Landroid/view/View;

.field private backGradientShower:Lcom/vk/core/widget/ViewShower;

.field private final callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

.field private currentDialog:Landroid/app/Dialog;

.field private currentIndex:I

.field private currentStory:Lcom/vk/stories/model/StoryEntry;

.field private dateView:Landroid/widget/TextView;

.field private final elapsedTimeCounter:Lcom/vk/core/util/ElapsedTimeCounter;

.field private errorView:Landroid/view/View;

.field private gestureHandler:Landroid/view/View;

.field private gestureTouchListener:Landroid/view/View$OnTouchListener;

.field private final hideErrorRunnable:Ljava/lang/Runnable;

.field private final hideProgressRunnable:Ljava/lang/Runnable;

.field private imagePreview:Lcom/vk/imageloader/view/VKImageView;

.field private isActivityPaused:Z

.field private isCurrentStoryPhoto:Z

.field private isDestroyed:Z

.field private loadingProgress:Landroid/widget/ProgressBar;

.field private myStoryBottom:Landroid/view/View;

.field private myStoryUploadFailure:Landroid/view/View;

.field private myStoryUploadRetryButton:Landroid/view/View;

.field private myStoryUploadingView:Landroid/view/View;

.field private myStoryViewersView:Landroid/view/View;

.field private nameView:Landroid/widget/TextView;

.field private photoLoaded:Z

.field private position:I

.field private final progressHandler:Landroid/os/Handler;

.field private final progressShowHandler:Landroid/os/Handler;

.field private progressView:Lcom/vk/stories/view/StoryProgressView;

.field private retryButton:Landroid/view/View;

.field private sendMessageView:Landroid/view/View;

.field private shareButton:Landroid/view/View;

.field private shareButtonMy:Landroid/view/View;

.field private final showErrorRunnable:Ljava/lang/Runnable;

.field private final showProgressRunnable:Ljava/lang/Runnable;

.field private final sourceType:Lcom/vk/stories/StoriesController$SourceType;

.field private final startProgressUpdatesRunnable:Ljava/lang/Runnable;

.field private final stopProgressUpdatesRunnable:Ljava/lang/Runnable;

.field private storyActions:Landroid/view/View;

.field private storyBottom:Landroid/view/View;

.field private final storyContainer:Lcom/vk/stories/model/StoriesContainer;

.field private final stubInstance:Z

.field private final uiHandler:Landroid/os/Handler;

.field private uploadProgressView:Lcom/vk/stories/view/StoryUploadProgressView;

.field private uploadText:Landroid/widget/TextView;

.field private videoView:Lcom/vk/core/view/SimpleVideoView;

.field private viewsCountIcon:Landroid/view/View;

.field private viewsCountText:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/vk/imageloader/ImageSize;->BIG:Lcom/vk/imageloader/ImageSize;

    sput-object v0, Lcom/vk/stories/view/StoryView;->STORY_IMAGE_SIZE:Lcom/vk/imageloader/ImageSize;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZLcom/vk/stories/StoriesController$SourceType;ILandroid/view/View$OnTouchListener;Lcom/vk/stories/model/StoriesContainer;Lcom/vk/stories/view/StoryView$StoryViewCallback;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "stubInstance"    # Z
    .param p3, "sourceType"    # Lcom/vk/stories/StoriesController$SourceType;
    .param p4, "position"    # I
    .param p5, "gestureTouchListener"    # Landroid/view/View$OnTouchListener;
    .param p6, "storiesContainer"    # Lcom/vk/stories/model/StoriesContainer;
    .param p7, "callback"    # Lcom/vk/stories/view/StoryView$StoryViewCallback;

    .prologue
    .line 196
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 59
    new-instance v0, Lcom/vk/core/util/ElapsedTimeCounter;

    invoke-direct {v0}, Lcom/vk/core/util/ElapsedTimeCounter;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->elapsedTimeCounter:Lcom/vk/core/util/ElapsedTimeCounter;

    .line 61
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->uiHandler:Landroid/os/Handler;

    .line 62
    new-instance v0, Lcom/vk/stories/view/StoryView$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vk/stories/view/StoryView$1;-><init>(Lcom/vk/stories/view/StoryView;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->progressHandler:Landroid/os/Handler;

    .line 94
    new-instance v0, Lcom/vk/stories/view/StoryView$2;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$2;-><init>(Lcom/vk/stories/view/StoryView;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->startProgressUpdatesRunnable:Ljava/lang/Runnable;

    .line 105
    new-instance v0, Lcom/vk/stories/view/StoryView$3;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$3;-><init>(Lcom/vk/stories/view/StoryView;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->stopProgressUpdatesRunnable:Ljava/lang/Runnable;

    .line 115
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->progressShowHandler:Landroid/os/Handler;

    .line 117
    new-instance v0, Lcom/vk/stories/view/StoryView$4;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$4;-><init>(Lcom/vk/stories/view/StoryView;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->showProgressRunnable:Ljava/lang/Runnable;

    .line 126
    new-instance v0, Lcom/vk/stories/view/StoryView$5;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$5;-><init>(Lcom/vk/stories/view/StoryView;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->hideProgressRunnable:Ljava/lang/Runnable;

    .line 134
    new-instance v0, Lcom/vk/stories/view/StoryView$6;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$6;-><init>(Lcom/vk/stories/view/StoryView;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->showErrorRunnable:Ljava/lang/Runnable;

    .line 143
    new-instance v0, Lcom/vk/stories/view/StoryView$7;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$7;-><init>(Lcom/vk/stories/view/StoryView;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->hideErrorRunnable:Ljava/lang/Runnable;

    .line 197
    iput-object p3, p0, Lcom/vk/stories/view/StoryView;->sourceType:Lcom/vk/stories/StoriesController$SourceType;

    .line 198
    iput-boolean p2, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    .line 199
    iput p4, p0, Lcom/vk/stories/view/StoryView;->position:I

    .line 200
    iput-object p5, p0, Lcom/vk/stories/view/StoryView;->gestureTouchListener:Landroid/view/View$OnTouchListener;

    .line 201
    iput-object p6, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    .line 202
    iput-object p7, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    .line 204
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->init()V

    .line 205
    return-void
.end method

.method static synthetic access$000(Lcom/vk/stories/view/StoryView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->canStartProgressUpdates()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/vk/stories/view/StoryView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->getCurrentProgress()F

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/vk/stories/view/StoryView;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/view/SimpleVideoView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vk/stories/view/StoryView;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressShowHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vk/stories/view/StoryView;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->loadingProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vk/stories/view/StoryView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->errorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->showError()V

    return-void
.end method

.method static synthetic access$1600(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->stopProgressUpdates()V

    return-void
.end method

.method static synthetic access$1700(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->showProgress()V

    return-void
.end method

.method static synthetic access$1800(Lcom/vk/stories/view/StoryView;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;
    .param p1, "x1"    # Z

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/vk/stories/view/StoryView;->startProgressUpdates(Z)V

    return-void
.end method

.method static synthetic access$1902(Lcom/vk/stories/view/StoryView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;
    .param p1, "x1"    # Z

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/vk/stories/view/StoryView;->photoLoaded:Z

    return p1
.end method

.method static synthetic access$200(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->hideProgress()V

    return-void
.end method

.method static synthetic access$2000(Lcom/vk/stories/view/StoryView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;
    .param p1, "x1"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/vk/stories/view/StoryView;->doDeleteCurrentStory(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->hideError()V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/model/StoryEntry;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/StoriesController$SourceType;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->sourceType:Lcom/vk/stories/StoriesController$SourceType;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/stories/view/StoryView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isCurrentStoryPhoto:Z

    return v0
.end method

.method static synthetic access$700(Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/view/StoryProgressView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressView:Lcom/vk/stories/view/StoryProgressView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->onNextClick()V

    return-void
.end method

.method static synthetic access$900(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/util/ElapsedTimeCounter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->elapsedTimeCounter:Lcom/vk/core/util/ElapsedTimeCounter;

    return-object v0
.end method

.method static synthetic access$lambda$0(Lcom/vk/stories/view/StoryView;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->deleteStory()V

    return-void
.end method

.method private canStartProgressUpdates()Z
    .locals 1

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isActivityPaused:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-nez v0, :cond_1

    .line 260
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isCurrentStoryPhoto:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isCurrentStoryPhoto:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->photoLoaded:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    .line 263
    invoke-static {v0}, Lcom/vk/stories/StoriesController;->isCurrentlyUploading(Lcom/vk/stories/model/StoryEntry;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private deleteStory()V
    .locals 6

    .prologue
    .line 620
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    .line 621
    .local v0, "idx":I
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    .line 622
    .local v1, "se":Lcom/vk/stories/model/StoryEntry;
    if-eqz v1, :cond_0

    .line 623
    invoke-static {v1}, Lcom/vk/stories/StoriesController;->isCurrentlyUploading(Lcom/vk/stories/model/StoryEntry;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 624
    invoke-static {v1}, Lcom/vk/stories/StoriesController;->cancelUpload(Lcom/vk/stories/model/StoryEntry;)V

    .line 625
    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->doDeleteCurrentStory(I)V

    .line 646
    :cond_0
    :goto_0
    return-void

    .line 627
    :cond_1
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->uiHandler:Landroid/os/Handler;

    invoke-static {p0, v1, v0}, Lcom/vk/stories/view/StoryView$$Lambda$15;->lambdaFactory$(Lcom/vk/stories/view/StoryView;Lcom/vk/stories/model/StoryEntry;I)Ljava/lang/Runnable;

    move-result-object v3

    const-wide/16 v4, 0x32

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private doDeleteCurrentStory(I)V
    .locals 3
    .param p1, "idx"    # I

    .prologue
    .line 650
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v1, v1, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 651
    :cond_0
    const/4 v0, 0x0

    .line 652
    .local v0, "indexDelta":I
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    if-eqz v1, :cond_1

    .line 653
    const/4 v1, -0x1

    iput v1, p0, Lcom/vk/stories/view/StoryView;->position:I

    .line 654
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->pause()V

    .line 655
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-interface {v1, v2}, Lcom/vk/stories/view/StoryView$StoryViewCallback;->deleteStory(Lcom/vk/stories/model/StoriesContainer;)V

    .line 666
    :cond_1
    :goto_0
    iget v1, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    .line 667
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->progressView:Lcom/vk/stories/view/StoryProgressView;

    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v2, v2, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/stories/view/StoryProgressView;->setSectionCount(I)V

    .line 668
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->progressView:Lcom/vk/stories/view/StoryProgressView;

    iget v2, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    invoke-virtual {v1, v2}, Lcom/vk/stories/view/StoryProgressView;->setCurrentSection(I)V

    .line 669
    const v1, 0x7f0806cc

    invoke-static {v1}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 670
    return-void

    .line 657
    .end local v0    # "indexDelta":I
    :cond_2
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v1, v1, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge p1, v1, :cond_3

    .line 658
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->onNextClick()V

    .line 659
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v1, v1, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 660
    const/4 v0, -0x1

    .restart local v0    # "indexDelta":I
    goto :goto_0

    .line 662
    .end local v0    # "indexDelta":I
    :cond_3
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->onPrevClick()V

    .line 663
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v1, v1, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 664
    const/4 v0, 0x0

    .restart local v0    # "indexDelta":I
    goto :goto_0
.end method

.method private getCurrentProgress()F
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 243
    iget-boolean v3, p0, Lcom/vk/stories/view/StoryView;->isCurrentStoryPhoto:Z

    if-eqz v3, :cond_1

    .line 244
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->elapsedTimeCounter:Lcom/vk/core/util/ElapsedTimeCounter;

    invoke-virtual {v2}, Lcom/vk/core/util/ElapsedTimeCounter;->elapsedTime()J

    move-result-wide v2

    long-to-float v2, v2

    const v3, 0x453b8000    # 3000.0f

    div-float/2addr v2, v3

    .line 251
    :cond_0
    :goto_0
    return v2

    .line 246
    :cond_1
    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v3}, Lcom/vk/core/view/SimpleVideoView;->getCurrentPosition()J

    move-result-wide v4

    long-to-float v0, v4

    .line 247
    .local v0, "currentPosition":F
    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v3}, Lcom/vk/core/view/SimpleVideoView;->getDuration()J

    move-result-wide v4

    long-to-float v1, v4

    .line 248
    .local v1, "videoDuration":F
    cmpl-float v3, v0, v2

    if-lez v3, :cond_0

    cmpl-float v3, v1, v2

    if-lez v3, :cond_0

    .line 249
    div-float v2, v0, v1

    goto :goto_0
.end method

.method private hideError()V
    .locals 2

    .prologue
    .line 309
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 314
    :cond_0
    :goto_0
    return-void

    .line 310
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 312
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressShowHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 313
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->hideErrorRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method private hideProgress()V
    .locals 2

    .prologue
    .line 293
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 298
    :cond_0
    :goto_0
    return-void

    .line 294
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 296
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressShowHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 297
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->hideProgressRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method private init()V
    .locals 7

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 403
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0300eb

    invoke-virtual {v2, v3, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 404
    const/high16 v2, -0x1000000

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->setBackgroundColor(I)V

    .line 405
    invoke-static {}, Lcom/vk/stories/view/StoryView$$Lambda$2;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 407
    const v2, 0x7f10035d

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->gestureHandler:Landroid/view/View;

    .line 408
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->gestureHandler:Landroid/view/View;

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->gestureTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 409
    const v2, 0x7f10035c

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->backGradient:Landroid/view/View;

    .line 410
    new-instance v2, Lcom/vk/core/widget/ViewShower;

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->backGradient:Landroid/view/View;

    invoke-direct {v2, v3}, Lcom/vk/core/widget/ViewShower;-><init>(Landroid/view/View;)V

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->backGradientShower:Lcom/vk/core/widget/ViewShower;

    .line 412
    const v2, 0x7f100192

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->loadingProgress:Landroid/widget/ProgressBar;

    .line 413
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->loadingProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, -0x1

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 415
    const v2, 0x7f10035e

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->errorView:Landroid/view/View;

    .line 416
    const v2, 0x7f100340

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->retryButton:Landroid/view/View;

    .line 417
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->retryButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$3;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 421
    const v2, 0x7f100360

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->storyBottom:Landroid/view/View;

    .line 422
    const v2, 0x7f100364

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    .line 423
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    const v3, 0x7f100366

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->viewsCountIcon:Landroid/view/View;

    .line 424
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    const v3, 0x7f100367

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->viewsCountText:Landroid/widget/TextView;

    .line 425
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    const v3, 0x7f100369

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadingView:Landroid/view/View;

    .line 426
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    const v3, 0x7f100365

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryViewersView:Landroid/view/View;

    .line 427
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    const v3, 0x7f10036c

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadFailure:Landroid/view/View;

    .line 428
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadFailure:Landroid/view/View;

    const v3, 0x7f10036d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadRetryButton:Landroid/view/View;

    .line 429
    const v2, 0x7f10036a

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/view/StoryUploadProgressView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->uploadProgressView:Lcom/vk/stories/view/StoryUploadProgressView;

    .line 430
    const v2, 0x7f10036b

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->uploadText:Landroid/widget/TextView;

    .line 432
    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$4;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v1

    .line 437
    .local v1, "openViewersClickListener":Landroid/view/View$OnClickListener;
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->viewsCountIcon:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 438
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->viewsCountText:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadRetryButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$5;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 445
    const v2, 0x7f10035a

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/imageloader/view/VKImageView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    .line 447
    const v2, 0x7f10035b

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/core/view/SimpleVideoView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    .line 448
    iget-boolean v2, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v2, :cond_2

    .line 449
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->removeView(Landroid/view/View;)V

    .line 489
    :goto_0
    const v2, 0x7f10018f

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/view/StoryProgressView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->progressView:Lcom/vk/stories/view/StoryProgressView;

    .line 490
    const v2, 0x7f100190

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/imageloader/view/VKImageView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->avatarImageView:Lcom/vk/imageloader/view/VKImageView;

    .line 491
    const v2, 0x7f100191

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->nameView:Landroid/widget/TextView;

    .line 492
    const v2, 0x7f10035f

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->dateView:Landroid/widget/TextView;

    .line 494
    const v2, 0x7f100361

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->sendMessageView:Landroid/view/View;

    .line 495
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->sendMessageView:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$8;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 502
    const v2, 0x7f10015e

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$9;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 509
    const v2, 0x7f100362

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->shareButton:Landroid/view/View;

    .line 510
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->shareButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$10;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 516
    const v2, 0x7f100363

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->storyActions:Landroid/view/View;

    .line 517
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyActions:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$11;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 538
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryViewersView:Landroid/view/View;

    const v3, 0x7f100368

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/StoryView;->shareButtonMy:Landroid/view/View;

    .line 539
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->shareButtonMy:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$12;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 547
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->progressView:Lcom/vk/stories/view/StoryProgressView;

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v3, v3, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vk/stories/view/StoryProgressView;->setSectionCount(I)V

    .line 548
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->progressView:Lcom/vk/stories/view/StoryProgressView;

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v3}, Lcom/vk/stories/model/StoriesContainer;->getStartIndex()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vk/stories/view/StoryProgressView;->setCurrentSection(I)V

    .line 551
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->avatarImageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v3}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 552
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->nameView:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v3}, Lcom/vk/stories/model/StoriesContainer;->getAuthorFullName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 553
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->canComment()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->myStory()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 554
    :cond_0
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->sendMessageView:Landroid/view/View;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 556
    :cond_1
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->myStory()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 557
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 558
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyBottom:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 560
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    const v3, 0x7f10036e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$13;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 587
    :goto_1
    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$14;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    .line 611
    .local v0, "openProfileListener":Landroid/view/View$OnClickListener;
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->avatarImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2, v0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 612
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->nameView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 613
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->dateView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 616
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->getStartIndex()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/vk/stories/view/StoryView;->openStory(I)V

    .line 617
    return-void

    .line 451
    .end local v0    # "openProfileListener":Landroid/view/View$OnClickListener;
    :cond_2
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v2, v5}, Lcom/vk/core/view/SimpleVideoView;->setFitVideo(Z)V

    .line 452
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v2, v5}, Lcom/vk/core/view/SimpleVideoView;->setLoop(Z)V

    .line 453
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    const/16 v3, 0x3e8

    invoke-virtual {v2, v3}, Lcom/vk/core/view/SimpleVideoView;->setBufferForPlaybackMs(I)V

    .line 454
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$6;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/view/SimpleVideoView$OnEndListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/core/view/SimpleVideoView;->setOnEndListener(Lcom/vk/core/view/SimpleVideoView$OnEndListener;)V

    .line 458
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$7;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/core/view/SimpleVideoView;->setOnFirstFrameRenderedListener(Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;)V

    .line 462
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    new-instance v3, Lcom/vk/stories/view/StoryView$8;

    invoke-direct {v3, p0}, Lcom/vk/stories/view/StoryView$8;-><init>(Lcom/vk/stories/view/StoryView;)V

    invoke-virtual {v2, v3}, Lcom/vk/core/view/SimpleVideoView;->setOnErrorListener(Lcom/vk/core/view/SimpleVideoView$OnErrorListener;)V

    .line 472
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    new-instance v3, Lcom/vk/stories/view/StoryView$9;

    invoke-direct {v3, p0}, Lcom/vk/stories/view/StoryView$9;-><init>(Lcom/vk/stories/view/StoryView;)V

    invoke-virtual {v2, v3}, Lcom/vk/core/view/SimpleVideoView;->setOnBufferingEventsListener(Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;)V

    goto/16 :goto_0

    .line 583
    :cond_3
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 584
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyBottom:Landroid/view/View;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method static synthetic lambda$init$1(Landroid/view/View;)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 405
    return-void
.end method

.method private onNextClick()V
    .locals 2

    .prologue
    .line 815
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v0

    if-nez v0, :cond_1

    .line 827
    :cond_0
    :goto_0
    return-void

    .line 818
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->sourceType:Lcom/vk/stories/StoriesController$SourceType;

    invoke-static {v0, v1}, Lcom/vk/stories/StoriesController;->markAsSeen(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/StoriesController$SourceType;)V

    .line 819
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v1, v1, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_2

    .line 820
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    if-eqz v0, :cond_0

    .line 821
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryView$StoryViewCallback;->nextStory()V

    goto :goto_0

    .line 824
    :cond_2
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->openStory(I)V

    .line 825
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->startProgressUpdates(Z)V

    goto :goto_0
.end method

.method private onPrevClick()V
    .locals 2

    .prologue
    .line 830
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v0

    if-nez v0, :cond_1

    .line 842
    :cond_0
    :goto_0
    return-void

    .line 833
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->sourceType:Lcom/vk/stories/StoriesController$SourceType;

    invoke-static {v0, v1}, Lcom/vk/stories/StoriesController;->markAsSeen(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/StoriesController$SourceType;)V

    .line 834
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    if-nez v0, :cond_2

    .line 835
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    if-eqz v0, :cond_0

    .line 836
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryView$StoryViewCallback;->prevStory()V

    goto :goto_0

    .line 839
    :cond_2
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->openStory(I)V

    .line 840
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->startProgressUpdates(Z)V

    goto :goto_0
.end method

.method private openStory(I)V
    .locals 13
    .param p1, "index"    # I

    .prologue
    const/4 v12, 0x0

    const/16 v8, 0x8

    const/4 v7, 0x0

    .line 673
    iget-boolean v6, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-eqz v6, :cond_1

    .line 812
    :cond_0
    :goto_0
    return-void

    .line 676
    :cond_1
    if-ltz p1, :cond_0

    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v6, v6, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge p1, v6, :cond_0

    .line 680
    const/4 v2, 0x0

    .line 682
    .local v2, "isBrokenEntry":Z
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v6, v6, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoryEntry;

    .line 683
    .local v1, "entry":Lcom/vk/stories/model/StoryEntry;
    iput-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    .line 684
    iput p1, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    .line 685
    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->isPhotoStory()Z

    move-result v6

    iput-boolean v6, p0, Lcom/vk/stories/view/StoryView;->isCurrentStoryPhoto:Z

    .line 688
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->dateView:Landroid/widget/TextView;

    iget-wide v10, v1, Lcom/vk/stories/model/StoryEntry;->date:J

    long-to-int v9, v10

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 689
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->progressView:Lcom/vk/stories/view/StoryProgressView;

    invoke-virtual {v6, p1}, Lcom/vk/stories/view/StoryProgressView;->setCurrentSection(I)V

    .line 692
    invoke-virtual {v1, v7}, Lcom/vk/stories/model/StoryEntry;->getImageSmall(Z)Ljava/lang/String;

    move-result-object v3

    .line 693
    .local v3, "smallUrl":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->getImageBig()Ljava/lang/String;

    move-result-object v0

    .line 695
    .local v0, "bigUrl":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_4

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 696
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v6, v12}, Lcom/vk/imageloader/view/VKImageView;->setOnLoadCallback(Lcom/vk/imageloader/OnLoadCallback;)V

    .line 697
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    sget-object v9, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->INSTANCE_5:Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;

    invoke-virtual {v6, v9}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 698
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    sget-object v9, Lcom/vk/stories/view/StoryView;->STORY_IMAGE_SIZE:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v6, v3, v9}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 735
    :goto_1
    iget-boolean v6, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-nez v6, :cond_2

    .line 736
    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->isPhotoStory()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 737
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v6, v8}, Lcom/vk/core/view/SimpleVideoView;->setVisibility(I)V

    .line 738
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v6}, Lcom/vk/core/view/SimpleVideoView;->releasePlayer()V

    .line 766
    :cond_2
    :goto_2
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v6}, Lcom/vk/stories/model/StoryEntry;->isMyStory()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 767
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-static {v6}, Lcom/vk/stories/StoriesController;->getUploadState(Lcom/vk/stories/model/StoryEntry;)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v4

    .line 768
    .local v4, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    if-eqz v4, :cond_d

    .line 769
    invoke-virtual {v4}, Lcom/vk/stories/StoriesController$StoryUpload;->uploadFailed()Z

    move-result v6

    if-eqz v6, :cond_b

    .line 770
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadFailure:Landroid/view/View;

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 771
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadingView:Landroid/view/View;

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 772
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    const v9, -0xcccccd

    invoke-virtual {v6, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 784
    :goto_3
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryViewersView:Landroid/view/View;

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 793
    .end local v4    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_3
    :goto_4
    iget-object v9, p0, Lcom/vk/stories/view/StoryView;->shareButtonMy:Landroid/view/View;

    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-boolean v6, v6, Lcom/vk/stories/model/StoryEntry;->canShare:Z

    if-eqz v6, :cond_e

    move v6, v7

    :goto_5
    invoke-virtual {v9, v6}, Landroid/view/View;->setVisibility(I)V

    .line 794
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->shareButton:Landroid/view/View;

    iget-object v9, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-boolean v9, v9, Lcom/vk/stories/model/StoryEntry;->canShare:Z

    if-eqz v9, :cond_f

    :goto_6
    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 797
    iget-boolean v6, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-nez v6, :cond_0

    .line 798
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->resetProgress()V

    .line 799
    const/4 v6, 0x1

    invoke-direct {p0, v6}, Lcom/vk/stories/view/StoryView;->startProgressUpdates(Z)V

    .line 800
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->preloadNextStories()V

    .line 802
    if-eqz v2, :cond_10

    .line 803
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->showError()V

    .line 804
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-object v7, p0, Lcom/vk/stories/view/StoryView;->sourceType:Lcom/vk/stories/StoriesController$SourceType;

    invoke-static {v6, v7}, Lcom/vk/stories/StoriesController;->markAsSeen(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/StoriesController$SourceType;)V

    goto/16 :goto_0

    .line 700
    :cond_4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 701
    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->isPhotoStory()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 702
    iput-boolean v7, p0, Lcom/vk/stories/view/StoryView;->photoLoaded:Z

    .line 703
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    new-instance v9, Lcom/vk/stories/view/StoryView$12;

    invoke-direct {v9, p0}, Lcom/vk/stories/view/StoryView$12;-><init>(Lcom/vk/stories/view/StoryView;)V

    invoke-virtual {v6, v9}, Lcom/vk/imageloader/view/VKImageView;->setOnLoadCallback(Lcom/vk/imageloader/OnLoadCallback;)V

    .line 723
    :goto_7
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 724
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    sget-object v9, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->INSTANCE_5:Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;

    invoke-virtual {v6, v9, v12}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 725
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    sget-object v10, Lcom/vk/stories/view/StoryView;->STORY_IMAGE_SIZE:Lcom/vk/imageloader/ImageSize;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    sget-object v12, Lcom/vk/stories/view/StoryView;->STORY_IMAGE_SIZE:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v6, v9, v10, v11, v12}, Lcom/vk/imageloader/view/VKImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    goto/16 :goto_1

    .line 720
    :cond_5
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v6, v12}, Lcom/vk/imageloader/view/VKImageView;->setOnLoadCallback(Lcom/vk/imageloader/OnLoadCallback;)V

    goto :goto_7

    .line 727
    :cond_6
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v6, v12}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 728
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    sget-object v9, Lcom/vk/stories/view/StoryView;->STORY_IMAGE_SIZE:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v6, v0, v9}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    goto/16 :goto_1

    .line 731
    :cond_7
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v6}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto/16 :goto_1

    .line 740
    :cond_8
    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->getVideoUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 741
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v6, v8}, Lcom/vk/core/view/SimpleVideoView;->setVisibility(I)V

    .line 742
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v6}, Lcom/vk/core/view/SimpleVideoView;->releasePlayer()V

    .line 743
    iget-boolean v6, v1, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-nez v6, :cond_2

    .line 744
    const/4 v2, 0x1

    goto/16 :goto_2

    .line 747
    :cond_9
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v6, v7}, Lcom/vk/core/view/SimpleVideoView;->setVisibility(I)V

    .line 748
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    const/4 v9, 0x0

    invoke-virtual {v6, v9}, Lcom/vk/core/view/SimpleVideoView;->setAlpha(F)V

    .line 749
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v6}, Lcom/vk/core/view/SimpleVideoView;->stop()V

    .line 751
    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->localVideoPath()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 752
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->getVideoUrl()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/vk/core/view/SimpleVideoView;->setVideoUri(Landroid/net/Uri;)V

    goto/16 :goto_2

    .line 754
    :cond_a
    move-object v5, v1

    .line 755
    .local v5, "tmpStory":Lcom/vk/stories/model/StoryEntry;
    invoke-static {p0, v5}, Lcom/vk/stories/view/StoryView$$Lambda$16;->lambdaFactory$(Lcom/vk/stories/view/StoryView;Lcom/vk/stories/model/StoryEntry;)Lcom/vk/stories/StoryVideoCache$UrlCallback;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/vk/stories/StoryVideoCache;->getVideoUrl(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/StoryVideoCache$UrlCallback;)V

    goto/16 :goto_2

    .line 774
    .end local v5    # "tmpStory":Lcom/vk/stories/model/StoryEntry;
    .restart local v4    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_b
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->uploadProgressView:Lcom/vk/stories/view/StoryUploadProgressView;

    invoke-virtual {v4}, Lcom/vk/stories/StoriesController$StoryUpload;->storyUploadProgress()F

    move-result v9

    invoke-virtual {v6, v9}, Lcom/vk/stories/view/StoryUploadProgressView;->setProgress(F)V

    .line 775
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v6}, Lcom/vk/stories/model/StoryEntry;->isPhotoStory()Z

    move-result v6

    if-eqz v6, :cond_c

    .line 776
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->uploadText:Landroid/widget/TextView;

    const v9, 0x7f0806d8

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(I)V

    .line 780
    :goto_8
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadFailure:Landroid/view/View;

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 781
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadingView:Landroid/view/View;

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 782
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundColor(I)V

    goto/16 :goto_3

    .line 778
    :cond_c
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->uploadText:Landroid/widget/TextView;

    const v9, 0x7f0806d9

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(I)V

    goto :goto_8

    .line 786
    :cond_d
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryBottom:Landroid/view/View;

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundColor(I)V

    .line 787
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadingView:Landroid/view/View;

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 788
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryUploadFailure:Landroid/view/View;

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 789
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->myStoryViewersView:Landroid/view/View;

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 790
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->viewsCountText:Landroid/widget/TextView;

    iget-object v9, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget v9, v9, Lcom/vk/stories/model/StoryEntry;->viewsCount:I

    invoke-static {v9}, Lcom/vk/stories/util/StoriesUtil;->getCounterText(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .end local v4    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_e
    move v6, v8

    .line 793
    goto/16 :goto_5

    :cond_f
    move v7, v8

    .line 794
    goto/16 :goto_6

    .line 805
    :cond_10
    iget-object v6, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-boolean v6, v6, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-nez v6, :cond_11

    .line 806
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->hideError()V

    .line 807
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->showProgress()V

    goto/16 :goto_0

    .line 809
    :cond_11
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->hideError()V

    goto/16 :goto_0
.end method

.method private preloadNextStories()V
    .locals 5

    .prologue
    .line 845
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v3

    if-nez v3, :cond_1

    .line 864
    :cond_0
    return-void

    .line 849
    :cond_1
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/4 v3, 0x3

    if-gt v0, v3, :cond_0

    .line 850
    iget v3, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    add-int v1, v3, v0

    .line 851
    .local v1, "idx":I
    if-ltz v1, :cond_3

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v3, v3, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 852
    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    iget-object v3, v3, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/model/StoryEntry;

    .line 855
    .local v2, "se":Lcom/vk/stories/model/StoryEntry;
    invoke-virtual {v2}, Lcom/vk/stories/model/StoryEntry;->getImageBig()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 856
    invoke-virtual {v2}, Lcom/vk/stories/model/StoryEntry;->getImageBig()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Lcom/vk/stories/view/StoryView;->STORY_IMAGE_SIZE:Lcom/vk/imageloader/ImageSize;

    invoke-static {v3, v4}, Lcom/vk/imageloader/VKImageLoader;->prefetchToMemory(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    .line 859
    :cond_2
    iget-boolean v3, v2, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-nez v3, :cond_3

    invoke-virtual {v2}, Lcom/vk/stories/model/StoryEntry;->isVideoStory()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Lcom/vk/stories/model/StoryEntry;->getVideoUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 860
    invoke-static {v2}, Lcom/vk/stories/StoryVideoCache;->prefetchVideo(Lcom/vk/stories/model/StoryEntry;)V

    .line 849
    .end local v2    # "se":Lcom/vk/stories/model/StoryEntry;
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private showDialog(Landroid/app/Dialog;)V
    .locals 1
    .param p1, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 867
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 868
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 870
    :cond_0
    iput-object p1, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    .line 871
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 872
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->pause()V

    .line 873
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 874
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->hideProgress()V

    .line 875
    return-void
.end method

.method private showError()V
    .locals 4

    .prologue
    .line 301
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 306
    :cond_0
    :goto_0
    return-void

    .line 302
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 304
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressShowHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 305
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressShowHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->showErrorRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private showProgress()V
    .locals 4

    .prologue
    .line 285
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 290
    :cond_0
    :goto_0
    return-void

    .line 286
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 288
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressShowHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 289
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressShowHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->showProgressRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x2bc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private startProgressUpdates(Z)V
    .locals 4
    .param p1, "withDelay"    # Z

    .prologue
    .line 267
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 268
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 270
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->canStartProgressUpdates()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 272
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->progressHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->startProgressUpdatesRunnable:Ljava/lang/Runnable;

    if-eqz p1, :cond_2

    const-wide/16 v0, 0x12c

    :goto_1
    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_2
    const-wide/16 v0, 0x0

    goto :goto_1
.end method

.method private stopProgressUpdates()V
    .locals 2

    .prologue
    .line 277
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 282
    :cond_0
    :goto_0
    return-void

    .line 278
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 280
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 281
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->stopProgressUpdatesRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    .line 364
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 372
    :cond_0
    :goto_0
    return-void

    .line 365
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 366
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    .line 368
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->stopProgressUpdates()V

    .line 369
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->setPlayWhenReady(Z)V

    .line 370
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v0}, Lcom/vk/core/view/SimpleVideoView;->releasePlayer()V

    .line 371
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public externalNextClick()V
    .locals 1

    .prologue
    .line 375
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 381
    :cond_0
    :goto_0
    return-void

    .line 376
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 378
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 379
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->onNextClick()V

    goto :goto_0
.end method

.method public externalPrevClick()V
    .locals 1

    .prologue
    .line 384
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 390
    :cond_0
    :goto_0
    return-void

    .line 385
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 387
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 388
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->onPrevClick()V

    goto :goto_0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 219
    iget v0, p0, Lcom/vk/stories/view/StoryView;->position:I

    return v0
.end method

.method public hideBackGradient()V
    .locals 2

    .prologue
    .line 399
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->backGradientShower:Lcom/vk/core/widget/ViewShower;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 400
    return-void
.end method

.method public isCurrentPage()Z
    .locals 2

    .prologue
    .line 215
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryView$StoryViewCallback;->getCurrentIdlePagerPosition()I

    move-result v0

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getPosition()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$deleteStory$18(Lcom/vk/stories/model/StoryEntry;I)V
    .locals 3
    .param p1, "se"    # Lcom/vk/stories/model/StoryEntry;
    .param p2, "idx"    # I

    .prologue
    .line 628
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0801b3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/widget/LoadingDialog;->getInstance(Landroid/content/Context;Ljava/lang/Integer;)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 629
    .local v0, "dialog":Landroid/app/Dialog;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 630
    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->showDialog(Landroid/app/Dialog;)V

    .line 631
    new-instance v1, Lcom/vk/stories/view/StoryView$11;

    invoke-direct {v1, p0, p2, v0}, Lcom/vk/stories/view/StoryView$11;-><init>(Lcom/vk/stories/view/StoryView;ILandroid/app/Dialog;)V

    invoke-static {p1, v1}, Lcom/vk/stories/StoriesController;->deleteStory(Lcom/vk/stories/model/StoryEntry;Lcom/vkontakte/android/api/Callback;)V

    .line 643
    return-void
.end method

.method synthetic lambda$init$12(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 518
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/AlertDialogs;->buildListActionDialog(Landroid/content/Context;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    move-result-object v0

    .line 519
    .local v0, "builder":Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    const v2, 0x7f08035a

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$20;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->action(ILjava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    .line 520
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-boolean v2, v2, Lcom/vk/stories/model/StoryEntry;->isPromo:Z

    if-nez v2, :cond_0

    .line 521
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget v1, v2, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    .line 522
    .local v1, "currentStoryId":I
    const v2, 0x7f080308

    invoke-static {p0, v1}, Lcom/vk/stories/view/StoryView$$Lambda$21;->lambdaFactory$(Lcom/vk/stories/view/StoryView;I)Ljava/lang/Runnable;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->action(ILjava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    .line 535
    .end local v1    # "currentStoryId":I
    :cond_0
    invoke-virtual {v0}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->show()Landroid/support/v7/app/AlertDialog;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/vk/stories/view/StoryView;->showDialog(Landroid/app/Dialog;)V

    .line 536
    return-void
.end method

.method synthetic lambda$init$13(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 540
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 544
    :cond_0
    :goto_0
    return-void

    .line 541
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    if-eqz v0, :cond_0

    .line 542
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorFirstName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-interface {v0, v1, v2, v3}, Lcom/vk/stories/view/StoryView$StoryViewCallback;->shareStory(Ljava/lang/String;Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)V

    goto :goto_0
.end method

.method synthetic lambda$init$16(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 562
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/AlertDialogs;->buildListActionDialog(Landroid/content/Context;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    move-result-object v0

    .line 563
    .local v0, "builder":Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    const v1, 0x7f08035a

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$17;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->action(ILjava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    .line 565
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-boolean v1, v1, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    .line 566
    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->getServerImageUrl()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->getServerVideoUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 567
    :cond_0
    const v1, 0x7f0805d9

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$18;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->action(ILjava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    .line 578
    :cond_1
    const v1, 0x7f0801ab

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$19;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->action(ILjava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    .line 580
    invoke-virtual {v0}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->show()Landroid/support/v7/app/AlertDialog;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vk/stories/view/StoryView;->showDialog(Landroid/app/Dialog;)V

    .line 581
    return-void
.end method

.method synthetic lambda$init$17(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 588
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-object v2, v2, Lcom/vk/stories/model/StoryEntry;->openUrl:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 589
    new-instance v2, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-object v3, v3, Lcom/vk/stories/model/StoryEntry;->openUrl:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;-><init>(Ljava/lang/String;)V

    .line 590
    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->openInternally()Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v2

    const v3, 0x7f0b0193

    .line 591
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->setTheme(I)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v2

    .line 592
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 610
    :cond_0
    :goto_0
    return-void

    .line 593
    :cond_1
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->isPromo()Z

    move-result v2

    if-nez v2, :cond_0

    .line 594
    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v1

    .line 598
    .local v1, "uid":I
    if-lez v1, :cond_2

    .line 599
    const-string/jumbo v2, "open_user"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 600
    .local v0, "eventBuilder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    const-string/jumbo v2, "user_ids"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 605
    :goto_1
    const-string/jumbo v2, "source"

    const-string/jumbo v3, "story"

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 606
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 608
    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-direct {v2, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 602
    .end local v0    # "eventBuilder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    :cond_2
    const-string/jumbo v2, "open_group"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 603
    .restart local v0    # "eventBuilder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    const-string/jumbo v2, "group_ids"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    neg-int v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    goto :goto_1
.end method

.method synthetic lambda$init$2(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 418
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->openStory(I)V

    .line 419
    return-void
.end method

.method synthetic lambda$init$3(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 433
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget v0, v0, Lcom/vk/stories/model/StoryEntry;->viewsCount:I

    if-lez v0, :cond_0

    .line 434
    new-instance v0, Lcom/vk/stories/StoryViewersFragment$Builder;

    invoke-direct {v0}, Lcom/vk/stories/StoryViewersFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v0, v1}, Lcom/vk/stories/StoryViewersFragment$Builder;->setStory(Lcom/vk/stories/model/StoryEntry;)Lcom/vk/stories/StoryViewersFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/StoryViewersFragment$Builder;->go(Landroid/content/Context;)Z

    .line 436
    :cond_0
    return-void
.end method

.method synthetic lambda$init$4(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 441
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-static {v0}, Lcom/vk/stories/StoriesController;->retryUpload(Lcom/vk/stories/model/StoryEntry;)V

    .line 442
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->openStory(I)V

    .line 443
    return-void
.end method

.method synthetic lambda$init$5(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 0
    .param p1, "mediaPlayer"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 455
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->stopProgressUpdates()V

    .line 456
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->onNextClick()V

    .line 457
    return-void
.end method

.method synthetic lambda$init$6(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 459
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->setAlpha(F)V

    .line 460
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->startProgressUpdates(Z)V

    .line 461
    return-void
.end method

.method synthetic lambda$init$7(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 496
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 500
    :cond_0
    :goto_0
    return-void

    .line 497
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    if-eqz v0, :cond_0

    .line 498
    new-instance v0, Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v2

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/stories/dialog/StorySendMessageDialog;-><init>(Landroid/content/Context;ILcom/vk/stories/model/StoryEntry;)V

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->showDialog(Landroid/app/Dialog;)V

    goto :goto_0
.end method

.method synthetic lambda$init$8(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 503
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 507
    :cond_0
    :goto_0
    return-void

    .line 504
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    if-eqz v0, :cond_0

    .line 505
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    invoke-interface {v0}, Lcom/vk/stories/view/StoryView$StoryViewCallback;->finish()V

    goto :goto_0
.end method

.method synthetic lambda$init$9(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 511
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 515
    :cond_0
    :goto_0
    return-void

    .line 512
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    if-eqz v0, :cond_0

    .line 513
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->callback:Lcom/vk/stories/view/StoryView$StoryViewCallback;

    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorFirstName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/stories/view/StoryView;->storyContainer:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-interface {v0, v1, v2, v3}, Lcom/vk/stories/view/StoryView$StoryViewCallback;->shareStory(Ljava/lang/String;Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)V

    goto :goto_0
.end method

.method synthetic lambda$null$10()V
    .locals 4

    .prologue
    .line 519
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/vk/stories/StorySettingsActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$null$11(I)V
    .locals 2
    .param p1, "currentStoryId"    # I

    .prologue
    .line 522
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/view/StoryView$10;

    invoke-direct {v1, p0, p1}, Lcom/vk/stories/view/StoryView$10;-><init>(Lcom/vk/stories/view/StoryView;I)V

    invoke-static {p1, v0, v1}, Lcom/vk/stories/StoriesController;->banUser(ILandroid/content/Context;Lcom/vkontakte/android/api/Callback;)V

    return-void
.end method

.method synthetic lambda$null$14()V
    .locals 4

    .prologue
    .line 563
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/vk/stories/StorySettingsActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$null$15()V
    .locals 3

    .prologue
    .line 569
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->isPhotoStory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 570
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->getServerImageUrl()Ljava/lang/String;

    move-result-object v0

    .line 574
    .local v0, "downloadUrl":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Lcom/vk/core/util/DownloadUtils;->downloadFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    return-void

    .line 572
    .end local v0    # "downloadUrl":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoryEntry;->getServerVideoUrl()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "downloadUrl":Ljava/lang/String;
    goto :goto_0
.end method

.method synthetic lambda$onAttachedToWindow$0()V
    .locals 1

    .prologue
    .line 211
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->startProgressUpdates(Z)V

    return-void
.end method

.method synthetic lambda$openStory$19(Lcom/vk/stories/model/StoryEntry;Ljava/lang/String;)V
    .locals 2
    .param p1, "tmpStory"    # Lcom/vk/stories/model/StoryEntry;
    .param p2, "link"    # Ljava/lang/String;

    .prologue
    .line 756
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    if-ne v0, p1, :cond_0

    .line 757
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->setVideoUri(Landroid/net/Uri;)V

    .line 759
    :cond_0
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .prologue
    .line 209
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 210
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_0

    .line 212
    :goto_0
    return-void

    .line 211
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressHandler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vk/stories/view/StoryView$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/view/StoryView;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    .line 879
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    .line 880
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->play()V

    .line 881
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 340
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 346
    :cond_0
    :goto_0
    return-void

    .line 341
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 343
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isActivityPaused:Z

    .line 344
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->setPlayWhenReady(Z)V

    .line 345
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->stopProgressUpdates()V

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 326
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 337
    :cond_0
    :goto_0
    return-void

    .line 327
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 329
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isActivityPaused:Z

    .line 330
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    if-nez v0, :cond_2

    .line 331
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->setPlayWhenReady(Z)V

    .line 332
    invoke-direct {p0, v1}, Lcom/vk/stories/view/StoryView;->startProgressUpdates(Z)V

    .line 334
    :cond_2
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    instance-of v0, v0, Lcom/vk/stories/dialog/StorySendMessageDialog;

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentDialog:Landroid/app/Dialog;

    check-cast v0, Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-virtual {v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->openKeyboard()V

    goto :goto_0
.end method

.method public pause()V
    .locals 2

    .prologue
    .line 356
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 361
    :cond_0
    :goto_0
    return-void

    .line 357
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->setPlayWhenReady(Z)V

    .line 360
    invoke-direct {p0}, Lcom/vk/stories/view/StoryView;->stopProgressUpdates()V

    goto :goto_0
.end method

.method public play()V
    .locals 1

    .prologue
    .line 349
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 353
    :cond_0
    :goto_0
    return-void

    .line 350
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 352
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->startProgressUpdates(Z)V

    goto :goto_0
.end method

.method public resetProgress()V
    .locals 4

    .prologue
    .line 317
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->stubInstance:Z

    if-eqz v0, :cond_1

    .line 323
    :cond_0
    :goto_0
    return-void

    .line 318
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryView;->isDestroyed:Z

    if-nez v0, :cond_0

    .line 320
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->elapsedTimeCounter:Lcom/vk/core/util/ElapsedTimeCounter;

    invoke-virtual {v0}, Lcom/vk/core/util/ElapsedTimeCounter;->reset()V

    .line 321
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->videoView:Lcom/vk/core/view/SimpleVideoView;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/vk/core/view/SimpleVideoView;->seekTo(J)V

    .line 322
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->progressView:Lcom/vk/stories/view/StoryProgressView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/StoryProgressView;->setProgress(F)V

    goto :goto_0
.end method

.method public setUploadDone(Lcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 2
    .param p1, "storyUpload"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-boolean v0, v0, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget v0, v0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->localId()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->resultStory()Lcom/vk/stories/model/StoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->fullFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/model/StoryEntry;->setFullFile(Ljava/io/File;)V

    .line 231
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->resultStory()Lcom/vk/stories/model/StoryEntry;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/model/StoryEntry;->setStory(Lcom/vk/stories/model/StoryEntry;)V

    .line 232
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->openStory(I)V

    .line 234
    :cond_0
    return-void
.end method

.method public setUploadFailed(Lcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 2
    .param p1, "storyUpload"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-boolean v0, v0, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget v0, v0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->localId()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 238
    iget v0, p0, Lcom/vk/stories/view/StoryView;->currentIndex:I

    invoke-direct {p0, v0}, Lcom/vk/stories/view/StoryView;->openStory(I)V

    .line 240
    :cond_0
    return-void
.end method

.method public setUploadProgress(Lcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 2
    .param p1, "storyUpload"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 223
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget-boolean v0, v0, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->currentStory:Lcom/vk/stories/model/StoryEntry;

    iget v0, v0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->localId()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 224
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->uploadProgressView:Lcom/vk/stories/view/StoryUploadProgressView;

    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->storyUploadProgress()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/StoryUploadProgressView;->setProgress(F)V

    .line 226
    :cond_0
    return-void
.end method

.method public showBackGradient()V
    .locals 1

    .prologue
    .line 393
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 394
    iget-object v0, p0, Lcom/vk/stories/view/StoryView;->backGradientShower:Lcom/vk/core/widget/ViewShower;

    invoke-virtual {v0}, Lcom/vk/core/widget/ViewShower;->show()V

    .line 396
    :cond_0
    return-void
.end method
