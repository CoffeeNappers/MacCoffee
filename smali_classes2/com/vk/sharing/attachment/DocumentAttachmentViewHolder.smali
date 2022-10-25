.class final Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;
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
    .line 228
    invoke-direct {p0, p1}, Lcom/vk/sharing/attachment/DataViewHolder;-><init>(Landroid/os/Bundle;)V

    .line 229
    return-void
.end method

.method private static format(Ljava/lang/String;ILandroid/content/res/Resources;)Ljava/lang/String;
    .locals 4
    .param p0, "extension"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "size"    # I
    .param p2, "res"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 267
    if-eqz p0, :cond_1

    .line 268
    if-lez p1, :cond_0

    .line 269
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    int-to-long v2, p1

    invoke-static {v2, v3, p2}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 277
    :goto_0
    return-object v0

    .line 271
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 274
    :cond_1
    if-lez p1, :cond_2

    .line 275
    int-to-long v0, p1

    invoke-static {v0, v1, p2}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 277
    :cond_2
    const-string/jumbo v0, ""

    goto :goto_0
.end method


# virtual methods
.method public bind(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 257
    iget-object v0, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const-string/jumbo v1, "thumbUrl"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0, v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 261
    iget-object v0, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const-string/jumbo v1, "extension"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "size"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->format(Ljava/lang/String;ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    :cond_1
    return-void
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

    .line 234
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 236
    .local v0, "container":Landroid/widget/FrameLayout;
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 237
    .local v2, "subContainer":Landroid/widget/FrameLayout;
    new-instance v3, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v3, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 238
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    const v5, 0x7f0f00b4

    invoke-static {p1, v5}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v4, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 239
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x60

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    const/16 v6, 0x48

    invoke-static {v6}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 241
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    .line 242
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    sget-object v4, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v4, v4, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 243
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/4 v4, 0x1

    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v3, v4, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 244
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 245
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 246
    const/4 v3, 0x4

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    .line 247
    .local v1, "padding":I
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v3, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 248
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const v4, 0x7f02007b

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 249
    iget-object v3, p0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;->textView:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x51

    invoke-direct {v4, v7, v7, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 251
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 252
    return-object v0
.end method
