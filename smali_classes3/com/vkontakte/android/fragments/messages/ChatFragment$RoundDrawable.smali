.class public Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;
.super Lcom/vkontakte/android/ui/RoundedImageView2$RoundedDrawable;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RoundDrawable"
.end annotation


# instance fields
.field private rectBitmap:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v3, 0x0

    .line 2926
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/RoundedImageView2$RoundedDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 2927
    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->bitmapWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->bitmapHeight:I

    int-to-float v2, v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->rectBitmap:Landroid/graphics/RectF;

    .line 2928
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 2932
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2933
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->getIntrinsicHeight()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->bitmapWidth:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->bitmapHeight:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 2934
    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->bitmapHeight:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v0, v1, v2

    .line 2935
    .local v0, "corners":F
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->rectBitmap:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 2936
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 2937
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 2941
    const/high16 v0, 0x42200000    # 40.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 2946
    const/high16 v0, 0x42380000    # 46.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    return v0
.end method
