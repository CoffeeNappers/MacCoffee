.class public Lcom/vk/imageloader/view/VKMultiImageView;
.super Landroid/view/View;
.source "VKMultiImageView.java"


# instance fields
.field protected controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

.field protected final draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/drawee/view/MultiDraweeHolder",
            "<",
            "Lcom/facebook/drawee/generic/GenericDraweeHierarchy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 32
    new-instance v0, Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-direct {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    .line 38
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vk/imageloader/view/VKMultiImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    new-instance v0, Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-direct {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance v0, Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-direct {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 53
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 32
    new-instance v0, Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-direct {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    .line 54
    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    return-void
.end method


# virtual methods
.method public addImage()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 115
    new-instance v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKMultiImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;-><init>(Landroid/content/res/Resources;)V

    .line 116
    .local v0, "gdh":Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 117
    invoke-virtual {v0, v3}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setFadeDuration(I)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 118
    sget-object v2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 119
    new-instance v1, Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->build()Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/facebook/drawee/view/DraweeHolder;-><init>(Lcom/facebook/drawee/interfaces/DraweeHierarchy;)V

    .line 120
    .local v1, "holder":Lcom/facebook/drawee/view/DraweeHolder;, "Lcom/facebook/drawee/view/DraweeHolder<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 121
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 123
    :cond_0
    iget-object v2, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v2, v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->add(Lcom/facebook/drawee/view/DraweeHolder;)V

    .line 124
    return-void
.end method

.method public clear()V
    .locals 3

    .prologue
    .line 102
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/DraweeHolder;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 102
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 105
    :cond_0
    return-void
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKMultiImageView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->newDraweeControllerBuilder()Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    .line 61
    :cond_0
    return-void
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKMultiImageView;->invalidate()V

    .line 71
    return-void
.end method

.method public load(ILandroid/net/Uri;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 127
    if-eqz p2, :cond_0

    .line 128
    invoke-static {p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 129
    .local v0, "imageRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    invoke-virtual {v1}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->reset()Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 130
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->build()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setImageRequest(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 131
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    iget-object v2, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v2, p1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeHolder;->getController()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setOldController(Lcom/facebook/drawee/interfaces/DraweeController;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 132
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    invoke-virtual {v1, v3}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setCallerContext(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 133
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, p1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/imageloader/view/VKMultiImageView;->controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    invoke-virtual {v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->build()Lcom/facebook/drawee/controller/AbstractDraweeController;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/DraweeHolder;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 137
    .end local v0    # "imageRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    :goto_0
    return-void

    .line 135
    :cond_0
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, p1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/facebook/drawee/view/DraweeHolder;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    goto :goto_0
.end method

.method public load(ILjava/lang/String;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 140
    if-nez p2, :cond_0

    .line 141
    const/4 v0, 0x0

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {p0, p1, v0}, Lcom/vk/imageloader/view/VKMultiImageView;->load(ILandroid/net/Uri;)V

    .line 145
    :goto_0
    return-void

    .line 143
    :cond_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/vk/imageloader/view/VKMultiImageView;->load(ILandroid/net/Uri;)V

    goto :goto_0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .prologue
    .line 87
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 88
    iget-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->onAttach()V

    .line 89
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 75
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 76
    iget-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->onDetach()V

    .line 77
    return-void
.end method

.method public onFinishTemporaryDetach()V
    .locals 1

    .prologue
    .line 93
    invoke-super {p0}, Landroid/view/View;->onFinishTemporaryDetach()V

    .line 94
    iget-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->onAttach()V

    .line 95
    return-void
.end method

.method public onStartTemporaryDetach()V
    .locals 1

    .prologue
    .line 81
    invoke-super {p0}, Landroid/view/View;->onStartTemporaryDetach()V

    .line 82
    iget-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->onDetach()V

    .line 83
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->clear()V

    .line 99
    return-void
.end method

.method public setScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V
    .locals 2
    .param p1, "scaleType"    # Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    .prologue
    .line 108
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 109
    iget-object v1, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v1, p1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 108
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 111
    :cond_0
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->size()I

    move-result v0

    return v0
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 65
    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/imageloader/view/VKMultiImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
