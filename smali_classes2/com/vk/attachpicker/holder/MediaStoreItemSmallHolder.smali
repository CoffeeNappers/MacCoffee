.class public Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "MediaStoreItemSmallHolder.java"


# instance fields
.field private photo:Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/attachpicker/SelectionContext;Landroid/support/v7/widget/RecyclerView$Adapter;Z)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "selectionContext"    # Lcom/vk/attachpicker/SelectionContext;
    .param p3, "adapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p4, "singleMode"    # Z

    .prologue
    const/4 v5, 0x0

    .line 21
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;-><init>(Landroid/content/Context;Lcom/vk/attachpicker/SelectionContext;Landroid/support/v7/widget/RecyclerView$Adapter;ZZI)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/attachpicker/SelectionContext;Landroid/support/v7/widget/RecyclerView$Adapter;ZZI)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "selectionContext"    # Lcom/vk/attachpicker/SelectionContext;
    .param p3, "adapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p4, "singleMode"    # Z
    .param p5, "hitEntire"    # Z
    .param p6, "radius"    # I

    .prologue
    .line 16
    new-instance v0, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;-><init>(Landroid/content/Context;Lcom/vk/attachpicker/SelectionContext;Landroid/support/v7/widget/RecyclerView$Adapter;ZZI)V

    invoke-direct {p0, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 17
    iget-object v0, p0, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;

    iput-object v0, p0, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;->photo:Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;

    .line 18
    return-void
.end method


# virtual methods
.method public update(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 2
    .param p1, "data"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;->photo:Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->setImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Z)V

    .line 26
    return-void
.end method
