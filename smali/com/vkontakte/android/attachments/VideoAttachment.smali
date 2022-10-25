.class public Lcom/vkontakte/android/attachments/VideoAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "VideoAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ThumbAttachment;
.implements Lcom/vkontakte/android/attachments/ImageAttachment;
.implements Lcom/vkontakte/android/media/AutoPlay;
.implements Lcom/vkontakte/android/media/VideoPools$PlayerContext;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;,
        Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/VideoAttachment;",
            ">;"
        }
    .end annotation
.end field

.field public static final HOLDER_TYPE_ADS:Ljava/lang/String; = "video_ads"

.field public static final HOLDER_TYPE_SINGLE:Ljava/lang/String; = "video_single"

.field public static final HOLDER_TYPE_VIDEO:Ljava/lang/String; = "video"

.field private static final PLAY_DELAY:J = 0xfaL


# instance fields
.field private autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

.field transient autoplay:Z

.field private context:Ljava/lang/String;

.field hasPlayer:Z

.field private holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

.field transient isSingle:Z

.field private layoutTag:Ljava/lang/String;

.field final lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

.field mActivityOnPause:Z

.field private final mAutoPlay:Z

.field mBuffering:Z

.field mFailed:Z

.field mPlaybackCompleted:Z

.field mPlaying:Z

.field mPrepared:Z

.field volatile mQuality:I

.field private mTask:Lcom/vkontakte/android/background/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/background/AsyncTask",
            "<***>;"
        }
    .end annotation
.end field

.field private mTracker:Lcom/vkontakte/android/media/VideoTracker;

.field private mWasAutoPlay:Z

.field private player:Lcom/vkontakte/android/media/AbsVideoPlayer;

.field private postId:I

.field public transient postInteract:Lcom/vkontakte/android/data/PostInteract;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private postOwnerId:I

.field public referer:Ljava/lang/String;

.field private shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

.field transient statistic:Lcom/vkontakte/android/statistics/Statistic;

.field final useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final video:Lcom/vkontakte/android/api/VideoFile;

