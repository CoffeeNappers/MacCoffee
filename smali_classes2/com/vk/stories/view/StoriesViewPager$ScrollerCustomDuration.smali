.class public Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;
.super Landroid/widget/Scroller;
.source "StoriesViewPager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoriesViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ScrollerCustomDuration"
.end annotation


# instance fields
.field private mScrollFactor:D

.field final synthetic this$0:Lcom/vk/stories/view/StoriesViewPager;


# direct methods
.method public constructor <init>(Lcom/vk/stories/view/StoriesViewPager;Landroid/content/Context;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vk/stories/view/StoriesViewPager;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->this$0:Lcom/vk/stories/view/StoriesViewPager;

    .line 80
    invoke-direct {p0, p2}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 77
    const-wide/high16 v0, 0x3ff8000000000000L    # 1.5

    iput-wide v0, p0, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->mScrollFactor:D

    .line 81
    return-void
.end method

.method public constructor <init>(Lcom/vk/stories/view/StoriesViewPager;Landroid/content/Context;Landroid/view/animation/Interpolator;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vk/stories/view/StoriesViewPager;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->this$0:Lcom/vk/stories/view/StoriesViewPager;

    .line 84
    invoke-direct {p0, p2, p3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 77
    const-wide/high16 v0, 0x3ff8000000000000L    # 1.5

    iput-wide v0, p0, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->mScrollFactor:D

    .line 85
    return-void
.end method

.method public constructor <init>(Lcom/vk/stories/view/StoriesViewPager;Landroid/content/Context;Landroid/view/animation/Interpolator;Z)V
    .locals 2
    .param p1, "this$0"    # Lcom/vk/stories/view/StoriesViewPager;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "interpolator"    # Landroid/view/animation/Interpolator;
    .param p4, "flywheel"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 88
    iput-object p1, p0, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->this$0:Lcom/vk/stories/view/StoriesViewPager;

    .line 89
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;Z)V

    .line 77
    const-wide/high16 v0, 0x3ff8000000000000L    # 1.5

    iput-wide v0, p0, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->mScrollFactor:D

    .line 90
    return-void
.end method


# virtual methods
.method public setScrollDurationFactor(D)V
    .locals 1
    .param p1, "scrollFactor"    # D

    .prologue
    .line 96
    iput-wide p1, p0, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->mScrollFactor:D

    .line 97
    return-void
.end method

.method public startScroll(IIIII)V
    .locals 6
    .param p1, "startX"    # I
    .param p2, "startY"    # I
    .param p3, "dx"    # I
    .param p4, "dy"    # I
    .param p5, "duration"    # I

    .prologue
    .line 101
    int-to-double v0, p5

    iget-wide v2, p0, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->mScrollFactor:D

    mul-double/2addr v0, v2

    double-to-int v5, v0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-super/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 102
    return-void
.end method
