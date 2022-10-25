.class public Lcom/vk/emoji/FastScroller;
.super Landroid/view/View;
.source "FastScroller.java"


# static fields
.field private static final DEFAULT_HANDLE_COLOR:I = -0xae7434

.field private static final DEFAULT_TRACK_COLOR:I = -0x3b3734

.field private static final HANDLE_HEIGHT_DP:I = 0x20

.field private static final HANDLE_RADIUS_DP:F = 1.5f

.field private static final HANDLE_WIDTH_DP:I = 0x3

.field public static final PADDING_BOTTOM:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/emoji/FastScroller;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final PADDING_TOP:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/emoji/FastScroller;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final TRACK_WIDTH_DP:I = 0x1

.field private static final VIEW_PADDING_DP:I = 0x8

.field private static final VIEW_WIDTH_DP:I = 0x14


# instance fields
.field private baseViewPadding:I

.field private downProgress:F

.field private downY:I

.field private final drawRect:Landroid/graphics/RectF;

.field private gestureInProgress:Z

.field private handleColor:I

.field private handleHeight:I

.field private final handlePaint:Landroid/graphics/Paint;

.field private handleRadius:I

.field private handleWidth:I

.field private progress:F

.field private recyclerView:Landroid/support/v7/widget/RecyclerView;

.field private final scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private scrollPositionProvider:Lcom/vk/emoji/ScrollPositionProvider;

.field private trackColor:I

.field private final trackPaint:Landroid/graphics/Paint;

.field private trackWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 18
    new-instance v0, Lcom/vk/emoji/FastScroller$1;

    const-class v1, Ljava/lang/Integer;

    const-string/jumbo v2, "paddingBottom"

    invoke-direct {v0, v1, v2}, Lcom/vk/emoji/FastScroller$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/emoji/FastScroller;->PADDING_BOTTOM:Landroid/util/Property;

    .line 30
    new-instance v0, Lcom/vk/emoji/FastScroller$2;

    const-class v1, Ljava/lang/Integer;

    const-string/jumbo v2, "paddingTop"

    invoke-direct {v0, v1, v2}, Lcom/vk/emoji/FastScroller$2;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/emoji/FastScroller;->PADDING_TOP:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 82
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 52
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->handlePaint:Landroid/graphics/Paint;

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->trackPaint:Landroid/graphics/Paint;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->drawRect:Landroid/graphics/RectF;

    .line 62
    const v0, -0xae7434

    iput v0, p0, Lcom/vk/emoji/FastScroller;->handleColor:I

    .line 63
    const v0, -0x3b3734

    iput v0, p0, Lcom/vk/emoji/FastScroller;->trackColor:I

    .line 68
    new-instance v0, Lcom/vk/emoji/FastScroller$3;

    invoke-direct {v0, p0}, Lcom/vk/emoji/FastScroller$3;-><init>(Lcom/vk/emoji/FastScroller;)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 77
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vk/emoji/FastScroller;->downProgress:F

    .line 78
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/emoji/FastScroller;->downY:I

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/emoji/FastScroller;->gestureInProgress:Z

    .line 83
    invoke-direct {p0, p1}, Lcom/vk/emoji/FastScroller;->init(Landroid/content/Context;)V

    .line 84
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

    .line 87
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->handlePaint:Landroid/graphics/Paint;

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->trackPaint:Landroid/graphics/Paint;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->drawRect:Landroid/graphics/RectF;

    .line 62
    const v0, -0xae7434

    iput v0, p0, Lcom/vk/emoji/FastScroller;->handleColor:I

    .line 63
    const v0, -0x3b3734

    iput v0, p0, Lcom/vk/emoji/FastScroller;->trackColor:I

    .line 68
    new-instance v0, Lcom/vk/emoji/FastScroller$3;

    invoke-direct {v0, p0}, Lcom/vk/emoji/FastScroller$3;-><init>(Lcom/vk/emoji/FastScroller;)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 77
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vk/emoji/FastScroller;->downProgress:F

    .line 78
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/emoji/FastScroller;->downY:I

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/emoji/FastScroller;->gestureInProgress:Z

    .line 88
    invoke-direct {p0, p1}, Lcom/vk/emoji/FastScroller;->init(Landroid/content/Context;)V

    .line 89
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

    .line 92
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->handlePaint:Landroid/graphics/Paint;

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->trackPaint:Landroid/graphics/Paint;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->drawRect:Landroid/graphics/RectF;

    .line 62
    const v0, -0xae7434

    iput v0, p0, Lcom/vk/emoji/FastScroller;->handleColor:I

    .line 63
    const v0, -0x3b3734

    iput v0, p0, Lcom/vk/emoji/FastScroller;->trackColor:I

    .line 68
    new-instance v0, Lcom/vk/emoji/FastScroller$3;

    invoke-direct {v0, p0}, Lcom/vk/emoji/FastScroller$3;-><init>(Lcom/vk/emoji/FastScroller;)V

    iput-object v0, p0, Lcom/vk/emoji/FastScroller;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 77
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vk/emoji/FastScroller;->downProgress:F

    .line 78
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/emoji/FastScroller;->downY:I

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/emoji/FastScroller;->gestureInProgress:Z

    .line 93
    invoke-direct {p0, p1}, Lcom/vk/emoji/FastScroller;->init(Landroid/content/Context;)V

    .line 94
    return-void
