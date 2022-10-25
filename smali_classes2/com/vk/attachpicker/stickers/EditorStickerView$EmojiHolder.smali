.class Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "EditorStickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/stickers/EditorStickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EmojiHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/stickers/EditorStickerView;


# direct methods
.method public constructor <init>(Lcom/vk/attachpicker/stickers/EditorStickerView;Landroid/content/Context;)V
    .locals 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 417
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;->this$0:Lcom/vk/attachpicker/stickers/EditorStickerView;

    .line 418
    new-instance v1, Lcom/vk/imageloader/view/VKStickerImageView;

    invoke-direct {v1, p2}, Lcom/vk/imageloader/view/VKStickerImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 419
    const/16 v1, 0x8

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    .line 420
    .local v0, "p":I
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;->itemView:Landroid/view/View;

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 421
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 422
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;->itemView:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 430
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 423
    invoke-static {}, Lcom/vk/attachpicker/stickers/EditorStickerView;->access$300()Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 429
    :goto_0
    return-void

    .line 426
    :cond_0
    invoke-static {}, Lcom/vk/attachpicker/stickers/EditorStickerView;->access$300()Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 428
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;->this$0:Lcom/vk/attachpicker/stickers/EditorStickerView;

    invoke-static {v0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->access$400(Lcom/vk/attachpicker/stickers/EditorStickerView;)Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "asset:///emoji/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/vk/attachpicker/stickers/EditorStickerView;->access$500()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;->getAdapterPosition()I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;->onEmojiSelected(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public update(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 433
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    sget-object v1, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0, p1, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 434
    return-void
.end method
