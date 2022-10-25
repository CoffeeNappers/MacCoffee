.class Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "EditorStickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/stickers/EditorStickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MaskHolder"
.end annotation


# instance fields
.field private id:I

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

    .prologue
    .line 285
    new-instance v1, Lcom/vk/imageloader/view/VKStickerImageView;

    invoke-direct {v1, p1}, Lcom/vk/imageloader/view/VKStickerImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 286
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;->itemView:Landroid/view/View;

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 287
    const/16 v1, 0x8

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    .line 288
    .local v0, "p":I
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 290
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;->itemView:Landroid/view/View;

    invoke-static {p0, p2}, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 300
    return-void
.end method


# virtual methods
.method public bind(Ljava/lang/String;I)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "id"    # I

    .prologue
    .line 303
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;->url:Ljava/lang/String;

    .line 304
    iput p2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;->id:I

    .line 305
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    sget-object v1, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0, p1, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 306
    return-void
.end method

.method synthetic lambda$new$0(Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;Landroid/view/View;)V
    .locals 2
    .param p1, "listener"    # Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 291
    invoke-static {}, Lcom/vk/attachpicker/stickers/EditorStickerView;->access$300()Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 299
    :cond_0
    :goto_0
    return-void

    .line 294
    :cond_1
    invoke-static {}, Lcom/vk/attachpicker/stickers/EditorStickerView;->access$300()Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 296
    if-eqz p1, :cond_0

    .line 297
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;->url:Ljava/lang/String;

    iget v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;->id:I

    invoke-interface {p1, v0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;->onMaskSelected(Ljava/lang/String;I)V

    goto :goto_0
.end method
