.class public Lcom/vk/music/view/adapter/ItemAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "ItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item:",
        "Ljava/lang/Object;",
        ">",
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vk/music/view/adapter/ItemViewHolder",
        "<TItem;>;>;"
    }
.end annotation


# instance fields
.field private final inflater:Landroid/view/LayoutInflater;

.field private final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private final resolver:Lcom/vk/music/view/adapter/IdResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/IdResolver",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private final viewHolderBuilder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private final viewType:I


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater;Lcom/vk/music/view/adapter/ItemViewHolder$Builder;Lcom/vk/music/view/adapter/IdResolver;I)V
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p4, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/LayoutInflater;",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;",
            "Lcom/vk/music/view/adapter/IdResolver",
            "<TItem;>;I)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    .local p2, "viewHolderBuilder":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    .local p3, "resolver":Lcom/vk/music/view/adapter/IdResolver;, "Lcom/vk/music/view/adapter/IdResolver<TItem;>;"
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    .line 28
    iput-object p1, p0, Lcom/vk/music/view/adapter/ItemAdapter;->inflater:Landroid/view/LayoutInflater;

    .line 29
    iput-object p2, p0, Lcom/vk/music/view/adapter/ItemAdapter;->viewHolderBuilder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    .line 30
    iput-object p3, p0, Lcom/vk/music/view/adapter/ItemAdapter;->resolver:Lcom/vk/music/view/adapter/IdResolver;

    .line 31
    iput p4, p0, Lcom/vk/music/view/adapter/ItemAdapter;->viewType:I

    .line 32
    return-void
.end method


# virtual methods
.method public final addItems(ILjava/util/Collection;)V
    .locals 3
    .param p1, "index"    # I
    .param p2    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    .local p2, "items":Ljava/util/Collection;, "Ljava/util/Collection<TItem;>;"
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v0

    .line 92
    .local v0, "addedCount":I
    if-eqz v0, :cond_0

    .line 93
    iget-object v2, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 94
    .local v1, "prevCount":I
    iget-object v2, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v2, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 95
    invoke-virtual {p0, v1, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyItemRangeInserted(II)V

    .line 97
    .end local v1    # "prevCount":I
    :cond_0
    return-void
.end method

.method public final addItems(Ljava/util/Collection;)V
    .locals 3
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/Collection;, "Ljava/util/Collection<TItem;>;"
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    .line 83
    .local v0, "addedCount":I
    if-eqz v0, :cond_0

    .line 84
    iget-object v2, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 85
    .local v1, "prevCount":I
    iget-object v2, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 86
    invoke-virtual {p0, v1, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyItemRangeInserted(II)V

    .line 88
    .end local v1    # "prevCount":I
    :cond_0
    return-void
.end method

.method public final changeItem(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    .local p1, "item":Ljava/lang/Object;, "TItem;"
    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 109
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 110
    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v1, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 111
    invoke-virtual {p0, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyItemChanged(I)V

    .line 113
    :cond_0
    return-void
.end method

.method public final getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TItem;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 46
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 56
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->resolver:Lcom/vk/music/view/adapter/IdResolver;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->resolver:Lcom/vk/music/view/adapter/IdResolver;

    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/view/adapter/IdResolver;->resolve(Ljava/lang/Object;)J

    move-result-wide v0

    .line 59
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 51
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    iget v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->viewType:I

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 18
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    check-cast p1, Lcom/vk/music/view/adapter/ItemViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->onBindViewHolder(Lcom/vk/music/view/adapter/ItemViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vk/music/view/adapter/ItemViewHolder;I)V
    .locals 1
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ItemViewHolder",
            "<TItem;>;I)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    .local p1, "holder":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lcom/vk/music/view/adapter/ItemViewHolder;->bind(Ljava/lang/Object;I)V

    .line 42
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 18
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/music/view/adapter/ItemViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/music/view/adapter/ItemViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vk/music/view/adapter/ItemViewHolder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->viewHolderBuilder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemAdapter;->inflater:Landroid/view/LayoutInflater;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->build(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lcom/vk/music/view/adapter/ItemViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public final removeItem(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    .local p1, "item":Ljava/lang/Object;, "TItem;"
    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 101
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 102
    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 103
    invoke-virtual {p0, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyItemRemoved(I)V

    .line 105
    :cond_0
    return-void
.end method

.method public final setItems(Ljava/util/Collection;)V
    .locals 1
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/Collection;, "Ljava/util/Collection<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 75
    if-eqz p1, :cond_0

    .line 76
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 78
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyDataSetChanged()V

    .line 79
    return-void
.end method
