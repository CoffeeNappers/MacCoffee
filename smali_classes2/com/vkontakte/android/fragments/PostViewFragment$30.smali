.class Lcom/vkontakte/android/fragments/PostViewFragment$30;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->loadComments(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/wall/WallGetComments$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$clear:Z

.field final synthetic val$csize:I

.field final synthetic val$saveScroll:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/app/Fragment;ZIZ)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 1745
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-boolean p3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->val$clear:Z

    iput p4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->val$csize:I

    iput-boolean p5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->val$saveScroll:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v1, 0x0

    .line 1902
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4102(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    .line 1903
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3800(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1904
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3802(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    .line 1905
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v1

    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 1906
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3900(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1917
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4002(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1918
    return-void

    .line 1907
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_2

    .line 1909
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/ErrorView;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1910
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/ErrorView;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1912
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4700(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1913
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    goto :goto_0

    .line 1915
    :cond_2
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallGetComments$Result;)V
    .locals 16
    .param p1, "r"    # Lcom/vkontakte/android/api/wall/WallGetComments$Result;

    .prologue
    .line 1748
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v13

    if-nez v13, :cond_1

    .line 1898
    :cond_0
    :goto_0
    return-void

    .line 1752
    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3800(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 1754
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3802(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    .line 1755
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3202(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    .line 1756
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3900(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1759
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4002(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1760
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4102(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    .line 1762
    move-object/from16 v0, p1

    iget-boolean v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->canComment:Z

    if-nez v13, :cond_3

    .line 1763
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v13

    const/16 v14, 0x8

    invoke-virtual {v13, v14}, Lcom/vkontakte/android/ui/WriteBar;->setVisibility(I)V

    .line 1764
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v13

    const/4 v14, 0x2

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 1765
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 1768
    :cond_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v13

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v14}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v14

    iput v14, v13, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 1770
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->val$clear:Z

    if-eqz v13, :cond_4

    .line 1771
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->likes:Lorg/json/JSONArray;

    invoke-static {v14}, Lcom/vkontakte/android/data/LikeInfo;->parse(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4202(Lcom/vkontakte/android/fragments/PostViewFragment;Ljava/util/List;)Ljava/util/List;

    .line 1773
    :cond_4
    move-object/from16 v0, p1

    iget v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalReposts:I

    const/4 v14, -0x1

    if-eq v13, v14, :cond_5

    .line 1774
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v13

    move-object/from16 v0, p1

    iget v14, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalReposts:I

    iput v14, v13, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 1775
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v13

    const/4 v14, 0x1

    move-object/from16 v0, p1

    iget-boolean v15, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->canRepost:Z

    invoke-virtual {v13, v14, v15}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 1776
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v13

    const/4 v14, 0x4

    move-object/from16 v0, p1

    iget-boolean v15, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->reposted:Z

    invoke-virtual {v13, v14, v15}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 1778
    :cond_5
    move-object/from16 v0, p1

    iget v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalViews:I

    const/4 v14, -0x1

    if-eq v13, v14, :cond_6

    .line 1779
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v13

    move-object/from16 v0, p1

    iget v14, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalViews:I

    iput v14, v13, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 1781
    :cond_6
    move-object/from16 v0, p1

    iget v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalLikes:I

    const/4 v14, -0x1

    if-eq v13, v14, :cond_7

    .line 1782
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v13

    move-object/from16 v0, p1

    iget v14, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalLikes:I

    iput v14, v13, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 1783
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v13

    const/16 v14, 0x8

    move-object/from16 v0, p1

    iget-boolean v15, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->liked:Z

    invoke-virtual {v13, v14, v15}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 1785
    :cond_7
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$100(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1786
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3100(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1790
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    add-int/2addr v13, v14

    add-int/lit8 v7, v13, 0x1

    .line 1791
    .local v7, "itemIndex":I
    const/4 v8, -0x1

    .line 1792
    .local v8, "itemOffset":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v13

    check-cast v13, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v13}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v13

    if-lt v7, v13, :cond_8

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4400(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    .line 1793
    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v13

    check-cast v13, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v13}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v13

    if-gt v7, v13, :cond_8

    .line 1794
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4600(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v13

    check-cast v13, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v13}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v13

    sub-int v13, v7, v13

    invoke-virtual {v14, v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 1795
    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    .line 1797
    :cond_8
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    move-result-object v13

    invoke-virtual {v13}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getItemCount()I

    move-result v5

    .line 1799
    .local v5, "countBefore":I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->val$clear:Z

    if-nez v13, :cond_b

    .line 1800
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v13}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 1801
    .local v9, "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/NewsComment;>;"
    :cond_9
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_b

    .line 1802
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/NewsComment;

    .line 1803
    .local v4, "comment":Lcom/vkontakte/android/NewsComment;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_a
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_9

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsComment;

    .line 1804
    .local v2, "c":Lcom/vkontakte/android/NewsComment;
    iget v14, v2, Lcom/vkontakte/android/NewsComment;->cid:I

    iget v15, v4, Lcom/vkontakte/android/NewsComment;->cid:I

    if-ne v14, v15, :cond_a

    .line 1805
    invoke-interface {v9}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 1812
    .end local v2    # "c":Lcom/vkontakte/android/NewsComment;
    .end local v4    # "comment":Lcom/vkontakte/android/NewsComment;
    .end local v9    # "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/NewsComment;>;"
    :cond_b
    sget-object v13, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v10

    .line 1813
    .local v10, "metrics":Landroid/util/DisplayMetrics;
    iget v13, v10, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v14, v10, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v13

    const/high16 v14, 0x42be0000    # 95.0f

    invoke-static {v14}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v14

    sub-int v12, v13, v14

    .line 1814
    .local v12, "tSize":I
    const/16 v13, 0x25c

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 1815
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v13}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_e

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsComment;

    .line 1816
    .restart local v2    # "c":Lcom/vkontakte/android/NewsComment;
    iget-object v14, v2, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_c
    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_d

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    .line 1817
    .local v1, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v15, v1, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v15, :cond_c

    .line 1818
    check-cast v1, Lcom/vkontakte/android/attachments/SnippetAttachment;

    .end local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    const/4 v15, 0x1

    iput-boolean v15, v1, Lcom/vkontakte/android/attachments/SnippetAttachment;->forceSmall:Z

    goto :goto_3

    .line 1821
    :cond_d
    int-to-float v14, v12

    const v15, 0x3f2a7efa    # 0.666f

    mul-float/2addr v14, v15

    float-to-int v14, v14

    iget-object v15, v2, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-static {v12, v14, v15}, Lcom/vkontakte/android/ZhukovLayout;->processThumbs(IILjava/util/List;)V

    goto :goto_2

    .line 1824
    .end local v2    # "c":Lcom/vkontakte/android/NewsComment;
    :cond_e
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4700(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/widget/FrameLayout;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1825
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4800(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/SwipeRefreshLayoutI;

    move-result-object v13

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Lme/grishka/appkit/views/SwipeRefreshLayoutI;->setRefreshing(Z)V

    .line 1827
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->val$clear:Z

    if-eqz v13, :cond_f

    .line 1828
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 1830
    :cond_f
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_4
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v13}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v13

    if-ge v6, v13, :cond_10

    .line 1831
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v13, v6}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsComment;

    .line 1832
    .local v3, "comm":Lcom/vkontakte/android/NewsComment;
    iget-object v13, v3, Lcom/vkontakte/android/NewsComment;->text:Ljava/lang/String;

    invoke-virtual {v3, v13}, Lcom/vkontakte/android/NewsComment;->setText(Ljava/lang/String;)V

    .line 1833
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v13, v6, v3}, Lcom/vkontakte/android/data/VKList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1830
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 1836
    .end local v3    # "comm":Lcom/vkontakte/android/NewsComment;
    :cond_10
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3200(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v13

    if-nez v13, :cond_14

    .line 1837
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v13, v14, v15}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 1856
    :cond_11
    :goto_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$900(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/LoadMoreCommentsView;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1857
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3200(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v13

    if-nez v13, :cond_12

    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    .line 1858
    invoke-virtual {v13}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-le v13, v14, :cond_12

    .line 1860
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$900(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/LoadMoreCommentsView;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lcom/vkontakte/android/LoadMoreCommentsView;->showProgress(Z)V

    .line 1861
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$900(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/LoadMoreCommentsView;

    move-result-object v13

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v14}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v15}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v15

    sub-int/2addr v14, v15

    invoke-virtual {v13, v14}, Lcom/vkontakte/android/LoadMoreCommentsView;->setNumComments(I)V

    .line 1862
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$900(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/LoadMoreCommentsView;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1865
    :cond_12
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 1867
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5000(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v13

    if-eqz v13, :cond_17

    .line 1868
    const/4 v11, -0x1

    .line 1869
    .local v11, "pos":I
    const/4 v6, 0x0

    .line 1870
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_6
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_13

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsComment;

    .line 1871
    .restart local v3    # "comm":Lcom/vkontakte/android/NewsComment;
    iget v14, v3, Lcom/vkontakte/android/NewsComment;->cid:I

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v15}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5000(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v15

    if-ne v14, v15, :cond_16

    .line 1872
    move v11, v6

    .line 1877
    .end local v3    # "comm":Lcom/vkontakte/android/NewsComment;
    :cond_13
    const/4 v13, -0x1

    if-eq v11, v13, :cond_0

    .line 1878
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    add-int/2addr v13, v14

    add-int/2addr v11, v13

    .line 1879
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v13

    check-cast v13, Landroid/support/v7/widget/LinearLayoutManager;

    const/high16 v14, 0x42480000    # 50.0f

    invoke-static {v14}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v14

    invoke-virtual {v13, v11, v14}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto/16 :goto_0

    .line 1842
    .end local v11    # "pos":I
    :cond_14
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->val$csize:I

    if-nez v13, :cond_15

    .line 1843
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1844
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_11

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v14

    iget v14, v14, Lcom/vkontakte/android/NewsEntry;->numComments:I

    if-ge v13, v14, :cond_11

    .line 1846
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$800(Lcom/vkontakte/android/fragments/PostViewFragment;Z)V

    goto/16 :goto_5

    .line 1850
    :cond_15
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4900(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 1851
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$4900(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_5

    .line 1875
    .restart local v3    # "comm":Lcom/vkontakte/android/NewsComment;
    .restart local v11    # "pos":I
    :cond_16
    add-int/lit8 v6, v6, 0x1

    .line 1876
    goto/16 :goto_6

    .line 1881
    .end local v3    # "comm":Lcom/vkontakte/android/NewsComment;
    .end local v11    # "pos":I
    :cond_17
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->val$saveScroll:Z

    if-eqz v13, :cond_18

    .line 1882
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v13

    check-cast v13, Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5200(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v14

    invoke-virtual {v14}, Lme/grishka/appkit/views/UsableRecyclerView;->getCount()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto/16 :goto_0

    .line 1883
    :cond_18
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5400(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v13

    if-eqz v13, :cond_1a

    .line 1884
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getCount()I

    move-result v13

    const/16 v14, 0x14

    if-ge v13, v14, :cond_19

    .line 1885
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5700(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5600(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v14

    invoke-virtual {v14}, Lme/grishka/appkit/views/UsableRecyclerView;->getCount()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-virtual {v13, v14}, Lme/grishka/appkit/views/UsableRecyclerView;->smoothScrollToPosition(I)V

    .line 1889
    :goto_7
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5402(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    goto/16 :goto_0

    .line 1887
    :cond_19
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5900(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5800(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v14

    invoke-virtual {v14}, Lme/grishka/appkit/views/UsableRecyclerView;->getCount()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-virtual {v13, v14}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    goto :goto_7

    .line 1890
    :cond_1a
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6000(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v13

    if-eqz v13, :cond_1b

    .line 1891
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v15}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v15

    add-int/2addr v14, v15

    invoke-virtual {v13, v14}, Lme/grishka/appkit/views/UsableRecyclerView;->smoothScrollToPosition(I)V

    .line 1892
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6002(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    goto/16 :goto_0

    .line 1893
    :cond_1b
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/16 v14, 0xa

    if-le v13, v14, :cond_0

    const/4 v13, -0x1

    if-eq v8, v13, :cond_0

    .line 1894
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6200(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v13

    check-cast v13, Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/PostViewFragment$30;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v14}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    move-result-object v14

    invoke-virtual {v14}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getItemCount()I

    move-result v14

    sub-int/2addr v14, v5

    add-int/2addr v14, v7

    invoke-virtual {v13, v14, v8}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto/16 :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1745
    check-cast p1, Lcom/vkontakte/android/api/wall/WallGetComments$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$30;->success(Lcom/vkontakte/android/api/wall/WallGetComments$Result;)V

    return-void
.end method
