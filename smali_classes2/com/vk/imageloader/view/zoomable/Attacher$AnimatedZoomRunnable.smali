.class Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;
.super Ljava/lang/Object;
.source "Attacher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/imageloader/view/zoomable/Attacher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatedZoomRunnable"
.end annotation


# instance fields
.field private final mFocalX:F

.field private final mFocalY:F

.field private final mStartTime:J

.field private final mZoomEnd:F

.field private final mZoomStart:F

.field final synthetic this$0:Lcom/vk/imageloader/view/zoomable/Attacher;


# direct methods
.method public constructor <init>(Lcom/vk/imageloader/view/zoomable/Attacher;FFFF)V
    .locals 2
    .param p2, "currentZoom"    # F
    .param p3, "targetZoom"    # F
    .param p4, "focalX"    # F
    .param p5, "focalY"    # F

    .prologue
    .line 442
    iput-object p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 443
    iput p4, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mFocalX:F

    .line 444
    iput p5, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mFocalY:F

    .line 445
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mStartTime:J

    .line 446
    iput p2, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mZoomStart:F

    .line 447
    iput p3, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mZoomEnd:F

    .line 448
    return-void
.end method

.method private interpolate()F
    .locals 7

    .prologue
    const/high16 v6, 0x3f800000    # 1.0f

    .line 469
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mStartTime:J

    sub-long/2addr v2, v4

    long-to-float v1, v2

    mul-float/2addr v1, v6

    iget-object v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-static {v2}, Lcom/vk/imageloader/view/zoomable/Attacher;->access$200(Lcom/vk/imageloader/view/zoomable/Attacher;)J

    move-result-wide v2

    long-to-float v2, v2

    div-float v0, v1, v2

    .line 470
    .local v0, "t":F
    invoke-static {v6, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 471
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-static {v1}, Lcom/vk/imageloader/view/zoomable/Attacher;->access$300(Lcom/vk/imageloader/view/zoomable/Attacher;)Landroid/view/animation/Interpolator;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    .line 472
    return v0
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 452
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v1

    .line 453
    .local v1, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-nez v1, :cond_1

    .line 466
    :cond_0
    :goto_0
    return-void

    .line 457
    :cond_1
    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->interpolate()F

    move-result v3

    .line 458
    .local v3, "t":F
    iget v4, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mZoomStart:F

    iget v5, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mZoomEnd:F

    iget v6, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mZoomStart:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, v3

    add-float v2, v4, v5

    .line 459
    .local v2, "scale":F
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/zoomable/Attacher;->getScale()F

    move-result v4

    div-float v0, v2, v4

    .line 461
    .local v0, "deltaScale":F
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    iget v5, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mFocalX:F

    iget v6, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->mFocalY:F

    invoke-virtual {v4, v0, v5, v6}, Lcom/vk/imageloader/view/zoomable/Attacher;->onScale(FFF)V

    .line 463
    const/high16 v4, 0x3f800000    # 1.0f

    cmpg-float v4, v3, v4

    if-gez v4, :cond_0

    .line 464
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-static {v4, v1, p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->access$100(Lcom/vk/imageloader/view/zoomable/Attacher;Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_0
.end method
