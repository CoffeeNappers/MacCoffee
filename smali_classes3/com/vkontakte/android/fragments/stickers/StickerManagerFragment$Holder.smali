.class Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "StickerManagerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Holder"
.end annotation

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
.field private mActionButton:Landroid/widget/ImageView;

.field private mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 344
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    .line 345
    const v0, 0x7f030203

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 346
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->mTitle:Landroid/widget/TextView;

    .line 347
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 348
    const v0, 0x7f1002b7

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->mActionButton:Landroid/widget/ImageView;

    .line 349
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 350
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->mActionButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 351
    return-void
.end method


# virtual methods
.method synthetic lambda$onClick$0(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 369
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->setActiveState(Lcom/vkontakte/android/data/orm/StickerStockItem;Z)V

    return-void
.end method

.method public onBind(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 355
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mPhotoSize:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getPhoto(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 356
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->mTitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 357
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->mActionButton:Landroid/widget/ImageView;

    iget-boolean v0, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-eqz v0, :cond_0

    const v0, 0x7f0201dd

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 358
    return-void

    .line 357
    :cond_0
    const v0, 0x7f0201db

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 338
    check-cast p1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->onBind(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 362
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->mActionButton:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_2

    .line 363
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-nez v0, :cond_1

    .line 364
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->setActiveState(Lcom/vkontakte/android/data/orm/StickerStockItem;Z)V

    .line 376
    :cond_0
    :goto_0
    return-void

    .line 366
    :cond_1
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 367
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0806c2

    .line 368
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 369
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 370
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 371
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 373
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->itemView:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 374
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/content/Context;)V

    goto :goto_0
.end method
