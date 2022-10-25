.class public Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "BoardTopicsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "TopicListAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/DiscussionHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 285
    const/4 v0, 0x6

    return v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->access$1300(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 267
    check-cast p1, Lcom/vkontakte/android/ui/holder/DiscussionHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/DiscussionHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/DiscussionHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/DiscussionHolder;
    .param p2, "position"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->access$1200(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->bind(Ljava/lang/Object;)V

    .line 276
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 267
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/DiscussionHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/DiscussionHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 270
    new-instance v0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;-><init>(Landroid/content/Context;Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;)V

    return-object v0
.end method
