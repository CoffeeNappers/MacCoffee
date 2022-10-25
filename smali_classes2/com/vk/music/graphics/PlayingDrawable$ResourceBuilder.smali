.class public final Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;
.super Lcom/vk/music/graphics/PlayingDrawable$Builder;
.source "PlayingDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/graphics/PlayingDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ResourceBuilder"
.end annotation


# instance fields
.field private final resourcer:Lcom/vk/core/util/Resourcer;


# direct methods
.method public constructor <init>(Lcom/vk/core/util/Resourcer;)V
    .locals 0
    .param p1, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 87
    invoke-direct {p0}, Lcom/vk/music/graphics/PlayingDrawable$Builder;-><init>()V

    .line 88
    iput-object p1, p0, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->resourcer:Lcom/vk/core/util/Resourcer;

    .line 89
    return-void
.end method


# virtual methods
.method public count(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 1
    .param p1, "val"    # I
        .annotation build Landroid/support/annotation/IntegerRes;
        .end annotation
    .end param

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v0, p1}, Lcom/vk/core/util/Resourcer;->integer(I)I

    move-result v0

    invoke-super {p0, v0}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->count(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public gapWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 1
    .param p1, "val"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v0, p1}, Lcom/vk/core/util/Resourcer;->dim(I)I

    move-result v0

    invoke-super {p0, v0}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->gapWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public rectColor(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 1
    .param p1, "val"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 122
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v0, p1}, Lcom/vk/core/util/Resourcer;->color(I)I

    move-result v0

    invoke-super {p0, v0}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectColor(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public rectCornerRadius(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 1
    .param p1, "val"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v0, p1}, Lcom/vk/core/util/Resourcer;->dim(I)I

    move-result v0

    invoke-super {p0, v0}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectCornerRadius(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public rectHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 1
    .param p1, "val"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v0, p1}, Lcom/vk/core/util/Resourcer;->dim(I)I

    move-result v0

    invoke-super {p0, v0}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public rectMinHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 1
    .param p1, "val"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 107
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v0, p1}, Lcom/vk/core/util/Resourcer;->dim(I)I

    move-result v0

    invoke-super {p0, v0}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectMinHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public rectWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 1
    .param p1, "val"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v0, p1}, Lcom/vk/core/util/Resourcer;->dim(I)I

    move-result v0

    invoke-super {p0, v0}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;

    move-result-object v0

    return-object v0
.end method