.field transient wasPlayed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1176
    new-instance v0, Lcom/vkontakte/android/attachments/VideoAttachment$2;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$2;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/VideoAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 2
    .param p1, "vf"    # Lcom/vkontakte/android/api/VideoFile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 66
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    .line 68
    invoke-static {}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->CreateLayoutParamsForZhukovsLayout()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    invoke-static {}, Lcom/vkontakte/android/cache/Videos;->allowAutoPlayVideo()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mAutoPlay:Z

    .line 90
    const-string/jumbo v0, "video_single"

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->layoutTag:Ljava/lang/String;

    .line 103
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 104
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->checkAutoPlay()V

    .line 105
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 107
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 66
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    .line 68
    invoke-static {}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->CreateLayoutParamsForZhukovsLayout()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    invoke-static {}, Lcom/vkontakte/android/cache/Videos;->allowAutoPlayVideo()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mAutoPlay:Z

    .line 90
    const-string/jumbo v0, "video_single"

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->layoutTag:Ljava/lang/String;

    .line 108
    const-class v0, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 109
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->referer:Ljava/lang/String;

    .line 110
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->checkAutoPlay()V

    .line 111
    return-void
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/attachments/VideoAttachment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment;

    .prologue
    .line 58
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mWasAutoPlay:Z

    return v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/attachments/VideoAttachment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment;

    .prologue
    .line 58
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mAutoPlay:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AbsVideoPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/attachments/VideoAttachment;Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment;
    .param p1, "x1"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->replay(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    return-object v0
.end method

.method private checkAutoPlay()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 114
    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VideoFile;->isHLSSupported()Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    move v0, v1

    .line 115
    .local v0, "hasLink":Z
    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->isSingle:Z

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v3, v3, Lcom/vkontakte/android/api/VideoFile;->noAutoplay:Z

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VideoFile;->isFlv()Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v3

    if-nez v3, :cond_2

    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoplay:Z

    .line 116
    return-void

    .end local v0    # "hasLink":Z
    :cond_1
    move v0, v2

    .line 114
    goto :goto_0

    .restart local v0    # "hasLink":Z
    :cond_2
    move v1, v2

    .line 115
    goto :goto_1
.end method

.method private static getDurationString(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;I)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "width"    # I

    .prologue
    .line 384
    const/high16 v3, 0x42c80000    # 100.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    if-lt p2, v3, :cond_1

    const/4 v1, 0x1

    .line 385
    .local v1, "fullWidth":Z
    :goto_0
    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->platform:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    if-eqz v1, :cond_2

    iget-object v2, p1, Lcom/vkontakte/android/api/VideoFile;->platform:Ljava/lang/String;

    .line 386
    .local v2, "platform":Ljava/lang/String;
    :goto_1
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 387
    const v3, 0x7f08075c

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 394
    :cond_0
    :goto_2
    return-object v0

    .line 384
    .end local v1    # "fullWidth":Z
    .end local v2    # "platform":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 385
    .restart local v1    # "fullWidth":Z
    :cond_2
    const-string/jumbo v2, ""

    goto :goto_1

    .line 388
    .restart local v2    # "platform":Ljava/lang/String;
    :cond_3
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 389
    const v3, 0x7f0807f3

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 390
    :cond_4
    iget v3, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    if-lez v3, :cond_5

    .line 391
    iget v3, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    invoke-static {v3}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v0

    .line 392
    .local v0, "durationString":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " \u00b7 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .end local v0    # "durationString":Ljava/lang/String;
    :cond_5
    move-object v0, v2

    .line 394
    goto :goto_2
.end method

.method private isAttached()Z
    .locals 1

    .prologue
    .line 694
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$1100(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private replay(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 751
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->replay(I)V

    .line 752
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->seek(I)V

    .line 753
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->play(Z)V

    .line 754
    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    .line 755
    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    .line 756
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v0, :cond_0

    .line 757
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->reset()V

    .line 759
    :cond_0
    return-void
.end method

.method private stopInternal()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 287
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->stopAndReleasePlayer()V

    .line 288
    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mFailed:Z

    .line 289
    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    .line 290
    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mActivityOnPause:Z

    .line 291
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 489
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v1, :cond_1

    .line 490
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoplay:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mAutoPlay:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VideoFile;->isExternal()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->platform:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 491
    .local v0, "scale":Z
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$500(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    if-eqz v0, :cond_3

    sget-object v2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    :goto_1
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 493
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$500(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 495
    .end local v0    # "scale":Z
    :cond_1
    return-void

    .line 490
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 491
    .restart local v0    # "scale":Z
    :cond_3
    sget-object v2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    goto :goto_1
.end method

.method public canAutoPlay()Z
    .locals 1

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoplay:Z

    return v0
.end method

.method public detachSurface()V
    .locals 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    .line 163
    :cond_0
    return-void
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 301
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getHeight()I
    .locals 1

    .prologue
    .line 457
    const/16 v0, 0xe10

    return v0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 477
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoplay:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mAutoPlay:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 478
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VideoFile;->getFirstFrame()Ljava/lang/String;

    move-result-object v0

    .line 479
    .local v0, "firstFrame":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 483
    .end local v0    # "firstFrame":Ljava/lang/String;
    :goto_0
    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v1, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPercentageOnScreen()F
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 277
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v1

    if-nez v1, :cond_1

    .line 282
    :cond_0
    :goto_0
    return v0

    .line 279
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_0

    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getPercentageOnScreen()F

    move-result v0

    goto :goto_0
.end method

.method public final getRatio()F
    .locals 1

    .prologue
    .line 434
    const v0, 0x3fe38e39

    return v0
.end method

.method public getScreenCenterDistance()I
    .locals 2

    .prologue
    const/4 v0, -0x1

    .line 266
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v1

    if-nez v1, :cond_1

    .line 271
    :cond_0
    :goto_0
    return v0

    .line 268
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_0

    .line 269
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getScreenCenterDistance()I

    move-result v0

    goto :goto_0
.end method

.method public final getThumbURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 462
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Lcom/vkontakte/android/media/AutoPlay$Type;
    .locals 1

    .prologue
    .line 155
    sget-object v0, Lcom/vkontakte/android/media/AutoPlay$Type;->VIDEO:Lcom/vkontakte/android/media/AutoPlay$Type;

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 306
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-nez v0, :cond_4

    .line 307
    new-instance v0, Lcom/vkontakte/android/media/VideoTracker;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->statistic:Lcom/vkontakte/android/statistics/Statistic;

    iget v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->postId:I

    iget v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->postOwnerId:I

    iget-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->referer:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mWasAutoPlay:Z

    iget-object v7, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->context:Ljava/lang/String;

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/media/VideoTracker;-><init>(Lcom/vkontakte/android/api/VideoFile;Lcom/vkontakte/android/statistics/Statistic;IILjava/lang/String;ZLjava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    .line 314
    :goto_0
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->isSingle:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->layoutTag:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v12

    .line 316
    .local v12, "vav":Landroid/view/View;
    :goto_1
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_7

    .line 317
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .line 332
    :goto_2
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$200(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$200(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_0
    const/4 v8, 0x1

    .line 334
    .local v8, "isNewsScreen":Z
    :goto_3
    if-eqz v8, :cond_a

    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoplay:Z

    if-eqz v0, :cond_a

    .line 335
    const/4 v0, 0x0

    invoke-virtual {v12, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 340
    :goto_4
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->isSingle:Z

    if-eqz v0, :cond_e

    .line 341
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->getTitle()Ljava/lang/CharSequence;

    move-result-object v11

    .line 342
    .local v11, "usedTitle":Ljava/lang/CharSequence;
    :goto_5
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$300(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$300(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/16 v0, 0x8

    :goto_6
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 344
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$300(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 345
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$300(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-virtual {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$400(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->views:I

    if-nez v0, :cond_d

    const/16 v0, 0x8

    :goto_7
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 347
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$400(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0060

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->views:I

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v6, v6, Lcom/vkontakte/android/api/VideoFile;->views:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$400(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 349
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->bind(Ljava/lang/Object;)V

    .line 373
    .end local v11    # "usedTitle":Ljava/lang/CharSequence;
    :cond_1
    :goto_8
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoplay:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mAutoPlay:Z

    if-nez v0, :cond_3

    .line 374
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$800(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    iget v2, v2, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    invoke-static {p1, v1, v2}, Lcom/vkontakte/android/attachments/VideoAttachment;->getDurationString(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 375
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$700(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$800(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x4

    :goto_9
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 376
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$700(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v0

    if-nez v0, :cond_13

    const v0, 0x7f0200c5

    :goto_a
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 380
    :cond_3
    return-object v12

    .line 308
    .end local v8    # "isNewsScreen":Z
    .end local v12    # "vav":Landroid/view/View;
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-nez v0, :cond_5

    .line 309
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->reset()V

    goto/16 :goto_0

    .line 311
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getPosition()I

    move-result v1

    div-int/lit16 v1, v1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VideoTracker;->reset(I)V

    goto/16 :goto_0

    .line 314
    :cond_6
    const-string/jumbo v0, "video"

    invoke-static {p1, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v12

    goto/16 :goto_1

    .line 319
    .restart local v12    # "vav":Landroid/view/View;
    :cond_7
    new-instance v0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v12, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;-><init>(Landroid/view/View;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .line 321
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$200(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Ljava/lang/Boolean;

    move-result-object v0

    if-nez v0, :cond_8

    .line 323
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/FragmentHelper;->findFragment(Landroid/app/Activity;)Landroid/app/Fragment;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$202(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 329
    :cond_8
    :goto_b
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-virtual {v12, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 324
    :catch_0
    move-exception v10

    .line 325
    .local v10, "t":Ljava/lang/Throwable;
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$202(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    goto :goto_b

    .line 332
    .end local v10    # "t":Ljava/lang/Throwable;
    :cond_9
    const/4 v8, 0x0

    goto/16 :goto_3

    .line 337
    .restart local v8    # "isNewsScreen":Z
    :cond_a
    invoke-virtual {v12, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_4

    .line 341
    :cond_b
    const-string/jumbo v11, ""

    goto/16 :goto_5

    .line 343
    .restart local v11    # "usedTitle":Ljava/lang/CharSequence;
    :cond_c
    const/4 v0, 0x0

    goto/16 :goto_6

    .line 346
    :cond_d
    const/4 v0, 0x0

    goto/16 :goto_7

    .line 351
    .end local v11    # "usedTitle":Ljava/lang/CharSequence;
    :cond_e
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$500(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    .line 352
    .local v9, "params":Landroid/view/ViewGroup$LayoutParams;
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    iget v0, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    iput v0, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 353
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    iget v0, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    iput v0, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 354
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$600(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 355
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    iget v0, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    const/high16 v1, 0x42c80000    # 100.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    if-lt v0, v1, :cond_f

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    iget v0, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    const/high16 v1, 0x42c80000    # 100.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 356
    :cond_f
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$700(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v0

    const/high16 v1, 0x40800000    # 4.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    const/high16 v2, 0x40400000    # 3.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 357
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$800(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 358
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$600(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 359
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    iget v0, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    const/high16 v1, 0x42480000    # 50.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    if-ge v0, v1, :cond_10

    .line 360
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$700(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_8

    .line 362
    :cond_10
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$700(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_8

    .line 365
    :cond_11
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$800(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x1

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 366
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$700(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v0

    const/high16 v1, 0x40800000    # 4.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 367
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$700(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 368
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$600(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_8

    .line 375
    .end local v9    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_12
    const/4 v0, 0x0

    goto/16 :goto_9

    .line 376
    :cond_13
    const v0, 0x7f02007b

    goto/16 :goto_a
.end method

.method public final getWidth()I
    .locals 1

    .prologue
    .line 452
    const/16 v0, 0x1900

    return v0
.end method

.method public final getWidth(C)I
    .locals 1
    .param p1, "size"    # C

    .prologue
    .line 467
    const/16 v0, 0x1900

    return v0
.end method

.method public isComplete()Z
    .locals 1

    .prologue
    .line 182
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    return v0
.end method

.method public isPrepared()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPrepared:Z

    return v0
.end method

.method synthetic lambda$null$5()V
    .locals 1

    .prologue
    .line 518
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    if-eqz v0, :cond_0

    .line 519
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showReplay()V

    .line 521
    :cond_0
    return-void
.end method

.method synthetic lambda$onPlayerAttached$6()V
    .locals 1

    .prologue
    .line 514
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    if-eqz v0, :cond_0

    .line 515
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/media/AutoPlay$Listener;->onReady(Lcom/vkontakte/android/media/AutoPlay;)V

    .line 517
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$10;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 522
    return-void
.end method

.method synthetic lambda$onPlayerAttached$7()V
    .locals 3

    .prologue
    .line 525
    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    if-eqz v2, :cond_1

    .line 526
    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay$Listener;->getPlayingNow()Lcom/vkontakte/android/media/AutoPlay;

    move-result-object v1

    .line 527
    .local v1, "playingNow":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v1, :cond_0

    if-ne v1, p0, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 528
    .local v0, "canWrap":Z
    :goto_0
    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isAttached()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v2}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p0, :cond_1

    .line 529
    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v2}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$1000(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;)V

    .line 532
    .end local v0    # "canWrap":Z
    .end local v1    # "playingNow":Lcom/vkontakte/android/media/AutoPlay;
    :cond_1
    return-void

    .line 527
    .restart local v1    # "playingNow":Lcom/vkontakte/android/media/AutoPlay;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$onPlayerReady$8()V
    .locals 5

    .prologue
    .line 567
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mActivityOnPause:Z

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isAttached()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 568
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    .line 569
    .local v0, "listener":Lcom/vkontakte/android/media/AutoPlay$Listener;
    if-eqz v0, :cond_0

    .line 570
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "AUTOPLAY"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "On Ready "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 571
    invoke-interface {v0, p0}, Lcom/vkontakte/android/media/AutoPlay$Listener;->onReady(Lcom/vkontakte/android/media/AutoPlay;)V

    .line 574
    .end local v0    # "listener":Lcom/vkontakte/android/media/AutoPlay$Listener;
    :cond_0
    return-void
.end method

.method synthetic lambda$onUpdatePlaybackPosition$9(I)V
    .locals 2
    .param p1, "sec"    # I

    .prologue
    .line 603
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .line 604
    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    if-ne v0, v1, :cond_0

    .line 605
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mDuration:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    sub-int/2addr v1, p1

    invoke-static {v1}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 607
    :cond_0
    return-void
.end method

.method synthetic lambda$pause$4()V
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->pause()V

    .line 243
    :cond_0
    return-void
.end method

.method synthetic lambda$play$1()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showPlayer()V

    return-void
.end method

.method synthetic lambda$play$2()V
    .locals 2

    .prologue
    .line 211
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->videoDisplay:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    .line 214
    :cond_0
    return-void
.end method

.method synthetic lambda$play$3()V
    .locals 2

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getPosition()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setVolume(F)V

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->play(Z)V

    .line 225
    :cond_0
    return-void
.end method

.method synthetic lambda$waiting$0()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$100(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;ZZ)V

    .line 191
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 499
    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->openVideo(Landroid/view/View;ZI)V

    .line 500
    return-void
.end method

.method public onEndOfBuffer(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 639
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-ne v0, p1, :cond_1

    .line 641
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 642
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$1000(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;)V

    .line 644
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mBuffering:Z

    .line 646
    :cond_1
    return-void
.end method

.method public onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 3
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "errCode"    # I

    .prologue
    const/4 v2, 0x0

    .line 650
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eq v1, p1, :cond_1

    .line 684
    :cond_0
    :goto_0
    return-void

    .line 653
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    if-eqz v1, :cond_2

    .line 654
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    invoke-interface {v1, p0}, Lcom/vkontakte/android/media/AutoPlay$Listener;->onError(Lcom/vkontakte/android/media/AutoPlay;)V

    .line 656
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mFailed:Z

    .line 657
    iput-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    .line 658
    iput-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    .line 659
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->stopInternal()V

    .line 660
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isAttached()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 661
    const/4 v0, -0x1

    .line 662
    .local v0, "errorString":I
    packed-switch p2, :pswitch_data_0

    .line 679
    :goto_1
    :pswitch_0
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 682
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showError(I)V

    goto :goto_0

    .line 664
    :pswitch_1
    const v0, 0x7f0801f5

    .line 665
    goto :goto_1

    .line 667
    :pswitch_2
    const v0, 0x7f080758

    .line 668
    goto :goto_1

    .line 670
    :pswitch_3
    const v0, 0x7f0801f8

    .line 671
    goto :goto_1

    .line 673
    :pswitch_4
    const v0, 0x7f080757

    .line 674
    goto :goto_1

    .line 676
    :pswitch_5
    const v0, 0x7f080761

    goto :goto_1

    .line 662
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 549
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mActivityOnPause:Z

    .line 550
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    if-eqz v0, :cond_0

    .line 551
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/media/AutoPlay$Listener;->onPause(Landroid/app/Activity;)V

    .line 553
    :cond_0
    return-void
.end method

.method public onPlaybackCompleted(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 581
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-ne v0, p1, :cond_0

    .line 582
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/VideoFile;->repeat:Z

    if-eqz v0, :cond_1

    .line 583
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->replay(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 595
    :cond_0
    :goto_0
    return-void

    .line 585
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    .line 586
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    .line 587
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 588
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showReplay()V

    .line 590
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    if-eqz v0, :cond_0

    .line 591
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/media/AutoPlay$Listener;->onComplete(Lcom/vkontakte/android/media/AutoPlay;)V

    goto :goto_0
.end method

.method public onPlaybackResumed(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v1, 0x0

    .line 623
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-ne v0, p1, :cond_1

    .line 624
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mFailed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 625
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$900(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;)V

    .line 627
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 628
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showPlayer()V

    .line 633
    :cond_0
    :goto_0
    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mBuffering:Z

    .line 635
    :cond_1
    return-void

    .line 629
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 630
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$100(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;ZZ)V

    goto :goto_0
.end method

.method public onPlayerAttached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 4
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 504
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    .line 505
    invoke-virtual {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getQuality()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    .line 506
    invoke-virtual {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->isCompleted()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    .line 509
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 510
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "AUTOPLAY"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onPlayerAttached "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VideoFile;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 511
    invoke-virtual {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getPosition()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 512
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isPrepared()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 513
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 535
    :cond_0
    :goto_0
    return-void

    .line 524
    :cond_1
    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public onPlayerDetached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 6
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 539
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-ne v0, p1, :cond_0

    .line 540
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string/jumbo v1, "AUTOPLAY"

    aput-object v1, v0, v4

    const/4 v1, 0x1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onPlayerDetached "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VideoFile;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 541
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    .line 542
    iput-object v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    .line 543
    iput-boolean v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    .line 545
    :cond_0
    return-void
.end method

.method public onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V
    .locals 1
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "videoW"    # I
    .param p3, "videoH"    # I

    .prologue
    .line 565
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    .line 566
    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 576
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPrepared:Z

    .line 577
    return-void
.end method

.method public onRenderedFirstFrame(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 688
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 689
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mPreview:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 691
    :cond_0
    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 557
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mActivityOnPause:Z

    .line 558
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    if-eqz v0, :cond_0

    .line 559
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/media/AutoPlay$Listener;->onResume(Landroid/app/Activity;)V

    .line 561
    :cond_0
    return-void
.end method

.method public onUpdateBuffered(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "percent"    # I

    .prologue
    .line 619
    return-void
.end method

.method public onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 3
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "msec"    # I

    .prologue
    .line 599
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-ne v1, p1, :cond_1

    .line 600
    const/4 v1, 0x0

    div-int/lit16 v2, p2, 0x3e8

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 601
    .local v0, "sec":I
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v1

    if-nez v1, :cond_0

    .line 602
    invoke-static {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;I)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 609
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v1, :cond_1

    .line 611
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    iget v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/media/VideoTracker;->track(II)V

    .line 614
    .end local v0    # "sec":I
    :cond_1
    return-void
.end method

.method public openVideo(Landroid/view/View;ZI)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "autoplay"    # Z
    .param p3, "quality"    # I

    .prologue
    const/4 v3, 0x1

    .line 399
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 400
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    const v4, 0x7f1001dc

    if-eq v2, v4, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    const v4, 0x7f1001dd

    if-ne v2, v4, :cond_3

    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-virtual {v2}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 401
    new-instance v2, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/VideoFile;->convertToPost()Lcom/vkontakte/android/NewsEntry;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->referer:Ljava/lang/String;

    .line 402
    invoke-virtual {v2, v4}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v2

    .line 403
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->resetScroll(Z)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v2

    .line 404
    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 427
    .end local v0    # "context":Landroid/content/Context;
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v2, :cond_2

    .line 428
    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    sget-object v3, Lcom/vkontakte/android/data/PostInteract$Type;->video_start:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 430
    :cond_2
    return-void

    .line 406
    .restart local v0    # "context":Landroid/content/Context;
    :cond_3
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v2}, Lcom/vkontakte/android/api/VideoFile;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v2, v0

    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v5, "from_video"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 407
    check-cast v0, Landroid/app/Activity;

    .end local v0    # "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 409
    .restart local v0    # "context":Landroid/content/Context;
    :cond_4
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 410
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "file"

    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 411
    const-string/jumbo v2, "file_index"

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 412
    const-string/jumbo v2, "referrer"

    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->referer:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 413
    const-string/jumbo v4, "load_likes"

    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->likes:I

    if-nez v2, :cond_5

    move v2, v3

    :goto_1
    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 414
    const-string/jumbo v2, "hide_ui"

    const-string/jumbo v3, "news"

    iget-object v4, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->referer:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 415
    const-string/jumbo v2, "autoplay"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 416
    const-string/jumbo v2, "ads"

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 417
    const-string/jumbo v2, "quality"

    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 418
    const-string/jumbo v2, "context"

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->context:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 419
    const-string/jumbo v2, "statistic"

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->statistic:Lcom/vkontakte/android/statistics/Statistic;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 420
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 421
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_1

    .line 422
    check-cast v0, Landroid/app/Activity;

    .end local v0    # "context":Landroid/content/Context;
    const/high16 v2, 0x10a0000

    const v3, 0x10a0001

    invoke-virtual {v0, v2, v3}, Landroid/app/Activity;->overridePendingTransition(II)V

    goto/16 :goto_0

    .line 413
    .restart local v0    # "context":Landroid/content/Context;
    :cond_5
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 439
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->isSingle:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    goto :goto_0
.end method

.method public pause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 231
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_1

    .line 232
    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$100(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;ZZ)V

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    const/4 v1, 0x6

    iput v1, v0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mState:I

    .line 239
    :cond_0
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 245
    :cond_1
    return-void
.end method

.method public play(Z)V
    .locals 4
    .param p1, "delay"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 201
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mActivityOnPause:Z

    if-nez v0, :cond_0

    .line 202
    iput-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    .line 203
    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mFailed:Z

    .line 204
    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaybackCompleted:Z

    .line 205
    iput-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->wasPlayed:Z

    .line 207
    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 209
    if-eqz p1, :cond_1

    .line 210
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 219
    :goto_0
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 227
    :cond_0
    return-void

    .line 216
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->holder:Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->videoDisplay:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    goto :goto_0
.end method

.method public prepare()V
    .locals 1

    .prologue
    .line 196
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->start(Z)V

    .line 197
    return-void
.end method

.method public removeListener(Lcom/vkontakte/android/media/AutoPlay$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vkontakte/android/media/AutoPlay$Listener;

    .prologue
    .line 259
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    if-ne v0, p1, :cond_0

    .line 260
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    .line 262
    :cond_0
    return-void
.end method

.method requestPlayer(Ljava/lang/String;)V
    .locals 8
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 744
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->hasPlayer:Z

    if-nez v0, :cond_0

    .line 745
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->hasPlayer:Z

    .line 746
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    iget v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    iget-boolean v5, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mWasAutoPlay:Z

    iget-object v6, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->referer:Ljava/lang/String;

    move-object v2, p1

    move-object v7, p0

    invoke-static/range {v0 .. v7}, Lcom/vkontakte/android/media/VideoPools;->obtainAndAttachPlayer(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V

    .line 748
    :cond_0
    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 296
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->referer:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 297
    return-void
.end method

.method public setLayoutTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "layoutTag"    # Ljava/lang/String;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->layoutTag:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public setListener(Lcom/vkontakte/android/media/AutoPlay$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/media/AutoPlay$Listener;

    .prologue
    .line 254
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    .line 255
    return-void
.end method

.method public setPostId(I)V
    .locals 0
    .param p1, "postId"    # I

    .prologue
    .line 138
    iput p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->postId:I

    .line 139
    return-void
.end method

.method public setPostOwnerId(I)V
    .locals 0
    .param p1, "postOwnerId"    # I

    .prologue
    .line 142
    iput p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->postOwnerId:I

    .line 143
    return-void
.end method

.method public setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 1
    .param p1, "refer"    # Ljava/lang/String;
    .param p2, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 128
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;Ljava/lang/String;)V
    .locals 0
    .param p1, "refer"    # Ljava/lang/String;
    .param p2, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "context"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 132
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->referer:Ljava/lang/String;

    .line 133
    iput-object p2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 134
    iput-object p3, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->context:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setShitAttachment(Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 0
    .param p1, "attachment"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 151
    return-void
.end method

.method public setSingle(Z)V
    .locals 0
    .param p1, "isSingle"    # Z

    .prologue
    .line 123
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->isSingle:Z

    .line 124
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->checkAutoPlay()V

    .line 125
    return-void
.end method

.method public setStatistic(Lcom/vkontakte/android/statistics/Statistic;)V
    .locals 0
    .param p1, "statistic"    # Lcom/vkontakte/android/statistics/Statistic;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->statistic:Lcom/vkontakte/android/statistics/Statistic;

    .line 147
    return-void
.end method

.method public final setViewSize(FFZZ)V
    .locals 2
    .param p1, "width"    # F
    .param p2, "height"    # F
    .param p3, "breakAfter"    # Z
    .param p4, "floating"    # Z

    .prologue
    .line 444
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    iput-boolean p3, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->breakAfter:Z

    .line 445
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    iput-boolean p4, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    .line 446
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    .line 447
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->lp:Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    .line 448
    return-void
.end method

.method start(Z)V
    .locals 2
    .param p1, "autoplay"    # Z

    .prologue
    const/4 v1, 0x0

    .line 698
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/AsyncTask;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->hasPlayer:Z

    if-eqz v0, :cond_2

    .line 741
    :cond_1
    :goto_0
    return-void

    .line 701
    :cond_2
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mWasAutoPlay:Z

    .line 702
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isHLSSupported()Z

    move-result v0

    if-nez v0, :cond_3

    .line 703
    new-instance v0, Lcom/vkontakte/android/attachments/VideoAttachment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/attachments/VideoAttachment$1;-><init>(Lcom/vkontakte/android/attachments/VideoAttachment;)V

    new-array v1, v1, [Ljava/lang/String;

    .line 735
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment$1;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    goto :goto_0

    .line 737
    :cond_3
    iput-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mFailed:Z

    .line 738
    const/4 v0, -0x2

    iput v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    .line 739
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->requestPlayer(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 249
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/VideoAttachment;->stopInternal()V

    .line 250
    return-void
.end method

.method stopAndReleasePlayer()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 762
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    if-eqz v0, :cond_0

    .line 763
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/AsyncTask;->cancel()V

    .line 765
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->hasPlayer:Z

    if-eqz v0, :cond_1

    .line 766
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/media/VideoPools;->detachAndReleasePlayer(Lcom/vkontakte/android/api/VideoFile;I)V

    .line 767
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    .line 768
    iput-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->hasPlayer:Z

    .line 770
    :cond_1
    iput-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPrepared:Z

    .line 771
    iput-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->mPlaying:Z

    .line 772
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 472
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public waiting()V
    .locals 1

    .prologue
    .line 187
    invoke-static {p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 192
    return-void
.end method
