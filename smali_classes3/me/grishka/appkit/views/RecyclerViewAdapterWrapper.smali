.class public Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "RecyclerViewAdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
            "<",
            "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V
    .locals 1
    .param p1    # Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
            "<",
            "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 11
    .local p1, "wrapped":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;, "Lme/grishka/appkit/views/UsableRecyclerView$Adapter<Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;>;"
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 12
    iput-object p1, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 13
    invoke-virtual {p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->hasStableIds()Z

    move-result v0

    invoke-super {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->setHasStableIds(Z)V

    .line 14
    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 90
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getImageCountForItem(I)I

    move-result v0

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 95
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getImageURL(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 43
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 48
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 33
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 34
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 7
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 23
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 24
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 7
    invoke-virtual {p0, p1, p2}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 18
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    return-object v0
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 38
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 39
    return-void
.end method

.method public bridge synthetic onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 1

    .prologue
    .line 7
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->onFailedToRecycleView(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)Z

    move-result v0

    return v0
.end method

.method public onFailedToRecycleView(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)Z
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 53
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .prologue
    .line 7
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->onViewAttachedToWindow(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V

    return-void
.end method

.method public onViewAttachedToWindow(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 58
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 59
    return-void
.end method

.method public bridge synthetic onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .prologue
    .line 7
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->onViewDetachedFromWindow(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V

    return-void
.end method

.method public onViewDetachedFromWindow(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 63
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 64
    return-void
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .prologue
    .line 7
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->onViewRecycled(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 68
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 69
    return-void
.end method

.method public registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .prologue
    .line 73
    invoke-super {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 74
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 75
    return-void
.end method

.method public setHasStableIds(Z)V
    .locals 1
    .param p1, "hasStableIds"    # Z

    .prologue
    .line 79
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->setHasStableIds(Z)V

    .line 80
    return-void
.end method

.method public unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .prologue
    .line 84
    invoke-super {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 85
    iget-object v0, p0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 86
    return-void
.end method
