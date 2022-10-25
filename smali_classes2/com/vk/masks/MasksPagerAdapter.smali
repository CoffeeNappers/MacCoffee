.class public Lcom/vk/masks/MasksPagerAdapter;
.super Lcom/vk/attachpicker/widget/ViewPagerAdapter;
.source "MasksPagerAdapter.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final masksContainer:Lcom/vk/masks/MasksContainer;

.field private final onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

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

.field private selectedMask:Lcom/vk/masks/model/Mask;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/masks/MasksContainer;Lcom/vk/masks/MasksView$OnMaskSelectedListener;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "container"    # Lcom/vk/masks/MasksContainer;
    .param p3, "onMaskSelectedListener"    # Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/ViewPagerAdapter;-><init>()V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/masks/MasksPagerAdapter;->sections:Ljava/util/ArrayList;

    .line 21
    iput-object p3, p0, Lcom/vk/masks/MasksPagerAdapter;->onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    .line 22
    iput-object p2, p0, Lcom/vk/masks/MasksPagerAdapter;->masksContainer:Lcom/vk/masks/MasksContainer;

    .line 23
    iput-object p1, p0, Lcom/vk/masks/MasksPagerAdapter;->context:Landroid/content/Context;

    .line 24
    return-void
.end method


# virtual methods
.method public findIndexBySectionId(I)I
    .locals 2
    .param p1, "sectionId"    # I

    .prologue
    .line 60
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/masks/MasksPagerAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 61
    iget-object v1, p0, Lcom/vk/masks/MasksPagerAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/masks/model/MaskSection;

    iget v1, v1, Lcom/vk/masks/model/MaskSection;->id:I

    if-ne p1, v1, :cond_0

    .line 65
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 60
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 65
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/masks/MasksPagerAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 48
    const/4 v0, -0x2

    return v0
.end method

.method public getSection(I)Lcom/vk/masks/model/MaskSection;
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vk/masks/MasksPagerAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/model/MaskSection;

    return-object v0
.end method

.method public getView(ILandroid/support/v4/view/ViewPager;)Landroid/view/View;
    .locals 5
    .param p1, "position"    # I
    .param p2, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 36
    new-instance v0, Lcom/vk/masks/MasksView;

    iget-object v2, p0, Lcom/vk/masks/MasksPagerAdapter;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/vk/masks/MasksPagerAdapter;->masksContainer:Lcom/vk/masks/MasksContainer;

    iget-object v1, p0, Lcom/vk/masks/MasksPagerAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/masks/model/MaskSection;

    iget v1, v1, Lcom/vk/masks/model/MaskSection;->id:I

    iget-object v4, p0, Lcom/vk/masks/MasksPagerAdapter;->onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    invoke-direct {v0, v2, v3, v1, v4}, Lcom/vk/masks/MasksView;-><init>(Landroid/content/Context;Lcom/vk/masks/MasksContainer;ILcom/vk/masks/MasksView$OnMaskSelectedListener;)V

    .line 37
    .local v0, "masksView":Lcom/vk/masks/MasksView;
    iget-object v1, p0, Lcom/vk/masks/MasksPagerAdapter;->selectedMask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksView;->setSelectedMask(Lcom/vk/masks/model/Mask;)V

    .line 38
    return-object v0
.end method

.method public setSections(Ljava/util/ArrayList;Z)V
    .locals 1
    .param p2, "notifyDatasetChanged"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p1, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    iget-object v0, p0, Lcom/vk/masks/MasksPagerAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 28
    iget-object v0, p0, Lcom/vk/masks/MasksPagerAdapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 29
    if-eqz p2, :cond_0

    .line 30
    invoke-virtual {p0}, Lcom/vk/masks/MasksPagerAdapter;->notifyDataSetChanged()V

    .line 32
    :cond_0
    return-void
.end method

.method public setSelectedMask(Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "selectedMask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vk/masks/MasksPagerAdapter;->selectedMask:Lcom/vk/masks/model/Mask;

    .line 53
    return-void
.end method
