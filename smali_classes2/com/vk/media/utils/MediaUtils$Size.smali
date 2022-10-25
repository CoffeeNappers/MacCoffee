.class public Lcom/vk/media/utils/MediaUtils$Size;
.super Ljava/lang/Object;
.source "MediaUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/MediaUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Size"
.end annotation


# instance fields
.field public height:I

.field public width:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lcom/vk/media/utils/MediaUtils$Size;->width:I

    .line 16
    iput p2, p0, Lcom/vk/media/utils/MediaUtils$Size;->height:I

    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/hardware/Camera$Size;)V
    .locals 1
    .param p1, "size"    # Landroid/hardware/Camera$Size;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iget v0, p1, Landroid/hardware/Camera$Size;->width:I

    iput v0, p0, Lcom/vk/media/utils/MediaUtils$Size;->width:I

    .line 21
    iget v0, p1, Landroid/hardware/Camera$Size;->height:I

    iput v0, p0, Lcom/vk/media/utils/MediaUtils$Size;->height:I

    .line 22
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    .prologue
    .line 29
    iget v0, p0, Lcom/vk/media/utils/MediaUtils$Size;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lcom/vk/media/utils/MediaUtils$Size;->width:I

    return v0
.end method
