.class final Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;
.super Lcom/vk/sharing/attachment/DataViewHolder;
.source "AttachmentViewHolder.java"


# instance fields
.field private imageView:Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private priceView:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private titleView:Landroid/widget/TextView;
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
    .line 293
    invoke-direct {p0, p1}, Lcom/vk/sharing/attachment/DataViewHolder;-><init>(Landroid/os/Bundle;)V

    .line 294
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
    .line 344
    iget-object v0, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_0

    .line 345
    iget-object v0, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const-string/jumbo v1, "thumbUrl"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 347
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 348
    iget-object v0, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    const-string/jumbo v1, "title"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 350
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 351
    iget-object v0, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    const-string/jumbo v1, "cost"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    :cond_2
    return-void
.end method

.method createView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
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
    .line 299
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 301
    .local v0, "container":Landroid/widget/FrameLayout;
    const/16 v7, 0x60

    invoke-static {v7}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    .line 302
    .local v3, "itemWidth":I
    const/16 v7, 0x48

    invoke-static {v7}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    .line 303
    .local v2, "itemHeight":I
    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 304
    .local v5, "subContainer":Landroid/widget/FrameLayout;
    new-instance v7, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v7, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 305
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v8, Landroid/graphics/drawable/ColorDrawable;

    const v9, 0x7f0f00b4

    invoke-static {p1, v9}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v8, v9}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v7, v8}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 306
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v9, -0x1

    const/4 v10, -0x1

    invoke-direct {v8, v9, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 308
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 309
    .local v1, "dimContainer":Landroid/widget/FrameLayout;
    const v7, 0x7f02007b

    invoke-virtual {v1, v7}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    .line 310
    const/4 v7, 0x4

    invoke-static {v7}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    .line 311
    .local v4, "padding":I
    invoke-virtual {v1, v4, v4, v4, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 312
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v1, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 314
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 315
    .local v6, "textContainer":Landroid/widget/LinearLayout;
    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 317
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    .line 318
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    sget-object v8, Lcom/vkontakte/android/ui/Font;->Regular:Lcom/vkontakte/android/ui/Font;

    iget-object v8, v8, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 319
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    const/4 v8, 0x1

    const/high16 v9, 0x41400000    # 12.0f

    invoke-virtual {v7, v8, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 320
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    const/4 v8, -0x1

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 321
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 322
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    const/4 v8, 0x2

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 323
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 324
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 325
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->titleView:Landroid/widget/TextView;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    const/4 v10, -0x2

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    .line 328
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    sget-object v8, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v8, v8, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 329
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    const/4 v8, 0x1

    const/high16 v9, 0x41400000    # 12.0f

    invoke-virtual {v7, v8, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 330
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    const/4 v8, -0x1

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 331
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 332
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 333
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 334
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 335
    iget-object v7, p0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;->priceView:Landroid/widget/TextView;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    const/4 v10, -0x2

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 336
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x2

    const/16 v10, 0x11

    invoke-direct {v7, v8, v9, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v6, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 338
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v7, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 339
    return-object v0
.end method
