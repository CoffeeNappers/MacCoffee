.class public final Lcom/vk/music/view/CommunityImageView;
.super Lcom/vk/imageloader/view/VKImageView;
.source "CommunityImageView.java"


# instance fields
.field private verified:Z

.field private verifiedDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 24
    invoke-direct {p0}, Lcom/vk/music/view/CommunityImageView;->init()V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    invoke-direct {p0}, Lcom/vk/music/view/CommunityImageView;->init()V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    invoke-direct {p0}, Lcom/vk/music/view/CommunityImageView;->init()V

    .line 35
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/vk/music/view/CommunityImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v0

    const v1, 0x7f0202cf

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Resourcer;->drawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/CommunityImageView;->verifiedDrawable:Landroid/graphics/drawable/Drawable;

    .line 39
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 49
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 50
    iget-boolean v0, p0, Lcom/vk/music/view/CommunityImageView;->verified:Z

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/vk/music/view/CommunityImageView;->verifiedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 53
    :cond_0
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 43
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vk/imageloader/view/VKImageView;->onSizeChanged(IIII)V

    .line 44
    iget-object v0, p0, Lcom/vk/music/view/CommunityImageView;->verifiedDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/vk/music/view/CommunityImageView;->verifiedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    sub-int v1, p1, v1

    iget-object v2, p0, Lcom/vk/music/view/CommunityImageView;->verifiedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    sub-int v2, p2, v2

    invoke-virtual {v0, v1, v2, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 45
    return-void
.end method

.method public setVerified(Z)V
    .locals 0
    .param p1, "verified"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lcom/vk/music/view/CommunityImageView;->verified:Z

    .line 57
    return-void
.end method
