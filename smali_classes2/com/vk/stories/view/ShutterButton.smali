.class public Lcom/vk/stories/view/ShutterButton;
.super Landroid/view/View;
.source "ShutterButton.java"


# static fields
.field public static final BORDER_SIZE:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/stories/view/ShutterButton;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final CIRCLE_RADIUS:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/stories/view/ShutterButton;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORWARD_ARROW_ALPHA:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/stories/view/ShutterButton;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final MASKS_BORDER:I

.field private static final MASKS_RADIUS:I

.field private static final NORMAL_BORDER:I

.field private static final NORMAL_RADIUS:I

.field public static final RED_PROGRESS:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/stories/view/ShutterButton;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final RED_PROGRESS_ALPHA:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/stories/view/ShutterButton;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final SHADOW_RATIO:F = 1.36f

.field private static final SHARE_BORDER:I

.field private static final SHARE_RADIUS:I

.field public static final SHUTTER_STATE_MASKS:I = 0x1

.field public static final SHUTTER_STATE_PHOTO:I = 0x0

.field public static final SHUTTER_STATE_RECORDING:I = 0x2

.field public static final SHUTTER_STATE_SHARE:I = 0x3

.field private static final VIDEO_BORDER:I

.field private static final VIDEO_RADIUS:I

.field private static final redColor:I = -0x19b9ba

.field private static final whiteColor:I = -0x1

.field private static final whiteColorPressed:I = -0x141220


# instance fields
.field private animator:Landroid/animation/AnimatorSet;

.field private bgShadow:Landroid/graphics/Bitmap;

.field private final bitmapPaint:Landroid/graphics/Paint;

.field private borderSize:F

.field private final buttonSize:F

.field private circleRadius:F

.field private forwardArrow:Landroid/graphics/Bitmap;

.field private forwardArrowAlpha:F

.field private final fullArrowSize:F

.field private final rectF:Landroid/graphics/RectF;

.field private final redCirclePaint:Landroid/graphics/Paint;

.field private redProgress:F

.field private redProgressAlpha:F

.field private shutterState:I

.field private final touchRect:Landroid/graphics/RectF;

