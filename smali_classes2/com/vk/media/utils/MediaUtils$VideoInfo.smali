.class public Lcom/vk/media/utils/MediaUtils$VideoInfo;
.super Lcom/vk/media/utils/MediaUtils$Size;
.source "MediaUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/MediaUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoInfo"
.end annotation


# instance fields
.field public durationMs:I

.field public preview:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/vk/media/utils/MediaUtils$Size;-><init>(II)V

    .line 39
    return-void
.end method
