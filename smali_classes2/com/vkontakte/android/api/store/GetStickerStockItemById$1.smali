.class Lcom/vkontakte/android/api/store/GetStickerStockItemById$1;
.super Ljava/lang/Object;
.source "GetStickerStockItemById.java"

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/store/GetStickerStockItemById;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/orm/StickerStockItem;
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
.field final synthetic this$0:Lcom/vkontakte/android/api/store/GetStickerStockItemById;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/store/GetStickerStockItemById;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/store/GetStickerStockItemById;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/vkontakte/android/api/store/GetStickerStockItemById$1;->this$0:Lcom/vkontakte/android/api/store/GetStickerStockItemById;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public f(Lcom/vkontakte/android/data/orm/StickerStockItem;)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 41
    return-object p1
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 38
    check-cast p1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/store/GetStickerStockItemById$1;->f(Lcom/vkontakte/android/data/orm/StickerStockItem;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    return-object v0
.end method
