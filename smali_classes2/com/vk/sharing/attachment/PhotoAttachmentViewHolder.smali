.class final Lcom/vk/sharing/attachment/PhotoAttachmentViewHolder;
.super Lcom/vk/sharing/attachment/DataViewHolder;
.source "AttachmentViewHolder.java"


# instance fields
.field private imageView:Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 151
    invoke-direct {p0, p1}, Lcom/vk/sharing/attachment/DataViewHolder;-><init>(Landroid/os/Bundle;)V

    .line 152
    return-void
.end method


# virtual methods
.method public bind(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vk/sharing/attachment/PhotoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/vk/sharing/attachment/PhotoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const-string/jumbo v1, "thumbUrl"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 170
    :cond_0
    return-void
.end method

.method public createView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 157
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 159
    .local v0, "container":Landroid/widget/FrameLayout;
    new-instance v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v1, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vk/sharing/attachment/PhotoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 160
    iget-object v1, p0, Lcom/vk/sharing/attachment/PhotoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const v2, 0x7f020337

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 161
    iget-object v1, p0, Lcom/vk/sharing/attachment/PhotoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x60

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    const/16 v4, 0x48

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    return-object v0
.end method
