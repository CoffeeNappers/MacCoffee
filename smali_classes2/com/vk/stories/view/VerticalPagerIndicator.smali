.class public Lcom/vk/stories/view/VerticalPagerIndicator;
.super Landroid/view/View;
.source "VerticalPagerIndicator.java"


# static fields
.field public static final CURRENT_SCROLL_OFFSET:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/stories/view/VerticalPagerIndicator;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final interpolator:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field private circleInterval:I

.field private circleSize:I

.field private colorNotSelected:I

.field private colorSelected:I

.field private currentOffsetAnimator:Landroid/animation/ObjectAnimator;

.field private currentPosition:I

.field private currentScrollOffset:F

.field private itemsCount:I

.field private final paint:Landroid/graphics/Paint;

.field private final strokePaint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 22
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    sput-object v0, Lcom/vk/stories/view/VerticalPagerIndicator;->interpolator:Landroid/view/animation/DecelerateInterpolator;

    .line 24
    new-instance v0, Lcom/vk/stories/view/VerticalPagerIndicator$1;

    const-class v1, Ljava/lang/Float;

    const-string/jumbo v2, "currentScrollOffset"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/view/VerticalPagerIndicator$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/view/VerticalPagerIndicator;->CURRENT_SCROLL_OFFSET:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 52
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 37
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->paint:Landroid/graphics/Paint;

    .line 38
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->strokePaint:Landroid/graphics/Paint;

    .line 39
    const/16 v0, 0x18

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    .line 40
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->colorSelected:I

    .line 43
    const v0, 0x7fffffff

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->colorNotSelected:I

    .line 53
    invoke-direct {p0}, Lcom/vk/stories/view/VerticalPagerIndicator;->init()V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x1

    .line 57
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->paint:Landroid/graphics/Paint;

    .line 38
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->strokePaint:Landroid/graphics/Paint;

    .line 39
    const/16 v0, 0x18

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    .line 40
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->colorSelected:I

    .line 43
    const v0, 0x7fffffff

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->colorNotSelected:I

    .line 58
    invoke-direct {p0}, Lcom/vk/stories/view/VerticalPagerIndicator;->init()V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x1

    .line 62
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->paint:Landroid/graphics/Paint;

    .line 38
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->strokePaint:Landroid/graphics/Paint;

    .line 39
    const/16 v0, 0x18

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    .line 40
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->colorSelected:I

    .line 43
    const v0, 0x7fffffff

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->colorNotSelected:I

    .line 63
    invoke-direct {p0}, Lcom/vk/stories/view/VerticalPagerIndicator;->init()V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/vk/stories/view/VerticalPagerIndicator;I)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/VerticalPagerIndicator;
    .param p1, "x1"    # I

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vk/stories/view/VerticalPagerIndicator;->getRawYForPosition(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/vk/stories/view/VerticalPagerIndicator;)F
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/VerticalPagerIndicator;

    .prologue
    .line 20
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentScrollOffset:F

    return v0
.end method

