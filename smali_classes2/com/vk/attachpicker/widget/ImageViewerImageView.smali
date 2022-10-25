.class public Lcom/vk/attachpicker/widget/ImageViewerImageView;
.super Lcom/vk/imageloader/view/VKZoomableImageView;
.source "ImageViewerImageView.java"


# instance fields
.field private currentPositionInImageViewer:I

.field private entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

.field private final position:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "position"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKZoomableImageView;-><init>(Landroid/content/Context;)V

    .line 14
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/attachpicker/widget/ImageViewerImageView;->currentPositionInImageViewer:I

    .line 22
    iput p2, p0, Lcom/vk/attachpicker/widget/ImageViewerImageView;->position:I

    .line 23
    return-void
.end method


# virtual methods
.method protected buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V
    .locals 1
    .param p1, "builder"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setFadeDuration(I)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 28
    return-void
.end method

.method public displayImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 3
    .param p1, "image"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/vk/attachpicker/widget/ImageViewerImageView;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 36
    iget-object v0, p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    sget-object v1, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    sget-object v2, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;Lcom/vk/imageloader/ImageSize;)V

    .line 37
    return-void
.end method

.method public getCurrentPositionInImageViewer()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/vk/attachpicker/widget/ImageViewerImageView;->currentPositionInImageViewer:I

    return v0
.end method

.method public getEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/attachpicker/widget/ImageViewerImageView;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 40
    iget v0, p0, Lcom/vk/attachpicker/widget/ImageViewerImageView;->position:I

    return v0
.end method

.method public setCurrentPositionInImageViewer(I)V
    .locals 0
    .param p1, "currentPositionInImageViewer"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/vk/attachpicker/widget/ImageViewerImageView;->currentPositionInImageViewer:I

    .line 49
    return-void
.end method

.method public updatePhotoViewAttacher()V
    .locals 2

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->hasImage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getImageWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getImageHeight()I

    move-result v1

    invoke-super {p0, v0, v1}, Lcom/vk/imageloader/view/VKZoomableImageView;->update(II)V

    .line 55
    :cond_0
    return-void
.end method
