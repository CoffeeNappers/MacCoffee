.class Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ShitBlockPostDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolderItem"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/attachments/ShitAttachment;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final attachSubtitle:Lcom/vkontakte/android/ui/widget/AdsButton;

.field final attachTitle:Landroid/widget/TextView;

.field final border:Landroid/view/View;

.field final content:Landroid/view/ViewGroup;

.field final contentPhoto:Lcom/vk/imageloader/view/VKImageView;

.field contentVideo:Landroid/view/View;

.field count:I

.field height:I

.field final photo:Lcom/vk/imageloader/view/VKImageView;

.field postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

.field final postOptionsButton:Landroid/view/View;

.field final ratingView:Lcom/vkontakte/android/ui/RatingView;

.field final subtitle:Landroid/widget/TextView;

.field final text:Landroid/widget/TextView;

.field final title:Landroid/widget/TextView;

.field videoAttachment:Lcom/vkontakte/android/attachments/VideoAttachment;

.field width:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 278
    const v0, 0x7f030169

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 280
    const v0, 0x7f10000e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->content:Landroid/view/ViewGroup;

    .line 281
    const v0, 0x7f100401

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    const v1, -0xd0d0e

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderColor(I)V

    .line 283
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 284
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->title:Landroid/widget/TextView;

    .line 285
    const v0, 0x7f100417

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->border:Landroid/view/View;

    .line 286
    const v0, 0x7f1001c3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->text:Landroid/widget/TextView;

    .line 287
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->subtitle:Landroid/widget/TextView;

    .line 288
    const v0, 0x7f1001dc

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->attachTitle:Landroid/widget/TextView;

    .line 289
    const v0, 0x7f1001dd

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/AdsButton;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->attachSubtitle:Lcom/vkontakte/android/ui/widget/AdsButton;

    .line 290
    const v0, 0x7f1001fa

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/RatingView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->ratingView:Lcom/vkontakte/android/ui/RatingView;

    .line 291
    const v0, 0x7f100400

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->postOptionsButton:Landroid/view/View;

    .line 292
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->postOptionsButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 294
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 296
    return-void
.end method

.method private ensureContentVideoIsReturnedToPool()V
    .locals 3

    .prologue
    .line 327
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    if-eqz v1, :cond_2

    .line 328
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 329
    .local v0, "tag":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-nez v1, :cond_0

    instance-of v1, v0, Lcom/vkontakte/android/attachments/AttachmentViewHolder;

    if-eqz v1, :cond_1

    .line 330
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/attachments/Attachment;->reuseView(Landroid/view/View;Ljava/lang/String;)V

    .line 332
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->content:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 333
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    .line 335
    .end local v0    # "tag":Ljava/lang/Object;
    :cond_2
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/attachments/ShitAttachment;IIILcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;)V
    .locals 1
    .param p1, "item"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p2, "count"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "postDisplayItem"    # Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    .prologue
    .line 299
    iput p2, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->count:I

    .line 300
    iput p3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->width:I

    .line 301
    iput p4, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->height:I

    .line 302
    iput-object p5, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    .line 303
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->attachSubtitle:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/ui/widget/AdsButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 304
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->bind(Ljava/lang/Object;)V

    .line 305
    return-void
.end method

.method public onBind(Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 8
    .param p1, "a"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    const/4 v7, 0x1

    const/4 v6, -0x2

    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 339
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->itemView:Landroid/view/View;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget v5, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->width:I

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 340
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->border:Landroid/view/View;

    iget v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->count:I

    if-le v1, v7, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 342
    if-eqz p1, :cond_6

    .line 343
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->itemView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 344
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    if-nez v1, :cond_2

    .line 346
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v1, :cond_0

    .line 347
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    iget v4, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->width:I

    int-to-float v4, v4

    iget v5, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->height:I

    int-to-float v5, v5

    invoke-virtual {v1, v4, v5, v2, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment;->setViewSize(FFZZ)V

    .line 348
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {v4}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getThumbURL()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 349
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v4, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->height:I

    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 350
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 351
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    invoke-static {v1, v3}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 360
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->userPhoto:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 362
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->title:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->userName:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 363
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->genre:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->count:I

    if-ne v1, v7, :cond_3

    const-string/jumbo v1, ""

    :goto_2
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 364
    .local v0, "genre":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 365
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->text:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->text:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 366
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->text:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v6, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 367
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->attachTitle:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->followers:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 368
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->attachSubtitle:Lcom/vkontakte/android/ui/widget/AdsButton;

    iget-boolean v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    if-eqz v1, :cond_4

    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonTextInstalled:Ljava/lang/String;

    :goto_3
    invoke-virtual {v4, v1}, Lcom/vkontakte/android/ui/widget/AdsButton;->setText(Ljava/lang/CharSequence;)V

    .line 369
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->ratingView:Lcom/vkontakte/android/ui/RatingView;

    iget v4, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->rating:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-lez v4, :cond_5

    :goto_4
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/RatingView;->setVisibility(I)V

    .line 370
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->ratingView:Lcom/vkontakte/android/ui/RatingView;

    iget v2, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->rating:F

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/RatingView;->setRating(F)V

    .line 374
    .end local v0    # "genre":Ljava/lang/String;
    :goto_5
    return-void

    .line 340
    :cond_1
    const/4 v1, 0x4

    goto/16 :goto_0

    .line 355
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v6, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 356
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1, v3}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 357
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    goto :goto_1

    .line 363
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, " "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->ageRestriction:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 368
    .restart local v0    # "genre":Ljava/lang/String;
    :cond_4
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonText:Ljava/lang/String;

    goto :goto_3

    :cond_5
    move v2, v3

    .line 369
    goto :goto_4

    .line 372
    .end local v0    # "genre":Ljava/lang/String;
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->itemView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 264
    check-cast p1, Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->onBind(Lcom/vkontakte/android/attachments/ShitAttachment;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 378
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 383
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-virtual {v1, v0, p1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->onItemClicked(Lcom/vkontakte/android/attachments/ShitAttachment;Landroid/view/View;)V

    .line 386
    :goto_0
    return-void

    .line 380
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-virtual {v1, v0, p1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->onMenuClicked(Lcom/vkontakte/android/attachments/ShitAttachment;Landroid/view/View;)V

    goto :goto_0

    .line 378
    nop

    :pswitch_data_0
    .packed-switch 0x7f100400
        :pswitch_0
    .end packed-switch
.end method

.method public setVideoAttachment(Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 2
    .param p1, "shitAttachment"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 308
    if-nez p1, :cond_0

    .line 324
    :goto_0
    return-void

    .line 310
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->videoAttachment:Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 312
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->videoAttachment:Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v0, :cond_1

    .line 313
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->ensureContentVideoIsReturnedToPool()V

    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->videoAttachment:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->setShitAttachment(Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->videoAttachment:Lcom/vkontakte/android/attachments/VideoAttachment;

    const-string/jumbo v1, "video_ads"

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->setLayoutTag(Ljava/lang/String;)V

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->videoAttachment:Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    .line 317
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 318
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->videoAttachment:Lcom/vkontakte/android/attachments/VideoAttachment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->bind(Landroid/view/View;)V

    .line 319
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->content:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->contentVideo:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 322
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->ensureContentVideoIsReturnedToPool()V

    goto :goto_0
.end method