.method static synthetic access$200(Lcom/vk/stories/view/VerticalPagerIndicator;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/VerticalPagerIndicator;

    .prologue
    .line 20
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    return v0
.end method

.method static synthetic access$300(Lcom/vk/stories/view/VerticalPagerIndicator;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/VerticalPagerIndicator;

    .prologue
    .line 20
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentPosition:I

    return v0
.end method

.method static synthetic access$302(Lcom/vk/stories/view/VerticalPagerIndicator;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/VerticalPagerIndicator;
    .param p1, "x1"    # I

    .prologue
    .line 20
    iput p1, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentPosition:I

    return p1
.end method

.method static synthetic access$400(Lcom/vk/stories/view/VerticalPagerIndicator;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/view/VerticalPagerIndicator;

    .prologue
    .line 20
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->itemsCount:I

    return v0
.end method

.method static synthetic access$500(Lcom/vk/stories/view/VerticalPagerIndicator;F)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/VerticalPagerIndicator;
    .param p1, "x1"    # F

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vk/stories/view/VerticalPagerIndicator;->animateScrollOffsetTo(F)V

    return-void
.end method

.method static synthetic access$602(Lcom/vk/stories/view/VerticalPagerIndicator;Landroid/animation/ObjectAnimator;)Landroid/animation/ObjectAnimator;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/VerticalPagerIndicator;
    .param p1, "x1"    # Landroid/animation/ObjectAnimator;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentOffsetAnimator:Landroid/animation/ObjectAnimator;

    return-object p1
.end method

.method private animateScrollOffsetTo(F)V
    .locals 4
    .param p1, "offset"    # F

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentOffsetAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentOffsetAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 188
    :cond_0
    sget-object v0, Lcom/vk/stories/view/VerticalPagerIndicator;->CURRENT_SCROLL_OFFSET:Landroid/util/Property;

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentOffsetAnimator:Landroid/animation/ObjectAnimator;

    .line 189
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentOffsetAnimator:Landroid/animation/ObjectAnimator;

    sget-object v1, Lcom/vk/stories/view/VerticalPagerIndicator;->interpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 190
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentOffsetAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 191
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentOffsetAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lcom/vk/stories/view/VerticalPagerIndicator$3;

    invoke-direct {v1, p0}, Lcom/vk/stories/view/VerticalPagerIndicator$3;-><init>(Lcom/vk/stories/view/VerticalPagerIndicator;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 197
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentOffsetAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 198
    return-void
.end method

.method private getRawYForPosition(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 201
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    iget v1, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    return v0
.end method

.method private init()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 67
    const/high16 v0, 0x41000000    # 8.0f

    .line 68
    invoke-virtual {p0}, Lcom/vk/stories/view/VerticalPagerIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 67
    invoke-static {v2, v0, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    .line 69
    const/high16 v0, 0x41800000    # 16.0f

    .line 70
    invoke-virtual {p0}, Lcom/vk/stories/view/VerticalPagerIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 69
    invoke-static {v2, v0, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    .line 72
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 73
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->strokePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 74
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->strokePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x44000000    # 512.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->strokePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 76
    return-void
.end method


# virtual methods
.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 130
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentPosition:I

    return v0
.end method

.method public getCurrentScrollOffset()F
    .locals 1

    .prologue
    .line 176
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentScrollOffset:F

    return v0
.end method

.method public getItemsCount()I
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->itemsCount:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    .line 80
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->itemsCount:I

    const/4 v6, 0x1

    if-le v5, v6, :cond_6

    .line 81
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v5

    div-int/lit8 v0, v5, 0x2

    .line 83
    .local v0, "cx":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->itemsCount:I

    if-ge v2, v5, :cond_6

    .line 84
    invoke-direct {p0, v2}, Lcom/vk/stories/view/VerticalPagerIndicator;->getRawYForPosition(I)I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentScrollOffset:F

    add-float/2addr v5, v6

    float-to-int v1, v5

    .line 85
    .local v1, "cy":I
    if-lez v1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    if-lt v1, v5, :cond_1

    .line 83
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 90
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    if-ge v1, v5, :cond_2

    if-nez v2, :cond_2

    .line 91
    int-to-float v5, v1

    iget v6, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 92
    .local v4, "sizeScale":F
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    int-to-float v5, v5

    mul-float v3, v5, v4

    .line 106
    .local v3, "realSize":F
    :goto_2
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    int-to-float v5, v5

    const/4 v6, 0x0

    invoke-static {v6, v3}, Ljava/lang/Math;->max(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 108
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentPosition:I

    if-ne v5, v2, :cond_5

    .line 109
    iget-object v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->paint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->colorSelected:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 113
    :goto_3
    int-to-float v5, v0

    int-to-float v6, v1

    div-float v7, v3, v9

    iget-object v8, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 114
    int-to-float v5, v0

    int-to-float v6, v1

    div-float v7, v3, v9

    iget-object v8, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 94
    .end local v3    # "realSize":F
    .end local v4    # "sizeScale":F
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    if-ge v1, v5, :cond_3

    .line 95
    int-to-float v5, v1

    iget v6, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    mul-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 96
    .restart local v4    # "sizeScale":F
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    int-to-float v5, v5

    mul-float v3, v5, v4

    .line 98
    .restart local v3    # "realSize":F
    goto :goto_2

    .end local v3    # "realSize":F
    .end local v4    # "sizeScale":F
    :cond_3
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->itemsCount:I

    add-int/lit8 v5, v5, -0x1

    if-ne v2, v5, :cond_4

    .line 99
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    sub-int/2addr v5, v1

    int-to-float v5, v5

    iget v6, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 100
    .restart local v4    # "sizeScale":F
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    int-to-float v5, v5

    mul-float v3, v5, v4

    .line 102
    .restart local v3    # "realSize":F
    goto :goto_2

    .line 103
    .end local v3    # "realSize":F
    .end local v4    # "sizeScale":F
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    sub-int/2addr v5, v1

    int-to-float v5, v5

    iget v6, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleInterval:I

    mul-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 104
    .restart local v4    # "sizeScale":F
    iget v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->circleSize:I

    int-to-float v5, v5

    mul-float v3, v5, v4

    .restart local v3    # "realSize":F
    goto :goto_2

    .line 111
    :cond_5
    iget-object v5, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->paint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->colorNotSelected:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_3

    .line 117
    .end local v0    # "cx":I
    .end local v1    # "cy":I
    .end local v2    # "i":I
    .end local v3    # "realSize":F
    .end local v4    # "sizeScale":F
    :cond_6
    return-void
.end method

.method public setCurrentPosition(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 134
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vk/stories/view/VerticalPagerIndicator;->setCurrentPosition(IZ)V

    .line 135
    return-void
.end method

.method public setCurrentPosition(IZ)V
    .locals 3
    .param p1, "position"    # I
    .param p2, "animated"    # Z

    .prologue
    .line 138
    new-instance v0, Lcom/vk/stories/view/VerticalPagerIndicator$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/vk/stories/view/VerticalPagerIndicator$2;-><init>(Lcom/vk/stories/view/VerticalPagerIndicator;IZ)V

    .line 168
    .local v0, "r":Ljava/lang/Runnable;
    invoke-virtual {p0}, Lcom/vk/stories/view/VerticalPagerIndicator;->getMeasuredHeight()I

    move-result v1

    if-lez v1, :cond_0

    .line 169
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 173
    :goto_0
    return-void

    .line 171
    :cond_0
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public setCurrentScrollOffset(F)V
    .locals 0
    .param p1, "currentScrollOffset"    # F

    .prologue
    .line 180
    iput p1, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->currentScrollOffset:F

    .line 181
    invoke-virtual {p0}, Lcom/vk/stories/view/VerticalPagerIndicator;->invalidate()V

    .line 182
    return-void
.end method

.method public setItemsCount(I)V
    .locals 0
    .param p1, "itemsCount"    # I

    .prologue
    .line 125
    iput p1, p0, Lcom/vk/stories/view/VerticalPagerIndicator;->itemsCount:I

    .line 126
    invoke-virtual {p0}, Lcom/vk/stories/view/VerticalPagerIndicator;->invalidate()V

    .line 127
    return-void
.end method
