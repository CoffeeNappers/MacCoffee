.class public abstract Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "RecyclerSectionAdapter.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;
.implements Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;,
        Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;",
        "Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;"
    }
.end annotation


# instance fields
.field public data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation
.end field

.field public final dataDelegate:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    .line 59
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->dataDelegate:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;

    .line 60
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;)V
    .locals 1
    .param p1, "dataDelegate"    # Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;

    .prologue
    .line 62
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->dataDelegate:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;

    .line 64
    return-void
.end method


# virtual methods
.method public add(ILcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;)V
    .locals 1
    .param p1, "location"    # I
    .param p2, "data"    # Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 91
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->notifyDataSetChanged()V

    .line 92
    return-void
.end method

.method public add(Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;)V
    .locals 1
    .param p1, "data"    # Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->notifyItemInserted(I)V

    .line 87
    return-void
.end method

.method public addAll(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->addAll(Ljava/util/Collection;Z)V

    .line 96
    return-void
.end method

.method public addAll(Ljava/util/Collection;Z)V
    .locals 2
    .param p2, "notifyChange"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 100
    .local v0, "lastSize":I
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 101
    if-eqz p2, :cond_0

    .line 102
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->notifyItemRangeInserted(II)V

    .line 104
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 107
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->clear(Z)V

    .line 108
    return-void
.end method

.method public clear(Z)V
    .locals 1
    .param p1, "notifyChange"    # Z

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 112
    if-eqz p1, :cond_0

    .line 113
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->notifyDataSetChanged()V

    .line 115
    :cond_0
    return-void
.end method

.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 138
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->decoratorType:I

    return v0
.end method

.method protected getData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->dataDelegate:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->dataDelegate:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;->getData()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 133
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->type:I

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 12
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .param p2, "position"    # I

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    .line 124
    return-void
.end method

.method public replace(Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;)V
    .locals 2
    .param p1, "oldData"    # Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;
    .param p2, "newData"    # Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .prologue
    .line 77
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 78
    .local v0, "index":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 79
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    invoke-interface {v1, v0, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 80
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->notifyItemChanged(I)V

    .line 82
    :cond_0
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    if-nez p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    .end local p1    # "data":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    .line 73
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->notifyDataSetChanged()V

    .line 74
    return-void
.end method

.method public setData(Ljava/util/List;II)V
    .locals 0
    .param p2, "startRange"    # I
    .param p3, "rangeSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    if-nez p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    .end local p1    # "data":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->data:Ljava/util/List;

    .line 68
    invoke-virtual {p0, p2, p3}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;->notifyItemRangeInserted(II)V

    .line 69
    return-void
.end method