.end method

.method static synthetic access$000(Lcom/vk/emoji/FastScroller;Landroid/support/v7/widget/RecyclerView;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/emoji/FastScroller;
    .param p1, "x1"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/emoji/FastScroller;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    return-void
.end method

.method private static calculateScrollProgress(Landroid/support/v7/widget/RecyclerView;)F
    .locals 4
    .param p0, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 240
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result v2

    int-to-float v0, v2

    .line 241
    .local v0, "offset":F
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->computeVerticalScrollRange()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->computeVerticalScrollExtent()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v1, v2

    .line 242
    .local v1, "range":F
    div-float v2, v0, v1

    return v2
.end method

.method private getHandlePathLength()I
    .locals 5

    .prologue
    .line 118
    iget v3, p0, Lcom/vk/emoji/FastScroller;->handleHeight:I

    div-int/lit8 v1, v3, 0x2

    .line 119
    .local v1, "handleHalfHeight":I
    iget v3, p0, Lcom/vk/emoji/FastScroller;->baseViewPadding:I

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingTop()I

    move-result v4

    add-int/2addr v3, v4

    add-int v2, v3, v1

    .line 120
    .local v2, "topHandlePosition":I
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getMeasuredHeight()I

    move-result v3

    iget v4, p0, Lcom/vk/emoji/FastScroller;->baseViewPadding:I

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    sub-int v0, v3, v1

    .line 122
    .local v0, "bottomHandlePosition":I
    sub-int v3, v0, v2

    return v3
.end method

.method private init(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 97
    const v0, -0x3b3734

    invoke-virtual {p0, v0}, Lcom/vk/emoji/FastScroller;->setTrackColor(I)V

    .line 98
    const v0, -0xae7434

    invoke-virtual {p0, v0}, Lcom/vk/emoji/FastScroller;->setHandleColor(I)V

    .line 99
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/emoji/FastScroller;->progress:F

    .line 101
    iget-object v0, p0, Lcom/vk/emoji/FastScroller;->trackPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 102
    iget-object v0, p0, Lcom/vk/emoji/FastScroller;->handlePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 104
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0, p1}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/vk/emoji/FastScroller;->baseViewPadding:I

    .line 105
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p1}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/vk/emoji/FastScroller;->trackWidth:I

    .line 106
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0, p1}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/vk/emoji/FastScroller;->handleWidth:I

    .line 107
    const/high16 v0, 0x42000000    # 32.0f

    invoke-static {v0, p1}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/vk/emoji/FastScroller;->handleHeight:I

    .line 108
    const/high16 v0, 0x3fc00000    # 1.5f

    invoke-static {v0, p1}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/vk/emoji/FastScroller;->handleRadius:I

    .line 109
    return-void
.end method

.method private onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 112
    iget-boolean v0, p0, Lcom/vk/emoji/FastScroller;->gestureInProgress:Z

    if-nez v0, :cond_0

    .line 113
    invoke-static {p1}, Lcom/vk/emoji/FastScroller;->calculateScrollProgress(Landroid/support/v7/widget/RecyclerView;)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/emoji/FastScroller;->setProgress(F)V

    .line 115
    :cond_0
    return-void
.end method


# virtual methods
.method public getHandleColor()I
    .locals 1

    .prologue
    .line 201
    iget v0, p0, Lcom/vk/emoji/FastScroller;->handleColor:I

    return v0
