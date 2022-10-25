.class Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;
.super Lcom/vk/emoji/EmojiDrawable;
.source "Emoji.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/Emoji;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SpriteEmojiDrawable"
.end annotation


# instance fields
.field private final spriteIndex:I

.field final synthetic this$0:Lcom/vk/emoji/Emoji;

.field private final x:I

.field private final y:I


# direct methods
.method public constructor <init>(Lcom/vk/emoji/Emoji;III)V
    .locals 8
    .param p2, "spriteIndex"    # I
    .param p3, "x"    # I
    .param p4, "y"    # I

    .prologue
    .line 279
    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$500(Lcom/vk/emoji/Emoji;)I

    move-result v5

    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$600(Lcom/vk/emoji/Emoji;)I

    move-result v6

    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$700(Lcom/vk/emoji/Emoji;)I

    move-result v7

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v7}, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;-><init>(Lcom/vk/emoji/Emoji;IIIIII)V

    .line 280
    return-void
.end method

.method public constructor <init>(Lcom/vk/emoji/Emoji;IIIIII)V
    .locals 1
    .param p2, "spriteIndex"    # I
    .param p3, "x"    # I
    .param p4, "y"    # I
    .param p5, "size"    # I
    .param p6, "paddingHorizontal"    # I
    .param p7, "paddingVertical"    # I

    .prologue
    .line 282
    iput-object p1, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    .line 283
    invoke-direct {p0, p5, p6, p7}, Lcom/vk/emoji/EmojiDrawable;-><init>(III)V

    .line 284
    iput p2, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->spriteIndex:I

    .line 285
    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$300(Lcom/vk/emoji/Emoji;)I

    move-result v0

    mul-int/2addr v0, p3

    iput v0, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->x:I

    .line 286
    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$300(Lcom/vk/emoji/Emoji;)I

    move-result v0

    mul-int/2addr v0, p4

    iput v0, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->y:I

    .line 287
    return-void
.end method


# virtual methods
.method protected drawInBounds(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "drawingBounds"    # Landroid/graphics/Rect;

    .prologue
    .line 291
    iget-object v0, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->access$100(Lcom/vk/emoji/Emoji;)[Landroid/graphics/Bitmap;

    move-result-object v0

    iget v1, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->spriteIndex:I

    aget-object v0, v0, v1

    if-nez v0, :cond_0

    .line 292
    iget-object v0, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    iget v1, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->spriteIndex:I

    invoke-static {v0, v1}, Lcom/vk/emoji/Emoji;->access$800(Lcom/vk/emoji/Emoji;I)V

    .line 293
    iget-object v0, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->access$900(Lcom/vk/emoji/Emoji;)Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 305
    :goto_0
    return-void

    .line 298
    :cond_0
    invoke-static {}, Lcom/vk/emoji/Emoji;->access$1000()Landroid/graphics/Rect;

    move-result-object v0

    iget v1, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->x:I

    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 299
    invoke-static {}, Lcom/vk/emoji/Emoji;->access$1000()Landroid/graphics/Rect;

    move-result-object v0

    iget v1, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->y:I

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 300
    invoke-static {}, Lcom/vk/emoji/Emoji;->access$1000()Landroid/graphics/Rect;

    move-result-object v0

    iget v1, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->x:I

    iget-object v2, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    invoke-static {v2}, Lcom/vk/emoji/Emoji;->access$300(Lcom/vk/emoji/Emoji;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 301
    invoke-static {}, Lcom/vk/emoji/Emoji;->access$1000()Landroid/graphics/Rect;

    move-result-object v0

    iget v1, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->y:I

    iget-object v2, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    invoke-static {v2}, Lcom/vk/emoji/Emoji;->access$300(Lcom/vk/emoji/Emoji;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 304
    iget-object v0, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->access$100(Lcom/vk/emoji/Emoji;)[Landroid/graphics/Bitmap;

    move-result-object v0

    iget v1, p0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;->spriteIndex:I

    aget-object v0, v0, v1

    invoke-static {}, Lcom/vk/emoji/Emoji;->access$1000()Landroid/graphics/Rect;

    move-result-object v1

    invoke-static {}, Lcom/vk/emoji/Emoji;->access$1100()Landroid/graphics/Paint;

    move-result-object v2

    invoke-virtual {p1, v0, v1, p2, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0
.end method
