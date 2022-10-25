.class public interface abstract Lcom/vk/lists/PaginateHelper$PaginatedView;
.super Ljava/lang/Object;
.source "PaginateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PaginatedView"
.end annotation


# virtual methods
.method public abstract addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
.end method

.method public abstract removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
.end method

.method public abstract setDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
.end method

.method public abstract setOnLoadNextRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V
.end method

.method public abstract setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V
.end method

.method public abstract setOnReloadRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V
.end method
