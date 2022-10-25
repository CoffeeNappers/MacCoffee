.class final Lcom/vkontakte/android/data/Friends$1;
.super Ljava/lang/Object;
.source "Friends.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Friends;->reload(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$forceNetwork:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .prologue
    .line 102
    iput-boolean p1, p0, Lcom/vkontakte/android/data/Friends$1;->val$forceNetwork:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 104
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-boolean v3, p0, Lcom/vkontakte/android/data/Friends$1;->val$forceNetwork:Z

    if-nez v3, :cond_0

    .line 106
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getFriends()Ljava/util/ArrayList;

    move-result-object v2

    .line 107
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getFriendLists()Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/data/Friends;->access$002(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 109
    :cond_0
    iget-boolean v3, p0, Lcom/vkontakte/android/data/Friends$1;->val$forceNetwork:Z

    if-nez v3, :cond_1

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_2

    .line 110
    :cond_1
    invoke-static {v6}, Lcom/vkontakte/android/data/Friends;->access$102(Z)Z

    .line 111
    new-instance v3, Lcom/vkontakte/android/api/friends/FriendsGet;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/api/friends/FriendsGet;-><init>(IZ)V

    new-instance v4, Lcom/vkontakte/android/data/Friends$1$1;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/data/Friends$1$1;-><init>(Lcom/vkontakte/android/data/Friends$1;)V

    .line 112
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/friends/FriendsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 151
    invoke-virtual {v3, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->setBackground(Z)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 152
    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 174
    :goto_0
    return-void

    .line 155
    :cond_2
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :goto_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 159
    .local v0, "onlines":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$300()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 160
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iget v4, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v5, v1, Lcom/vkontakte/android/UserProfile;->online:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 162
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_3
    invoke-static {v2}, Lcom/vkontakte/android/data/Friends;->access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 163
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$300()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_4
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 164
    .restart local v1    # "p":Lcom/vkontakte/android/UserProfile;
    iget v3, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 165
    iget v3, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, v1, Lcom/vkontakte/android/UserProfile;->online:I

    goto :goto_3

    .line 168
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_5
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 169
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$500()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v3

    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$300()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 170
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$600()V

    .line 171
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->updateSorting()V

    .line 172
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v5, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 156
    .end local v0    # "onlines":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :catch_0
    move-exception v3

    goto/16 :goto_1
.end method
