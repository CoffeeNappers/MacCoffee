.class Lcom/vkontakte/android/fragments/NewsFragment$5;
.super Ljava/lang/Object;
.source "NewsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsFragment;->preloadNew()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;

.field final synthetic val$list:Lme/grishka/appkit/views/UsableRecyclerView;

.field final synthetic val$listId:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;ILme/grishka/appkit/views/UsableRecyclerView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 781
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iput p2, p0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$listId:I

    iput-object p3, p0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$success$0(Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "forCache"    # Ljava/util/ArrayList;

    .prologue
    .line 969
    invoke-static {p0}, Lcom/vkontakte/android/cache/NewsfeedCache;->addToTop(Ljava/util/Collection;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 996
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1402(Lcom/vkontakte/android/fragments/NewsFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 998
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;)V
    .locals 34
    .param p1, "rnews"    # Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    .prologue
    .line 784
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    .line 785
    .local v8, "activity":Landroid/app/Activity;
    if-eqz v8, :cond_0

    .line 786
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "feed_last_unload"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v32

    move-wide/from16 v0, v32

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 789
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->stories:Lcom/vk/stories/model/GetStoriesResponse;

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1300(Lcom/vkontakte/android/fragments/NewsFragment;Lcom/vk/stories/model/GetStoriesResponse;)V

    .line 791
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1402(Lcom/vkontakte/android/fragments/NewsFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 792
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->from()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1502(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 793
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 794
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/vkontakte/android/cache/NewsfeedCache;->setLists(Ljava/util/List;Z)V

    .line 795
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$listId:I

    if-nez v2, :cond_1

    .line 796
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->isSmartNews:Ljava/lang/Boolean;

    invoke-static {v2}, Lcom/vkontakte/android/cache/NewsfeedCache;->setNewsfeedTop(Ljava/lang/Boolean;)V

    .line 798
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v31

    move/from16 v0, v31

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1700(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/util/List;Z)V

    .line 801
    const/16 v16, 0x0

    .line 802
    .local v16, "hasNewNotifications":Z
    const/16 v30, 0x0

    .line 804
    .local v30, "userNotifications":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$listId:I

    if-nez v2, :cond_7

    .line 805
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 806
    .local v23, "lastNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 807
    .local v27, "newNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1800(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v17

    if-ge v0, v2, :cond_3

    .line 808
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1900(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0xf

    if-ne v2, v3, :cond_2

    .line 809
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2000(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 807
    :cond_2
    add-int/lit8 v17, v17, 0x1

    goto :goto_0

    .line 812
    :cond_3
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    if-nez v2, :cond_a

    .line 813
    move-object/from16 v0, v27

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 822
    :cond_4
    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_d

    .line 823
    const/16 v17, 0x0

    :goto_1
    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v17

    if-ge v0, v2, :cond_6

    .line 824
    move-object/from16 v0, v23

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/vkontakte/android/NewsEntry;

    .line 825
    .local v19, "last":Lcom/vkontakte/android/NewsEntry;
    move-object/from16 v0, v27

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/NewsEntry;

    .line 826
    .local v26, "newN":Lcom/vkontakte/android/NewsEntry;
    move-object/from16 v0, v19

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move-object/from16 v0, v26

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v2, v3, :cond_5

    move-object/from16 v0, v19

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, v26

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-eq v2, v3, :cond_c

    .line 827
    :cond_5
    const/16 v16, 0x1

    .line 835
    .end local v19    # "last":Lcom/vkontakte/android/NewsEntry;
    .end local v26    # "newN":Lcom/vkontakte/android/NewsEntry;
    :cond_6
    :goto_2
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    if-eqz v2, :cond_e

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    move-object/from16 v30, v0

    .line 837
    .end local v17    # "i":I
    .end local v23    # "lastNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    .end local v27    # "newNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_7
    :goto_3
    if-nez v30, :cond_f

    const/4 v4, 0x0

    .line 839
    .local v4, "notificationCount":I
    :goto_4
    const/16 v28, 0x0

    .line 840
    .local v28, "numNew":I
    const/4 v14, 0x0

    .line 841
    .local v14, "found":Z
    if-nez v16, :cond_17

    .line 842
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->isSmartNews:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_1e

    .line 844
    const/16 v20, 0x0

    .line 845
    .local v20, "lastFirstItem":Lcom/vkontakte/android/NewsEntry;
    const/16 v21, -0x1

    .line 846
    .local v21, "lastFirstItemIndex":I
    const/16 v17, 0x0

    .restart local v17    # "i":I
    :goto_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2100(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v17

    if-ge v0, v2, :cond_8

    .line 847
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2200(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0xf

    if-eq v2, v3, :cond_10

    .line 848
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2300(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    move/from16 v21, v17

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    .end local v20    # "lastFirstItem":Lcom/vkontakte/android/NewsEntry;
    check-cast v20, Lcom/vkontakte/android/NewsEntry;

    .line 852
    .restart local v20    # "lastFirstItem":Lcom/vkontakte/android/NewsEntry;
    :cond_8
    const/16 v22, -0x1

    .line 853
    .local v22, "lastFirstItemIndexInNew":I
    const/16 v17, 0x0

    :goto_6
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->size()I

    move-result v2

    move/from16 v0, v17

    if-ge v0, v2, :cond_11

    .line 854
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/NewsEntry;

    .line 855
    .local v10, "e":Lcom/vkontakte/android/NewsEntry;
    if-eqz v20, :cond_9

    iget v2, v10, Lcom/vkontakte/android/NewsEntry;->type:I

    move-object/from16 v0, v20

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v2, v3, :cond_9

    iget v2, v10, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, v20

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v2, v3, :cond_9

    iget v2, v10, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move-object/from16 v0, v20

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v2, v3, :cond_9

    .line 857
    move/from16 v22, v17

    .line 853
    :cond_9
    add-int/lit8 v17, v17, 0x1

    goto :goto_6

    .line 815
    .end local v4    # "notificationCount":I
    .end local v10    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v14    # "found":Z
    .end local v20    # "lastFirstItem":Lcom/vkontakte/android/NewsEntry;
    .end local v21    # "lastFirstItemIndex":I
    .end local v22    # "lastFirstItemIndexInNew":I
    .end local v28    # "numNew":I
    .restart local v23    # "lastNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    .restart local v27    # "newNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_a
    const/16 v17, 0x0

    :goto_7
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    move/from16 v0, v17

    if-ge v0, v2, :cond_4

    .line 816
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    move/from16 v0, v17

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0xf

    if-ne v2, v3, :cond_b

    .line 817
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    move/from16 v0, v17

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v27

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 815
    :cond_b
    add-int/lit8 v17, v17, 0x1

    goto :goto_7

    .line 823
    .restart local v19    # "last":Lcom/vkontakte/android/NewsEntry;
    .restart local v26    # "newN":Lcom/vkontakte/android/NewsEntry;
    :cond_c
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_1

    .line 832
    .end local v19    # "last":Lcom/vkontakte/android/NewsEntry;
    .end local v26    # "newN":Lcom/vkontakte/android/NewsEntry;
    :cond_d
    const/16 v16, 0x1

    goto/16 :goto_2

    :cond_e
    move-object/from16 v30, v23

    .line 835
    goto/16 :goto_3

    .line 837
    .end local v17    # "i":I
    .end local v23    # "lastNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    .end local v27    # "newNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_f
    invoke-interface/range {v30 .. v30}, Ljava/util/List;->size()I

    move-result v4

    goto/16 :goto_4

    .line 846
    .restart local v4    # "notificationCount":I
    .restart local v14    # "found":Z
    .restart local v17    # "i":I
    .restart local v20    # "lastFirstItem":Lcom/vkontakte/android/NewsEntry;
    .restart local v21    # "lastFirstItemIndex":I
    .restart local v28    # "numNew":I
    :cond_10
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_5

    .line 860
    .restart local v22    # "lastFirstItemIndexInNew":I
    :cond_11
    if-ltz v21, :cond_15

    if-ltz v22, :cond_15

    .line 861
    const/4 v14, 0x1

    .line 862
    :cond_12
    add-int/lit8 v21, v21, 0x1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2400(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v21

    if-ge v0, v2, :cond_15

    add-int/lit8 v22, v22, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->size()I

    move-result v2

    move/from16 v0, v22

    if-ge v0, v2, :cond_15

    .line 863
    const/4 v11, 0x0

    .line 864
    .local v11, "entryInLast":Lcom/vkontakte/android/NewsEntry;
    :goto_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2500(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v21

    if-ge v0, v2, :cond_14

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    .line 865
    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    move/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "entryInLast":Lcom/vkontakte/android/NewsEntry;
    check-cast v11, Lcom/vkontakte/android/NewsEntry;

    .restart local v11    # "entryInLast":Lcom/vkontakte/android/NewsEntry;
    if-eqz v11, :cond_13

    iget v2, v11, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 866
    invoke-static {v2}, Lcom/vkontakte/android/NewsEntry;->isTypeAd(I)Z

    move-result v2

    if-nez v2, :cond_13

    iget v2, v11, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0xd

    if-ne v2, v3, :cond_14

    .line 867
    :cond_13
    add-int/lit8 v21, v21, 0x1

    goto :goto_8

    .line 869
    :cond_14
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2700(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v21

    if-lt v0, v2, :cond_1a

    .line 898
    .end local v11    # "entryInLast":Lcom/vkontakte/android/NewsEntry;
    .end local v17    # "i":I
    .end local v20    # "lastFirstItem":Lcom/vkontakte/android/NewsEntry;
    .end local v21    # "lastFirstItemIndex":I
    .end local v22    # "lastFirstItemIndexInNew":I
    :cond_15
    :goto_9
    const/4 v15, 0x0

    .line 899
    .local v15, "foundWhileMerge":Z
    const/16 v17, 0x0

    .restart local v17    # "i":I
    :goto_a
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->size()I

    move-result v2

    move/from16 v0, v17

    if-ge v0, v2, :cond_17

    .line 900
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/NewsEntry;

    .line 901
    .restart local v10    # "e":Lcom/vkontakte/android/NewsEntry;
    const/16 v18, 0x0

    .local v18, "j":I
    :goto_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2800(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v18

    if-ge v0, v2, :cond_16

    .line 902
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$2900(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    move/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lcom/vkontakte/android/NewsEntry;

    .line 903
    .local v25, "ne":Lcom/vkontakte/android/NewsEntry;
    if-eqz v14, :cond_1f

    iget v2, v10, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0xf

    if-eq v2, v3, :cond_1f

    iget v2, v10, Lcom/vkontakte/android/NewsEntry;->type:I

    move-object/from16 v0, v25

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v2, v3, :cond_1f

    iget v2, v10, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, v25

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v2, v3, :cond_1f

    iget v2, v10, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move-object/from16 v0, v25

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v2, v3, :cond_1f

    .line 905
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v31, "Found intersection, numNew="

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 906
    const/4 v15, 0x1

    .line 910
    .end local v25    # "ne":Lcom/vkontakte/android/NewsEntry;
    :cond_16
    if-eqz v15, :cond_20

    .line 918
    .end local v10    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v15    # "foundWhileMerge":Z
    .end local v17    # "i":I
    .end local v18    # "j":I
    :cond_17
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v2, :cond_21

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :goto_c
    check-cast v2, Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v24, v2

    check-cast v24, Landroid/support/v7/widget/LinearLayoutManager;

    .line 919
    .local v24, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    if-eqz v24, :cond_18

    invoke-virtual/range {v24 .. v24}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v2

    if-eqz v2, :cond_22

    :cond_18
    const/16 v29, 0x1

    .line 921
    .local v29, "savePosition":Z
    :goto_d
    if-eqz v16, :cond_23

    .line 922
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 923
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    if-eqz v2, :cond_19

    .line 924
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 926
    :cond_19
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 927
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$902(Lcom/vkontakte/android/fragments/NewsFragment;Z)Z

    .line 928
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v3, -0x1

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$702(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 929
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3000(Lcom/vkontakte/android/fragments/NewsFragment;Z)V

    .line 992
    :goto_e
    return-void

    .line 872
    .end local v24    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    .end local v29    # "savePosition":Z
    .restart local v11    # "entryInLast":Lcom/vkontakte/android/NewsEntry;
    .restart local v17    # "i":I
    .restart local v20    # "lastFirstItem":Lcom/vkontakte/android/NewsEntry;
    .restart local v21    # "lastFirstItemIndex":I
    .restart local v22    # "lastFirstItemIndexInNew":I
    :cond_1a
    const/4 v12, 0x0

    .line 873
    .local v12, "entryInNew":Lcom/vkontakte/android/NewsEntry;
    :goto_f
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->size()I

    move-result v2

    move/from16 v0, v22

    if-ge v0, v2, :cond_1c

    .line 874
    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "entryInNew":Lcom/vkontakte/android/NewsEntry;
    check-cast v12, Lcom/vkontakte/android/NewsEntry;

    .restart local v12    # "entryInNew":Lcom/vkontakte/android/NewsEntry;
    if-eqz v12, :cond_1b

    iget v2, v12, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 875
    invoke-static {v2}, Lcom/vkontakte/android/NewsEntry;->isTypeAd(I)Z

    move-result v2

    if-nez v2, :cond_1b

    iget v2, v12, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0xd

    if-ne v2, v3, :cond_1c

    .line 876
    :cond_1b
    add-int/lit8 v22, v22, 0x1

    goto :goto_f

    .line 878
    :cond_1c
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->size()I

    move-result v2

    move/from16 v0, v22

    if-ge v0, v2, :cond_15

    .line 884
    if-eqz v11, :cond_12

    if-eqz v12, :cond_12

    iget v2, v11, Lcom/vkontakte/android/NewsEntry;->type:I

    iget v3, v12, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v2, v3, :cond_1d

    iget v2, v11, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v3, v12, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v2, v3, :cond_1d

    iget v2, v11, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v3, v12, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-eq v2, v3, :cond_12

    .line 888
    :cond_1d
    const/4 v14, 0x0

    .line 889
    goto/16 :goto_9

    .line 895
    .end local v11    # "entryInLast":Lcom/vkontakte/android/NewsEntry;
    .end local v12    # "entryInNew":Lcom/vkontakte/android/NewsEntry;
    .end local v17    # "i":I
    .end local v20    # "lastFirstItem":Lcom/vkontakte/android/NewsEntry;
    .end local v21    # "lastFirstItemIndex":I
    .end local v22    # "lastFirstItemIndexInNew":I
    :cond_1e
    const/4 v14, 0x0

    goto/16 :goto_9

    .line 901
    .restart local v10    # "e":Lcom/vkontakte/android/NewsEntry;
    .restart local v15    # "foundWhileMerge":Z
    .restart local v17    # "i":I
    .restart local v18    # "j":I
    .restart local v25    # "ne":Lcom/vkontakte/android/NewsEntry;
    :cond_1f
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_b

    .line 913
    .end local v25    # "ne":Lcom/vkontakte/android/NewsEntry;
    :cond_20
    add-int/lit8 v28, v28, 0x1

    .line 914
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 899
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_a

    .line 918
    .end local v10    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v15    # "foundWhileMerge":Z
    .end local v17    # "i":I
    .end local v18    # "j":I
    :cond_21
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    goto/16 :goto_c

    .line 919
    .restart local v24    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    :cond_22
    const/16 v29, 0x0

    goto/16 :goto_d

    .line 931
    .restart local v29    # "savePosition":Z
    :cond_23
    if-lez v28, :cond_27

    if-nez v14, :cond_27

    .line 932
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 933
    if-eqz v30, :cond_24

    .line 934
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    move-object/from16 v0, v30

    invoke-interface {v2, v3, v0}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 936
    :cond_24
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$902(Lcom/vkontakte/android/fragments/NewsFragment;Z)Z

    .line 938
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_25

    .line 939
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v5

    .line 944
    .local v5, "position":I
    :goto_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    if-eqz v29, :cond_26

    add-int/lit8 v2, v5, -0x1

    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    :goto_11
    invoke-static {v3, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$702(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 945
    if-nez v29, :cond_28

    .line 946
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3000(Lcom/vkontakte/android/fragments/NewsFragment;Z)V

    goto/16 :goto_e

    .line 942
    .end local v5    # "position":I
    :cond_25
    const/4 v5, 0x0

    .restart local v5    # "position":I
    goto :goto_10

    .line 944
    :cond_26
    const/4 v2, -0x1

    goto :goto_11

    .line 949
    .end local v5    # "position":I
    :cond_27
    if-lez v28, :cond_28

    .line 950
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 952
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_2a

    .line 953
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v5

    .line 955
    .restart local v5    # "position":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v7

    .line 959
    .local v7, "offset":I
    :goto_12
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3100(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v4, v3}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 960
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/NewsFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 961
    .local v9, "cnt":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/NewsFragment;->onPrependItems(Ljava/util/List;I)V

    .line 962
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/NewsFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int v6, v2, v9

    .line 963
    .local v6, "addedCount":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    add-int v3, v5, v6

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$702(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 964
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->updateList()V

    .line 965
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 966
    .local v13, "forCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 967
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 968
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$902(Lcom/vkontakte/android/fragments/NewsFragment;Z)Z

    .line 969
    new-instance v2, Ljava/lang/Thread;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/NewsFragment$5$$Lambda$1;->lambdaFactory$(Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 970
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->val$list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v31

    new-instance v2, Lcom/vkontakte/android/fragments/NewsFragment$5$1;

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/vkontakte/android/fragments/NewsFragment$5$1;-><init>(Lcom/vkontakte/android/fragments/NewsFragment$5;IIII)V

    move-object/from16 v0, v31

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 986
    .end local v5    # "position":I
    .end local v6    # "addedCount":I
    .end local v7    # "offset":I
    .end local v9    # "cnt":I
    .end local v13    # "forCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_28
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v32

    move-wide/from16 v0, v32

    invoke-static {v2, v0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3302(Lcom/vkontakte/android/fragments/NewsFragment;J)J

    .line 987
    if-lez v28, :cond_29

    .line 988
    const-string/jumbo v2, "user_action"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "action_type"

    const-string/jumbo v31, "feed_load_new"

    move-object/from16 v0, v31

    invoke-virtual {v2, v3, v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "action_param"

    const-string/jumbo v31, "show"

    move-object/from16 v0, v31

    invoke-virtual {v2, v3, v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 990
    :cond_29
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    if-eqz v29, :cond_2b

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$700(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v2

    :goto_13
    invoke-static {v3, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$702(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 991
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/NewsFragment$5;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3400(Lcom/vkontakte/android/fragments/NewsFragment;)V

    goto/16 :goto_e

    .line 957
    :cond_2a
    const/4 v7, 0x0

    .restart local v7    # "offset":I
    move v5, v7

    .restart local v5    # "position":I
    goto/16 :goto_12

    .line 990
    .end local v5    # "position":I
    .end local v7    # "offset":I
    :cond_2b
    const/4 v2, -0x1

    goto :goto_13
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 781
    check-cast p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$5;->success(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;)V

    return-void
.end method
