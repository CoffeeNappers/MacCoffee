.class public Lme/grishka/appkit/utils/MergeRecyclerAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "MergeRecyclerAdapter.java"

# interfaces
.implements Lme/grishka/appkit/preloading/PrefetchInfoProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/grishka/appkit/utils/MergeRecyclerAdapter$InternalDataObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;",
        "Lme/grishka/appkit/preloading/PrefetchInfoProvider;"
    }
.end annotation


# instance fields
.field private adapters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lme/grishka/appkit/views/UsableRecyclerView$Adapter;",
            ">;"
        }
    .end annotation
.end field

.field private observers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lme/grishka/appkit/views/UsableRecyclerView$Adapter;",
            "Lme/grishka/appkit/utils/MergeRecyclerAdapter$InternalDataObserver;",
            ">;"
        }
    .end annotation
.end field

.field private viewTypeMapping:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lme/grishka/appkit/views/UsableRecyclerView$Adapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    .line 22
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->viewTypeMapping:Landroid/util/SparseArray;

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->observers:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public addAdapter(ILme/grishka/appkit/views/UsableRecyclerView$Adapter;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "adapter"    # Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .prologue
    .line 30
    iget-object v1, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 31
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Adapter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " is already added!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 33
    :cond_0
    iget-object v1, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 34
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter$InternalDataObserver;

    invoke-direct {v0, p0, p2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter$InternalDataObserver;-><init>(Lme/grishka/appkit/utils/MergeRecyclerAdapter;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 35
    .local v0, "observer":Lme/grishka/appkit/utils/MergeRecyclerAdapter$InternalDataObserver;
    invoke-virtual {p2, v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 36
    iget-object v1, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->observers:Ljava/util/HashMap;

    invoke-virtual {v1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    invoke-virtual {p0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->notifyDataSetChanged()V

    .line 38
    return-void
.end method

.method public addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V
    .locals 1
    .param p1, "adapter"    # Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .prologue
    .line 26
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(ILme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 27
    return-void
.end method

.method public getAdapterAt(I)Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 61
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$Adapter;

    return-object v0
.end method

.method public getAdapterCount()I
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .locals 5
    .param p1, "pos"    # I

    .prologue
    .line 95
    const/4 v2, 0x0

    .line 96
    .local v2, "count":I
    iget-object v3, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 97
    .local v0, "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v1

    .line 98
    .local v1, "c":I
    if-lt p1, v2, :cond_0

    add-int v4, v2, v1

    if-ge p1, v4, :cond_0

    .line 103
    .end local v0    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .end local v1    # "c":I
    :goto_1
    return-object v0

    .line 101
    .restart local v0    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .restart local v1    # "c":I
    :cond_0
    add-int/2addr v2, v1

    .line 102
    goto :goto_0

    .line 103
    .end local v0    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .end local v1    # "c":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getAdapterPosition(I)I
    .locals 5
    .param p1, "pos"    # I

    .prologue
    .line 73
    const/4 v2, 0x0

    .line 74
    .local v2, "count":I
    iget-object v3, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 75
    .local v0, "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    .line 76
    .local v1, "c":I
    if-lt p1, v2, :cond_1

    add-int v4, v2, v1

    if-ge p1, v4, :cond_1

    .line 77
    sub-int/2addr p1, v2

    .line 81
    .end local v0    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    .end local v1    # "c":I
    .end local p1    # "pos":I
    :cond_0
    return p1

    .line 79
    .restart local v0    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    .restart local v1    # "c":I
    .restart local p1    # "pos":I
    :cond_1
    add-int/2addr v2, v1

    .line 80
    goto :goto_0
.end method

.method public getImageCountForItem(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 135
    invoke-virtual {p0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    .line 136
    .local v0, "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    if-eqz v0, :cond_0

    .line 137
    invoke-virtual {p0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterPosition(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getImageCountForItem(I)I

    move-result v1

    .line 139
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 2
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 144
    invoke-virtual {p0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    .line 145
    .local v0, "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {p0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterPosition(I)I

    move-result v1

    invoke-virtual {v0, v1, p2}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getImageURL(II)Ljava/lang/String;

    move-result-object v1

    .line 148
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getIndexOfAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)I
    .locals 1
    .param p1, "adapter"    # Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .prologue
    .line 65
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 4

    .prologue
    .line 126
    const/4 v1, 0x0

    .line 127
    .local v1, "count":I
    iget-object v2, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 128
    .local v0, "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v3

    add-int/2addr v1, v3

    .line 129
    goto :goto_0

    .line 130
    .end local v0    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    :cond_0
    return v1
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {p0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterPosition(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 118
    invoke-virtual {p0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    .line 119
    .local v0, "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    invoke-virtual {p0, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterPosition(I)I

    move-result v2

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemViewType(I)I

    move-result v1

    .line 120
    .local v1, "viewType":I
    iget-object v2, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->viewTypeMapping:Landroid/util/SparseArray;

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 121
    return v1
.end method

.method public getPositionForAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)I
    .locals 4
    .param p1, "adapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;

    .prologue
    .line 85
    const/4 v1, 0x0

    .line 86
    .local v1, "pos":I
    iget-object v2, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 87
    .local v0, "a":Landroid/support/v7/widget/RecyclerView$Adapter;
    if-ne v0, p1, :cond_1

    .line 91
    .end local v0    # "a":Landroid/support/v7/widget/RecyclerView$Adapter;
    :cond_0
    return v1

    .line 89
    .restart local v0    # "a":Landroid/support/v7/widget/RecyclerView$Adapter;
    :cond_1
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v3

    add-int/2addr v1, v3

    .line 90
    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 2
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 113
    invoke-virtual {p0, p2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {p0, p2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterPosition(I)I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 114
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 19
    invoke-virtual {p0, p1, p2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 108
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->viewTypeMapping:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    return-object v0
.end method

.method public removeAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V
    .locals 1
    .param p1, "adapter"    # Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .prologue
    .line 41
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 42
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->observers:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p1, v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 43
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->observers:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    invoke-virtual {p0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->notifyDataSetChanged()V

    .line 45
    return-void
.end method

.method public removeAdapterAt(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 48
    iget-object v0, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {p0, v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->removeAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 49
    return-void
.end method

.method public removeAllAdapters()V
    .locals 3

    .prologue
    .line 52
    iget-object v1, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 53
    .local v0, "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    iget-object v1, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->observers:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 54
    iget-object v1, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->observers:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 56
    .end local v0    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    :cond_0
    iget-object v1, p0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->adapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 57
    invoke-virtual {p0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->notifyDataSetChanged()V

    .line 58
    return-void
.end method
