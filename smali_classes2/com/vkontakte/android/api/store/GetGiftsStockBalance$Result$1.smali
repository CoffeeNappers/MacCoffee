.class Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result$1;
.super Ljava/lang/Object;
.source "GetGiftsStockBalance.java"

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;-><init>(Lcom/vkontakte/android/api/store/GetGiftsStockBalance;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/functions/F1",
        "<",
        "Ljava/lang/String;",
        "Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;

.field final synthetic val$this$0:Lcom/vkontakte/android/api/store/GetGiftsStockBalance;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;Lcom/vkontakte/android/api/store/GetGiftsStockBalance;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result$1;->this$1:Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;

    iput-object p2, p0, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result$1;->val$this$0:Lcom/vkontakte/android/api/store/GetGiftsStockBalance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 47
    check-cast p1, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result$1;->f(Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public f(Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;)Ljava/lang/String;
    .locals 1
    .param p1, "product"    # Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;

    .prologue
    .line 50
    iget-object v0, p1, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;->merchant_product_id:Ljava/lang/String;

    return-object v0
.end method
