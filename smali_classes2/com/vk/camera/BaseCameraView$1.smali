.class Lcom/vk/camera/BaseCameraView$1;
.super Landroid/view/View;
.source "BaseCameraView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/camera/BaseCameraView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private paint:Landroid/graphics/Paint;

.field final synthetic this$0:Lcom/vk/camera/BaseCameraView;


# direct methods
.method constructor <init>(Lcom/vk/camera/BaseCameraView;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/camera/BaseCameraView;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vk/camera/BaseCameraView$1;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 73
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    .line 74
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 75
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 76
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 77
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 78
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    const v1, 0x1ffffff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    .line 83
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 85
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    .line 86
    invoke-direct {p0}, Lcom/vk/camera/BaseCameraView$1;->init()V

    .line 90
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    int-to-float v4, v0

    iget-object v5, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v1

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 91
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v3, v0

    iget-object v5, p0, Lcom/vk/camera/BaseCameraView$1;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v1

    move v4, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 92
    return-void
.end method
