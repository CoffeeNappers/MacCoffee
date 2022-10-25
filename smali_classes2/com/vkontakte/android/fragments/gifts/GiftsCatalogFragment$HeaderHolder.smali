.class Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftsCatalogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeaderHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/GiftCategory;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private final mAction:Landroid/widget/TextView;

.field private final mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 353
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .line 354
    const v0, 0x7f0300b9

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 355
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->mTitle:Landroid/widget/TextView;

    .line 356
    const v0, 0x7f1002b7

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->mAction:Landroid/widget/TextView;

    .line 357
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->mAction:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/models/GiftCategory;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/api/models/GiftCategory;

    .prologue
    .line 362
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->mTitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/api/models/GiftCategory;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 363
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 348
    check-cast p1, Lcom/vkontakte/android/api/models/GiftCategory;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->onBind(Lcom/vkontakte/android/api/models/GiftCategory;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 367
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/GiftCategory;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->showCategory(Lcom/vkontakte/android/api/models/GiftCategory;)V

    .line 368
    return-void
.end method
