.class Lcom/vkontakte/android/data/Friends$1$1;
.super Ljava/lang/Object;
.source "Friends.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Friends$1;->run()V
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
        "Lcom/vkontakte/android/api/friends/FriendsGet$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/Friends$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/Friends$1;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/data/Friends$1;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/vkontakte/android/data/Friends$1$1;->this$0:Lcom/vkontakte/android/data/Friends$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 140
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getFriends()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 141
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getFriendLists()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->access$002(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 142
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "reload friends failed, got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$300()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " from cache"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$500()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$300()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 144
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$600()V

    .line 145
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->updateSorting()V

    .line 146
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 147
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->access$702(Z)Z

    .line 148
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->access$102(Z)Z

    .line 149
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/friends/FriendsGet$Result;)V
    .locals 5
    .param p1, "result"    # Lcom/vkontakte/android/api/friends/FriendsGet$Result;

    .prologue
    const/4 v4, 0x1

    .line 116
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$300()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 120
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$300()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/api/friends/FriendsGet$Result;->friends:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 121
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 122
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$400()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 123
    iget-object v1, p1, Lcom/vkontakte/android/api/friends/FriendsGet$Result;->friends:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 124
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$400()Ljava/util/ArrayList;

    move-result-object v2

    iget v3, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 126
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    iget-object v1, p1, Lcom/vkontakte/android/api/friends/FriendsGet$Result;->friends:Ljava/util/List;

    invoke-static {v1, v4}, Lcom/vkontakte/android/cache/Cache;->updateFriends(Ljava/util/List;Z)V

    .line 127
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$500()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$300()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 128
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$600()V

    .line 129
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->updateSorting()V

    .line 130
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$000()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 131
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$000()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/api/friends/FriendsGet$Result;->lists:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 132
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$000()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1, v4}, Lcom/vkontakte/android/cache/Cache;->updateFriendLists(Ljava/util/List;Z)V

    .line 133
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 134
    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->access$702(Z)Z

    .line 135
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/vkontakte/android/data/Friends;->access$102(Z)Z

    .line 136
    return-void

    .line 117
    :catch_0
    move-exception v1

    goto/16 :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 112
    check-cast p1, Lcom/vkontakte/android/api/friends/FriendsGet$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Friends$1$1;->success(Lcom/vkontakte/android/api/friends/FriendsGet$Result;)V

    return-void
.end method
