.class final Lcom/vk/imageloader/ImageLoaderUtils$2;
.super Ljava/lang/ThreadLocal;
.source "ImageLoaderUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/imageloader/ImageLoaderUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Landroid/graphics/Rect;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method public get()Landroid/graphics/Rect;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-super {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    .line 39
    .local v0, "r":Landroid/graphics/Rect;
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 40
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vk/imageloader/ImageLoaderUtils$2;->get()Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 33
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vk/imageloader/ImageLoaderUtils$2;->initialValue()Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method
