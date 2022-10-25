.class public Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;
.super Ljava/lang/Object;
.source "DefaultOnDoubleTapListener.java"

# interfaces
.implements Landroid/view/GestureDetector$OnDoubleTapListener;


# instance fields
.field private mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;


# direct methods
.method public constructor <init>(Lcom/vk/imageloader/view/zoomable/Attacher;)V
    .locals 0
    .param p1, "attacher"    # Lcom/vk/imageloader/view/zoomable/Attacher;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-virtual {p0, p1}, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->setPhotoDraweeViewAttacher(Lcom/vk/imageloader/view/zoomable/Attacher;)V

    .line 15
    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    .line 50
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    if-nez v4, :cond_0

    .line 51
    const/4 v3, 0x0

    .line 69
    :goto_0
    return v3

    .line 55
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/zoomable/Attacher;->getScale()F

    move-result v0

    .line 56
    .local v0, "scale":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 57
    .local v1, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 59
    .local v2, "y":F
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMediumScale()F

    move-result v4

    cmpg-float v4, v0, v4

    if-gez v4, :cond_1

    .line 60
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    iget-object v5, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v5}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMediumScale()F

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v1, v2, v6}, Lcom/vk/imageloader/view/zoomable/Attacher;->setScale(FFFZ)V

    goto :goto_0

    .line 66
    .end local v0    # "scale":F
    .end local v1    # "x":F
    .end local v2    # "y":F
    :catch_0
    move-exception v4

    goto :goto_0

    .line 61
    .restart local v0    # "scale":F
    .restart local v1    # "x":F
    .restart local v2    # "y":F
    :cond_1
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMediumScale()F

    move-result v4

    cmpl-float v4, v0, v4

    if-ltz v4, :cond_2

    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMaximumScale()F

    move-result v4

    cmpg-float v4, v0, v4

    if-gez v4, :cond_2

    .line 62
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    iget-object v5, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v5}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMaximumScale()F

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v1, v2, v6}, Lcom/vk/imageloader/view/zoomable/Attacher;->setScale(FFFZ)V

    goto :goto_0

    .line 64
    :cond_2
    iget-object v4, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    iget-object v5, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v5}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMinimumScale()F

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v1, v2, v6}, Lcom/vk/imageloader/view/zoomable/Attacher;->setScale(FFFZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 19
    iget-object v8, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    if-nez v8, :cond_1

    .line 46
    :cond_0
    :goto_0
    return v6

    .line 22
    :cond_1
    iget-object v8, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v8}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v1

    .line 23
    .local v1, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v1, :cond_0

    .line 27
    iget-object v8, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v8}, Lcom/vk/imageloader/view/zoomable/Attacher;->getOnPhotoTapListener()Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 28
    iget-object v8, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v8}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 30
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_2

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 32
    .local v4, "y":F
    invoke-virtual {v0, v2, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 33
    iget v6, v0, Landroid/graphics/RectF;->left:F

    sub-float v6, v2, v6

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v8

    div-float v3, v6, v8

    .line 34
    .local v3, "xResult":F
    iget v6, v0, Landroid/graphics/RectF;->top:F

    sub-float v6, v4, v6

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v8

    div-float v5, v6, v8

    .line 35
    .local v5, "yResult":F
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v6}, Lcom/vk/imageloader/view/zoomable/Attacher;->getOnPhotoTapListener()Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;

    move-result-object v6

    invoke-interface {v6, v1, v3, v5}, Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;->onPhotoTap(Landroid/view/View;FF)V

    move v6, v7

    .line 36
    goto :goto_0

    .line 41
    .end local v0    # "displayRect":Landroid/graphics/RectF;
    .end local v2    # "x":F
    .end local v3    # "xResult":F
    .end local v4    # "y":F
    .end local v5    # "yResult":F
    :cond_2
    iget-object v8, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v8}, Lcom/vk/imageloader/view/zoomable/Attacher;->getOnViewTapListener()Lcom/vk/imageloader/view/zoomable/OnViewTapListener;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 42
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v6}, Lcom/vk/imageloader/view/zoomable/Attacher;->getOnViewTapListener()Lcom/vk/imageloader/view/zoomable/OnViewTapListener;

    move-result-object v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    invoke-interface {v6, v1, v8, v9}, Lcom/vk/imageloader/view/zoomable/OnViewTapListener;->onViewTap(Landroid/view/View;FF)V

    move v6, v7

    .line 43
    goto :goto_0
.end method

.method public setPhotoDraweeViewAttacher(Lcom/vk/imageloader/view/zoomable/Attacher;)V
    .locals 0
    .param p1, "attacher"    # Lcom/vk/imageloader/view/zoomable/Attacher;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    .line 78
    return-void
.end method
