.class Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;
.super Lcom/vk/emoji/EmojiDrawable;
.source "Emoji.java"

# interfaces
.implements Lcom/squareup/picasso/Target;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/Emoji;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetworkEmojiDrawable"
.end annotation


# instance fields
.field private emojiBitmap:Landroid/graphics/Bitmap;

.field final synthetic this$0:Lcom/vk/emoji/Emoji;

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vk/emoji/Emoji;Ljava/lang/String;)V
    .locals 6
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 314
    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$500(Lcom/vk/emoji/Emoji;)I

    move-result v3

    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$600(Lcom/vk/emoji/Emoji;)I

    move-result v4

    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$700(Lcom/vk/emoji/Emoji;)I

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;-><init>(Lcom/vk/emoji/Emoji;Ljava/lang/String;III)V

    .line 315
    return-void
.end method

.method public constructor <init>(Lcom/vk/emoji/Emoji;Ljava/lang/String;III)V
    .locals 3
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "size"    # I
    .param p4, "paddingHorizontal"    # I
    .param p5, "paddingVertical"    # I

    .prologue
    .line 317
    iput-object p1, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    .line 318
    invoke-direct {p0, p3, p4, p5}, Lcom/vk/emoji/EmojiDrawable;-><init>(III)V

    .line 319
    iput-object p2, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->url:Ljava/lang/String;

    .line 320
    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$1200(Lcom/vk/emoji/Emoji;)Lcom/squareup/picasso/LruCache;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 321
    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$1200(Lcom/vk/emoji/Emoji;)Lcom/squareup/picasso/LruCache;

    move-result-object v0

    invoke-static {p1, p2}, Lcom/vk/emoji/Emoji;->access$1300(Lcom/vk/emoji/Emoji;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/LruCache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->emojiBitmap:Landroid/graphics/Bitmap;

    .line 322
    iget-object v0, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->emojiBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 323
    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$1400(Lcom/vk/emoji/Emoji;)Landroid/os/Handler;

    move-result-object v0

    invoke-static {p1}, Lcom/vk/emoji/Emoji;->access$1400(Lcom/vk/emoji/Emoji;)Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 326
    :cond_0
    return-void
.end method


# virtual methods
.method protected drawInBounds(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "drawingBounds"    # Landroid/graphics/Rect;

    .prologue
    .line 334
    iget-object v0, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->emojiBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->access$900(Lcom/vk/emoji/Emoji;)Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 341
    :goto_0
    return-void

    .line 340
    :cond_0
    iget-object v0, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->emojiBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    invoke-static {}, Lcom/vk/emoji/Emoji;->access$1100()Landroid/graphics/Paint;

    move-result-object v2

    invoke-virtual {p1, v0, v1, p2, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->url:Ljava/lang/String;

    return-object v0
.end method

.method public onBitmapFailed(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "errorDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 351
    return-void
.end method

.method public onBitmapLoaded(Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;)V
    .locals 1
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "from"    # Lcom/squareup/picasso/Picasso$LoadedFrom;

    .prologue
    .line 345
    iput-object p1, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->emojiBitmap:Landroid/graphics/Bitmap;

    .line 346
    iget-object v0, p0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->this$0:Lcom/vk/emoji/Emoji;

    invoke-virtual {v0}, Lcom/vk/emoji/Emoji;->dispatchEmojiLoaded()V

    .line 347
    return-void
.end method

.method public onPrepareLoad(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "placeHolderDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 355
    return-void
.end method
