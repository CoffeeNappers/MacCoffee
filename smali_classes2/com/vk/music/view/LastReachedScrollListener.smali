.class public final Lcom/vk/music/view/LastReachedScrollListener;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "LastReachedScrollListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;
    }
.end annotation


# instance fields
.field private lastVisible:I

.field private final layoutManager:Landroid/support/v7/widget/LinearLayoutManager;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private listener:Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/LinearLayoutManager;)V
    .locals 0
    .param p1, "layoutManager"    # Landroid/support/v7/widget/LinearLayoutManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/vk/music/view/LastReachedScrollListener;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 27
    return-void
.end method


# virtual methods
.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 35
    iget-object v1, p0, Lcom/vk/music/view/LastReachedScrollListener;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    .line 36
    .local v0, "lastVisiblePosition":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_1

    .line 37
    iget v1, p0, Lcom/vk/music/view/LastReachedScrollListener;->lastVisible:I

    if-eq v0, v1, :cond_0

    .line 38
    iput v0, p0, Lcom/vk/music/view/LastReachedScrollListener;->lastVisible:I

    .line 39
    iget-object v1, p0, Lcom/vk/music/view/LastReachedScrollListener;->listener:Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;

    if-eqz v1, :cond_0

    .line 40
    iget-object v1, p0, Lcom/vk/music/view/LastReachedScrollListener;->listener:Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;

    invoke-interface {v1}, Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;->onLastReached()V

    .line 46
    :cond_0
    :goto_0
    return-void

    .line 44
    :cond_1
    iput v0, p0, Lcom/vk/music/view/LastReachedScrollListener;->lastVisible:I

    goto :goto_0
.end method

.method public setListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 30
    iput-object p1, p0, Lcom/vk/music/view/LastReachedScrollListener;->listener:Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;

    .line 31
    return-void
.end method
