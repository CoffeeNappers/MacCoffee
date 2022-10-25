.class final Lcom/vkontakte/android/data/Friends$2;
.super Ljava/lang/Object;
.source "Friends.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/vkontakte/android/data/Friends$GetUsersCallback;

.field final synthetic val$ids:Ljava/util/ArrayList;

.field final synthetic val$nameCase:I

.field final synthetic val$profiles:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;ILjava/util/ArrayList;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V
    .locals 0

    .prologue
    .line 409
    iput-object p1, p0, Lcom/vkontakte/android/data/Friends$2;->val$ids:Ljava/util/ArrayList;

    iput p2, p0, Lcom/vkontakte/android/data/Friends$2;->val$nameCase:I

    iput-object p3, p0, Lcom/vkontakte/android/data/Friends$2;->val$profiles:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/vkontakte/android/data/Friends$2;->val$callback:Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 411
    iget-object v4, p0, Lcom/vkontakte/android/data/Friends$2;->val$ids:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 412
    iget-object v4, p0, Lcom/vkontakte/android/data/Friends$2;->val$ids:Ljava/util/ArrayList;

    iget v5, p0, Lcom/vkontakte/android/data/Friends$2;->val$nameCase:I

    invoke-static {v4, v8, v5}, Lcom/vkontakte/android/cache/Cache;->getUsers(Ljava/util/List;ZI)Ljava/util/ArrayList;

    move-result-object v0

    .line 413
    .local v0, "fromCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v4, p0, Lcom/vkontakte/android/data/Friends$2;->val$profiles:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 414
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 415
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v5, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-static {v5}, Lcom/vkontakte/android/utils/Utils;->isBlank(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 416
    iget-object v5, p0, Lcom/vkontakte/android/data/Friends$2;->val$ids:Ljava/util/ArrayList;

    iget v6, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 417
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$800()Landroid/util/LruCache;

    move-result-object v5

    iget v6, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    iget v7, p0, Lcom/vkontakte/android/data/Friends$2;->val$nameCase:I

    shl-int/lit8 v7, v7, 0x18

    or-int/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 424
    .end local v0    # "fromCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/data/Friends$2;->val$ids:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 425
    const/4 v3, 0x0

    .line 426
    .local v3, "success":Z
    const/4 v4, 0x1

    new-array v2, v4, [I

    const/4 v4, 0x3

    aput v4, v2, v8

    .line 427
    .local v2, "retriesLeft":[I
    :goto_1
    aget v4, v2, v8

    if-lez v4, :cond_2

    if-nez v3, :cond_2

    .line 428
    new-instance v4, Lcom/vkontakte/android/api/users/UsersGet;

    iget-object v5, p0, Lcom/vkontakte/android/data/Friends$2;->val$ids:Ljava/util/ArrayList;

    iget v6, p0, Lcom/vkontakte/android/data/Friends$2;->val$nameCase:I

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/api/users/UsersGet;-><init>(Ljava/util/List;I)V

    new-instance v5, Lcom/vkontakte/android/data/Friends$2$1;

    invoke-direct {v5, p0, v2}, Lcom/vkontakte/android/data/Friends$2$1;-><init>(Lcom/vkontakte/android/data/Friends$2;[I)V

    .line 429
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/users/UsersGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    .line 452
    invoke-virtual {v4}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v3

    goto :goto_1

    .line 455
    .end local v2    # "retriesLeft":[I
    .end local v3    # "success":Z
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/data/Friends$2;->val$callback:Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    iget-object v5, p0, Lcom/vkontakte/android/data/Friends$2;->val$profiles:Ljava/util/ArrayList;

    invoke-interface {v4, v5}, Lcom/vkontakte/android/data/Friends$GetUsersCallback;->onUsersLoaded(Ljava/util/ArrayList;)V

    .line 456
    return-void
.end method
