.class public Lcom/vk/music/view/adapter/ItemViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "ItemViewHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/adapter/ItemViewHolder$Builder;,
        Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener;,
        Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;,
        Lcom/vk/music/view/adapter/ItemViewHolder$Binder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item:",
        "Ljava/lang/Object;",
        ">",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/view/View$OnLongClickListener;"
    }
.end annotation


# instance fields
.field private final binder:Lcom/vk/music/view/adapter/ItemViewHolder$Binder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private final clickListeners:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener",
            "<TItem;>;>;"
        }
    .end annotation
.end field

.field private item:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TItem;"
        }
    .end annotation
.end field

.field private itemPosition:I

.field private final longClickListeners:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener",
            "<TItem;>;>;"
        }
    .end annotation
.end field

.field private viewRefs:Lcom/vk/music/view/adapter/ViewRefs;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/vk/music/view/adapter/ItemViewHolder$Binder;Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .locals 5
    .param p1, "itemView"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
            "<TItem;>;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener",
            "<TItem;>;>;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener",
            "<TItem;>;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    .local p2, "binder":Lcom/vk/music/view/adapter/ItemViewHolder$Binder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Binder<TItem;>;"
    .local p3, "clickListeners":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<TItem;>;>;"
    .local p4, "longClickListeners":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener<TItem;>;>;"
    const/4 v4, -0x1

    .line 48
    invoke-direct {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 39
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    .line 40
    iput v4, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    .line 49
    iput-object p2, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->binder:Lcom/vk/music/view/adapter/ItemViewHolder$Binder;

    .line 50
    iput-object p3, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->clickListeners:Landroid/util/SparseArray;

    .line 51
    if-eqz p3, :cond_2

    .line 54
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 55
    invoke-virtual {p3, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 56
    .local v1, "id":I
    if-ne v1, v4, :cond_1

    .line 57
    move-object v2, p1

    .line 61
    .local v2, "v":Landroid/view/View;
    :goto_1
    if-eqz v2, :cond_0

    .line 62
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 59
    .end local v2    # "v":Landroid/view/View;
    :cond_1
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .restart local v2    # "v":Landroid/view/View;
    goto :goto_1

    .line 66
    .end local v0    # "i":I
    .end local v1    # "id":I
    .end local v2    # "v":Landroid/view/View;
    :cond_2
    iput-object p4, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->longClickListeners:Landroid/util/SparseArray;

    .line 67
    if-eqz p4, :cond_5

    .line 70
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    invoke-virtual {p4}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_5

    .line 71
    invoke-virtual {p4, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 72
    .restart local v1    # "id":I
    if-ne v1, v4, :cond_4

    .line 73
    move-object v2, p1

    .line 77
    .restart local v2    # "v":Landroid/view/View;
    :goto_3
    if-eqz v2, :cond_3

    .line 78
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 70
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 75
    .end local v2    # "v":Landroid/view/View;
    :cond_4
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .restart local v2    # "v":Landroid/view/View;
    goto :goto_3

    .line 82
    .end local v0    # "i":I
    .end local v1    # "id":I
    .end local v2    # "v":Landroid/view/View;
    :cond_5
    invoke-interface {p2, p1}, Lcom/vk/music/view/adapter/ItemViewHolder$Binder;->onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->viewRefs:Lcom/vk/music/view/adapter/ViewRefs;

    .line 83
    return-void
.end method


# virtual methods
.method public bind(Ljava/lang/Object;I)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;I)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    .local p1, "item":Ljava/lang/Object;, "TItem;"
    iput-object p1, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    .line 116
    iput p2, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    .line 117
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->binder:Lcom/vk/music/view/adapter/ItemViewHolder$Binder;

    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->viewRefs:Lcom/vk/music/view/adapter/ViewRefs;

    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ViewRefs;->reset()Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2}, Lcom/vk/music/view/adapter/ItemViewHolder$Binder;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Ljava/lang/Object;I)V

    .line 118
    return-void
.end method

.method public final getItem()Ljava/lang/Object;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TItem;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method public final getItemPosition()I
    .locals 1

    .prologue
    .line 126
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    iget v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 87
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->clickListeners:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->clickListeners:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    iget v2, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    invoke-interface {v0, p1, v1, v2}, Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;->onClick(Landroid/view/View;Ljava/lang/Object;I)V

    .line 90
    :cond_0
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 94
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->longClickListeners:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->longClickListeners:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener;

    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    iget v2, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    invoke-interface {v0, p1, v1, v2}, Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener;->onLongClick(Landroid/view/View;Ljava/lang/Object;I)Z

    move-result v0

    .line 97
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final rebind()V
    .locals 2

    .prologue
    .line 102
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 103
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->item:Ljava/lang/Object;

    iget v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/view/adapter/ItemViewHolder;->bind(Ljava/lang/Object;I)V

    .line 105
    :cond_0
    return-void
.end method

.method public final rebind(Ljava/lang/Object;)V
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
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder;, "Lcom/vk/music/view/adapter/ItemViewHolder<TItem;>;"
    .local p1, "item":Ljava/lang/Object;, "TItem;"
    iget v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 109
    iget v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder;->itemPosition:I

    invoke-virtual {p0, p1, v0}, Lcom/vk/music/view/adapter/ItemViewHolder;->bind(Ljava/lang/Object;I)V

    .line 111
    :cond_0
    return-void
.end method
