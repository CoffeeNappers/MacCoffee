.class public Lcom/vk/stories/view/StoryUploadProgressView;
.super Landroid/view/View;
.source "StoryUploadProgressView.java"


# static fields
.field private static final RADIUS:I

.field private static final SIZE:I

.field private static final STROKE_WIDTH:I


# instance fields
.field private final borderPaint:Landroid/graphics/Paint;

.field private final drawBounds:Landroid/graphics/RectF;

.field private final innerPaint:Landroid/graphics/Paint;

.field private progress:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 15
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/stories/view/StoryUploadProgressView;->SIZE:I

    .line 16
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/stories/view/StoryUploadProgressView;->STROKE_WIDTH:I

    .line 17
    sget v0, Lcom/vk/stories/view/StoryUploadProgressView;->SIZE:I

    div-int/lit8 v0, v0, 0x2

    sget v1, Lcom/vk/stories/view/StoryUploadProgressView;->STROKE_WIDTH:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x2

    sput v0, Lcom/vk/stories/view/StoryUploadProgressView;->RADIUS:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 26
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 19
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->borderPaint:Landroid/graphics/Paint;

    .line 20
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->innerPaint:Landroid/graphics/Paint;

    .line 21
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->drawBounds:Landroid/graphics/RectF;

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->progress:F

    .line 27
    invoke-direct {p0}, Lcom/vk/stories/view/StoryUploadProgressView;->init()V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x1

    .line 31
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->borderPaint:Landroid/graphics/Paint;

    .line 20
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->innerPaint:Landroid/graphics/Paint;

    .line 21
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->drawBounds:Landroid/graphics/RectF;

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->progress:F

    .line 32
    invoke-direct {p0}, Lcom/vk/stories/view/StoryUploadProgressView;->init()V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x1

    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->borderPaint:Landroid/graphics/Paint;

    .line 20
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->innerPaint:Landroid/graphics/Paint;

    .line 21
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->drawBounds:Landroid/graphics/RectF;

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->progress:F

    .line 37
    invoke-direct {p0}, Lcom/vk/stories/view/StoryUploadProgressView;->init()V

    .line 38
    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 41
    iget-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->borderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    iget-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->borderPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 43
    iget-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->borderPaint:Landroid/graphics/Paint;

    sget v1, Lcom/vk/stories/view/StoryUploadProgressView;->STROKE_WIDTH:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 45
    iget-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->innerPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    iget-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->innerPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 47
    return-void
.end method


# virtual methods
.method public getProgress()F
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->progress:F

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 51
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 53
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    div-int/lit8 v6, v0, 0x2

    .line 54
    .local v6, "cx":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    div-int/lit8 v7, v0, 0x2

    .line 55
    .local v7, "cy":I
    iget-object v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->drawBounds:Landroid/graphics/RectF;

    sget v1, Lcom/vk/stories/view/StoryUploadProgressView;->RADIUS:I

    sub-int v1, v6, v1

    int-to-float v1, v1

    sget v2, Lcom/vk/stories/view/StoryUploadProgressView;->RADIUS:I

    sub-int v2, v7, v2

    int-to-float v2, v2

    sget v3, Lcom/vk/stories/view/StoryUploadProgressView;->RADIUS:I

    add-int/2addr v3, v6

    int-to-float v3, v3

    sget v4, Lcom/vk/stories/view/StoryUploadProgressView;->RADIUS:I

    add-int/2addr v4, v7

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 57
    int-to-float v0, v6

    int-to-float v1, v7

    sget v2, Lcom/vk/stories/view/StoryUploadProgressView;->RADIUS:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/vk/stories/view/StoryUploadProgressView;->borderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 58
    iget-object v1, p0, Lcom/vk/stories/view/StoryUploadProgressView;->drawBounds:Landroid/graphics/RectF;

    const/high16 v2, -0x3d4c0000    # -90.0f

    iget v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->progress:F

    const/high16 v3, 0x43b40000    # 360.0f

    mul-float/2addr v3, v0

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/vk/stories/view/StoryUploadProgressView;->innerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 59
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 63
    sget v0, Lcom/vk/stories/view/StoryUploadProgressView;->SIZE:I

    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    sget v1, Lcom/vk/stories/view/StoryUploadProgressView;->SIZE:I

    .line 64
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 63
    invoke-super {p0, v0, v1}, Landroid/view/View;->onMeasure(II)V

    .line 65
    return-void
.end method

.method public setProgress(F)V
    .locals 2
    .param p1, "progress"    # F

    .prologue
    const/4 v1, 0x0

    .line 72
    cmpg-float v0, p1, v1

    if-gez v0, :cond_3

    .line 73
    const/4 p1, 0x0

    .line 77
    :cond_0
    :goto_0
    cmpl-float v0, p1, v1

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/vk/stories/view/StoryUploadProgressView;->progress:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_2

    .line 78
    :cond_1
    iput p1, p0, Lcom/vk/stories/view/StoryUploadProgressView;->progress:F

    .line 80
    :cond_2
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryUploadProgressView;->invalidate()V

    .line 81
    return-void

    .line 74
    :cond_3
    const v0, 0x3f733333    # 0.95f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 75
    const p1, 0x3f733333    # 0.95f

    goto :goto_0
.end method
