.class Lcom/vkontakte/android/stickers/StickerPage$StickerHolder$1;
.super Lcom/vk/imageloader/view/VKStickerImageView;
.source "StickerPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;-><init>(Landroid/content/Context;Lcom/vkontakte/android/stickers/StickersView$Listener;Lcom/vkontakte/android/data/orm/StickerStockItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 157
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKStickerImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public hasOverlappingRendering()Z
    .locals 1

    .prologue
    .line 160
    const/4 v0, 0x0

    return v0
.end method
