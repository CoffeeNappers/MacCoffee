.class public Lcom/google/android/exoplayer2/ui/PlaybackControlView;
.super Landroid/widget/FrameLayout;
.source "PlaybackControlView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;,
        Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;,
        Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;
    }
.end annotation


# static fields
.field public static final DEFAULT_FAST_FORWARD_MS:I = 0x3a98

.field public static final DEFAULT_REWIND_MS:I = 0x1388

.field public static final DEFAULT_SEEK_DISPATCHER:Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

.field public static final DEFAULT_SHOW_TIMEOUT_MS:I = 0x1388

.field private static final MAX_POSITION_FOR_SEEK_TO_PREVIOUS:J = 0xbb8L

.field private static final PROGRESS_BAR_MAX:I = 0x3e8


# instance fields
.field private final componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

.field private final currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

.field private dragging:Z

.field private final durationView:Landroid/widget/TextView;

.field private final fastForwardButton:Landroid/view/View;

.field private fastForwardMs:I

.field private final formatBuilder:Ljava/lang/StringBuilder;

.field private final formatter:Ljava/util/Formatter;

.field private final hideAction:Ljava/lang/Runnable;

.field private hideAtMs:J

.field private isAttachedToWindow:Z

.field private final nextButton:Landroid/view/View;

.field private final pauseButton:Landroid/view/View;

.field private final playButton:Landroid/view/View;

.field private player:Lcom/google/android/exoplayer2/ExoPlayer;

.field private final positionView:Landroid/widget/TextView;

.field private final previousButton:Landroid/view/View;

.field private final progressBar:Landroid/widget/SeekBar;

.field private final rewindButton:Landroid/view/View;

.field private rewindMs:I

.field private seekDispatcher:Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

.field private showTimeoutMs:I

.field private final updateProgressAction:Ljava/lang/Runnable;

