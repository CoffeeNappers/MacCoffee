.class final Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;
.super Lcom/vk/sharing/attachment/DataViewHolder;
.source "AttachmentViewHolder.java"


# instance fields
.field private artistView:Landroid/widget/TextView;

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
    .line 362
    invoke-direct {p0, p1}, Lcom/vk/sharing/attachment/DataViewHolder;-><init>(Landroid/os/Bundle;)V

    .line 363
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
    .line 382
    iget-object v1, p0, Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;->imageView:Lcom/vk/music/view/ThumbsImageView;

    const-string/jumbo v0, "thumb"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Thumb;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 383
    iget-object v0, p0, Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    const-string/jumbo v1, "title"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 384
    iget-object v0, p0, Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;->artistView:Landroid/widget/TextView;

    const-string/jumbo v1, "artist"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 385
    return-void
.end method

.method createView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
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
    .line 368
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030123

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 370
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1003bd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/music/view/ThumbsImageView;

    iput-object v1, p0, Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;->imageView:Lcom/vk/music/view/ThumbsImageView;

    .line 371
    const v1, 0x7f100216

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    .line 372
    const v1, 0x7f100217

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;->artistView:Landroid/widget/TextView;

    .line 374
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 375
    const v1, 0x7f1003bf

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 377
    return-object v0
.end method
