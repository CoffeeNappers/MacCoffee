.class Lcom/vk/masks/MaskTabsHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "MaskTabsHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;
    }
.end annotation


# instance fields
.field private icon:Lcom/vk/imageloader/view/VKImageView;

.field private newBadge:Landroid/view/View;

.field private final onMaskTabClick:Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;

.field private section:Lcom/vk/masks/model/MaskSection;

.field private selected:Z

.field private selector:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "onMaskTabClick"    # Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;

    .prologue
    .line 24
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0300de

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 25
    iput-object p2, p0, Lcom/vk/masks/MaskTabsHolder;->onMaskTabClick:Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;

    .line 27
    iget-object v0, p0, Lcom/vk/masks/MaskTabsHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10033d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vk/masks/MaskTabsHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    .line 28
    iget-object v0, p0, Lcom/vk/masks/MaskTabsHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10033f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MaskTabsHolder;->selector:Landroid/view/View;

    .line 29
    iget-object v0, p0, Lcom/vk/masks/MaskTabsHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10033e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MaskTabsHolder;->newBadge:Landroid/view/View;

    .line 31
    iget-object v0, p0, Lcom/vk/masks/MaskTabsHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vk/masks/MaskTabsHolder;->onMaskTabClick:Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;

    invoke-virtual {p0}, Lcom/vk/masks/MaskTabsHolder;->getAdapterPosition()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;->onClick(I)V

    .line 52
    return-void
.end method

.method public update(Lcom/vk/masks/model/MaskSection;Z)V
    .locals 4
    .param p1, "section"    # Lcom/vk/masks/model/MaskSection;
    .param p2, "selected"    # Z

    .prologue
    const/4 v1, 0x4

    const/4 v0, 0x0

    .line 35
    iput-object p1, p0, Lcom/vk/masks/MaskTabsHolder;->section:Lcom/vk/masks/model/MaskSection;

    .line 36
    iput-boolean p2, p0, Lcom/vk/masks/MaskTabsHolder;->selected:Z

    .line 38
    if-eqz p2, :cond_0

    .line 39
    iget-object v2, p0, Lcom/vk/masks/MaskTabsHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->setColorFilter(I)V

    .line 40
    iget-object v2, p0, Lcom/vk/masks/MaskTabsHolder;->selector:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 45
    :goto_0
    iget-object v2, p0, Lcom/vk/masks/MaskTabsHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p1, Lcom/vk/masks/model/MaskSection;->icon:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 46
    iget-object v2, p0, Lcom/vk/masks/MaskTabsHolder;->newBadge:Landroid/view/View;

    iget-boolean v3, p1, Lcom/vk/masks/model/MaskSection;->hasNew:Z

    if-eqz v3, :cond_1

    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 47
    return-void

    .line 42
    :cond_0
    iget-object v2, p0, Lcom/vk/masks/MaskTabsHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    const v3, -0x5f5f60

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->setColorFilter(I)V

    .line 43
    iget-object v2, p0, Lcom/vk/masks/MaskTabsHolder;->selector:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    move v0, v1

    .line 46
    goto :goto_1
.end method
