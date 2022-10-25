.class Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GoodsBlockPostDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CardViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/attachments/ShitAttachment$Card;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private button:Landroid/widget/TextView;

.field private contentPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private description:Landroid/widget/TextView;

.field private followers:Landroid/widget/TextView;

.field private padding:I

.field private postDisplayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

.field private rating:Lcom/vkontakte/android/ui/RatingView;

.field private shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

.field private size:I

.field private title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 221
    const v0, 0x7f03015d

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 223
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->title:Landroid/widget/TextView;

    .line 224
    const v0, 0x7f1001dd

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->button:Landroid/widget/TextView;

    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->button:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 226
    const v0, 0x7f1001dc

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->followers:Landroid/widget/TextView;

    .line 227
    const v0, 0x7f1001fa

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/RatingView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->rating:Lcom/vkontakte/android/ui/RatingView;

    .line 228
    const v0, 0x7f1001cc

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->description:Landroid/widget/TextView;

    .line 229
    const v0, 0x7f100401

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->button:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 234
    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    .prologue
    .line 210
    iget v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->size:I

    return v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    .prologue
    .line 210
    iget v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->padding:I

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Lcom/vkontakte/android/ui/RatingView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->rating:Lcom/vkontakte/android/ui/RatingView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->button:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->followers:Landroid/widget/TextView;

    return-object v0
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/attachments/ShitAttachment$Card;Lcom/vkontakte/android/attachments/ShitAttachment;Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;II)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    .param p2, "shitAttachment"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p3, "postDisplayItem"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;
    .param p4, "padding"    # I
    .param p5, "size"    # I

    .prologue
    .line 247
    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    .line 248
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 249
    iput p4, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->padding:I

    .line 250
    iput p5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->size:I

    .line 251
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->bind(Ljava/lang/Object;)V

    .line 252
    return-void
.end method

.method public onBind(Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V
    .locals 5
    .param p1, "card"    # Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    .prologue
    const/4 v2, 0x0

    .line 256
    iget-boolean v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->installed:Z

    if-eqz v1, :cond_0

    iget-object v0, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->buttonTextInstalled:Ljava/lang/String;

    .line 258
    .local v0, "buttonText":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->title:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->title:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 260
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->rating:Lcom/vkontakte/android/ui/RatingView;

    iget v3, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->rating:F

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/ui/RatingView;->setRating(F)V

    .line 261
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->followers:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->followers:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->description:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->description:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->description:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->description:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 264
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v3, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->size:I

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 265
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    iget v3, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->size:I

    int-to-float v3, v3

    iget v4, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->size:I

    int-to-float v4, v4

    invoke-virtual {v1, v3, v4, v2, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment;->setViewSize(FFZZ)V

    .line 266
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->contentPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {v2}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getThumbURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 268
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->button:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;-><init>(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 290
    invoke-static {p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->access$700(Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V

    .line 291
    return-void

    .line 256
    .end local v0    # "buttonText":Ljava/lang/String;
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->buttonText:Ljava/lang/String;

    goto :goto_0

    .restart local v0    # "buttonText":Ljava/lang/String;
    :cond_1
    move v1, v2

    .line 263
    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 210
    check-cast p1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->onBind(Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 238
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 240
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    invoke-static {v1, v2, v0, p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->access$100(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;Lcom/vkontakte/android/attachments/ShitAttachment;Lcom/vkontakte/android/attachments/ShitAttachment$Card;Landroid/view/View;)V

    .line 243
    return-void
.end method