.field private final whiteCirclePaint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/16 v4, 0x38

    const/4 v3, 0x6

    .line 34
    new-instance v0, Lcom/vk/stories/view/ShutterButton$1;

    const-class v1, Ljava/lang/Float;

    const-string/jumbo v2, "circleRadius"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/view/ShutterButton$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/view/ShutterButton;->CIRCLE_RADIUS:Landroid/util/Property;

    .line 46
    new-instance v0, Lcom/vk/stories/view/ShutterButton$2;

    const-class v1, Ljava/lang/Float;

    const-string/jumbo v2, "borderSize"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/view/ShutterButton$2;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/view/ShutterButton;->BORDER_SIZE:Landroid/util/Property;

    .line 58
    new-instance v0, Lcom/vk/stories/view/ShutterButton$3;

    const-class v1, Ljava/lang/Float;

    const-string/jumbo v2, "redProgress"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/view/ShutterButton$3;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/view/ShutterButton;->RED_PROGRESS:Landroid/util/Property;

    .line 70
    new-instance v0, Lcom/vk/stories/view/ShutterButton$4;

    const-class v1, Ljava/lang/Float;

    const-string/jumbo v2, "redProgressAlpha"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/view/ShutterButton$4;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/view/ShutterButton;->RED_PROGRESS_ALPHA:Landroid/util/Property;

    .line 82
    new-instance v0, Lcom/vk/stories/view/ShutterButton$5;

    const-class v1, Ljava/lang/Float;

    const-string/jumbo v2, "forwardArrowAlpha"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/view/ShutterButton$5;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/view/ShutterButton;->FORWARD_ARROW_ALPHA:Landroid/util/Property;

    .line 94
    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/vk/stories/view/ShutterButton;->MASKS_RADIUS:I

    .line 95
    const/16 v0, 0x48

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_RADIUS:I

    .line 96
    const/16 v0, 0x60

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/vk/stories/view/ShutterButton;->VIDEO_RADIUS:I

    .line 97
    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/vk/stories/view/ShutterButton;->SHARE_RADIUS:I

    .line 99
    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/stories/view/ShutterButton;->MASKS_BORDER:I

    .line 100
    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_BORDER:I

    .line 101
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/stories/view/ShutterButton;->VIDEO_BORDER:I

    .line 102
    sget v0, Lcom/vk/stories/view/ShutterButton;->SHARE_RADIUS:I

    sput v0, Lcom/vk/stories/view/ShutterButton;->SHARE_BORDER:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 133
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 110
    const/16 v0, 0x6e

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->buttonSize:F

    .line 111
    const/16 v0, 0x30

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->fullArrowSize:F

    .line 113
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    .line 114
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->redCirclePaint:Landroid/graphics/Paint;

    .line 115
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->bitmapPaint:Landroid/graphics/Paint;

    .line 116
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    .line 117
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->touchRect:Landroid/graphics/RectF;

    .line 122
    sget v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_RADIUS:I

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    .line 123
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->forwardArrowAlpha:F

    .line 124
    sget v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_BORDER:I

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->borderSize:F

    .line 125
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->redProgress:F

    .line 126
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->redProgressAlpha:F

    .line 128
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->shutterState:I

    .line 134
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->init()V

    .line 135
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 138
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 110
    const/16 v0, 0x6e

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->buttonSize:F

    .line 111
    const/16 v0, 0x30

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->fullArrowSize:F

    .line 113
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    .line 114
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->redCirclePaint:Landroid/graphics/Paint;

    .line 115
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->bitmapPaint:Landroid/graphics/Paint;

    .line 116
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    .line 117
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->touchRect:Landroid/graphics/RectF;

    .line 122
    sget v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_RADIUS:I

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    .line 123
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->forwardArrowAlpha:F

    .line 124
    sget v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_BORDER:I

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->borderSize:F

    .line 125
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->redProgress:F

    .line 126
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->redProgressAlpha:F

    .line 128
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->shutterState:I

    .line 139
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->init()V

    .line 140
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 143
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 110
    const/16 v0, 0x6e

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->buttonSize:F

    .line 111
    const/16 v0, 0x30

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->fullArrowSize:F

    .line 113
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    .line 114
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->redCirclePaint:Landroid/graphics/Paint;

    .line 115
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->bitmapPaint:Landroid/graphics/Paint;

    .line 116
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    .line 117
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->touchRect:Landroid/graphics/RectF;

    .line 122
    sget v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_RADIUS:I

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    .line 123
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->forwardArrowAlpha:F

    .line 124
    sget v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_BORDER:I

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->borderSize:F

    .line 125
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->redProgress:F

    .line 126
    iput v2, p0, Lcom/vk/stories/view/ShutterButton;->redProgressAlpha:F

    .line 128
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->shutterState:I

    .line 144
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->init()V

    .line 145
    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    .prologue
    .line 27
    sget v0, Lcom/vk/stories/view/ShutterButton;->SHARE_RADIUS:I

    return v0
.end method

.method static synthetic access$100()I
    .locals 1

    .prologue
    .line 27
    sget v0, Lcom/vk/stories/view/ShutterButton;->SHARE_BORDER:I

    return v0
.end method

.method static synthetic access$200()I
    .locals 1

    .prologue
    .line 27
    sget v0, Lcom/vk/stories/view/ShutterButton;->MASKS_RADIUS:I

    return v0
.end method

.method static synthetic access$300()I
    .locals 1

    .prologue
    .line 27
    sget v0, Lcom/vk/stories/view/ShutterButton;->MASKS_BORDER:I

    return v0
.end method

.method static synthetic access$402(Lcom/vk/stories/view/ShutterButton;Landroid/animation/AnimatorSet;)Landroid/animation/AnimatorSet;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/ShutterButton;
    .param p1, "x1"    # Landroid/animation/AnimatorSet;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    return-object p1
.end method

.method private cancelCurrentAnimator()V
    .locals 1

    .prologue
    .line 488
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    .line 489
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 490
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    .line 492
    :cond_0
    return-void
.end method

