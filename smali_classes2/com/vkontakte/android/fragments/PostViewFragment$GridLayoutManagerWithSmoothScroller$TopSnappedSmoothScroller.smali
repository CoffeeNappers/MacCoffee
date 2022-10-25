.class Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller$TopSnappedSmoothScroller;
.super Landroid/support/v7/widget/LinearSmoothScroller;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TopSnappedSmoothScroller"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 2376
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller$TopSnappedSmoothScroller;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;

    .line 2377
    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearSmoothScroller;-><init>(Landroid/content/Context;)V

    .line 2379
    return-void
.end method


# virtual methods
.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 1
    .param p1, "targetPosition"    # I

    .prologue
    .line 2383
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller$TopSnappedSmoothScroller;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;

    .line 2384
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method protected getVerticalSnapPreference()I
    .locals 1

    .prologue
    .line 2393
    const/4 v0, -0x1

    return v0
.end method