.end method

.method public getProgress()F
    .locals 1

    .prologue
    .line 221
    iget v0, p0, Lcom/vk/emoji/FastScroller;->progress:F

    return v0
.end method

.method public getTrackColor()I
    .locals 1

    .prologue
    .line 211
    iget v0, p0, Lcom/vk/emoji/FastScroller;->trackColor:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 134
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 136
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v5

    div-int/lit8 v0, v5, 0x2

    .line 139
    .local v0, "cx":I
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->drawRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/vk/emoji/FastScroller;->trackWidth:I

    div-int/lit8 v6, v6, 0x2

    sub-int v6, v0, v6

    int-to-float v6, v6

    iget v7, p0, Lcom/vk/emoji/FastScroller;->baseViewPadding:I

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingTop()I

    move-result v8

    add-int/2addr v7, v8

    int-to-float v7, v7

    iget v8, p0, Lcom/vk/emoji/FastScroller;->trackWidth:I

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v0

    int-to-float v8, v8

    .line 140
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v9

    iget v10, p0, Lcom/vk/emoji/FastScroller;->baseViewPadding:I

    sub-int/2addr v9, v10

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingBottom()I

    move-result v10

    sub-int/2addr v9, v10

    int-to-float v9, v9

    .line 139
    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 141
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->drawRect:Landroid/graphics/RectF;

    iget-object v6, p0, Lcom/vk/emoji/FastScroller;->trackPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 144
    iget v5, p0, Lcom/vk/emoji/FastScroller;->handleHeight:I

    div-int/lit8 v2, v5, 0x2

    .line 145
    .local v2, "handleHalfHeight":I
    iget v5, p0, Lcom/vk/emoji/FastScroller;->baseViewPadding:I

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingTop()I

    move-result v6

    add-int/2addr v5, v6

    add-int v4, v5, v2

    .line 146
    .local v4, "topHandlePosition":I
    invoke-direct {p0}, Lcom/vk/emoji/FastScroller;->getHandlePathLength()I

    move-result v3

    .line 147
    .local v3, "handlePathLength":I
    int-to-float v5, v4

    int-to-float v6, v3

    iget v7, p0, Lcom/vk/emoji/FastScroller;->progress:F

    mul-float/2addr v6, v7

    add-float/2addr v5, v6

    float-to-int v1, v5

    .line 148
    .local v1, "handleCenterY":I
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->drawRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/vk/emoji/FastScroller;->handleWidth:I

    div-int/lit8 v6, v6, 0x2

    sub-int v6, v0, v6

    int-to-float v6, v6

    sub-int v7, v1, v2

    int-to-float v7, v7

    iget v8, p0, Lcom/vk/emoji/FastScroller;->handleWidth:I

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v0

    int-to-float v8, v8

    add-int v9, v1, v2

    int-to-float v9, v9

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 152
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->drawRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/vk/emoji/FastScroller;->handleRadius:I

    int-to-float v6, v6

    iget v7, p0, Lcom/vk/emoji/FastScroller;->handleRadius:I

    int-to-float v7, v7

    iget-object v8, p0, Lcom/vk/emoji/FastScroller;->handlePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 153
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 127
    const/high16 v0, 0x41a00000    # 20.0f

    .line 128
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v0

    float-to-int v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 127
    invoke-super {p0, v0, p2}, Landroid/view/View;->onMeasure(II)V

    .line 130
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 157
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    and-int/lit16 v0, v5, 0xff

    .line 158
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v4, v5

    .line 160
    .local v4, "y":I
    if-eqz v0, :cond_0

    const/4 v5, 0x5

    if-ne v0, v5, :cond_2

    .line 161
    :cond_0
    iget v5, p0, Lcom/vk/emoji/FastScroller;->progress:F

    iput v5, p0, Lcom/vk/emoji/FastScroller;->downProgress:F

    .line 162
    iput v4, p0, Lcom/vk/emoji/FastScroller;->downY:I

    .line 163
    iput-boolean v9, p0, Lcom/vk/emoji/FastScroller;->gestureInProgress:Z

    .line 188
    :cond_1
    :goto_0
    return v9

    .line 165
    :cond_2
    if-eq v0, v9, :cond_3

    const/4 v5, 0x3

    if-ne v0, v5, :cond_4

    .line 166
    :cond_3
    const/high16 v5, -0x40800000    # -1.0f

    iput v5, p0, Lcom/vk/emoji/FastScroller;->downProgress:F

    .line 167
    const/4 v5, -0x1

    iput v5, p0, Lcom/vk/emoji/FastScroller;->downY:I

    .line 168
    iput-boolean v8, p0, Lcom/vk/emoji/FastScroller;->gestureInProgress:Z

    .line 169
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0, v5, v8, v8}, Lcom/vk/emoji/FastScroller;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    goto :goto_0

    .line 171
    :cond_4
    const/4 v5, 0x2

    if-ne v0, v5, :cond_1

    .line 172
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v5, :cond_5

    .line 173
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->stopScroll()V

    .line 176
    :cond_5
    invoke-direct {p0}, Lcom/vk/emoji/FastScroller;->getHandlePathLength()I

    move-result v5

    int-to-float v3, v5

    .line 177
    .local v3, "handlePathLength":F
    iget v5, p0, Lcom/vk/emoji/FastScroller;->downY:I

    sub-int v5, v4, v5

    int-to-float v2, v5

    .line 178
    .local v2, "deltaY":F
    div-float v1, v2, v3

    .line 179
    .local v1, "deltaProgress":F
    iget v5, p0, Lcom/vk/emoji/FastScroller;->downProgress:F

    add-float/2addr v5, v1

    invoke-virtual {p0, v5}, Lcom/vk/emoji/FastScroller;->setProgress(F)V

    .line 180
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->scrollPositionProvider:Lcom/vk/emoji/ScrollPositionProvider;

    if-eqz v5, :cond_1

    .line 181
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v5

    instance-of v5, v5, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v5, :cond_1

    .line 182
    iget-object v5, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v6, p0, Lcom/vk/emoji/FastScroller;->scrollPositionProvider:Lcom/vk/emoji/ScrollPositionProvider;

    .line 183
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getProgress()F

    move-result v7

    invoke-interface {v6, v7}, Lcom/vk/emoji/ScrollPositionProvider;->getScrollPosition(F)I

    move-result v6

    invoke-virtual {v5, v6, v8}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_0
