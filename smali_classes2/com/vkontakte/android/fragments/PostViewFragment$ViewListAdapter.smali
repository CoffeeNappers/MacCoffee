.class Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewListAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private positionMap:Landroid/util/SparseIntArray;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 2

    .prologue
    .line 2334
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 2336
    new-instance v0, Landroid/util/SparseIntArray;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->positionMap:Landroid/util/SparseIntArray;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/fragments/PostViewFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/PostViewFragment$1;

    .prologue
    .line 2334
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 2349
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 2354
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->positionMap:Landroid/util/SparseIntArray;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseIntArray;->put(II)V

    .line 2356
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 2334
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 0
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 2345
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 2334
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 2340
    new-instance v1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;->positionMap:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-direct {v1, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method
