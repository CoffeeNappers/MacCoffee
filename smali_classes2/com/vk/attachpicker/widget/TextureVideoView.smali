.class public Lcom/vk/attachpicker/widget/TextureVideoView;
.super Landroid/view/TextureView;
.source "TextureVideoView.java"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;,
        Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "CenterCropVideoView"

.field private static final STATE_ERROR:I = -0x1

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_PAUSED:I = 0x4

.field private static final STATE_PLAYBACK_COMPLETED:I = 0x5

.field private static final STATE_PLAYING:I = 0x3

.field private static final STATE_PREPARED:I = 0x2

.field private static final STATE_PREPARING:I = 0x1

.field private static final sScaleTypeArray:[Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;


# instance fields
.field private final focusListener:Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

.field private isSound:Z

.field private loop:Z

.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mContext:Landroid/content/Context;

.field private mCurrentBufferPercentage:I

.field private mCurrentState:I

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mOCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

.field private mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mScaleType:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

.field private mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

.field private mSurface:Landroid/view/Surface;

.field private mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private mTargetState:I

.field private mVideoHeight:I

.field private mVideoWidth:I

.field private uri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 88
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    const/4 v1, 0x0

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->MATRIX:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_XY:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_START:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_END:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER_CROP:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER_INSIDE:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/attachpicker/widget/TextureVideoView;->sScaleTypeArray:[Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 100
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 49
    iput v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 50
    iput v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 60
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;Lcom/vk/attachpicker/widget/TextureVideoView$1;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->focusListener:Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    .line 69
    iput-boolean v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->loop:Z

    .line 528
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$1;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$1;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 540
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$2;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$2;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 570
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$3;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$3;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 582
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$4;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$4;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    .line 591
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$5;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$5;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 608
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$6;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$6;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 736
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$7;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$7;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 102
    iput-boolean v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->isSound:Z

    .line 103
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mContext:Landroid/content/Context;

    .line 104
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->initVideoView()V

    .line 105
    sget-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->setScaleType(Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;)V

    .line 106
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 109
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    iput v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 50
    iput v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 60
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;Lcom/vk/attachpicker/widget/TextureVideoView$1;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->focusListener:Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    .line 69
    iput-boolean v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->loop:Z

    .line 528
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$1;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$1;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 540
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$2;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$2;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 570
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$3;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$3;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 582
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$4;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$4;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    .line 591
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$5;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$5;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 608
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$6;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$6;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 736
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$7;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$7;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 110
    iput-boolean v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->isSound:Z

    .line 111
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mContext:Landroid/content/Context;

    .line 112
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->initVideoView()V

    .line 113
    invoke-direct {p0, p1, p2, v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 114
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 117
    invoke-direct {p0, p1, p2, p3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 49
    iput v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 50
    iput v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 60
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;Lcom/vk/attachpicker/widget/TextureVideoView$1;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->focusListener:Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    .line 69
    iput-boolean v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->loop:Z

    .line 528
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$1;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$1;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 540
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$2;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$2;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 570
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$3;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$3;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 582
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$4;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$4;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    .line 591
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$5;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$5;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 608
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$6;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$6;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 736
    new-instance v0, Lcom/vk/attachpicker/widget/TextureVideoView$7;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/TextureVideoView$7;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 118
    iput-boolean v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->isSound:Z

    .line 119
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mContext:Landroid/content/Context;

    .line 120
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->initVideoView()V

    .line 121
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/attachpicker/widget/TextureVideoView;->initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 122
    return-void
.end method

.method private abandonAudioFocus()V
    .locals 2

    .prologue
    .line 829
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->focusListener:Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 830
    return-void
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/widget/TextureVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    return v0
.end method

.method static synthetic access$1000(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vk/attachpicker/widget/TextureVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    return p1
.end method

.method static synthetic access$1102(Lcom/vk/attachpicker/widget/TextureVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentBufferPercentage:I

    return p1
.end method

.method static synthetic access$1200(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/view/Surface;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSurface:Landroid/view/Surface;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/vk/attachpicker/widget/TextureVideoView;Landroid/view/Surface;)Landroid/view/Surface;
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;
    .param p1, "x1"    # Landroid/view/Surface;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSurface:Landroid/view/Surface;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/vk/attachpicker/widget/TextureVideoView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->isSound:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/widget/TextureVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    return v0
.end method

.method static synthetic access$202(Lcom/vk/attachpicker/widget/TextureVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    return p1
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/widget/TextureVideoView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->initVideo()V

    return-void
.end method

.method static synthetic access$402(Lcom/vk/attachpicker/widget/TextureVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    return p1
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/attachpicker/widget/TextureVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    return v0
.end method

.method static synthetic access$602(Lcom/vk/attachpicker/widget/TextureVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    return p1
.end method

.method static synthetic access$700(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mOCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$802(Lcom/vk/attachpicker/widget/TextureVideoView;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;
    .param p1, "x1"    # Landroid/media/MediaPlayer;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p1
.end method

.method static synthetic access$900(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer$OnInfoListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    return-object v0
.end method

.method private center()V
    .locals 11

    .prologue
    const/high16 v10, 0x40000000    # 2.0f

    .line 273
    :try_start_0
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 275
    .local v3, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getWidth()I

    move-result v7

    .line 276
    .local v7, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getHeight()I

    move-result v6

    .line 278
    .local v6, "viewHeight":I
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v8, v8

    int-to-float v9, v7

    div-float v4, v8, v9

    .line 279
    .local v4, "mScaleX":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v8, v8

    int-to-float v9, v6

    div-float v5, v8, v9

    .line 281
    .local v5, "mScaleY":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    sub-int v8, v7, v8

    int-to-float v1, v8

    .line 282
    .local v1, "mBoundX":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    sub-int v8, v6, v8

    int-to-float v2, v8

    .line 284
    .local v2, "mBoundY":F
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 285
    div-float v8, v1, v10

    div-float v9, v2, v10

    invoke-virtual {v3, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 287
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/widget/TextureVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :goto_0
    return-void

    .line 288
    :catch_0
    move-exception v0

    .line 289
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method

.method private centerCrop()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v10, 0x3f800000    # 1.0f

    .line 296
    :try_start_0
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 298
    .local v3, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getWidth()I

    move-result v7

    .line 299
    .local v7, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getHeight()I

    move-result v6

    .line 301
    .local v6, "viewHeight":I
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v8, v8

    int-to-float v9, v7

    div-float v4, v8, v9

    .line 302
    .local v4, "mScaleX":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v8, v8

    int-to-float v9, v6

    div-float v5, v8, v9

    .line 304
    .local v5, "mScaleY":F
    int-to-float v8, v7

    iget v9, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v9, v9

    div-float/2addr v9, v5

    sub-float v1, v8, v9

    .line 305
    .local v1, "mBoundX":F
    int-to-float v8, v6

    iget v9, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v9, v9

    div-float/2addr v9, v4

    sub-float v2, v8, v9

    .line 307
    .local v2, "mBoundY":F
    cmpg-float v8, v4, v5

    if-gez v8, :cond_0

    .line 308
    div-float v8, v10, v4

    mul-float/2addr v5, v8

    .line 309
    const/high16 v4, 0x3f800000    # 1.0f

    .line 310
    const/4 v1, 0x0

    .line 317
    :goto_0
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 318
    div-float v8, v1, v11

    div-float v9, v2, v11

    invoke-virtual {v3, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 320
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/widget/TextureVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :goto_1
    return-void

    .line 312
    .restart local v1    # "mBoundX":F
    .restart local v2    # "mBoundY":F
    .restart local v3    # "mMatrix":Landroid/graphics/Matrix;
    .restart local v4    # "mScaleX":F
    .restart local v5    # "mScaleY":F
    .restart local v6    # "viewHeight":I
    .restart local v7    # "viewWidth":I
    :cond_0
    div-float v8, v10, v5

    mul-float/2addr v4, v8

    .line 313
    const/high16 v5, 0x3f800000    # 1.0f

    .line 314
    const/4 v2, 0x0

    goto :goto_0

    .line 321
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :catch_0
    move-exception v0

    .line 322
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1
.end method

.method private centerInside()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v10, 0x3f800000    # 1.0f

    .line 329
    :try_start_0
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 331
    .local v3, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getWidth()I

    move-result v7

    .line 332
    .local v7, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getHeight()I

    move-result v6

    .line 334
    .local v6, "viewHeight":I
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v8, v8

    int-to-float v9, v7

    div-float v4, v8, v9

    .line 335
    .local v4, "mScaleX":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v8, v8

    int-to-float v9, v6

    div-float v5, v8, v9

    .line 337
    .local v5, "mScaleY":F
    cmpl-float v8, v4, v10

    if-gtz v8, :cond_0

    cmpl-float v8, v5, v10

    if-lez v8, :cond_1

    .line 338
    :cond_0
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->fitCenter()V

    .line 351
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :goto_0
    return-void

    .line 340
    .restart local v3    # "mMatrix":Landroid/graphics/Matrix;
    .restart local v4    # "mScaleX":F
    .restart local v5    # "mScaleY":F
    .restart local v6    # "viewHeight":I
    .restart local v7    # "viewWidth":I
    :cond_1
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    sub-int v8, v7, v8

    int-to-float v1, v8

    .line 341
    .local v1, "mBoundX":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    sub-int v8, v6, v8

    int-to-float v2, v8

    .line 343
    .local v2, "mBoundY":F
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 344
    div-float v8, v1, v11

    div-float v9, v2, v11

    invoke-virtual {v3, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 346
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/widget/TextureVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 348
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :catch_0
    move-exception v0

    .line 349
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method

.method private fitCenter()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v10, 0x3f800000    # 1.0f

    .line 387
    :try_start_0
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 389
    .local v3, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getWidth()I

    move-result v7

    .line 390
    .local v7, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getHeight()I

    move-result v6

    .line 392
    .local v6, "viewHeight":I
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v8, v8

    int-to-float v9, v7

    div-float v4, v8, v9

    .line 393
    .local v4, "mScaleX":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v8, v8

    int-to-float v9, v6

    div-float v5, v8, v9

    .line 395
    .local v5, "mScaleY":F
    int-to-float v8, v7

    iget v9, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v9, v9

    div-float/2addr v9, v5

    sub-float v1, v8, v9

    .line 396
    .local v1, "mBoundX":F
    int-to-float v8, v6

    iget v9, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v9, v9

    div-float/2addr v9, v4

    sub-float v2, v8, v9

    .line 398
    .local v2, "mBoundY":F
    cmpl-float v8, v4, v5

    if-lez v8, :cond_0

    .line 399
    div-float v8, v10, v4

    mul-float/2addr v5, v8

    .line 400
    const/high16 v4, 0x3f800000    # 1.0f

    .line 401
    const/4 v1, 0x0

    .line 408
    :goto_0
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 409
    div-float v8, v1, v11

    div-float v9, v2, v11

    invoke-virtual {v3, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 411
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/widget/TextureVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :goto_1
    return-void

    .line 403
    .restart local v1    # "mBoundX":F
    .restart local v2    # "mBoundY":F
    .restart local v3    # "mMatrix":Landroid/graphics/Matrix;
    .restart local v4    # "mScaleX":F
    .restart local v5    # "mScaleY":F
    .restart local v6    # "viewHeight":I
    .restart local v7    # "viewWidth":I
    :cond_0
    div-float v8, v10, v5

    mul-float/2addr v4, v8

    .line 404
    const/high16 v5, 0x3f800000    # 1.0f

    .line 405
    const/4 v2, 0x0

    goto :goto_0

    .line 412
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :catch_0
    move-exception v0

    .line 413
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1
.end method

.method private fitEnd()V
    .locals 11

    .prologue
    const/high16 v10, 0x3f800000    # 1.0f

    .line 420
    :try_start_0
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 422
    .local v3, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getWidth()I

    move-result v7

    .line 423
    .local v7, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getHeight()I

    move-result v6

    .line 425
    .local v6, "viewHeight":I
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v8, v8

    int-to-float v9, v7

    div-float v4, v8, v9

    .line 426
    .local v4, "mScaleX":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v8, v8

    int-to-float v9, v6

    div-float v5, v8, v9

    .line 428
    .local v5, "mScaleY":F
    int-to-float v8, v7

    iget v9, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v9, v9

    div-float/2addr v9, v5

    sub-float v1, v8, v9

    .line 429
    .local v1, "mBoundX":F
    int-to-float v8, v6

    iget v9, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v9, v9

    div-float/2addr v9, v4

    sub-float v2, v8, v9

    .line 431
    .local v2, "mBoundY":F
    cmpl-float v8, v4, v5

    if-lez v8, :cond_0

    .line 432
    div-float v8, v10, v4

    mul-float/2addr v5, v8

    .line 433
    const/high16 v4, 0x3f800000    # 1.0f

    .line 434
    const/4 v1, 0x0

    .line 441
    :goto_0
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 442
    invoke-virtual {v3, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 444
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/widget/TextureVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 448
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :goto_1
    return-void

    .line 436
    .restart local v1    # "mBoundX":F
    .restart local v2    # "mBoundY":F
    .restart local v3    # "mMatrix":Landroid/graphics/Matrix;
    .restart local v4    # "mScaleX":F
    .restart local v5    # "mScaleY":F
    .restart local v6    # "viewHeight":I
    .restart local v7    # "viewWidth":I
    :cond_0
    div-float v8, v10, v5

    mul-float/2addr v4, v8

    .line 437
    const/high16 v5, 0x3f800000    # 1.0f

    .line 438
    const/4 v2, 0x0

    goto :goto_0

    .line 445
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :catch_0
    move-exception v0

    .line 446
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1
.end method

.method private fitStart()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v10, 0x3f800000    # 1.0f

    .line 356
    :try_start_0
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 358
    .local v3, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getWidth()I

    move-result v7

    .line 359
    .local v7, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getHeight()I

    move-result v6

    .line 361
    .local v6, "viewHeight":I
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v8, v8

    int-to-float v9, v7

    div-float v4, v8, v9

    .line 362
    .local v4, "mScaleX":F
    iget v8, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v8, v8

    int-to-float v9, v6

    div-float v5, v8, v9

    .line 364
    .local v5, "mScaleY":F
    const/4 v1, 0x0

    .line 365
    .local v1, "mBoundX":F
    const/4 v2, 0x0

    .line 367
    .local v2, "mBoundY":F
    cmpl-float v8, v4, v5

    if-lez v8, :cond_0

    .line 368
    div-float v8, v10, v4

    mul-float/2addr v5, v8

    .line 369
    const/high16 v4, 0x3f800000    # 1.0f

    .line 375
    :goto_0
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 376
    div-float v8, v1, v11

    div-float v9, v2, v11

    invoke-virtual {v3, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 378
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/widget/TextureVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 382
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :goto_1
    return-void

    .line 371
    .restart local v1    # "mBoundX":F
    .restart local v2    # "mBoundY":F
    .restart local v3    # "mMatrix":Landroid/graphics/Matrix;
    .restart local v4    # "mScaleX":F
    .restart local v5    # "mScaleY":F
    .restart local v6    # "viewHeight":I
    .restart local v7    # "viewWidth":I
    :cond_0
    div-float v8, v10, v5

    mul-float/2addr v4, v8

    .line 372
    const/high16 v5, 0x3f800000    # 1.0f

    goto :goto_0

    .line 379
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v6    # "viewHeight":I
    .end local v7    # "viewWidth":I
    :catch_0
    move-exception v0

    .line 380
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1
.end method

.method private fitXY()V
    .locals 4

    .prologue
    .line 260
    :try_start_0
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 262
    .local v1, "mMatrix":Landroid/graphics/Matrix;
    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 264
    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    .end local v1    # "mMatrix":Landroid/graphics/Matrix;
    :goto_0
    return-void

    .line 265
    :catch_0
    move-exception v0

    .line 266
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method

.method private initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 132
    sget-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->FIT_CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->setScaleType(Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;)V

    .line 133
    return-void
.end method

.method private initVideo()V
    .locals 2

    .prologue
    .line 210
    sget-object v0, Lcom/vk/attachpicker/widget/TextureVideoView$8;->$SwitchMap$com$vk$attachpicker$widget$TextureVideoView$ScaleType:[I

    iget-object v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mScaleType:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 236
    :goto_0
    return-void

    .line 212
    :pswitch_0
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->fitCenter()V

    goto :goto_0

    .line 215
    :pswitch_1
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->centerCrop()V

    goto :goto_0

    .line 218
    :pswitch_2
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->matrix()V

    goto :goto_0

    .line 221
    :pswitch_3
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->fitXY()V

    goto :goto_0

    .line 224
    :pswitch_4
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->fitStart()V

    goto :goto_0

    .line 227
    :pswitch_5
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->fitEnd()V

    goto :goto_0

    .line 230
    :pswitch_6
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->center()V

    goto :goto_0

    .line 233
    :pswitch_7
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->centerInside()V

    goto :goto_0

    .line 210
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private isInPlaybackState()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 710
    iget-object v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private matrix()V
    .locals 8

    .prologue
    .line 241
    :try_start_0
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 243
    .local v1, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getWidth()I

    move-result v5

    .line 244
    .local v5, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getHeight()I

    move-result v4

    .line 246
    .local v4, "viewHeight":I
    iget v6, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    int-to-float v6, v6

    int-to-float v7, v5

    div-float v2, v6, v7

    .line 247
    .local v2, "mScaleX":F
    iget v6, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    int-to-float v6, v6

    int-to-float v7, v4

    div-float v3, v6, v7

    .line 249
    .local v3, "mScaleY":F
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 251
    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    .end local v1    # "mMatrix":Landroid/graphics/Matrix;
    .end local v2    # "mScaleX":F
    .end local v3    # "mScaleY":F
    .end local v4    # "viewHeight":I
    .end local v5    # "viewWidth":I
    :goto_0
    return-void

    .line 252
    :catch_0
    move-exception v0

    .line 253
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method

.method private release(Z)V
    .locals 2
    .param p1, "cleartargetstate"    # Z

    .prologue
    const/4 v1, 0x0

    .line 632
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 633
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 634
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 635
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 636
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 637
    if-eqz p1, :cond_0

    .line 638
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 641
    :cond_0
    return-void
.end method

.method private requestAudioFocus()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 819
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->focusListener:Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    const/4 v3, 0x3

    .line 820
    invoke-virtual {v1, v2, v3, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v0

    .line 821
    .local v0, "result":I
    if-ne v0, v4, :cond_0

    .line 822
    iget-object v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->focusListener:Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    invoke-virtual {v1, v4}, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;->onAudioFocusChange(I)V

    .line 826
    :goto_0
    return-void

    .line 824
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->focusListener:Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;->onAudioFocusChange(I)V

    goto :goto_0
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 718
    const/4 v0, 0x0

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 723
    const/4 v0, 0x0

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 728
    const/4 v0, 0x0

    return v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 733
    const/4 v0, -0x1

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 703
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 704
    iget v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentBufferPercentage:I

    .line 706
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 683
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 684
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    .line 686
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 674
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 675
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    .line 678
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getVideoHeight()I
    .locals 1

    .prologue
    .line 815
    iget v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    return v0
.end method

.method public getVideoWidth()I
    .locals 1

    .prologue
    .line 811
    iget v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    return v0
.end method

.method public initVideoView()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 200
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoHeight:I

    .line 201
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mVideoWidth:I

    .line 202
    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setFocusable(Z)V

    .line 203
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 204
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 205
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 206
    return-void
.end method

.method public isInitialized()Z
    .locals 1

    .prologue
    .line 525
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLoop()Z
    .locals 1

    .prologue
    .line 803
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->loop:Z

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 698
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 786
    invoke-super {p0}, Landroid/view/TextureView;->onDetachedFromWindow()V

    .line 787
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->stopPlayback()V

    .line 788
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 153
    invoke-super {p0, p1}, Landroid/view/TextureView;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 154
    const-class v0, Landroid/widget/VideoView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 155
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 159
    invoke-super {p0, p1}, Landroid/view/TextureView;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 160
    const-class v0, Landroid/widget/VideoView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 161
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 165
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/TextureView;->onSizeChanged(IIII)V

    .line 166
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->initVideo()V

    .line 167
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    .line 775
    invoke-super {p0, p1, p2}, Landroid/view/TextureView;->onVisibilityChanged(Landroid/view/View;I)V

    .line 777
    const/4 v0, 0x4

    if-eq p2, v0, :cond_0

    const/16 v0, 0x8

    if-ne p2, v0, :cond_1

    .line 778
    :cond_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 779
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->stopPlayback()V

    .line 782
    :cond_1
    return-void
.end method

.method public openVideo()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    const/4 v5, -0x1

    .line 475
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->uri:Landroid/net/Uri;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSurface:Landroid/view/Surface;

    if-nez v2, :cond_1

    .line 522
    :cond_0
    :goto_0
    return-void

    .line 481
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.android.music.musicservicecommand"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 482
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "command"

    const-string/jumbo v3, "pause"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 483
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 484
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->requestAudioFocus()V

    .line 488
    invoke-direct {p0, v4}, Lcom/vk/attachpicker/widget/TextureVideoView;->release(Z)V

    .line 490
    :try_start_0
    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 493
    iget-boolean v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->isSound:Z

    if-nez v2, :cond_2

    .line 494
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 499
    :goto_1
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 500
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 501
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 502
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 503
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 504
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 505
    const/4 v2, 0x0

    iput v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentBufferPercentage:I

    .line 506
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->uri:Landroid/net/Uri;

    invoke-virtual {v2, v3, v4}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 507
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mSurface:Landroid/view/Surface;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 508
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 510
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 511
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 512
    const/4 v2, 0x1

    iput v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 513
    :catch_0
    move-exception v0

    .line 514
    .local v0, "e":Ljava/lang/IllegalStateException;
    iput v5, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 515
    iput v5, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 516
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto/16 :goto_0

    .line 496
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3, v4}, Landroid/media/MediaPlayer;->setVolume(FF)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 517
    :catch_1
    move-exception v0

    .line 518
    .local v0, "e":Ljava/io/IOException;
    iput v5, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 519
    iput v5, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 520
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public pause()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 655
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 656
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 657
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 658
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 661
    :cond_0
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 662
    return-void
.end method

.method public resolveAdjustedSize(II)I
    .locals 5
    .param p1, "desiredSize"    # I
    .param p2, "measureSpec"    # I

    .prologue
    .line 170
    const-string/jumbo v3, "CenterCropVideoView"

    const-string/jumbo v4, "Resolve called."

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    move v0, p1

    .line 172
    .local v0, "result":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 173
    .local v1, "specMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 175
    .local v2, "specSize":I
    sparse-switch v1, :sswitch_data_0

    .line 196
    :goto_0
    return v0

    .line 180
    :sswitch_0
    move v0, p1

    .line 181
    goto :goto_0

    .line 188
    :sswitch_1
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 189
    goto :goto_0

    .line 193
    :sswitch_2
    move v0, v2

    goto :goto_0

    .line 175
    nop

    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x0 -> :sswitch_0
        0x40000000 -> :sswitch_2
    .end sparse-switch
.end method

.method public resume()V
    .locals 0

    .prologue
    .line 669
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->openVideo()V

    .line 670
    return-void
.end method

.method public seekTo(I)V
    .locals 1
    .param p1, "msec"    # I

    .prologue
    .line 691
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 692
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 694
    :cond_0
    return-void
.end method

.method public setLoop(Z)V
    .locals 0
    .param p1, "loop"    # Z

    .prologue
    .line 807
    iput-boolean p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->loop:Z

    .line 808
    return-void
.end method

.method public setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/media/MediaPlayer$OnCompletionListener;

    .prologue
    .line 620
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mOCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 621
    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/media/MediaPlayer$OnErrorListener;

    .prologue
    .line 624
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 625
    return-void
.end method

.method public setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/media/MediaPlayer$OnInfoListener;

    .prologue
    .line 628
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    .line 629
    return-void
.end method

.method public setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/media/MediaPlayer$OnPreparedListener;

    .prologue
    .line 616
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 617
    return-void
.end method

.method public setScaleType(Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;)V
    .locals 2
    .param p1, "scaleType"    # Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .prologue
    .line 136
    if-nez p1, :cond_0

    .line 137
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 140
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mScaleType:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    if-eq v0, p1, :cond_1

    .line 141
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mScaleType:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    .line 143
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mScaleType:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    sget-object v1, Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;->CENTER:Lcom/vk/attachpicker/widget/TextureVideoView$ScaleType;

    if-ne v0, v1, :cond_2

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->setWillNotCacheDrawing(Z)V

    .line 145
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->requestLayout()V

    .line 146
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->invalidate()V

    .line 147
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->initVideo()V

    .line 149
    :cond_1
    return-void

    .line 143
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setSound(Z)V
    .locals 3
    .param p1, "isSound"    # Z

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 791
    iput-boolean p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->isSound:Z

    .line 793
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 794
    if-nez p1, :cond_1

    .line 795
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v1, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 800
    :cond_0
    :goto_0
    return-void

    .line 797
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v2, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    goto :goto_0
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 451
    if-eqz p1, :cond_0

    .line 452
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 454
    :cond_0
    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;)V
    .locals 0
    .param p1, "pVideoURI"    # Landroid/net/Uri;

    .prologue
    .line 457
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->uri:Landroid/net/Uri;

    .line 458
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->openVideo()V

    .line 459
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->requestLayout()V

    .line 460
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->invalidate()V

    .line 461
    return-void
.end method

.method public start()V
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 645
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 646
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-boolean v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->loop:Z

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 647
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 648
    iput v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 650
    :cond_0
    iput v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 651
    return-void
.end method

.method public stopPlayback()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 464
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 465
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 466
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 467
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 468
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mCurrentState:I

    .line 469
    iput v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView;->mTargetState:I

    .line 471
    :cond_0
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/TextureVideoView;->abandonAudioFocus()V

    .line 472
    return-void
.end method

.method public suspend()V
    .locals 1

    .prologue
    .line 665
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->release(Z)V

    .line 666
    return-void
.end method
