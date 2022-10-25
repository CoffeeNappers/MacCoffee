.class Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId$1;
.super Ljava/lang/Object;
.source "GetStickerStockItemByStickerId.java"

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/orm/StickerStockItem;
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
        "Lcom/vkontakte/android/data/orm/StickerStockItem;",
        "Lcom/vkontakte/android/data/orm/StickerStockItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId$1;->this$0:Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public f(Lcom/vkontakte/android/data/orm/StickerStockItem;)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 37
    return-object p1
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 34
    check-cast p1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/store/GetStickerStockItemByStickerId$1;->f(Lcom/vkontakte/android/data/orm/StickerStockItem;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    return-object v0
.end method
