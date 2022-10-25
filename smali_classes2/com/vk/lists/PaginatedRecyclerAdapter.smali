.class Lcom/vk/lists/PaginatedRecyclerAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "PaginatedRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final ITEM_VIEW_TYPE_LOADING:I = 0x7fffffcd


# instance fields
.field private final adapterDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

.field private displayError:Z

.field private displayLoading:Z

.field private final footerViewProvider:Lcom/vk/lists/FooterViewProvider;

.field private final onRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

.field private final wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView$Adapter;Lcom/vk/lists/FooterViewProvider;Lcom/vk/lists/OnRetryClickListener;)V
    .locals 2
    .param p1, "adapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p2, "footerViewProvider"    # Lcom/vk/lists/FooterViewProvider;
    .param p3, "onRetryClickListener"    # Lcom/vk/lists/OnRetryClickListener;

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 134
    new-instance v0, Lcom/vk/lists/PaginatedRecyclerAdapter$1;

    invoke-direct {v0, p0}, Lcom/vk/lists/PaginatedRecyclerAdapter$1;-><init>(Lcom/vk/lists/PaginatedRecyclerAdapter;)V

    iput-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->adapterDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .line 19
    iput-object p3, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->onRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

    .line 20
    iput-object p1, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 21
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->adapterDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 22
    iput-object p2, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->footerViewProvider:Lcom/vk/lists/FooterViewProvider;

    .line 23
    return-void
.end method

.method private getFooterRowPosition()I
    .locals 1

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->isDisplayFooterRow()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method


# virtual methods
.method public displayErrorRow(Z)V
    .locals 1
    .param p1, "displayErrorRow"    # Z

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayError:Z

    if-eq v0, p1, :cond_0

    .line 112
    iput-boolean p1, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayError:Z

    .line 113
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayLoading:Z

    .line 114
    invoke-virtual {p0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->notifyDataSetChanged()V

    .line 116
    :cond_0
    return-void
.end method

.method public displayLoadingRow(Z)V
    .locals 1
    .param p1, "displayLoadingRow"    # Z

    .prologue
    .line 103
    iget-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayLoading:Z

    if-eq v0, p1, :cond_0

    .line 104
    iput-boolean p1, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayLoading:Z

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayError:Z

    .line 106
    invoke-virtual {p0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->notifyDataSetChanged()V

    .line 108
    :cond_0
    return-void
.end method

.method public getContentItemsCount()I
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->isDisplayFooterRow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 59
    invoke-virtual {p0, p1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->isFooterRow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->isFooterRow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7fffffcd

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result v0

    goto :goto_0
.end method

.method public getWrappedAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    return-object v0
.end method

.method public hideFooter()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 119
    iget-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayError:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayLoading:Z

    if-eqz v0, :cond_1

    .line 120
    :cond_0
    iput-boolean v1, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayError:Z

    .line 121
    iput-boolean v1, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayLoading:Z

    .line 122
    invoke-virtual {p0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->notifyDataSetChanged()V

    .line 124
    :cond_1
    return-void
.end method

.method public isDisplayFooterRow()Z
    .locals 1

    .prologue
    .line 99
    iget-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayLoading:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayError:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFooterRow(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 127
    invoke-virtual {p0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->isDisplayFooterRow()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->getFooterRowPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 87
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 40
    invoke-virtual {p0, p2}, Lcom/vk/lists/PaginatedRecyclerAdapter;->isFooterRow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    check-cast p1, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-boolean v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayLoading:Z

    invoke-virtual {p1, v0}, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;->onBindViewHolder(Z)V

    .line 45
    :goto_0
    return-void

    .line 43
    .restart local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    goto :goto_0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 31
    const v0, 0x7fffffcd

    if-ne p2, v0, :cond_0

    .line 32
    new-instance v0, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->footerViewProvider:Lcom/vk/lists/FooterViewProvider;

    iget-object v3, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->onRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/vk/lists/PaginatedRecyclerAdapter$FooterHolder;-><init>(Lcom/vk/lists/PaginatedRecyclerAdapter;Landroid/content/Context;Lcom/vk/lists/FooterViewProvider;Lcom/vk/lists/OnRetryClickListener;)V

    .line 34
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    goto :goto_0
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 92
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 76
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 81
    return-void
.end method

.method public onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 71
    return-void
.end method

.method public setHasStableIds(Z)V
    .locals 1
    .param p1, "hasStableIds"    # Z

    .prologue
    .line 64
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->setHasStableIds(Z)V

    .line 65
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->setHasStableIds(Z)V

    .line 66
    return-void
.end method
