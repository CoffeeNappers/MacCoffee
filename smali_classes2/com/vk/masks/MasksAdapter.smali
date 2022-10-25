.class public Lcom/vk/masks/MasksAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "MasksAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/vk/masks/MasksHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final masksContainer:Lcom/vk/masks/MasksContainer;

.field private final onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

.field private final sectionId:I

.field private selectedMask:Lcom/vk/masks/model/Mask;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/masks/MasksContainer;ILcom/vk/masks/MasksView$OnMaskSelectedListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "masksContainer"    # Lcom/vk/masks/MasksContainer;
    .param p3, "sectionId"    # I
    .param p4, "onMaskSelectedListener"    # Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/vk/masks/MasksAdapter;->context:Landroid/content/Context;

    .line 23
    iput-object p4, p0, Lcom/vk/masks/MasksAdapter;->onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    .line 24
    iput p3, p0, Lcom/vk/masks/MasksAdapter;->sectionId:I

    .line 25
    iput-object p2, p0, Lcom/vk/masks/MasksAdapter;->masksContainer:Lcom/vk/masks/MasksContainer;

    .line 26
    return-void
.end method


# virtual methods
.method public appendRange(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vk/masks/model/Mask;>;"
    invoke-virtual {p0}, Lcom/vk/masks/MasksAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v0

    .line 46
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 47
    .local v1, "position":I
    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/vk/masks/MasksAdapter;->notifyItemRangeInserted(II)V

    .line 49
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/vk/masks/MasksAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 53
    return-void
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/vk/masks/MasksAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItems()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vk/masks/MasksAdapter;->masksContainer:Lcom/vk/masks/MasksContainer;

    iget v1, p0, Lcom/vk/masks/MasksAdapter;->sectionId:I

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksContainer;->masksListForSectionId(I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getOnMaskSelectedListener()Lcom/vk/masks/MasksView$OnMaskSelectedListener;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/vk/masks/MasksAdapter;->onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    return-object v0
.end method

.method public getSectionId()I
    .locals 1

    .prologue
    .line 69
    iget v0, p0, Lcom/vk/masks/MasksAdapter;->sectionId:I

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 13
    check-cast p1, Lcom/vk/masks/MasksHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vk/masks/MasksAdapter;->onBindViewHolder(Lcom/vk/masks/MasksHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vk/masks/MasksHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vk/masks/MasksHolder;
    .param p2, "position"    # I

    .prologue
    .line 35
    invoke-virtual {p0}, Lcom/vk/masks/MasksAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/model/Mask;

    .line 36
    .local v0, "m":Lcom/vk/masks/model/Mask;
    iget-object v1, p0, Lcom/vk/masks/MasksAdapter;->selectedMask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v0, v1}, Lcom/vk/masks/model/Mask;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/vk/masks/MasksHolder;->update(Lcom/vk/masks/model/Mask;Z)V

    .line 37
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vk/masks/MasksAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/masks/MasksHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/masks/MasksHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 30
    new-instance v0, Lcom/vk/masks/MasksHolder;

    iget-object v1, p0, Lcom/vk/masks/MasksAdapter;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/vk/masks/MasksHolder;-><init>(Landroid/content/Context;Lcom/vk/masks/MasksAdapter;)V

    return-object v0
.end method

.method public setSelectedMask(Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "selectedMask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vk/masks/MasksAdapter;->selectedMask:Lcom/vk/masks/model/Mask;

    .line 61
    invoke-virtual {p0}, Lcom/vk/masks/MasksAdapter;->notifyDataSetChanged()V

    .line 62
    return-void
.end method
