.class public final Lcom/vk/music/view/adapter/ItemAdapter$Builder;
.super Ljava/lang/Object;
.source "ItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/adapter/ItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
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
.field private builder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private final layoutInflater:Landroid/view/LayoutInflater;

.field private resolver:Lcom/vk/music/view/adapter/IdResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/IdResolver",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private viewType:I


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater;)V
    .locals 0
    .param p1, "layoutInflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 123
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p1, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layoutInflater:Landroid/view/LayoutInflater;

    .line 125
    return-void
.end method

.method private getOrCreateBuilder()Lcom/vk/music/view/adapter/ItemViewHolder$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->builder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    if-nez v0, :cond_0

    new-instance v0, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    invoke-direct {v0}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;-><init>()V

    iput-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->builder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->builder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    goto :goto_0
.end method


# virtual methods
.method public binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    .local p1, "val":Lcom/vk/music/view/adapter/ItemViewHolder$Binder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Binder<TItem;>;"
    invoke-direct {p0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->getOrCreateBuilder()Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    .line 143
    return-object p0
.end method

.method public build()Lcom/vk/music/view/adapter/ItemAdapter;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    iget-object v0, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->builder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    if-nez v0, :cond_0

    .line 178
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "viewHolderBuilder must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 181
    :cond_0
    new-instance v0, Lcom/vk/music/view/adapter/ItemAdapter;

    iget-object v1, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layoutInflater:Landroid/view/LayoutInflater;

    iget-object v2, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->builder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    iget-object v3, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver:Lcom/vk/music/view/adapter/IdResolver;

    iget v4, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vk/music/view/adapter/ItemAdapter;-><init>(Landroid/view/LayoutInflater;Lcom/vk/music/view/adapter/ItemViewHolder$Builder;Lcom/vk/music/view/adapter/IdResolver;I)V

    return-object v0
.end method

.method public init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 1
    .param p1, "init"    # Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;",
            ")",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    invoke-direct {p0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->getOrCreateBuilder()Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    .line 138
    return-object p0
.end method

.method public layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 1
    .param p1, "val"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    invoke-direct {p0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->getOrCreateBuilder()Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    .line 133
    return-object p0
.end method

.method public registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    .local p2, "val":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<TItem;>;"
    invoke-direct {p0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->getOrCreateBuilder()Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    .line 148
    return-object p0
.end method

.method public registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    .local p1, "val":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<TItem;>;"
    invoke-direct {p0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->getOrCreateBuilder()Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    .line 153
    return-object p0
.end method

.method public registerLongClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$LongClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    .local p2, "val":Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$LongClickListener<TItem;>;"
    invoke-direct {p0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->getOrCreateBuilder()Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/vk/music/view/adapter/ItemViewHolder$Builder;->registerLongClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$LongClickListener;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    .line 158
    return-object p0
.end method

.method public resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/IdResolver",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    .local p1, "val":Lcom/vk/music/view/adapter/IdResolver;, "Lcom/vk/music/view/adapter/IdResolver<TItem;>;"
    iput-object p1, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver:Lcom/vk/music/view/adapter/IdResolver;

    .line 168
    return-object p0
.end method

.method public viewHolderBuilder(Lcom/vk/music/view/adapter/ItemViewHolder$Builder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ItemViewHolder$Builder",
            "<TItem;>;)",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    .local p1, "val":Lcom/vk/music/view/adapter/ItemViewHolder$Builder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Builder<TItem;>;"
    iput-object p1, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->builder:Lcom/vk/music/view/adapter/ItemViewHolder$Builder;

    .line 163
    return-object p0
.end method

.method public viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;
    .locals 0
    .param p1, "val"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vk/music/view/adapter/ItemAdapter$Builder",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 172
    .local p0, "this":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<TItem;>;"
    iput p1, p0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType:I

    .line 173
    return-object p0
.end method
