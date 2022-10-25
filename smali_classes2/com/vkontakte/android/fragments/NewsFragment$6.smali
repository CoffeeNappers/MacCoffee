.class Lcom/vkontakte/android/fragments/NewsFragment$6;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "NewsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;

.field final synthetic val$listId:I

.field final synthetic val$offset:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/app/Fragment;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 1076
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->val$offset:I

    iput p4, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->val$listId:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1107
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 1109
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;)V
    .locals 8
    .param p1, "news"    # Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1079
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1080
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 1081
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "feed_last_unload"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-interface {v3, v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1084
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->val$offset:I

    if-nez v3, :cond_2

    .line 1085
    iget-object v3, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    if-eqz v3, :cond_1

    iget v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->val$listId:I

    if-nez v3, :cond_1

    .line 1086
    iget-object v3, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    invoke-virtual {p1, v2, v3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->addAll(ILjava/util/Collection;)Z

    .line 1088
    :cond_1
    invoke-static {p1}, Lcom/vkontakte/android/cache/NewsfeedCache;->replace(Ljava/util/List;)V

    .line 1090
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->from()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFrom(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3500(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/lang/String;)V

    .line 1091
    iget-object v3, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    invoke-static {v3, v1}, Lcom/vkontakte/android/cache/NewsfeedCache;->setLists(Ljava/util/List;Z)V

    .line 1092
    iget v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->val$listId:I

    if-nez v3, :cond_3

    .line 1093
    iget-object v3, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->isSmartNews:Ljava/lang/Boolean;

    invoke-static {v3}, Lcom/vkontakte/android/cache/NewsfeedCache;->setNewsfeedTop(Ljava/lang/Boolean;)V

    .line 1095
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v4, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1700(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/util/List;Z)V

    .line 1096
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5

    :goto_0
    invoke-virtual {v3, p1, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 1097
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3700(Lcom/vkontakte/android/fragments/NewsFragment;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3800(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 1098
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3900(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 1099
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$3702(Lcom/vkontakte/android/fragments/NewsFragment;Z)Z

    .line 1102
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->stories:Lcom/vk/stories/model/GetStoriesResponse;

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1300(Lcom/vkontakte/android/fragments/NewsFragment;Lcom/vk/stories/model/GetStoriesResponse;)V

    .line 1103
    return-void

    :cond_5
    move v1, v2

    .line 1096
    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1076
    check-cast p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$6;->success(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;)V

    return-void
.end method
