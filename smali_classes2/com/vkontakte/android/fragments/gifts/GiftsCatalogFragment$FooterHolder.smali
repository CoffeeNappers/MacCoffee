.class Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$FooterHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftsCatalogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FooterHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/GiftCategory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 433
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$FooterHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .line 434
    const v0, 0x7f0300b7

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 435
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/models/GiftCategory;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/api/models/GiftCategory;

    .prologue
    .line 440
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 431
    check-cast p1, Lcom/vkontakte/android/api/models/GiftCategory;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$FooterHolder;->onBind(Lcom/vkontakte/android/api/models/GiftCategory;)V

    return-void
.end method
