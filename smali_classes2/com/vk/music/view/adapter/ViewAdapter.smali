.class public final Lcom/vk/music/view/adapter/ViewAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "ViewAdapter.java"


# instance fields
.field private final binder:Lcom/vkontakte/android/functions/VoidF;

.field private enabled:Z

.field private final factory:Lcom/vkontakte/android/functions/F1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/F1",
            "<",
            "Landroid/view/View;",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field private final viewType:I


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater;II)V
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p3, "viewType"    # I

    .prologue
    .line 39
    invoke-static {p1, p2}, Lcom/vk/music/view/adapter/ViewAdapter$$Lambda$1;->lambdaFactory$(Landroid/view/LayoutInflater;I)Lcom/vkontakte/android/functions/F1;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p3}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/functions/F1;I)V
    .locals 1
    .param p1    # Lcom/vkontakte/android/functions/F1;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/F1",
            "<",
            "Landroid/view/View;",
            "Landroid/view/ViewGroup;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "factory":Lcom/vkontakte/android/functions/F1;, "Lcom/vkontakte/android/functions/F1<Landroid/view/View;Landroid/view/ViewGroup;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V
    .locals 1
    .param p1    # Lcom/vkontakte/android/functions/F1;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "binder"    # Lcom/vkontakte/android/functions/VoidF;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/F1",
            "<",
            "Landroid/view/View;",
            "Landroid/view/ViewGroup;",
            ">;",
            "Lcom/vkontakte/android/functions/VoidF;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "factory":Lcom/vkontakte/android/functions/F1;, "Lcom/vkontakte/android/functions/F1<Landroid/view/View;Landroid/view/ViewGroup;>;"
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/view/adapter/ViewAdapter;->enabled:Z

    .line 29
    iput-object p1, p0, Lcom/vk/music/view/adapter/ViewAdapter;->factory:Lcom/vkontakte/android/functions/F1;

    .line 30
    iput-object p2, p0, Lcom/vk/music/view/adapter/ViewAdapter;->binder:Lcom/vkontakte/android/functions/VoidF;

    .line 31
    iput p3, p0, Lcom/vk/music/view/adapter/ViewAdapter;->viewType:I

    .line 32
    return-void
.end method

.method static synthetic lambda$new$0(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 56
    iget-boolean v0, p0, Lcom/vk/music/view/adapter/ViewAdapter;->enabled:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 66
    iget v0, p0, Lcom/vk/music/view/adapter/ViewAdapter;->viewType:I

    neg-int v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 61
    iget v0, p0, Lcom/vk/music/view/adapter/ViewAdapter;->viewType:I

    return v0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewAdapter;->binder:Lcom/vkontakte/android/functions/VoidF;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewAdapter;->binder:Lcom/vkontakte/android/functions/VoidF;

    invoke-interface {v0}, Lcom/vkontakte/android/functions/VoidF;->f()V

    .line 52
    :cond_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 44
    new-instance v1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewAdapter;->factory:Lcom/vkontakte/android/functions/F1;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-direct {v1, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method

.method public setEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/vk/music/view/adapter/ViewAdapter;->enabled:Z

    .line 71
    invoke-virtual {p0}, Lcom/vk/music/view/adapter/ViewAdapter;->notifyDataSetChanged()V

    .line 72
    return-void
.end method
