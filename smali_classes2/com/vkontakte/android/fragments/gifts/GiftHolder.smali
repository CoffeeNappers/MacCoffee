.class Lcom/vkontakte/android/fragments/gifts/GiftHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/CatalogedGift;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private mItemMinSize:I

.field private mListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/api/models/CatalogedGift;",
            ">;"
        }
    .end annotation
.end field

.field private final mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private mSize:I

.field private final mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 28
    const v0, 0x7f0300b8

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 29
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09001d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mItemMinSize:I

    .line 30
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 31
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mTitle:Landroid/widget/TextView;

    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mSize:I

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setFixedSize(I)V

    .line 35
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/models/CatalogedGift;)V
    .locals 7
    .param p1, "item"    # Lcom/vkontakte/android/api/models/CatalogedGift;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 52
    invoke-virtual {p1}, Lcom/vkontakte/android/api/models/CatalogedGift;->isFree()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->disabled:Z

    if-nez v3, :cond_0

    iget-object v3, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    if-eqz v3, :cond_0

    iget-object v3, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lez v3, :cond_0

    move v0, v1

    .line 53
    .local v0, "free":Z
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-boolean v3, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->disabled:Z

    if-eqz v3, :cond_1

    const/high16 v3, 0x3f000000    # 0.5f

    :goto_1
    invoke-virtual {v4, v3}, Lcom/vk/imageloader/view/VKImageView;->setAlpha(F)V

    .line 54
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    sget-object v3, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v3, v3, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    :goto_2
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 55
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    const v3, -0xae7e48

    :goto_3
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mTitle:Landroid/widget/TextView;

    iget-boolean v4, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->disabled:Z

    if-eqz v4, :cond_4

    const v1, 0x7f08071b

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_4
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget v3, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mItemMinSize:I

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/models/Gift;->getImage(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 58
    return-void

    .end local v0    # "free":Z
    :cond_0
    move v0, v2

    .line 52
    goto :goto_0

    .line 53
    .restart local v0    # "free":Z
    :cond_1
    const/high16 v3, 0x3f800000    # 1.0f

    goto :goto_1

    .line 54
    :cond_2
    const/4 v3, 0x0

    goto :goto_2

    .line 55
    :cond_3
    const v3, -0x6f6b67

    goto :goto_3

    .line 56
    :cond_4
    if-eqz v0, :cond_5

    const v4, 0x7f0d001b

    iget-object v5, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v6, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    aput-object v6, v1, v2

    invoke-virtual {p0, v4, v5, v1}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_5
    const v4, 0x7f0d0003

    iget v5, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->price:I

    new-array v1, v1, [Ljava/lang/Object;

    iget v6, p1, Lcom/vkontakte/android/api/models/CatalogedGift;->price:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v1, v2

    invoke-virtual {p0, v4, v5, v1}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lcom/vkontakte/android/api/models/CatalogedGift;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->onBind(Lcom/vkontakte/android/api/models/CatalogedGift;)V

    return-void
.end method

.method public onClick(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/gifts/GiftHolder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/api/models/CatalogedGift;",
            ">;)",
            "Lcom/vkontakte/android/fragments/gifts/GiftHolder;"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "callback":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/api/models/CatalogedGift;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 47
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 65
    :cond_0
    return-void
.end method

.method public setSize(I)Lcom/vkontakte/android/fragments/gifts/GiftHolder;
    .locals 2
    .param p1, "size"    # I

    .prologue
    .line 38
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mSize:I

    if-eq p1, v0, :cond_0

    .line 39
    iput p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mSize:I

    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->mSize:I

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setFixedSize(I)V

    .line 42
    :cond_0
    return-object p0
.end method