.method private createAnimatorSet()Landroid/animation/AnimatorSet;
    .locals 2

    .prologue
    .line 495
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 496
    .local v0, "defaultAnimator":Landroid/animation/AnimatorSet;
    new-instance v1, Lcom/vk/stories/view/ShutterButton$11;

    invoke-direct {v1, p0}, Lcom/vk/stories/view/ShutterButton$11;-><init>(Lcom/vk/stories/view/ShutterButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 508
    return-object v0
.end method

.method private static fillRectFWithCircleSize(FFLandroid/graphics/RectF;F)V
    .locals 4
    .param p0, "cx"    # F
    .param p1, "cy"    # F
    .param p2, "rect"    # Landroid/graphics/RectF;
    .param p3, "r"    # F

    .prologue
    .line 512
    sub-float v0, p0, p3

    sub-float v1, p1, p3

    add-float v2, p0, p3

    add-float v3, p1, p3

    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 513
    return-void
.end method

.method private fillTouchRect()V
    .locals 7

    .prologue
    .line 163
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v0, v2

    .line 164
    .local v0, "cx":F
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v1, v2

    .line 165
    .local v1, "cy":F
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton;->touchRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    sub-float v3, v0, v3

    iget v4, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    sub-float v4, v1, v4

    iget v5, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    add-float/2addr v5, v0

    iget v6, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    add-float/2addr v6, v1

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 171
    return-void
.end method

.method private init()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 148
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 149
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 150
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02007c

    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/view/ShutterButton;->bgShadow:Landroid/graphics/Bitmap;

    .line 151
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0201b7

    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/view/ShutterButton;->forwardArrow:Landroid/graphics/Bitmap;

    .line 153
    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 154
    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 156
    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->redCirclePaint:Landroid/graphics/Paint;

    const v2, -0x19b9ba

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 157
    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->redCirclePaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 159
    invoke-virtual {p0, v3}, Lcom/vk/stories/view/ShutterButton;->toPhotoShutter(Z)Landroid/animation/AnimatorSet;

    .line 160
    return-void
.end method


# virtual methods
.method public canHandleTouch(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->touchRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    return v0
.end method

.method public getBorderSize()F
    .locals 1

    .prologue
    .line 265
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->borderSize:F

    return v0
.end method

.method public getCircleRadius()F
    .locals 1

    .prologue
    .line 255
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    return v0
.end method

.method public getForwardArrowAlpha()F
    .locals 1

    .prologue
    .line 274
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->forwardArrowAlpha:F

    return v0
.end method

.method public getRedProgress()F
    .locals 1

    .prologue
    .line 283
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->redProgress:F

    return v0
.end method

.method public getRedProgressAlpha()F
    .locals 1

    .prologue
    .line 292
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->redProgressAlpha:F

    return v0
.end method

.method public getShutterState()I
    .locals 1

    .prologue
    .line 251
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->shutterState:I

    return v0
.end method

.method public hasOverlappingRendering()Z
    .locals 1

    .prologue
    .line 184
    const/4 v0, 0x0

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v13, 0x0

    const/high16 v12, 0x437f0000    # 255.0f

    const/high16 v11, 0x40000000    # 2.0f

    .line 189
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 191
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v7, v0

    .line 192
    .local v7, "cx":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v8, v0

    .line 193
    .local v8, "cy":F
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/vk/stories/view/ShutterButton;->borderSize:F

    div-float/2addr v1, v11

    sub-float v9, v0, v1

    .line 196
    .local v9, "radius":F
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    const v1, 0x3fae147b    # 1.36f

    mul-float v10, v0, v1

    .line 197
    .local v10, "shadowSize":F
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    sub-float v1, v7, v10

    sub-float v2, v8, v10

    add-float v3, v7, v10

    add-float v4, v8, v10

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 198
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->bitmapPaint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 199
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->bgShadow:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v13, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 202
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/stories/view/ShutterButton;->borderSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 203
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v8, v9, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 206
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->redCirclePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/stories/view/ShutterButton;->borderSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 207
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->redCirclePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/stories/view/ShutterButton;->redProgressAlpha:F

    mul-float/2addr v1, v12

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 208
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    invoke-static {v7, v8, v0, v9}, Lcom/vk/stories/view/ShutterButton;->fillRectFWithCircleSize(FFLandroid/graphics/RectF;F)V

    .line 209
    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    const/high16 v2, -0x3d4c0000    # -90.0f

    const/high16 v0, 0x43b40000    # 360.0f

    iget v3, p0, Lcom/vk/stories/view/ShutterButton;->redProgress:F

    mul-float/2addr v3, v0

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vk/stories/view/ShutterButton;->redCirclePaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 212
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->fullArrowSize:F

    div-float/2addr v0, v11

    float-to-int v6, v0

    .line 213
    .local v6, "arrowSize":I
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    int-to-float v1, v6

    sub-float v1, v7, v1

    int-to-float v2, v6

    sub-float v2, v8, v2

    int-to-float v3, v6

    add-float/2addr v3, v7

    int-to-float v4, v6

    add-float/2addr v4, v8

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 214
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->bitmapPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/stories/view/ShutterButton;->forwardArrowAlpha:F

    mul-float/2addr v1, v12

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 215
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->forwardArrow:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->rectF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v13, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 216
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 246
    iget v0, p0, Lcom/vk/stories/view/ShutterButton;->buttonSize:F

    float-to-int v0, v0

    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iget v1, p0, Lcom/vk/stories/view/ShutterButton;->buttonSize:F

    float-to-int v1, v1

    .line 247
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 246
    invoke-super {p0, v0, v1}, Landroid/view/View;->onMeasure(II)V

    .line 248
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 179
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->fillTouchRect()V

    .line 180
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 220
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 221
    .local v0, "action":I
    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/vk/stories/view/ShutterButton;->canHandleTouch(Landroid/view/MotionEvent;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 222
    const/4 v1, 0x0

    .line 230
    :goto_0
    return v1

    .line 224
    :cond_0
    if-nez v0, :cond_2

    .line 225
    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    const v2, -0x141220

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 229
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->invalidate()V

    .line 230
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_0

    .line 226
    :cond_2
    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 227
    :cond_3
    iget-object v1, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1
.end method

.method public setBorderSize(F)V
    .locals 0
    .param p1, "borderSize"    # F

    .prologue
    .line 269
    iput p1, p0, Lcom/vk/stories/view/ShutterButton;->borderSize:F

    .line 270
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->invalidate()V

    .line 271
    return-void
.end method

.method public setCircleRadius(F)V
    .locals 0
    .param p1, "circleRadius"    # F

    .prologue
    .line 259
    iput p1, p0, Lcom/vk/stories/view/ShutterButton;->circleRadius:F

    .line 260
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->fillTouchRect()V

    .line 261
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->invalidate()V

    .line 262
    return-void
.end method

.method public setForwardArrowAlpha(F)V
    .locals 0
    .param p1, "forwardArrowAlpha"    # F

    .prologue
    .line 278
    iput p1, p0, Lcom/vk/stories/view/ShutterButton;->forwardArrowAlpha:F

    .line 279
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->invalidate()V

    .line 280
    return-void
.end method

.method public setPressed(Z)V
    .locals 2
    .param p1, "pressed"    # Z

    .prologue
    .line 235
    invoke-super {p0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 236
    if-eqz p1, :cond_0

    .line 237
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    const v1, -0x141220

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 241
    :goto_0
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->invalidate()V

    .line 242
    return-void

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->whiteCirclePaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0
.end method

.method public setRedProgress(F)V
    .locals 0
    .param p1, "redProgress"    # F

    .prologue
    .line 287
    iput p1, p0, Lcom/vk/stories/view/ShutterButton;->redProgress:F

    .line 288
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->invalidate()V

    .line 289
    return-void
.end method

.method public setRedProgressAlpha(F)V
    .locals 0
    .param p1, "redProgressAlpha"    # F

    .prologue
    .line 296
    iput p1, p0, Lcom/vk/stories/view/ShutterButton;->redProgressAlpha:F

    .line 297
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->invalidate()V

    .line 298
    return-void
.end method

.method public toArrowShutter(Z)Landroid/animation/AnimatorSet;
    .locals 14
    .param p1, "anim"    # Z

    .prologue
    const/16 v5, 0x28

    const/4 v11, 0x3

    const-wide/16 v12, 0x177

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 361
    iput v11, p0, Lcom/vk/stories/view/ShutterButton;->shutterState:I

    .line 363
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->cancelCurrentAnimator()V

    .line 365
    if-eqz p1, :cond_1

    .line 366
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 369
    .local v2, "vp":Landroid/view/View;
    if-eqz v2, :cond_0

    .line 370
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    sub-int v0, v3, v4

    .line 371
    .local v0, "tx":I
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    sub-int v1, v3, v4

    .line 377
    .local v1, "ty":I
    :goto_0
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    .line 378
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    const/4 v4, 0x6

    new-array v4, v4, [Landroid/animation/Animator;

    sget-object v5, Lcom/vk/stories/view/ShutterButton;->RED_PROGRESS_ALPHA:Landroid/util/Property;

    new-array v6, v10, [F

    const/4 v7, 0x0

    aput v7, v6, v9

    .line 379
    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xc3

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v4, v9

    sget-object v5, Lcom/vk/stories/view/ShutterButton;->FORWARD_ARROW_ALPHA:Landroid/util/Property;

    new-array v6, v10, [F

    const/high16 v7, 0x3f800000    # 1.0f

    aput v7, v6, v9

    .line 380
    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v6, 0xe1

    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    const/16 v6, 0x96

    invoke-static {v5, v6}, Lcom/vk/core/util/AnimationUtils;->delay(Landroid/animation/Animator;I)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v4, v10

    const/4 v5, 0x2

    sget-object v6, Lcom/vk/stories/view/ShutterButton;->CIRCLE_RADIUS:Landroid/util/Property;

    new-array v7, v10, [F

    sget v8, Lcom/vk/stories/view/ShutterButton;->SHARE_RADIUS:I

    int-to-float v8, v8

    aput v8, v7, v9

    .line 381
    invoke-static {p0, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    invoke-virtual {v6, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v6

    invoke-static {v6}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v6

    aput-object v6, v4, v5

    sget-object v5, Lcom/vk/stories/view/ShutterButton;->BORDER_SIZE:Landroid/util/Property;

    new-array v6, v10, [F

    sget v7, Lcom/vk/stories/view/ShutterButton;->SHARE_BORDER:I

    int-to-float v7, v7

    aput v7, v6, v9

    .line 382
    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v4, v11

    const/4 v5, 0x4

    sget-object v6, Lcom/vk/stories/view/ShutterButton;->TRANSLATION_X:Landroid/util/Property;

    new-array v7, v10, [F

    int-to-float v8, v0

    aput v8, v7, v9

    .line 383
    invoke-static {p0, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    invoke-virtual {v6, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v6

    invoke-static {v6}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x5

    sget-object v6, Lcom/vk/stories/view/ShutterButton;->TRANSLATION_Y:Landroid/util/Property;

    new-array v7, v10, [F

    int-to-float v8, v1

    aput v8, v7, v9

    .line 384
    invoke-static {p0, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    invoke-virtual {v6, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v6

    invoke-static {v6}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v6

    aput-object v6, v4, v5

    .line 378
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 386
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    new-instance v4, Lcom/vk/stories/view/ShutterButton$7;

    invoke-direct {v4, p0}, Lcom/vk/stories/view/ShutterButton$7;-><init>(Lcom/vk/stories/view/ShutterButton;)V

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 396
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 423
    .end local v0    # "tx":I
    .end local v1    # "ty":I
    .end local v2    # "vp":Landroid/view/View;
    :goto_1
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    return-object v3

    .line 373
    .restart local v2    # "vp":Landroid/view/View;
    :cond_0
    const/4 v0, 0x0

    .line 374
    .restart local v0    # "tx":I
    const/4 v1, 0x0

    .restart local v1    # "ty":I
    goto/16 :goto_0

    .line 400
    .end local v0    # "tx":I
    .end local v1    # "ty":I
    .end local v2    # "vp":Landroid/view/View;
    :cond_1
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    new-instance v4, Lcom/vk/stories/view/ShutterButton$8;

    invoke-direct {v4, p0}, Lcom/vk/stories/view/ShutterButton$8;-><init>(Lcom/vk/stories/view/ShutterButton;)V

    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_1
.end method

.method public toMasksShutter(Z)Landroid/animation/AnimatorSet;
    .locals 13
    .param p1, "anim"    # Z

    .prologue
    const/4 v12, 0x0

    const-wide/16 v10, 0x177

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 427
    iput v8, p0, Lcom/vk/stories/view/ShutterButton;->shutterState:I

    .line 429
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->cancelCurrentAnimator()V

    .line 431
    if-eqz p1, :cond_1

    .line 432
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 434
    .local v1, "vp":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 435
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    const/16 v3, 0x30

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    sub-int v0, v2, v3

    .line 440
    .local v0, "ty":I
    :goto_0
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    .line 441
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    const/4 v3, 0x6

    new-array v3, v3, [Landroid/animation/Animator;

    sget-object v4, Lcom/vk/stories/view/ShutterButton;->RED_PROGRESS_ALPHA:Landroid/util/Property;

    new-array v5, v8, [F

    aput v12, v5, v9

    .line 442
    invoke-static {p0, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    const-wide/16 v6, 0xc3

    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v9

    sget-object v4, Lcom/vk/stories/view/ShutterButton;->FORWARD_ARROW_ALPHA:Landroid/util/Property;

    new-array v5, v8, [F

    aput v12, v5, v9

    .line 443
    invoke-static {p0, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    const-wide/16 v6, 0xe1

    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v4

    const/16 v5, 0x96

    invoke-static {v4, v5}, Lcom/vk/core/util/AnimationUtils;->delay(Landroid/animation/Animator;I)Landroid/animation/Animator;

    move-result-object v4

    aput-object v4, v3, v8

    const/4 v4, 0x2

    sget-object v5, Lcom/vk/stories/view/ShutterButton;->CIRCLE_RADIUS:Landroid/util/Property;

    new-array v6, v8, [F

    sget v7, Lcom/vk/stories/view/ShutterButton;->MASKS_RADIUS:I

    int-to-float v7, v7

    aput v7, v6, v9

    .line 444
    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    sget-object v5, Lcom/vk/stories/view/ShutterButton;->BORDER_SIZE:Landroid/util/Property;

    new-array v6, v8, [F

    sget v7, Lcom/vk/stories/view/ShutterButton;->MASKS_BORDER:I

    int-to-float v7, v7

    aput v7, v6, v9

    .line 445
    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    sget-object v5, Lcom/vk/stories/view/ShutterButton;->TRANSLATION_X:Landroid/util/Property;

    new-array v6, v8, [F

    aput v12, v6, v9

    .line 446
    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    sget-object v5, Lcom/vk/stories/view/ShutterButton;->TRANSLATION_Y:Landroid/util/Property;

    new-array v6, v8, [F

    int-to-float v7, v0

    aput v7, v6, v9

    .line 447
    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v5

    aput-object v5, v3, v4

    .line 441
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 449
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    new-instance v3, Lcom/vk/stories/view/ShutterButton$9;

    invoke-direct {v3, p0}, Lcom/vk/stories/view/ShutterButton$9;-><init>(Lcom/vk/stories/view/ShutterButton;)V

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 459
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 484
    .end local v0    # "ty":I
    .end local v1    # "vp":Landroid/view/View;
    :goto_1
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    return-object v2

    .line 437
    .restart local v1    # "vp":Landroid/view/View;
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "ty":I
    goto/16 :goto_0

    .line 463
    .end local v0    # "ty":I
    .end local v1    # "vp":Landroid/view/View;
    :cond_1
    invoke-virtual {p0}, Lcom/vk/stories/view/ShutterButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v3, Lcom/vk/stories/view/ShutterButton$10;

    invoke-direct {v3, p0}, Lcom/vk/stories/view/ShutterButton$10;-><init>(Lcom/vk/stories/view/ShutterButton;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_1
.end method

.method public toPhotoShutter(Z)Landroid/animation/AnimatorSet;
    .locals 12
    .param p1, "anim"    # Z

    .prologue
    const-wide/16 v4, 0xc3

    const-wide/16 v10, 0x177

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 301
    iput v7, p0, Lcom/vk/stories/view/ShutterButton;->shutterState:I

    .line 303
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->cancelCurrentAnimator()V

    .line 304
    if-eqz p1, :cond_0

    .line 305
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    .line 306
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    const/4 v1, 0x6

    new-array v1, v1, [Landroid/animation/Animator;

    sget-object v2, Lcom/vk/stories/view/ShutterButton;->RED_PROGRESS_ALPHA:Landroid/util/Property;

    new-array v3, v8, [F

    aput v6, v3, v7

    .line 307
    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v1, v7

    sget-object v2, Lcom/vk/stories/view/ShutterButton;->FORWARD_ARROW_ALPHA:Landroid/util/Property;

    new-array v3, v8, [F

    aput v6, v3, v7

    .line 308
    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v1, v8

    const/4 v2, 0x2

    sget-object v3, Lcom/vk/stories/view/ShutterButton;->CIRCLE_RADIUS:Landroid/util/Property;

    new-array v4, v8, [F

    sget v5, Lcom/vk/stories/view/ShutterButton;->NORMAL_RADIUS:I

    int-to-float v5, v5

    aput v5, v4, v7

    .line 309
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    sget-object v3, Lcom/vk/stories/view/ShutterButton;->BORDER_SIZE:Landroid/util/Property;

    new-array v4, v8, [F

    sget v5, Lcom/vk/stories/view/ShutterButton;->NORMAL_BORDER:I

    int-to-float v5, v5

    aput v5, v4, v7

    .line 310
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    sget-object v3, Lcom/vk/stories/view/ShutterButton;->TRANSLATION_X:Landroid/util/Property;

    new-array v4, v8, [F

    aput v6, v4, v7

    .line 311
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    sget-object v3, Lcom/vk/stories/view/ShutterButton;->TRANSLATION_Y:Landroid/util/Property;

    new-array v4, v8, [F

    aput v6, v4, v7

    .line 312
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 306
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 314
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    new-instance v1, Lcom/vk/stories/view/ShutterButton$6;

    invoke-direct {v1, p0}, Lcom/vk/stories/view/ShutterButton$6;-><init>(Lcom/vk/stories/view/ShutterButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 320
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 330
    :goto_0
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    return-object v0

    .line 322
    :cond_0
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 323
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setRedProgressAlpha(F)V

    .line 324
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setForwardArrowAlpha(F)V

    .line 325
    sget v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_RADIUS:I

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/ShutterButton;->setCircleRadius(F)V

    .line 326
    sget v0, Lcom/vk/stories/view/ShutterButton;->NORMAL_BORDER:I

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/ShutterButton;->setBorderSize(F)V

    .line 327
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setTranslationX(F)V

    .line 328
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setTranslationY(F)V

    goto :goto_0
.end method

.method public toRecordingShutter(Z)Landroid/animation/AnimatorSet;
    .locals 12
    .param p1, "anim"    # Z

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    const-wide/16 v10, 0x177

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 334
    const/4 v0, 0x2

    iput v0, p0, Lcom/vk/stories/view/ShutterButton;->shutterState:I

    .line 336
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 337
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->cancelCurrentAnimator()V

    .line 338
    if-eqz p1, :cond_0

    .line 339
    invoke-direct {p0}, Lcom/vk/stories/view/ShutterButton;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    .line 340
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    const/4 v1, 0x6

    new-array v1, v1, [Landroid/animation/Animator;

    sget-object v2, Lcom/vk/stories/view/ShutterButton;->RED_PROGRESS_ALPHA:Landroid/util/Property;

    new-array v3, v8, [F

    aput v4, v3, v7

    .line 341
    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    const-wide/16 v4, 0xc3

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v1, v7

    sget-object v2, Lcom/vk/stories/view/ShutterButton;->FORWARD_ARROW_ALPHA:Landroid/util/Property;

    new-array v3, v8, [F

    aput v6, v3, v7

    .line 342
    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    const-wide/16 v4, 0xc3

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v1, v8

    const/4 v2, 0x2

    sget-object v3, Lcom/vk/stories/view/ShutterButton;->CIRCLE_RADIUS:Landroid/util/Property;

    new-array v4, v8, [F

    sget v5, Lcom/vk/stories/view/ShutterButton;->VIDEO_RADIUS:I

    int-to-float v5, v5

    aput v5, v4, v7

    .line 343
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    sget-object v3, Lcom/vk/stories/view/ShutterButton;->BORDER_SIZE:Landroid/util/Property;

    new-array v4, v8, [F

    sget v5, Lcom/vk/stories/view/ShutterButton;->VIDEO_BORDER:I

    int-to-float v5, v5

    aput v5, v4, v7

    .line 344
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    sget-object v3, Lcom/vk/stories/view/ShutterButton;->TRANSLATION_X:Landroid/util/Property;

    new-array v4, v8, [F

    aput v6, v4, v7

    .line 345
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    sget-object v3, Lcom/vk/stories/view/ShutterButton;->TRANSLATION_Y:Landroid/util/Property;

    new-array v4, v8, [F

    aput v6, v4, v7

    .line 346
    invoke-static {p0, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 340
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 348
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 357
    :goto_0
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton;->animator:Landroid/animation/AnimatorSet;

    return-object v0

    .line 350
    :cond_0
    invoke-virtual {p0, v4}, Lcom/vk/stories/view/ShutterButton;->setRedProgressAlpha(F)V

    .line 351
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setForwardArrowAlpha(F)V

    .line 352
    sget v0, Lcom/vk/stories/view/ShutterButton;->VIDEO_RADIUS:I

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/ShutterButton;->setCircleRadius(F)V

    .line 353
    sget v0, Lcom/vk/stories/view/ShutterButton;->VIDEO_BORDER:I

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/ShutterButton;->setBorderSize(F)V

    .line 354
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setTranslationX(F)V

    .line 355
    invoke-virtual {p0, v6}, Lcom/vk/stories/view/ShutterButton;->setTranslationY(F)V

    goto :goto_0
.end method
