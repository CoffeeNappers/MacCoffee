.class final Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "StickersDetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(ILjava/lang/String;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/orm/StickerStockItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/content/Context;

.field final synthetic val$referrer:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    iput-object p2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;->val$referrer:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;->val$activity:Landroid/content/Context;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;->val$referrer:Ljava/lang/String;

    iput-object v0, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->referrer:Ljava/lang/String;

    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;->val$activity:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/content/Context;)V

    .line 72
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 67
    check-cast p1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$1;->success(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    return-void
.end method