.field private visibilityListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 180
    new-instance v0, Lcom/google/android/exoplayer2/ui/PlaybackControlView$1;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView$1;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->DEFAULT_SEEK_DISPATCHER:Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 237
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 238
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 241
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 242
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/16 v3, 0x1388

    const/4 v4, 0x0

    .line 245
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 222
    new-instance v2, Lcom/google/android/exoplayer2/ui/PlaybackControlView$2;

    invoke-direct {v2, p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView$2;-><init>(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateProgressAction:Ljava/lang/Runnable;

    .line 229
    new-instance v2, Lcom/google/android/exoplayer2/ui/PlaybackControlView$3;

    invoke-direct {v2, p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView$3;-><init>(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAction:Ljava/lang/Runnable;

    .line 247
    sget v1, Lcom/google/android/exoplayer2/R$layout;->exo_playback_control_view:I

    .line 248
    .local v1, "controllerLayoutId":I
    iput v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindMs:I

    .line 249
    const/16 v2, 0x3a98

    iput v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardMs:I

    .line 250
    iput v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->showTimeoutMs:I

    .line 251
    if-eqz p2, :cond_0

    .line 252
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    sget-object v3, Lcom/google/android/exoplayer2/R$styleable;->PlaybackControlView:[I

    invoke-virtual {v2, p2, v3, v4, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 255
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_0
    sget v2, Lcom/google/android/exoplayer2/R$styleable;->PlaybackControlView_rewind_increment:I

    iget v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindMs:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindMs:I

    .line 256
    sget v2, Lcom/google/android/exoplayer2/R$styleable;->PlaybackControlView_fastforward_increment:I

    iget v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardMs:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardMs:I

    .line 258
    sget v2, Lcom/google/android/exoplayer2/R$styleable;->PlaybackControlView_show_timeout:I

    iget v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->showTimeoutMs:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->showTimeoutMs:I

    .line 259
    sget v2, Lcom/google/android/exoplayer2/R$styleable;->PlaybackControlView_controller_layout_id:I

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 262
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 265
    .end local v0    # "a":Landroid/content/res/TypedArray;
    :cond_0
    new-instance v2, Lcom/google/android/exoplayer2/Timeline$Window;

    invoke-direct {v2}, Lcom/google/android/exoplayer2/Timeline$Window;-><init>()V

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    .line 266
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->formatBuilder:Ljava/lang/StringBuilder;

    .line 267
    new-instance v2, Ljava/util/Formatter;

    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->formatBuilder:Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->formatter:Ljava/util/Formatter;

    .line 268
    new-instance v2, Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;-><init>(Lcom/google/android/exoplayer2/ui/PlaybackControlView;Lcom/google/android/exoplayer2/ui/PlaybackControlView$1;)V

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    .line 269
    sget-object v2, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->DEFAULT_SEEK_DISPATCHER:Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekDispatcher:Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

    .line 271
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-virtual {v2, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 272
    const/high16 v2, 0x40000

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setDescendantFocusability(I)V

    .line 274
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_duration:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->durationView:Landroid/widget/TextView;

    .line 275
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_position:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->positionView:Landroid/widget/TextView;

    .line 276
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_progress:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/SeekBar;

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    .line 277
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    if-eqz v2, :cond_1

    .line 278
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 279
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    const/16 v3, 0x3e8

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 281
    :cond_1
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_play:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    .line 282
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    if-eqz v2, :cond_2

    .line 283
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 285
    :cond_2
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_pause:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    .line 286
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    if-eqz v2, :cond_3

    .line 287
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 289
    :cond_3
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_prev:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->previousButton:Landroid/view/View;

    .line 290
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->previousButton:Landroid/view/View;

    if-eqz v2, :cond_4

    .line 291
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->previousButton:Landroid/view/View;

    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 293
    :cond_4
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_next:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->nextButton:Landroid/view/View;

    .line 294
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->nextButton:Landroid/view/View;

    if-eqz v2, :cond_5

    .line 295
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->nextButton:Landroid/view/View;

    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 297
    :cond_5
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_rew:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindButton:Landroid/view/View;

    .line 298
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindButton:Landroid/view/View;

    if-eqz v2, :cond_6

    .line 299
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindButton:Landroid/view/View;

    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 301
    :cond_6
    sget v2, Lcom/google/android/exoplayer2/R$id;->exo_ffwd:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardButton:Landroid/view/View;

    .line 302
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardButton:Landroid/view/View;

    if-eqz v2, :cond_7

    .line 303
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardButton:Landroid/view/View;

    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 305
    :cond_7
    return-void

    .line 262
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v2
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateProgress()V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updatePlayPauseButton()V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateNavigation()V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->nextButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->next()V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->previousButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->previous()V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForward()V

    return-void
.end method

.method static synthetic access$1800(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewind()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAction:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->dragging:Z

    return v0
.end method

.method static synthetic access$302(Lcom/google/android/exoplayer2/ui/PlaybackControlView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;
    .param p1, "x1"    # Z

    .prologue
    .line 145
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->dragging:Z

    return p1
.end method

.method static synthetic access$400(Lcom/google/android/exoplayer2/ui/PlaybackControlView;I)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;
    .param p1, "x1"    # I

    .prologue
    .line 145
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->positionValue(I)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$500(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->positionView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/android/exoplayer2/ui/PlaybackControlView;J)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;
    .param p1, "x1"    # J

    .prologue
    .line 145
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->stringForTime(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)Lcom/google/android/exoplayer2/ExoPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    return-object v0
.end method

.method static synthetic access$800(Lcom/google/android/exoplayer2/ui/PlaybackControlView;J)V
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;
    .param p1, "x1"    # J

    .prologue
    .line 145
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekTo(J)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/android/exoplayer2/ui/PlaybackControlView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView;

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAfterTimeout()V

    return-void
.end method

.method private fastForward()V
    .locals 4

    .prologue
    .line 623
    iget v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardMs:I

    if-gtz v0, :cond_0

    .line 627
    :goto_0
    return-void

    .line 626
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    iget v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardMs:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekTo(J)V

    goto :goto_0
.end method

.method private hideAfterTimeout()V
    .locals 4

    .prologue
    .line 436
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 437
    iget v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->showTimeoutMs:I

    if-lez v0, :cond_1

    .line 438
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->showTimeoutMs:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAtMs:J

    .line 439
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isAttachedToWindow:Z

    if-eqz v0, :cond_0

    .line 440
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAction:Ljava/lang/Runnable;

    iget v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->showTimeoutMs:I

    int-to-long v2, v1

    invoke-virtual {p0, v0, v2, v3}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 445
    :cond_0
    :goto_0
    return-void

    .line 443
    :cond_1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAtMs:J

    goto :goto_0
.end method

.method private static isHandledMediaKey(I)Z
    .locals 1
    .param p0, "keyCode"    # I

    .prologue
    .line 718
    const/16 v0, 0x5a

    if-eq p0, v0, :cond_0

    const/16 v0, 0x59

    if-eq p0, v0, :cond_0

    const/16 v0, 0x55

    if-eq p0, v0, :cond_0

    const/16 v0, 0x7e

    if-eq p0, v0, :cond_0

    const/16 v0, 0x7f

    if-eq p0, v0, :cond_0

    const/16 v0, 0x57

    if-eq p0, v0, :cond_0

    const/16 v0, 0x58

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private next()V
    .locals 6

    .prologue
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 603
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentTimeline()Lcom/google/android/exoplayer2/Timeline;

    move-result-object v0

    .line 604
    .local v0, "currentTimeline":Lcom/google/android/exoplayer2/Timeline;
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/Timeline;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 613
    :cond_0
    :goto_0
    return-void

    .line 607
    :cond_1
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentWindowIndex()I

    move-result v1

    .line 608
    .local v1, "currentWindowIndex":I
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/Timeline;->getWindowCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_2

    .line 609
    add-int/lit8 v2, v1, 0x1

    invoke-direct {p0, v2, v4, v5}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekTo(IJ)V

    goto :goto_0

    .line 610
    :cond_2
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/Timeline;->getWindow(ILcom/google/android/exoplayer2/Timeline$Window;Z)Lcom/google/android/exoplayer2/Timeline$Window;

    move-result-object v2

    iget-boolean v2, v2, Lcom/google/android/exoplayer2/Timeline$Window;->isDynamic:Z

    if-eqz v2, :cond_0

    .line 611
    invoke-direct {p0, v1, v4, v5}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekTo(IJ)V

    goto :goto_0
.end method

.method private positionValue(I)J
    .locals 6
    .param p1, "progress"    # I

    .prologue
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 583
    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-nez v4, :cond_0

    move-wide v0, v2

    .line 584
    .local v0, "duration":J
    :goto_0
    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    const-wide/16 v2, 0x0

    :goto_1
    return-wide v2

    .line 583
    .end local v0    # "duration":J
    :cond_0
    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v4}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v0

    goto :goto_0

    .line 584
    .restart local v0    # "duration":J
    :cond_1
    int-to-long v2, p1

    mul-long/2addr v2, v0

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    goto :goto_1
.end method

.method private previous()V
    .locals 6

    .prologue
    .line 588
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentTimeline()Lcom/google/android/exoplayer2/Timeline;

    move-result-object v0

    .line 589
    .local v0, "currentTimeline":Lcom/google/android/exoplayer2/Timeline;
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/Timeline;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 600
    :goto_0
    return-void

    .line 592
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentWindowIndex()I

    move-result v1

    .line 593
    .local v1, "currentWindowIndex":I
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/Timeline;->getWindow(ILcom/google/android/exoplayer2/Timeline$Window;)Lcom/google/android/exoplayer2/Timeline$Window;

    .line 594
    if-lez v1, :cond_2

    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v2

    const-wide/16 v4, 0xbb8

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    iget-boolean v2, v2, Lcom/google/android/exoplayer2/Timeline$Window;->isDynamic:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    iget-boolean v2, v2, Lcom/google/android/exoplayer2/Timeline$Window;->isSeekable:Z

    if-nez v2, :cond_2

    .line 596
    :cond_1
    add-int/lit8 v2, v1, -0x1

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    invoke-direct {p0, v2, v4, v5}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekTo(IJ)V

    goto :goto_0

    .line 598
    :cond_2
    const-wide/16 v2, 0x0

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekTo(J)V

    goto :goto_0
.end method

.method private progressBarValue(J)I
    .locals 5
    .param p1, "position"    # J

    .prologue
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 577
    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-nez v4, :cond_1

    move-wide v0, v2

    .line 578
    .local v0, "duration":J
    :goto_0
    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_2

    :cond_0
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 577
    .end local v0    # "duration":J
    :cond_1
    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v4}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v0

    goto :goto_0

    .line 578
    .restart local v0    # "duration":J
    :cond_2
    const-wide/16 v2, 0x3e8

    mul-long/2addr v2, p1

    div-long/2addr v2, v0

    long-to-int v2, v2

    goto :goto_1
.end method

.method private requestPlayPauseFocus()V
    .locals 2

    .prologue
    .line 537
    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlayWhenReady()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    .line 538
    .local v0, "playing":Z
    :goto_0
    if-nez v0, :cond_2

    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    if-eqz v1, :cond_2

    .line 539
    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    .line 543
    :cond_0
    :goto_1
    return-void

    .line 537
    .end local v0    # "playing":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 540
    .restart local v0    # "playing":Z
    :cond_2
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 541
    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    goto :goto_1
.end method

.method private rewind()V
    .locals 4

    .prologue
    .line 616
    iget v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindMs:I

    if-gtz v0, :cond_0

    .line 620
    :goto_0
    return-void

    .line 619
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    iget v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindMs:I

    int-to-long v2, v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekTo(J)V

    goto :goto_0
.end method

.method private seekTo(IJ)V
    .locals 4
    .param p1, "windowIndex"    # I
    .param p2, "positionMs"    # J

    .prologue
    .line 634
    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekDispatcher:Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v1, v2, p1, p2, p3}, Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;->dispatchSeek(Lcom/google/android/exoplayer2/ExoPlayer;IJ)Z

    move-result v0

    .line 635
    .local v0, "dispatched":Z
    if-nez v0, :cond_0

    .line 638
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateProgress()V

    .line 640
    :cond_0
    return-void
.end method

.method private seekTo(J)V
    .locals 1
    .param p1, "positionMs"    # J

    .prologue
    .line 630
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentWindowIndex()I

    move-result v0

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekTo(IJ)V

    .line 631
    return-void
.end method

.method private setButtonEnabled(ZLandroid/view/View;)V
    .locals 3
    .param p1, "enabled"    # Z
    .param p2, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 546
    if-nez p2, :cond_0

    .line 556
    :goto_0
    return-void

    .line 549
    :cond_0
    invoke-virtual {p2, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 550
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_2

    .line 551
    if-eqz p1, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_1
    invoke-direct {p0, p2, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setViewAlphaV11(Landroid/view/View;F)V

    .line 552
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 551
    :cond_1
    const v0, 0x3e99999a    # 0.3f

    goto :goto_1

    .line 554
    :cond_2
    if-eqz p1, :cond_3

    move v0, v1

    :goto_2
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_3
    const/4 v0, 0x4

    goto :goto_2
.end method

.method private setViewAlphaV11(Landroid/view/View;F)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "alpha"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 560
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 561
    return-void
.end method

.method private stringForTime(J)Ljava/lang/String;
    .locals 13
    .param p1, "timeMs"    # J

    .prologue
    .line 564
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v8, p1, v8

    if-nez v8, :cond_0

    .line 565
    const-wide/16 p1, 0x0

    .line 567
    :cond_0
    const-wide/16 v8, 0x1f4

    add-long/2addr v8, p1

    const-wide/16 v10, 0x3e8

    div-long v6, v8, v10

    .line 568
    .local v6, "totalSeconds":J
    const-wide/16 v8, 0x3c

    rem-long v4, v6, v8

    .line 569
    .local v4, "seconds":J
    const-wide/16 v8, 0x3c

    div-long v8, v6, v8

    const-wide/16 v10, 0x3c

    rem-long v2, v8, v10

    .line 570
    .local v2, "minutes":J
    const-wide/16 v8, 0xe10

    div-long v0, v6, v8

    .line 571
    .local v0, "hours":J
    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->formatBuilder:Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 572
    const-wide/16 v8, 0x0

    cmp-long v8, v0, v8

    if-lez v8, :cond_1

    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->formatter:Ljava/util/Formatter;

    const-string/jumbo v9, "%d:%02d:%02d"

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v8

    .line 573
    :goto_0
    return-object v8

    .line 572
    :cond_1
    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->formatter:Ljava/util/Formatter;

    const-string/jumbo v9, "%02d:%02d"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    .line 573
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method private updateAll()V
    .locals 0

    .prologue
    .line 448
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updatePlayPauseButton()V

    .line 449
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateNavigation()V

    .line 450
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateProgress()V

    .line 451
    return-void
.end method

.method private updateNavigation()V
    .locals 10

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 473
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isVisible()Z

    move-result v8

    if-eqz v8, :cond_0

    iget-boolean v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isAttachedToWindow:Z

    if-nez v8, :cond_1

    .line 496
    :cond_0
    :goto_0
    return-void

    .line 476
    :cond_1
    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-eqz v8, :cond_5

    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v8}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentTimeline()Lcom/google/android/exoplayer2/Timeline;

    move-result-object v0

    .line 477
    .local v0, "currentTimeline":Lcom/google/android/exoplayer2/Timeline;
    :goto_1
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/Timeline;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_6

    move v4, v7

    .line 478
    .local v4, "haveNonEmptyTimeline":Z
    :goto_2
    const/4 v5, 0x0

    .line 479
    .local v5, "isSeekable":Z
    const/4 v3, 0x0

    .line 480
    .local v3, "enablePrevious":Z
    const/4 v2, 0x0

    .line 481
    .local v2, "enableNext":Z
    if-eqz v4, :cond_4

    .line 482
    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v8}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentWindowIndex()I

    move-result v1

    .line 483
    .local v1, "currentWindowIndex":I
    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    invoke-virtual {v0, v1, v8}, Lcom/google/android/exoplayer2/Timeline;->getWindow(ILcom/google/android/exoplayer2/Timeline$Window;)Lcom/google/android/exoplayer2/Timeline$Window;

    .line 484
    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    iget-boolean v5, v8, Lcom/google/android/exoplayer2/Timeline$Window;->isSeekable:Z

    .line 485
    if-gtz v1, :cond_2

    if-nez v5, :cond_2

    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    iget-boolean v8, v8, Lcom/google/android/exoplayer2/Timeline$Window;->isDynamic:Z

    if-nez v8, :cond_7

    :cond_2
    move v3, v7

    .line 486
    :goto_3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/Timeline;->getWindowCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-lt v1, v8, :cond_3

    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->currentWindow:Lcom/google/android/exoplayer2/Timeline$Window;

    iget-boolean v8, v8, Lcom/google/android/exoplayer2/Timeline$Window;->isDynamic:Z

    if-eqz v8, :cond_8

    :cond_3
    move v2, v7

    .line 489
    .end local v1    # "currentWindowIndex":I
    :cond_4
    :goto_4
    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->previousButton:Landroid/view/View;

    invoke-direct {p0, v3, v8}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setButtonEnabled(ZLandroid/view/View;)V

    .line 490
    iget-object v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->nextButton:Landroid/view/View;

    invoke-direct {p0, v2, v8}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setButtonEnabled(ZLandroid/view/View;)V

    .line 491
    iget v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardMs:I

    if-lez v8, :cond_9

    if-eqz v5, :cond_9

    move v8, v7

    :goto_5
    iget-object v9, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardButton:Landroid/view/View;

    invoke-direct {p0, v8, v9}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setButtonEnabled(ZLandroid/view/View;)V

    .line 492
    iget v8, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindMs:I

    if-lez v8, :cond_a

    if-eqz v5, :cond_a

    :goto_6
    iget-object v6, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindButton:Landroid/view/View;

    invoke-direct {p0, v7, v6}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setButtonEnabled(ZLandroid/view/View;)V

    .line 493
    iget-object v6, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    if-eqz v6, :cond_0

    .line 494
    iget-object v6, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    invoke-virtual {v6, v5}, Landroid/widget/SeekBar;->setEnabled(Z)V

    goto :goto_0

    .line 476
    .end local v0    # "currentTimeline":Lcom/google/android/exoplayer2/Timeline;
    .end local v2    # "enableNext":Z
    .end local v3    # "enablePrevious":Z
    .end local v4    # "haveNonEmptyTimeline":Z
    .end local v5    # "isSeekable":Z
    :cond_5
    const/4 v0, 0x0

    goto :goto_1

    .restart local v0    # "currentTimeline":Lcom/google/android/exoplayer2/Timeline;
    :cond_6
    move v4, v6

    .line 477
    goto :goto_2

    .restart local v1    # "currentWindowIndex":I
    .restart local v2    # "enableNext":Z
    .restart local v3    # "enablePrevious":Z
    .restart local v4    # "haveNonEmptyTimeline":Z
    .restart local v5    # "isSeekable":Z
    :cond_7
    move v3, v6

    .line 485
    goto :goto_3

    :cond_8
    move v2, v6

    .line 486
    goto :goto_4

    .end local v1    # "currentWindowIndex":I
    :cond_9
    move v8, v6

    .line 491
    goto :goto_5

    :cond_a
    move v7, v6

    .line 492
    goto :goto_6
.end method

.method private updatePlayPauseButton()V
    .locals 7

    .prologue
    const/16 v5, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 454
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isVisible()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isAttachedToWindow:Z

    if-nez v4, :cond_1

    .line 470
    :cond_0
    :goto_0
    return-void

    .line 457
    :cond_1
    const/4 v1, 0x0

    .line 458
    .local v1, "requestPlayPauseFocus":Z
    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v4}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlayWhenReady()Z

    move-result v4

    if-eqz v4, :cond_4

    move v0, v2

    .line 459
    .local v0, "playing":Z
    :goto_1
    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    if-eqz v4, :cond_2

    .line 460
    if-eqz v0, :cond_5

    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->isFocused()Z

    move-result v4

    if-eqz v4, :cond_5

    move v4, v2

    :goto_2
    or-int/2addr v1, v4

    .line 461
    iget-object v6, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->playButton:Landroid/view/View;

    if-eqz v0, :cond_6

    move v4, v5

    :goto_3
    invoke-virtual {v6, v4}, Landroid/view/View;->setVisibility(I)V

    .line 463
    :cond_2
    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    if-eqz v4, :cond_3

    .line 464
    if-nez v0, :cond_7

    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->isFocused()Z

    move-result v4

    if-eqz v4, :cond_7

    :goto_4
    or-int/2addr v1, v2

    .line 465
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->pauseButton:Landroid/view/View;

    if-nez v0, :cond_8

    :goto_5
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 467
    :cond_3
    if-eqz v1, :cond_0

    .line 468
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->requestPlayPauseFocus()V

    goto :goto_0

    .end local v0    # "playing":Z
    :cond_4
    move v0, v3

    .line 458
    goto :goto_1

    .restart local v0    # "playing":Z
    :cond_5
    move v4, v3

    .line 460
    goto :goto_2

    :cond_6
    move v4, v3

    .line 461
    goto :goto_3

    :cond_7
    move v2, v3

    .line 464
    goto :goto_4

    :cond_8
    move v5, v3

    .line 465
    goto :goto_5
.end method

.method private updateProgress()V
    .locals 14

    .prologue
    .line 499
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isVisible()Z

    move-result v7

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isAttachedToWindow:Z

    if-nez v7, :cond_1

    .line 534
    :cond_0
    :goto_0
    return-void

    .line 502
    :cond_1
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-nez v7, :cond_7

    const-wide/16 v4, 0x0

    .line 503
    .local v4, "duration":J
    :goto_1
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-nez v7, :cond_8

    const-wide/16 v8, 0x0

    .line 504
    .local v8, "position":J
    :goto_2
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->durationView:Landroid/widget/TextView;

    if-eqz v7, :cond_2

    .line 505
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->durationView:Landroid/widget/TextView;

    invoke-direct {p0, v4, v5}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->stringForTime(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 507
    :cond_2
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->positionView:Landroid/widget/TextView;

    if-eqz v7, :cond_3

    iget-boolean v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->dragging:Z

    if-nez v7, :cond_3

    .line 508
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->positionView:Landroid/widget/TextView;

    invoke-direct {p0, v8, v9}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->stringForTime(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 511
    :cond_3
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    if-eqz v7, :cond_5

    .line 512
    iget-boolean v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->dragging:Z

    if-nez v7, :cond_4

    .line 513
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    invoke-direct {p0, v8, v9}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBarValue(J)I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 515
    :cond_4
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-nez v7, :cond_9

    const-wide/16 v0, 0x0

    .line 516
    .local v0, "bufferedPosition":J
    :goto_3
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBar:Landroid/widget/SeekBar;

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->progressBarValue(J)I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    .line 519
    .end local v0    # "bufferedPosition":J
    :cond_5
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateProgressAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 521
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-nez v7, :cond_a

    const/4 v6, 0x1

    .line 522
    .local v6, "playbackState":I
    :goto_4
    const/4 v7, 0x1

    if-eq v6, v7, :cond_0

    const/4 v7, 0x4

    if-eq v6, v7, :cond_0

    .line 524
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v7}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlayWhenReady()Z

    move-result v7

    if-eqz v7, :cond_b

    const/4 v7, 0x3

    if-ne v6, v7, :cond_b

    .line 525
    const-wide/16 v10, 0x3e8

    const-wide/16 v12, 0x3e8

    rem-long v12, v8, v12

    sub-long v2, v10, v12

    .line 526
    .local v2, "delayMs":J
    const-wide/16 v10, 0xc8

    cmp-long v7, v2, v10

    if-gez v7, :cond_6

    .line 527
    const-wide/16 v10, 0x3e8

    add-long/2addr v2, v10

    .line 532
    :cond_6
    :goto_5
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateProgressAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v7, v2, v3}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 502
    .end local v2    # "delayMs":J
    .end local v4    # "duration":J
    .end local v6    # "playbackState":I
    .end local v8    # "position":J
    :cond_7
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v7}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v4

    goto :goto_1

    .line 503
    .restart local v4    # "duration":J
    :cond_8
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v7}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v8

    goto :goto_2

    .line 515
    .restart local v8    # "position":J
    :cond_9
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v7}, Lcom/google/android/exoplayer2/ExoPlayer;->getBufferedPosition()J

    move-result-wide v0

    goto :goto_3

    .line 521
    :cond_a
    iget-object v7, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v7}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlaybackState()I

    move-result v6

    goto :goto_4

    .line 530
    .restart local v6    # "playbackState":I
    :cond_b
    const-wide/16 v2, 0x3e8

    .restart local v2    # "delayMs":J
    goto :goto_5
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 667
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->dispatchMediaKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 668
    .local v0, "handled":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 669
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->show()V

    .line 671
    :cond_1
    return v0

    .line 667
    .end local v0    # "handled":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchMediaKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 682
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .line 683
    .local v0, "keyCode":I
    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-eqz v3, :cond_0

    invoke-static {v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isHandledMediaKey(I)Z

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    move v2, v1

    .line 714
    :goto_0
    return v2

    .line 686
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_2

    .line 687
    sparse-switch v0, :sswitch_data_0

    .line 713
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->show()V

    goto :goto_0

    .line 689
    :sswitch_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForward()V

    goto :goto_1

    .line 692
    :sswitch_1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewind()V

    goto :goto_1

    .line 695
    :sswitch_2
    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    iget-object v4, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v4}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlayWhenReady()Z

    move-result v4

    if-nez v4, :cond_3

    move v1, v2

    :cond_3
    invoke-interface {v3, v1}, Lcom/google/android/exoplayer2/ExoPlayer;->setPlayWhenReady(Z)V

    goto :goto_1

    .line 698
    :sswitch_3
    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer2/ExoPlayer;->setPlayWhenReady(Z)V

    goto :goto_1

    .line 701
    :sswitch_4
    iget-object v3, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v3, v1}, Lcom/google/android/exoplayer2/ExoPlayer;->setPlayWhenReady(Z)V

    goto :goto_1

    .line 704
    :sswitch_5
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->next()V

    goto :goto_1

    .line 707
    :sswitch_6
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->previous()V

    goto :goto_1

    .line 687
    :sswitch_data_0
    .sparse-switch
        0x55 -> :sswitch_2
        0x57 -> :sswitch_5
        0x58 -> :sswitch_6
        0x59 -> :sswitch_1
        0x5a -> :sswitch_0
        0x7e -> :sswitch_3
        0x7f -> :sswitch_4
    .end sparse-switch
