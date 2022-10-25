.class Lcom/vkontakte/android/fragments/PostListFragment$5;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PostListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostListFragment;->hideSource(Lcom/vkontakte/android/NewsEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostListFragment;

.field final synthetic val$de:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostListFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 787
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->val$de:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 7

    .prologue
    .line 790
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 791
    .local v3, "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/PostListFragment;->access$000(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 792
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    iget v5, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->val$de:Lcom/vkontakte/android/NewsEntry;

    iget v6, v6, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v5, v6, :cond_0

    .line 793
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 796
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/PostListFragment;->access$100(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 797
    .restart local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    iget v5, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->val$de:Lcom/vkontakte/android/NewsEntry;

    iget v6, v6, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v5, v6, :cond_2

    .line 798
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 801
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_3
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 802
    .restart local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostListFragment;->access$200(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 803
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostListFragment;->access$300(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 805
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_4
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 806
    .local v2, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    :cond_5
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 807
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 808
    .local v1, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    iget v4, v1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->val$de:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v4, v5, :cond_5

    .line 809
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_3

    .line 812
    .end local v1    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_6
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->val$de:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-lez v4, :cond_7

    const v4, 0x7f08042d

    :goto_4
    const/4 v6, 0x1

    invoke-static {v5, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 813
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/PostListFragment;->updateList()V

    .line 814
    return-void

    .line 812
    :cond_7
    const v4, 0x7f08042c

    goto :goto_4
.end method
