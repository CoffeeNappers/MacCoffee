.class public Lcom/vk/camera/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBitmapAr(Landroid/graphics/Bitmap;)F
    .locals 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 10
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method public static getViewsRotation(I)I
    .locals 2
    .param p0, "o"    # I

    .prologue
    .line 14
    const/4 v0, 0x0

    .line 15
    .local v0, "result":I
    rem-int/lit16 v1, p0, 0xb4

    if-nez v1, :cond_1

    .line 16
    add-int/lit8 v0, p0, 0x5a

    .line 20
    :goto_0
    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    .line 21
    const/16 v0, -0x5a

    .line 23
    .end local v0    # "result":I
    :cond_0
    return v0

    .line 18
    .restart local v0    # "result":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static keepScreenOn(Landroid/app/Activity;Z)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "enabled"    # Z

    .prologue
    .line 29
    if-eqz p1, :cond_0

    .line 30
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 37
    :goto_0
    return-void

    .line 32
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 34
    :catch_0
    move-exception v0

    goto :goto_0
.end method
