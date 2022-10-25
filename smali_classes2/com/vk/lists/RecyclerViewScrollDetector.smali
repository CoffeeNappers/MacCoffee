.class abstract Lcom/vk/lists/RecyclerViewScrollDetector;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "RecyclerViewScrollDetector.java"


# instance fields
.field private mScrollThreshold:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 7
    const/4 v0, 0x2

    iput v0, p0, Lcom/vk/lists/RecyclerViewScrollDetector;->mScrollThreshold:I

    return-void
.end method


# virtual methods
.method public abstract onScrollDown()V
.end method

.method public abstract onScrollUp()V
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 15
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Lcom/vk/lists/RecyclerViewScrollDetector;->mScrollThreshold:I

    if-le v1, v2, :cond_1

    const/4 v0, 0x1

    .line 16
    .local v0, "isSignificantDelta":Z
    :goto_0
    if-eqz v0, :cond_0

    .line 17
    if-lez p3, :cond_2

    .line 18
    invoke-virtual {p0}, Lcom/vk/lists/RecyclerViewScrollDetector;->onScrollUp()V

    .line 23
    :cond_0
    :goto_1
    return-void

    .line 15
    .end local v0    # "isSignificantDelta":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 20
    .restart local v0    # "isSignificantDelta":Z
    :cond_2
    invoke-virtual {p0}, Lcom/vk/lists/RecyclerViewScrollDetector;->onScrollDown()V

    goto :goto_1
.end method

.method public setScrollThreshold(I)V
    .locals 0
    .param p1, "scrollThreshold"    # I

    .prologue
    .line 26
    iput p1, p0, Lcom/vk/lists/RecyclerViewScrollDetector;->mScrollThreshold:I

    .line 27
    return-void
.end method
