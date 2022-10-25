.class public Lcom/vk/stories/view/StoriesViewPager;
.super Landroid/support/v4/view/ViewPager;
.source "StoriesViewPager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;
    }
.end annotation


# instance fields
.field private mScroller:Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;

.field private final touchLocker:Lcom/vk/core/util/TimeoutLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;)V

    .line 17
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/stories/view/StoriesViewPager;->touchLocker:Lcom/vk/core/util/TimeoutLock;

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/view/StoriesViewPager;->mScroller:Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;

    .line 22
    invoke-direct {p0}, Lcom/vk/stories/view/StoriesViewPager;->postInitViewPager()V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/stories/view/StoriesViewPager;->touchLocker:Lcom/vk/core/util/TimeoutLock;

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/view/StoriesViewPager;->mScroller:Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;

    .line 27
    invoke-direct {p0}, Lcom/vk/stories/view/StoriesViewPager;->postInitViewPager()V

    .line 28
    return-void
.end method

.method private postInitViewPager()V
    .locals 5

    .prologue
    .line 56
    :try_start_0
    const-class v2, Landroid/support/v4/view/ViewPager;

    const-string/jumbo v3, "mScroller"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 57
    .local v1, "scroller":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 58
    const-class v2, Landroid/support/v4/view/ViewPager;

    const-string/jumbo v3, "sInterpolator"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 59
    .local v0, "interpolator":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 61
    new-instance v3, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;

    invoke-virtual {p0}, Lcom/vk/stories/view/StoriesViewPager;->getContext()Landroid/content/Context;

    move-result-object v4

    const/4 v2, 0x0

    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/animation/Interpolator;

    invoke-direct {v3, p0, v4, v2}, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;-><init>(Lcom/vk/stories/view/StoriesViewPager;Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v3, p0, Lcom/vk/stories/view/StoriesViewPager;->mScroller:Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;

    .line 63
    iget-object v2, p0, Lcom/vk/stories/view/StoriesViewPager;->mScroller:Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .end local v0    # "interpolator":Ljava/lang/reflect/Field;
    .end local v1    # "scroller":Ljava/lang/reflect/Field;
    :goto_0
    return-void

    .line 64
    :catch_0
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public lockTouches()V
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/stories/view/StoriesViewPager;->touchLocker:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 32
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vk/stories/view/StoriesViewPager;->touchLocker:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    const/4 v0, 0x0

    .line 39
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/stories/view/StoriesViewPager;->touchLocker:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    const/4 v0, 0x0

    .line 47
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public setScrollDurationFactor(D)V
    .locals 1
    .param p1, "scrollFactor"    # D

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vk/stories/view/StoriesViewPager;->mScroller:Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;

    invoke-virtual {v0, p1, p2}, Lcom/vk/stories/view/StoriesViewPager$ScrollerCustomDuration;->setScrollDurationFactor(D)V

    .line 73
    return-void
.end method
