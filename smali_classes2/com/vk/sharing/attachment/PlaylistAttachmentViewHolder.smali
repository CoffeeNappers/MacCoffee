.class final Lcom/vk/sharing/attachment/PlaylistAttachmentViewHolder;
.super Lcom/vk/sharing/attachment/DataViewHolder;
.source "AttachmentViewHolder.java"


# instance fields
.field private imageView:Lcom/vk/music/view/ThumbsImageView;

.field private titleView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 394
    invoke-direct {p0, p1}, Lcom/vk/sharing/attachment/DataViewHolder;-><init>(Landroid/os/Bundle;)V

    .line 395
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
    .line 415
    iget-object v0, p0, Lcom/vk/sharing/attachment/PlaylistAttachmentViewHolder;->imageView:Lcom/vk/music/view/ThumbsImageView;

    const-string/jumbo v1, "thumbs"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumbs(Ljava/util/List;)V

    .line 416
    iget-object v0, p0, Lcom/vk/sharing/attachment/PlaylistAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    const-string/jumbo v1, "title"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
    return-void
.end method

.method createView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
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
    const/16 v4, 0x8

    .line 400
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030141

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 402
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1003cb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/music/view/ThumbsImageView;

    iput-object v1, p0, Lcom/vk/sharing/attachment/PlaylistAttachmentViewHolder;->imageView:Lcom/vk/music/view/ThumbsImageView;

    .line 403
    const v1, 0x7f1003cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/sharing/attachment/PlaylistAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    .line 405
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 406
    const v1, 0x7f1003de

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 407
    const v1, 0x7f1003e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 408
    const v1, 0x7f1003e1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 410
    return-object v0
.end method
