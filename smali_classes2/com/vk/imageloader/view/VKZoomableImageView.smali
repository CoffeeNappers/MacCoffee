.class public Lcom/vk/imageloader/view/VKZoomableImageView;
.super Lcom/vk/imageloader/view/VKImageView;
.source "VKZoomableImageView.java"

# interfaces
.implements Lcom/vk/imageloader/view/zoomable/IAttacher;


# instance fields
.field private mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/vk/imageloader/view/VKZoomableImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/imageloader/view/VKZoomableImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKZoomableImageView;->init()V

    .line 30
    new-instance v0, Lcom/vk/imageloader/view/VKZoomableImageView$1;

    invoke-direct {v0, p0}, Lcom/vk/imageloader/view/VKZoomableImageView$1;-><init>(Lcom/vk/imageloader/view/VKZoomableImageView;)V

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKZoomableImageView;->setOnLoadCallback(Lcom/vk/imageloader/OnLoadCallback;)V

    .line 41
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    if-nez v0, :cond_1

    .line 45
    :cond_0
    new-instance v0, Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-direct {v0, p0}, Lcom/vk/imageloader/view/zoomable/Attacher;-><init>(Lcom/vk/imageloader/view/VKDraweeView;)V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    .line 47
    :cond_1
    return-void
.end method


# virtual methods
.method public getDisplayRect()Landroid/graphics/RectF;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getMaximumScale()F
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMediumScale()F
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMinimumScale()F
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getOnPhotoTapListener()Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getOnPhotoTapListener()Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;

    move-result-object v0

    return-object v0
.end method

.method public getOnViewTapListener()Lcom/vk/imageloader/view/zoomable/OnViewTapListener;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getOnViewTapListener()Lcom/vk/imageloader/view/zoomable/OnViewTapListener;

    move-result-object v0

    return-object v0
.end method

.method public getScale()F
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getScale()F

    move-result v0

    return v0
.end method

.method public isZoomable()Z
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->isZoomable()Z

    move-result v0

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKZoomableImageView;->init()V

    .line 65
    invoke-super {p0}, Lcom/vk/imageloader/view/VKImageView;->onAttachedToWindow()V

    .line 66
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->onDetachedFromWindow()V

    .line 71
    invoke-super {p0}, Lcom/vk/imageloader/view/VKImageView;->onDetachedFromWindow()V

    .line 72
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 56
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 57
    .local v0, "saveCount":I
    iget-object v1, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 58
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 59
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 60
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 51
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKImageView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .locals 1
    .param p1, "allow"    # Z

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setAllowParentInterceptOnEdge(Z)V

    .line 142
    return-void
.end method

.method public setMaximumScale(F)V
    .locals 1
    .param p1, "maximumScale"    # F

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setMaximumScale(F)V

    .line 112
    return-void
.end method

.method public setMediumScale(F)V
    .locals 1
    .param p1, "mediumScale"    # F

    .prologue
    .line 106
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setMediumScale(F)V

    .line 107
    return-void
.end method

.method public setMinimumScale(F)V
    .locals 1
    .param p1, "minimumScale"    # F

    .prologue
    .line 101
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setMinimumScale(F)V

    .line 102
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 147
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 157
    return-void
.end method

.method public setOnPhotoTapListener(Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setOnPhotoTapListener(Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;)V

    .line 162
    return-void
.end method

.method public setOnScaleChangeListener(Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setOnScaleChangeListener(Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;)V

    .line 152
    return-void
.end method

.method public setOnViewTapListener(Lcom/vk/imageloader/view/zoomable/OnViewTapListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vk/imageloader/view/zoomable/OnViewTapListener;

    .prologue
    .line 166
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setOnViewTapListener(Lcom/vk/imageloader/view/zoomable/OnViewTapListener;)V

    .line 167
    return-void
.end method

.method public setScale(F)V
    .locals 1
    .param p1, "scale"    # F

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setScale(F)V

    .line 122
    return-void
.end method

.method public setScale(FFFZ)V
    .locals 1
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F
    .param p4, "animate"    # Z

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/vk/imageloader/view/zoomable/Attacher;->setScale(FFFZ)V

    .line 132
    return-void
.end method

.method public setScale(FZ)V
    .locals 1
    .param p1, "scale"    # F
    .param p2, "animate"    # Z

    .prologue
    .line 126
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1, p2}, Lcom/vk/imageloader/view/zoomable/Attacher;->setScale(FZ)V

    .line 127
    return-void
.end method

.method public setZoomTransitionDuration(J)V
    .locals 1
    .param p1, "duration"    # J

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1, p2}, Lcom/vk/imageloader/view/zoomable/Attacher;->setZoomTransitionDuration(J)V

    .line 137
    return-void
.end method

.method public setZoomable(Z)V
    .locals 1
    .param p1, "zoomable"    # Z

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->setZoomable(Z)V

    .line 82
    return-void
.end method

.method public update(II)V
    .locals 1
    .param p1, "imageInfoWidth"    # I
    .param p2, "imageInfoHeight"    # I

    .prologue
    .line 181
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView;->mAttacher:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0, p1, p2}, Lcom/vk/imageloader/view/zoomable/Attacher;->update(II)V

    .line 182
    return-void
.end method
