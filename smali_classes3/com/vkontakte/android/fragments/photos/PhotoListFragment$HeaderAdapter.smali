.class public Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "HeaderAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 647
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 661
    const/4 v0, 0x1

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 666
    const/4 v0, 0x2

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 647
    check-cast p1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;I)V
    .locals 0
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 656
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->update()V

    .line 657
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 647
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 651
    new-instance v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    return-object v0
.end method
