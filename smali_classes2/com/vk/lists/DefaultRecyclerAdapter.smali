.class public abstract Lcom/vk/lists/DefaultRecyclerAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "DefaultRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "VH:",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<TVH;>;"
    }
.end annotation


# instance fields
.field private final list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public appendRange(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcom/vk/lists/DefaultRecyclerAdapter;->insertRangeAt(ILjava/util/List;)V

    .line 38
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 71
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 72
    invoke-virtual {p0}, Lcom/vk/lists/DefaultRecyclerAdapter;->notifyDataSetChanged()V

    .line 73
    return-void
.end method

.method public getItemAt(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 19
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 14
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    return-object v0
.end method

.method public insertItemAt(ILjava/lang/Object;)V
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 28
    invoke-virtual {p0, p1}, Lcom/vk/lists/DefaultRecyclerAdapter;->notifyItemInserted(I)V

    .line 29
    return-void
.end method

.method public insertRangeAt(ILjava/util/List;)V
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 33
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vk/lists/DefaultRecyclerAdapter;->notifyItemRangeInserted(II)V

    .line 34
    return-void
.end method

.method public moveItem(II)V
    .locals 1
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I

    .prologue
    .line 54
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-static {v0, p1, p2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 55
    invoke-virtual {p0, p1, p2}, Lcom/vk/lists/DefaultRecyclerAdapter;->notifyItemMoved(II)V

    .line 56
    return-void
.end method

.method public removeItemAt(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 59
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 60
    invoke-virtual {p0, p1}, Lcom/vk/lists/DefaultRecyclerAdapter;->notifyItemRemoved(I)V

    .line 61
    return-void
.end method

.method public removeRangeAt(II)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "count"    # I

    .prologue
    .line 64
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 65
    iget-object v1, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 64
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/vk/lists/DefaultRecyclerAdapter;->notifyItemRangeRemoved(II)V

    .line 68
    return-void
.end method

.method public updateItemAt(ILjava/lang/Object;)V
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 42
    invoke-virtual {p0, p1}, Lcom/vk/lists/DefaultRecyclerAdapter;->notifyItemChanged(I)V

    .line 43
    return-void
.end method

.method public updateRangeAt(ILjava/util/List;)V
    .locals 5
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lcom/vk/lists/DefaultRecyclerAdapter;, "Lcom/vk/lists/DefaultRecyclerAdapter<TT;TVH;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v0, 0x0

    .line 47
    .local v0, "i":I
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 48
    .local v1, "item":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lcom/vk/lists/DefaultRecyclerAdapter;->list:Ljava/util/ArrayList;

    add-int v4, p1, v0

    invoke-virtual {v3, v4, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 50
    .end local v1    # "item":Ljava/lang/Object;, "TT;"
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p0, p1, v2}, Lcom/vk/lists/DefaultRecyclerAdapter;->notifyItemRangeChanged(II)V

    .line 51
    return-void
.end method
