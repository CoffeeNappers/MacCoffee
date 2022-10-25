.class public Lcom/vk/attachpicker/widget/EditButton;
.super Landroid/widget/FrameLayout;
.source "EditButton.java"


# static fields
.field private static final ANIMATION_DURATION:J = 0x12cL

.field private static final CHANGE_PERIOD:J = 0x5dcL

.field private static final ICONS:[I

.field private static final TRIM_ICON:I = 0x7f02037f


# instance fields
.field private currentIconIndex:I

.field private final handler:Landroid/os/Handler;

.field private icon1:Landroid/widget/ImageView;

.field private icon2:Landroid/widget/ImageView;

.field private final iconChangeRunnable:Ljava/lang/Runnable;

.field private isAttachedToWindow:Z

.field private trimMode:Z

.field private trimModeSetDone:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vk/attachpicker/widget/EditButton;->ICONS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f020372
        0x7f020375
        0x7f02035b
        0x7f020356
        0x7f020369
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 32
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    .line 130
    new-instance v0, Lcom/vk/attachpicker/widget/EditButton$1;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/EditButton$1;-><init>(Lcom/vk/attachpicker/widget/EditButton;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    .line 46
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/EditButton;->init()V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    .line 130
    new-instance v0, Lcom/vk/attachpicker/widget/EditButton$1;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/EditButton$1;-><init>(Lcom/vk/attachpicker/widget/EditButton;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    .line 51
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/EditButton;->init()V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 55
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    .line 130
    new-instance v0, Lcom/vk/attachpicker/widget/EditButton$1;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/EditButton$1;-><init>(Lcom/vk/attachpicker/widget/EditButton;)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    .line 56
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/EditButton;->init()V

    .line 57
    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/widget/EditButton;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;

    .prologue
    .line 17
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->isAttachedToWindow:Z

    return v0
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/widget/EditButton;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;

    .prologue
    .line 17
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->trimMode:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/widget/EditButton;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;

    .prologue
    .line 17
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->trimModeSetDone:Z

    return v0
.end method

.method static synthetic access$202(Lcom/vk/attachpicker/widget/EditButton;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;
    .param p1, "x1"    # Z

    .prologue
    .line 17
    iput-boolean p1, p0, Lcom/vk/attachpicker/widget/EditButton;->trimModeSetDone:Z

    return p1
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/widget/EditButton;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;

    .prologue
    .line 17
    iget v0, p0, Lcom/vk/attachpicker/widget/EditButton;->currentIconIndex:I

    return v0
.end method

.method static synthetic access$302(Lcom/vk/attachpicker/widget/EditButton;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;
    .param p1, "x1"    # I

    .prologue
    .line 17
    iput p1, p0, Lcom/vk/attachpicker/widget/EditButton;->currentIconIndex:I

    return p1
.end method

.method static synthetic access$400()[I
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/vk/attachpicker/widget/EditButton;->ICONS:[I

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/widget/EditButton;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon1:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/attachpicker/widget/EditButton;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon2:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$700(Landroid/widget/ImageView;Landroid/widget/ImageView;I)Landroid/animation/AnimatorSet;
    .locals 1
    .param p0, "x0"    # Landroid/widget/ImageView;
    .param p1, "x1"    # Landroid/widget/ImageView;
    .param p2, "x2"    # I

    .prologue
    .line 17
    invoke-static {p0, p1, p2}, Lcom/vk/attachpicker/widget/EditButton;->createImageChangeSet(Landroid/widget/ImageView;Landroid/widget/ImageView;I)Landroid/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lcom/vk/attachpicker/widget/EditButton;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vk/attachpicker/widget/EditButton;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/EditButton;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method private static createImageChangeSet(Landroid/widget/ImageView;Landroid/widget/ImageView;I)Landroid/animation/AnimatorSet;
    .locals 6
    .param p0, "icon1"    # Landroid/widget/ImageView;
    .param p1, "icon2"    # Landroid/widget/ImageView;
    .param p2, "resId"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x2

    .line 161
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 162
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 163
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 165
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 166
    .local v0, "set":Landroid/animation/AnimatorSet;
    const/4 v1, 0x5

    new-array v1, v1, [Landroid/animation/Animator;

    const-string/jumbo v2, "scaleX"

    new-array v3, v5, [F

    fill-array-data v3, :array_0

    .line 167
    invoke-static {p1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string/jumbo v3, "scaleY"

    new-array v4, v5, [F

    fill-array-data v4, :array_1

    .line 168
    invoke-static {p1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const-string/jumbo v2, "scaleX"

    new-array v3, v5, [F

    fill-array-data v3, :array_2

    .line 169
    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v5

    const/4 v2, 0x3

    const-string/jumbo v3, "scaleY"

    new-array v4, v5, [F

    fill-array-data v4, :array_3

    .line 170
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "alpha"

    new-array v4, v5, [F

    fill-array-data v4, :array_4

    .line 171
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 166
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 173
    new-instance v1, Lcom/vk/attachpicker/widget/EditButton$2;

    invoke-direct {v1, p0, p2}, Lcom/vk/attachpicker/widget/EditButton$2;-><init>(Landroid/widget/ImageView;I)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 189
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 190
    return-object v0

    .line 166
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 167
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 168
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 169
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 170
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private init()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 60
    const/16 v0, 0xc

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    const/16 v1, 0x14

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-virtual {p0, v0, v2, v1, v2}, Lcom/vk/attachpicker/widget/EditButton;->setPadding(IIII)V

    .line 61
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/EditButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03019b

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 62
    const v0, 0x7f10046d

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/EditButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon1:Landroid/widget/ImageView;

    .line 63
    const v0, 0x7f10046e

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/EditButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon2:Landroid/widget/ImageView;

    .line 64
    return-void
.end method

.method private start()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 108
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/EditButton;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 109
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon1:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 110
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon1:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 111
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon1:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 112
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon1:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 113
    iget-object v1, p0, Lcom/vk/attachpicker/widget/EditButton;->icon1:Landroid/widget/ImageView;

    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->trimMode:Z

    if-eqz v0, :cond_0

    const v0, 0x7f02037f

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 116
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->icon2:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 117
    iput v2, p0, Lcom/vk/attachpicker/widget/EditButton;->currentIconIndex:I

    .line 119
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 120
    iget-object v2, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->trimMode:Z

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x0

    :goto_1
    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 124
    :goto_2
    return-void

    .line 113
    :cond_0
    sget-object v0, Lcom/vk/attachpicker/widget/EditButton;->ICONS:[I

    aget v0, v0, v2

    goto :goto_0

    .line 120
    :cond_1
    const-wide/16 v0, 0x5dc

    goto :goto_1

    .line 122
    :cond_2
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_2
.end method

.method private stop()V
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 128
    return-void
.end method


# virtual methods
.method public isTrimMode()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->trimMode:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 95
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 96
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->isAttachedToWindow:Z

    .line 97
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/EditButton;->start()V

    .line 98
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 102
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 103
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->isAttachedToWindow:Z

    .line 104
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/EditButton;->stop()V

    .line 105
    return-void
.end method

.method public setTrimMode(Z)V
    .locals 4
    .param p1, "trimMode"    # Z

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->trimMode:Z

    if-eq v0, p1, :cond_0

    .line 72
    iput-boolean p1, p0, Lcom/vk/attachpicker/widget/EditButton;->trimMode:Z

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/widget/EditButton;->trimModeSetDone:Z

    .line 75
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 76
    iget-object v0, p0, Lcom/vk/attachpicker/widget/EditButton;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/attachpicker/widget/EditButton;->iconChangeRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 78
    :cond_0
    return-void
.end method

.method public setVisibility(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/EditButton;->getVisibility()I

    move-result v0

    .line 83
    .local v0, "prevVisibility":I
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 84
    if-nez p1, :cond_1

    .line 85
    if-eqz v0, :cond_0

    .line 86
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/EditButton;->start()V

    .line 91
    :cond_0
    :goto_0
    return-void

    .line 89
    :cond_1
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/EditButton;->stop()V

    goto :goto_0
.end method