.end method

.method public getPlayer()Lcom/google/android/exoplayer2/ExoPlayer;
    .locals 1

    .prologue
    .line 311
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    return-object v0
.end method

.method public getShowTimeoutMs()I
    .locals 1

    .prologue
    .line 382
    iget v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->showTimeoutMs:I

    return v0
.end method

.method public hide()V
    .locals 2

    .prologue
    .line 417
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 418
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setVisibility(I)V

    .line 419
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->visibilityListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;

    if-eqz v0, :cond_0

    .line 420
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->visibilityListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;

    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->getVisibility()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;->onVisibilityChange(I)V

    .line 422
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateProgressAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 423
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 424
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAtMs:J

    .line 426
    :cond_1
    return-void
.end method

.method public isVisible()Z
    .locals 1

    .prologue
    .line 432
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAttachedToWindow()V
    .locals 6

    .prologue
    .line 644
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 645
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isAttachedToWindow:Z

    .line 646
    iget-wide v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAtMs:J

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 647
    iget-wide v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAtMs:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 648
    .local v0, "delayMs":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    .line 649
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hide()V

    .line 654
    .end local v0    # "delayMs":J
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateAll()V

    .line 655
    return-void

    .line 651
    .restart local v0    # "delayMs":J
    :cond_1
    iget-object v2, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v2, v0, v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 659
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 660
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isAttachedToWindow:Z

    .line 661
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateProgressAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 662
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 663
    return-void
