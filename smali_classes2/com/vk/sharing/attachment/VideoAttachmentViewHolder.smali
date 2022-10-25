.class final Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;
.super Lcom/vk/sharing/attachment/DataViewHolder;
.source "AttachmentViewHolder.java"


# instance fields
.field private imageView:Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private textView:Landroid/widget/TextView;
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
    .line 181
    invoke-direct {p0, p1}, Lcom/vk/sharing/attachment/DataViewHolder;-><init>(Landroid/os/Bundle;)V

    .line 182
    return-void
.end method


# virtual methods
.method public bind(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 210
    iget-object v1, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v1, :cond_0

    .line 211
    iget-object v1, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const-string/jumbo v2, "thumbUrl"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    .line 213
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 214
    const-string/jumbo v1, "duration"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 215
    .local v0, "duration":I
    iget-object v2, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    if-lez v0, :cond_2

    invoke-static {v0}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .end local v0    # "duration":I
    :cond_1
    return-void

    .line 215
    .restart local v0    # "duration":I
    :cond_2
    const-string/jumbo v1, ""

    goto :goto_0
.end method

.method public createView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
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
    const/4 v7, -0x2

    .line 187
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 189
    .local v0, "container":Landroid/widget/FrameLayout;
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 190
    .local v2, "subContainer":Landroid/widget/FrameLayout;
    new-instance v3, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v3, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 191
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const v4, 0x7f0202d4

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 192
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x60

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    const/16 v6, 0x48

    invoke-static {v6}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    .line 195
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    sget-object v4, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v4, v4, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 196
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/4 v4, 0x1

    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v3, v4, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 197
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 198
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 199
    const/4 v3, 0x4

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    .line 200
    .local v1, "padding":I
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v3, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 201
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const v4, 0x7f02007b

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 202
    iget-object v3, p0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;->textView:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x55

    invoke-direct {v4, v7, v7, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 204
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 205
    return-object v0
.end method
