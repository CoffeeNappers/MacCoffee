.class public final Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
.super Ljava/lang/Object;
.source "ItemViewHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/adapter/ItemViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private binder:Lcom/vk/music/view/adapter/ItemViewHolder$Binder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private clickListeners:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener",
            "<TItem;>;>;"
        }
    .end annotation
.end field

.field private init:Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

.field private layout:I

.field private longClickListeners:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener",
            "<TItem;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 129
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    .local p1, "val":Lcom/vk/music/view/adapter/ItemViewHolder$Binder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Binder<TItem;>;"
    iput-object p1, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->binder:Lcom/vk/music/view/adapter/ItemViewHolder$Binder;

    .line 154
    return-object p0
.end method

.method build(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lcom/vk/music/view/adapter/ItemViewHolder;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/LayoutInflater;",
            "Landroid/view/ViewGroup;",
            ")",
            "Lcom/vk/music/view/adapter/ItemViewHolder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 178
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    iget v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->layout:I

    if-nez v1, :cond_0

    .line 179
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "layout must not be 0"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 181
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->binder:Lcom/vk/music/view/adapter/ItemViewHolder$Binder;

    if-nez v1, :cond_1

    .line 182
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "binder must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 185
    :cond_1
    iget v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->layout:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 186
    .local v0, "itemView":Landroid/view/View;
    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->init:Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    if-eqz v1, :cond_2

    .line 187
    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->init:Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    invoke-interface {v1, v0}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;->apply(Landroid/view/View;)V

    .line 189
    :cond_2
    new-instance v1, Lcom/vk/music/view/adapter/ItemViewHolder;

    iget-object v2, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->binder:Lcom/vk/music/view/adapter/ItemViewHolder$Binder;

    iget-object v3, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->clickListeners:Landroid/util/SparseArray;

    iget-object v4, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->longClickListeners:Landroid/util/SparseArray;

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/vk/music/view/adapter/ItemViewHolder;-><init>(Landroid/view/View;Lcom/vk/music/view/adapter/ItemViewHolder$Binder;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    return-object v1
.end method

.method public init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .locals 0
    .param p1, "init"    # Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;",
            ")",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 148
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    iput-object p1, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->init:Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    .line 149
    return-object p0
.end method

.method public layout(I)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .locals 0
    .param p1, "val"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    iput p1, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->layout:I

    .line 144
    return-object p0
.end method

.method public registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    .local p2, "val":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->clickListeners:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    .line 163
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->clickListeners:Landroid/util/SparseArray;

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->clickListeners:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 166
    return-object p0
.end method

.method public registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    .local p1, "val":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<TItem;>;"
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    move-result-object v0

    return-object v0
.end method

.method public registerLongClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$LongClickListener;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 170
    .local p0, "this":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    .local p2, "val":Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->longClickListeners:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    .line 171
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->longClickListeners:Landroid/util/SparseArray;

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->longClickListeners:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 174
    return-object p0
.end method
