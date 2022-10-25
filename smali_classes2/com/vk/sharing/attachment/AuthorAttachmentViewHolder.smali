.class Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;
.super Lcom/vk/sharing/attachment/DataViewHolder;
.source "AttachmentViewHolder.java"


# instance fields
.field private imageView:Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final label:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private textView:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/os/Bundle;I)V
    .locals 0
    .param p1, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "label"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 87
    invoke-direct {p0, p1}, Lcom/vk/sharing/attachment/DataViewHolder;-><init>(Landroid/os/Bundle;)V

    .line 88
    iput p2, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->label:I

    .line 89
    return-void
.end method


# virtual methods
.method public final bind(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const-string/jumbo v1, "authorPhotoUrl"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const-string/jumbo v1, "authorName"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    :cond_1
    return-void
.end method

.method public final createView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
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
    const/16 v11, 0x14

    const/4 v10, -0x1

    const/4 v9, 0x0

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 94
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 96
    .local v0, "container":Landroid/widget/FrameLayout;
    new-instance v5, Lcom/vk/imageloader/view/VKCircleImageView;

    invoke-direct {v5, p1}, Lcom/vk/imageloader/view/VKCircleImageView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 97
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const v6, 0x7f02039a

    invoke-virtual {v5, v6}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 98
    const/16 v5, 0x30

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    .line 99
    .local v1, "imageSize":I
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    const/16 v5, 0x3c

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    .line 102
    .local v4, "textMarginLeft":I
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    .line 103
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    sget-object v6, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v6, v6, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 104
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/high16 v6, 0x41700000    # 15.0f

    invoke-virtual {v5, v8, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 105
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const v6, 0x7f0f00af

    invoke-static {p1, v6}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 106
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 107
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 108
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 109
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/4 v6, 0x6

    invoke-static {v6}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 110
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const v6, 0x7f0200d1

    .line 111
    invoke-static {p1, v6}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 110
    invoke-virtual {v5, v6, v9, v9, v9}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 117
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    const/16 v6, 0x10

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 118
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v11}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    invoke-direct {v3, v10, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 119
    .local v3, "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    const/4 v5, 0x4

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    invoke-virtual {v3, v4, v5, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 120
    iget-object v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, v5, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 123
    .local v2, "labelView":Landroid/widget/TextView;
    iget v5, p0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;->label:I

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(I)V

    .line 124
    sget-object v5, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v5, v5, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 125
    const/high16 v5, 0x41600000    # 14.0f

    invoke-virtual {v2, v8, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 126
    const v5, 0x7f0f003d

    invoke-static {p1, v5}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 127
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 128
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .end local v3    # "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    invoke-static {v11}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    invoke-direct {v3, v10, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 129
    .restart local v3    # "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v5, 0x1a

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    invoke-virtual {v3, v4, v5, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 130
    invoke-virtual {v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    return-object v0
.end method
