.class public Lcom/vk/masks/MasksContainer;
.super Ljava/lang/Object;
.source "MasksContainer.java"


# instance fields
.field private final masksContainer:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;>;"
        }
    .end annotation
.end field

.field private final masksNextFroms:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private selectedMask:Lcom/vk/masks/model/Mask;

.field private selectedSectionId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/masks/MasksContainer;->masksContainer:Ljava/util/HashMap;

    .line 11
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/masks/MasksContainer;->masksNextFroms:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public getNextFromForSectionId(I)Ljava/lang/String;
    .locals 2
    .param p1, "sectionId"    # I

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/masks/MasksContainer;->masksNextFroms:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public masksListForSectionId(I)Ljava/util/ArrayList;
    .locals 4
    .param p1, "sectionId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;"
        }
    .end annotation

    .prologue
    .line 16
    iget-object v2, p0, Lcom/vk/masks/MasksContainer;->masksContainer:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 17
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    if-nez v0, :cond_0

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .restart local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    iget-object v2, p0, Lcom/vk/masks/MasksContainer;->masksContainer:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 22
    .end local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    .local v1, "list":Ljava/lang/Object;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    :goto_0
    return-object v1

    .end local v1    # "list":Ljava/lang/Object;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    .restart local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    :cond_0
    move-object v1, v0

    .restart local v1    # "list":Ljava/lang/Object;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    goto :goto_0
.end method

.method public selectedMask()Lcom/vk/masks/model/Mask;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/masks/MasksContainer;->selectedMask:Lcom/vk/masks/model/Mask;

    return-object v0
.end method

.method public selectedMask(Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "selectedMask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/vk/masks/MasksContainer;->selectedMask:Lcom/vk/masks/model/Mask;

    .line 48
    return-void
.end method

.method public selectedSectionId()I
    .locals 1

    .prologue
    .line 35
    iget v0, p0, Lcom/vk/masks/MasksContainer;->selectedSectionId:I

    return v0
.end method

.method public selectedSectionId(I)V
    .locals 0
    .param p1, "selectedSectionId"    # I

    .prologue
    .line 39
    iput p1, p0, Lcom/vk/masks/MasksContainer;->selectedSectionId:I

    .line 40
    return-void
.end method

.method public setNextFromForSectionId(ILjava/lang/String;)V
    .locals 2
    .param p1, "sectionId"    # I
    .param p2, "nextFrom"    # Ljava/lang/String;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/masks/MasksContainer;->masksNextFroms:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    return-void
.end method
