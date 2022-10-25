.class public Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;
.super Lcom/vk/attachpicker/adapter/OnItemClickAdapter;
.source "PhotoSmallPickerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/attachpicker/adapter/OnItemClickAdapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_IMAGES:I = 0x14

.field private static final TYPE_ITEM:I = 0x0

.field private static final TYPE_OPEN_GALLERY:I = 0x1


# instance fields
.field private final context:Landroid/content/Context;

.field private galleryEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final images:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final selectionContext:Lcom/vk/attachpicker/SelectionContext;

.field private singleMode:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/attachpicker/SelectionContext;Z)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "selectionContext"    # Lcom/vk/attachpicker/SelectionContext;
    .param p3, "singleMode"    # Z

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vk/attachpicker/adapter/OnItemClickAdapter;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    .line 36
    iput-object p1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->context:Landroid/content/Context;

    .line 37
    iput-object p2, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    .line 38
    iput-boolean p3, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->singleMode:Z

    .line 39
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->setHasStableIds(Z)V

    .line 40
    return-void
.end method


# virtual methods
.method public addItem(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 2
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 114
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->notifyDataSetChanged()V

    .line 115
    return-void
.end method

.method public getItem(I)Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    iget v0, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->id:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 2
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 62
    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 63
    .local v0, "mediaStoreEntry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    instance-of v1, p1, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;

    if-eqz v1, :cond_1

    .line 64
    check-cast p1, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;

    .end local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p1, v0}, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;->update(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    .line 68
    :cond_0
    :goto_0
    return-void

    .line 65
    .restart local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_1
    instance-of v1, p1, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;

    if-eqz v1, :cond_0

    .line 66
    check-cast p1, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;

    .end local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;->onBind(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    goto :goto_0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 11
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v5, 0x1

    .line 44
    const/high16 v1, 0x42c80000    # 100.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    .line 45
    .local v9, "size":I
    new-instance v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v8, v9, v9}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 46
    .local v8, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    if-ne p2, v5, :cond_0

    .line 47
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0301ee

    const/4 v3, 0x0

    .line 48
    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v10

    .line 49
    .local v10, "view":Landroid/view/View;
    invoke-virtual {v10, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    new-instance v7, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;

    invoke-direct {v7, v10}, Lcom/vkontakte/android/ui/adapters/PickPhotoGalleryViewHolder;-><init>(Landroid/view/View;)V

    .line 51
    .local v7, "galleryHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->wrapHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 57
    .end local v7    # "galleryHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v10    # "view":Landroid/view/View;
    :goto_0
    return-object v1

    .line 54
    :cond_0
    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    .line 55
    .local v6, "radius":I
    new-instance v0, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    iget-boolean v4, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->singleMode:Z

    move-object v3, p0

    invoke-direct/range {v0 .. v6}, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;-><init>(Landroid/content/Context;Lcom/vk/attachpicker/SelectionContext;Landroid/support/v7/widget/RecyclerView$Adapter;ZZI)V

    .line 56
    .local v0, "holder":Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;
    iget-object v1, v0, Lcom/vk/attachpicker/holder/MediaStoreItemSmallHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->wrapHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    goto :goto_0
.end method

.method public setImages(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "images":Ljava/util/List;, "Ljava/util/List<Lcom/vk/attachpicker/mediastore/MediaStoreEntry;>;"
    const/16 v3, 0x14

    .line 86
    if-nez p1, :cond_0

    .line 105
    :goto_0
    return-void

    .line 89
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 90
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 91
    .local v0, "entry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    iget-object v2, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    iget-object v2, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v3, :cond_1

    .line 96
    .end local v0    # "entry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-gt v1, v3, :cond_4

    .line 97
    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->galleryEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 98
    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    iget-object v2, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    iput-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->galleryEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 100
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->galleryEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    if-eqz v1, :cond_4

    .line 101
    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->images:Ljava/util/List;

    iget-object v2, p0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->galleryEntry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method