.end method

.method public setFastForwardIncrementMs(I)V
    .locals 0
    .param p1, "fastForwardMs"    # I

    .prologue
    .line 370
    iput p1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->fastForwardMs:I

    .line 371
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateNavigation()V

    .line 372
    return-void
.end method

.method public setPlayer(Lcom/google/android/exoplayer2/ExoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/google/android/exoplayer2/ExoPlayer;

    .prologue
    .line 320
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-ne v0, p1, :cond_0

    .line 331
    :goto_0
    return-void

    .line 323
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    if-eqz v0, :cond_1

    .line 324
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    iget-object v1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/ExoPlayer;->removeListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 326
    :cond_1
    iput-object p1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->player:Lcom/google/android/exoplayer2/ExoPlayer;

    .line 327
    if-eqz p1, :cond_2

    .line 328
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->componentListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$ComponentListener;

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer2/ExoPlayer;->addListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 330
    :cond_2
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateAll()V

    goto :goto_0
.end method

.method public setRewindIncrementMs(I)V
    .locals 0
    .param p1, "rewindMs"    # I

    .prologue
    .line 359
    iput p1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->rewindMs:I

    .line 360
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateNavigation()V

    .line 361
    return-void
.end method

.method public setSeekDispatcher(Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;)V
    .locals 0
    .param p1, "seekDispatcher"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

    .prologue
    .line 349
    if-nez p1, :cond_0

    sget-object p1, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->DEFAULT_SEEK_DISPATCHER:Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

    .end local p1    # "seekDispatcher":Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;
    :cond_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->seekDispatcher:Lcom/google/android/exoplayer2/ui/PlaybackControlView$SeekDispatcher;

    .line 350
    return-void
.end method

.method public setShowTimeoutMs(I)V
    .locals 0
    .param p1, "showTimeoutMs"    # I

    .prologue
    .line 393
    iput p1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->showTimeoutMs:I

    .line 394
    return-void
.end method

.method public setVisibilityListener(Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;

    .prologue
    .line 339
    iput-object p1, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->visibilityListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;

    .line 340
    return-void
.end method

.method public show()V
    .locals 2

    .prologue
    .line 401
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->isVisible()Z

    move-result v0

    if-nez v0, :cond_1

    .line 402
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->setVisibility(I)V

    .line 403
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->visibilityListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;

    if-eqz v0, :cond_0

    .line 404
    iget-object v0, p0, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->visibilityListener:Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;

    invoke-virtual {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->getVisibility()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/ui/PlaybackControlView$VisibilityListener;->onVisibilityChange(I)V

    .line 406
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->updateAll()V

    .line 407
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->requestPlayPauseFocus()V

    .line 410
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ui/PlaybackControlView;->hideAfterTimeout()V

    .line 411
    return-void
.end method
