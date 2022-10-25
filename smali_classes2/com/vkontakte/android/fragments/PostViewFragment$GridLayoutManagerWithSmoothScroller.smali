.class public Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;
.super Landroid/support/v7/widget/GridLayoutManager;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GridLayoutManagerWithSmoothScroller"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller$TopSnappedSmoothScroller;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 2364
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 2365
    return-void
.end method


# virtual methods
.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .locals 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "position"    # I

    .prologue
    .line 2370
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller$TopSnappedSmoothScroller;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller$TopSnappedSmoothScroller;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;Landroid/content/Context;)V

    .line 2371
    .local v0, "smoothScroller":Landroid/support/v7/widget/RecyclerView$SmoothScroller;
    invoke-virtual {v0, p3}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->setTargetPosition(I)V

    .line 2372
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    .line 2373
    return-void
.end method
