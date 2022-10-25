.class Lcom/vkontakte/android/stickers/StickerPage$1;
.super Ljava/lang/Object;
.source "StickerPage.java"

# interfaces
.implements Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickerPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickerPage;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/StickerPage;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/StickerPage;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage$1;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getURL(Landroid/view/View;)Ljava/lang/String;
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 48
    const v1, 0x7f10003c

    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 49
    .local v0, "id":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 50
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$1;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/StickerPage;->access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerStickerViewURL(I)Ljava/lang/String;

    move-result-object v1

    .line 52
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
