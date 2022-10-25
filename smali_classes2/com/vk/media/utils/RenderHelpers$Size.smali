.class public Lcom/vk/media/utils/RenderHelpers$Size;
.super Ljava/lang/Object;
.source "RenderHelpers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderHelpers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Size"
.end annotation


# instance fields
.field public mHeight:I

.field public mWidth:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    iput p1, p0, Lcom/vk/media/utils/RenderHelpers$Size;->mWidth:I

    .line 260
    iput p2, p0, Lcom/vk/media/utils/RenderHelpers$Size;->mHeight:I

    .line 261
    return-void
.end method
