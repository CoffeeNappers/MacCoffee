.class Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "PickPhotoGalleryViewHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
        ">;"
    }
.end annotation


# instance fields
.field private vkImageView:Lcom/vk/imageloader/view/VKImageView;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 18
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;->itemView:Landroid/view/View;

    const v1, 0x1020006

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;->vkImageView:Lcom/vk/imageloader/view/VKImageView;

    .line 19
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;->vkImageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v1, Lcom/vk/imageloader/transform/BlurPostProcessor;

    invoke-direct {v1}, Lcom/vk/imageloader/transform/BlurPostProcessor;-><init>()V

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 20
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 3
    .param p1, "item"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;->vkImageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    sget-object v2, Lcom/vk/imageloader/ImageSize;->BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0, v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    .line 25
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 12
    check-cast p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;->onBind(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    return-void
.end method