.end method

.method public setHandleColor(I)V
    .locals 1
    .param p1, "handleColor"    # I

    .prologue
    .line 205
    iput p1, p0, Lcom/vk/emoji/FastScroller;->handleColor:I

    .line 206
    iget-object v0, p0, Lcom/vk/emoji/FastScroller;->handlePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 207
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->invalidate()V

    .line 208
    return-void
.end method

.method public setPaddingBottom(I)V
    .locals 3
    .param p1, "paddingBottom"    # I

    .prologue
    .line 230
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingRight()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/vk/emoji/FastScroller;->setPadding(IIII)V

    .line 231
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->invalidate()V

    .line 232
    return-void
.end method

.method public setPaddingTop(I)V
    .locals 3
    .param p1, "paddingTop"    # I

    .prologue
    .line 235
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/vk/emoji/FastScroller;->setPadding(IIII)V

    .line 236
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->invalidate()V

    .line 237
    return-void
.end method

.method public setProgress(F)V
    .locals 2
    .param p1, "progress"    # F

    .prologue
    .line 225
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/vk/emoji/FastScroller;->progress:F

    .line 226
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->invalidate()V

    .line 227
    return-void
.end method

.method public setRecyclerView(Landroid/support/v7/widget/RecyclerView;Lcom/vk/emoji/ScrollPositionProvider;)V
    .locals 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "scrollPositionProvider"    # Lcom/vk/emoji/ScrollPositionProvider;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vk/emoji/FastScroller;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 195
    :cond_0
    iput-object p1, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 196
    iget-object v0, p0, Lcom/vk/emoji/FastScroller;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vk/emoji/FastScroller;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 197
    iput-object p2, p0, Lcom/vk/emoji/FastScroller;->scrollPositionProvider:Lcom/vk/emoji/ScrollPositionProvider;

    .line 198
    return-void
.end method

.method public setTrackColor(I)V
    .locals 1
    .param p1, "trackColor"    # I

    .prologue
    .line 215
    iput p1, p0, Lcom/vk/emoji/FastScroller;->trackColor:I

    .line 216
    iget-object v0, p0, Lcom/vk/emoji/FastScroller;->trackPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 217
    invoke-virtual {p0}, Lcom/vk/emoji/FastScroller;->invalidate()V

    .line 218
    return-void
.end method
