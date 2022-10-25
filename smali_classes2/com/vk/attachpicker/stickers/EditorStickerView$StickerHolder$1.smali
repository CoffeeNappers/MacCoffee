.class Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder$1;
.super Lcom/vk/imageloader/view/VKStickerImageView;
.source "EditorStickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;-><init>(Landroid/content/Context;Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)V
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
    .line 241
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKStickerImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public hasOverlappingRendering()Z
    .locals 1

    .prologue
    .line 244
    const/4 v0, 0x0

    return v0
.end method
