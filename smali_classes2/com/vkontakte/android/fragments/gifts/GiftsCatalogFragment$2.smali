.class Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "GiftsCatalogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/gifts/GiftsGetCatalog$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/gifts/GiftsGetCatalog$Result;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/gifts/GiftsGetCatalog$Result;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    iget v1, p1, Lcom/vkontakte/android/api/gifts/GiftsGetCatalog$Result;->votes:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$302(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;I)I

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/gifts/GiftsGetCatalog$Result;->catalog:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->onDataLoaded(Ljava/util/List;)V

    .line 199
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 194
    check-cast p1, Lcom/vkontakte/android/api/gifts/GiftsGetCatalog$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$2;->success(Lcom/vkontakte/android/api/gifts/GiftsGetCatalog$Result;)V

    return-void
.end method
