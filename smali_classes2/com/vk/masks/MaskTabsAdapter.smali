.class Lcom/vk/masks/MaskTabsAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "MaskTabsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/vk/masks/MaskTabsHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final onMaskTabClick:Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;

.field private final sections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;"
        }
    .end annotation
.end field

.field private selectionPosition:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "onMaskTabClick"    # Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/masks/MaskTabsAdapter;->sections:Ljava/util/ArrayList;

    .line 18
    iput-object p1, p0, Lcom/vk/masks/MaskTabsAdapter;->context:Landroid/content/Context;

    .line 19
    iput-object p2, p0, Lcom/vk/masks/MaskTabsAdapter;->onMaskTabClick:Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;

    .line 20
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vk/masks/MaskTabsAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 10
    check-cast p1, Lcom/vk/masks/MaskTabsHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vk/masks/MaskTabsAdapter;->onBindViewHolder(Lcom/vk/masks/MaskTabsHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vk/masks/MaskTabsHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vk/masks/MaskTabsHolder;
    .param p2, "position"    # I

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vk/masks/MaskTabsAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/model/MaskSection;

    iget v1, p0, Lcom/vk/masks/MaskTabsAdapter;->selectionPosition:I

    if-ne v1, p2, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {p1, v0, v1}, Lcom/vk/masks/MaskTabsHolder;->update(Lcom/vk/masks/model/MaskSection;Z)V

    .line 30
    return-void

    .line 29
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/vk/masks/MaskTabsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/masks/MaskTabsHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/masks/MaskTabsHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 24
    new-instance v0, Lcom/vk/masks/MaskTabsHolder;

    iget-object v1, p0, Lcom/vk/masks/MaskTabsAdapter;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vk/masks/MaskTabsAdapter;->onMaskTabClick:Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;

    invoke-direct {v0, v1, v2}, Lcom/vk/masks/MaskTabsHolder;-><init>(Landroid/content/Context;Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;)V

    return-object v0
.end method

.method public setSections(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    iget-object v0, p0, Lcom/vk/masks/MaskTabsAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 39
    iget-object v0, p0, Lcom/vk/masks/MaskTabsAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 40
    invoke-virtual {p0}, Lcom/vk/masks/MaskTabsAdapter;->notifyDataSetChanged()V

    .line 41
    return-void
.end method

.method public setSelectionPosition(I)V
    .locals 0
    .param p1, "selectionPosition"    # I

    .prologue
    .line 44
    iput p1, p0, Lcom/vk/masks/MaskTabsAdapter;->selectionPosition:I

    .line 45
    invoke-virtual {p0}, Lcom/vk/masks/MaskTabsAdapter;->notifyDataSetChanged()V

    .line 46
    return-void
.end method
