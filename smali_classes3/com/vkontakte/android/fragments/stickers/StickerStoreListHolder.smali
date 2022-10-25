.class public Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "StickerStoreListHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/orm/StickerStockItem;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private final mActionListener:Landroid/view/View$OnClickListener;

.field private mError:Landroid/view/View;

.field private mOkButton:Landroid/view/View;

.field private mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mStickerButton:Landroid/widget/TextView;

.field private mSubtitle:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "actionListener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v2, 0x0

    .line 47
    const v1, 0x7f030206

    invoke-direct {p0, v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 48
    iput-object p2, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mActionListener:Landroid/view/View$OnClickListener;

    .line 50
    new-instance v0, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v0, v2}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    .line 51
    .local v0, "pd":Lcom/vkontakte/android/ui/CircularProgressDrawable;
    const v1, -0xae7e48

    invoke-virtual {v0, v2, v1}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setColors(II)V

    .line 52
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setThickness(F)V

    .line 53
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setPad(Z)V

    .line 54
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setDimBackground(Z)V

    .line 56
    const v1, 0x7f100544

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mStickerButton:Landroid/widget/TextView;

    .line 57
    const v1, 0x7f100546

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->$(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mOkButton:Landroid/view/View;

    .line 58
    const v1, 0x7f100545

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mProgress:Landroid/widget/ProgressBar;

    .line 59
    const v1, 0x7f100547

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->$(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mError:Landroid/view/View;

    .line 60
    const v1, 0x7f1001e8

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 61
    const v1, 0x7f100128

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mTitle:Landroid/widget/TextView;

    .line 62
    const v1, 0x7f10019c

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mSubtitle:Landroid/widget/TextView;

    .line 64
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 65
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mStickerButton:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mActionListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mError:Landroid/view/View;

    new-instance v2, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder$1;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;)Landroid/view/View$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mActionListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public static bindButtons(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/widget/TextView;Landroid/view/View;Landroid/widget/ProgressBar;Landroid/view/View;)V
    .locals 3
    .param p0, "data"    # Lcom/vkontakte/android/data/orm/StickerStockItem;
    .param p1, "stickerButton"    # Landroid/widget/TextView;
    .param p2, "okButton"    # Landroid/view/View;
    .param p3, "progress"    # Landroid/widget/ProgressBar;
    .param p4, "error"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x8

    .line 83
    iget-boolean v0, p0, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-eqz v0, :cond_0

    .line 84
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 85
    invoke-virtual {p3, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 86
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 87
    invoke-virtual {p4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 111
    :goto_0
    return-void

    .line 89
    :cond_0
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 90
    invoke-virtual {p3, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 91
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 92
    invoke-virtual {p4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 94
    invoke-static {p0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getIsPurchaseNotAllowedWithReason(Lcom/vkontakte/android/data/orm/StickerStockItem;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 95
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 96
    invoke-virtual {p4, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/StickerStockItem;->payment_type:Lcom/vkontakte/android/api/models/PaymentType;

    sget-object v1, Lcom/vkontakte/android/api/models/PaymentType;->Inapp:Lcom/vkontakte/android/api/models/PaymentType;

    if-ne v0, v1, :cond_2

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    iget-boolean v0, p0, Lcom/vkontakte/android/data/orm/StickerStockItem;->can_purchase:Z

    if-nez v0, :cond_4

    .line 102
    :cond_3
    const v0, 0x7f08071b

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 103
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 104
    invoke-virtual {p1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_0

    .line 106
    :cond_4
    iget-boolean v0, p0, Lcom/vkontakte/android/data/orm/StickerStockItem;->free:Z

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f080529

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 108
    invoke-virtual {p1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_0

    .line 106
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/StickerStockItem;->price_str:Ljava/lang/String;

    goto :goto_1
.end method

.method public static getIsPurchaseNotAllowedWithReason(Lcom/vkontakte/android/data/orm/StickerStockItem;)Z
    .locals 1
    .param p0, "data"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 40
    if-eqz p0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/data/orm/StickerStockItem;->can_purchase:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/data/orm/StickerStockItem;->no_purchase_reason:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/data/orm/StickerStockItem;->no_purchase_reason:Ljava/lang/String;

    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 6
    .param p1, "data"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    const/4 v5, 0x0

    const/high16 v4, 0x40e00000    # 7.0f

    const/4 v3, 0x0

    .line 115
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getThumbUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mTitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-boolean v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->isNew:Z

    if-eqz v1, :cond_0

    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0202a9

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 119
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-virtual {v0, v5, v5, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 120
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 121
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mTitle:Landroid/widget/TextView;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 125
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->author:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mStickerButton:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mOkButton:Landroid/view/View;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mProgress:Landroid/widget/ProgressBar;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mError:Landroid/view/View;

    invoke-static {p1, v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->bindButtons(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/widget/TextView;Landroid/view/View;Landroid/widget/ProgressBar;Landroid/view/View;)V

    .line 128
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mStickerButton:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 129
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mError:Landroid/view/View;

    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 131
    return-void

    .line 123
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 27
    check-cast p1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->onBind(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->itemView:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 136
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    const-string/jumbo v1, "store"

    iput-object v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->referrer:Ljava/lang/String;

    .line 137
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/content/Context;)V

    .line 139
    :cond_0
    return-void
.end method
