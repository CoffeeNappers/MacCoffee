.class Lcom/vkontakte/android/data/Friends$2$1;
.super Ljava/lang/Object;
.source "Friends.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Friends$2;->run()V
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
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/Friends$2;

.field final synthetic val$retriesLeft:[I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/Friends$2;[I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/data/Friends$2;

    .prologue
    .line 429
    iput-object p1, p0, Lcom/vkontakte/android/data/Friends$2$1;->this$0:Lcom/vkontakte/android/data/Friends$2;

    iput-object p2, p0, Lcom/vkontakte/android/data/Friends$2$1;->val$retriesLeft:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 447
    iget-object v1, p0, Lcom/vkontakte/android/data/Friends$2$1;->this$0:Lcom/vkontakte/android/data/Friends$2;

    iget-object v1, v1, Lcom/vkontakte/android/data/Friends$2;->val$ids:Ljava/util/ArrayList;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/data/Friends$2$1;->this$0:Lcom/vkontakte/android/data/Friends$2;

    iget v3, v3, Lcom/vkontakte/android/data/Friends$2;->val$nameCase:I

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/cache/Cache;->getUsers(Ljava/util/List;ZI)Ljava/util/ArrayList;

    move-result-object v0

    .line 448
    .local v0, "fromCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v1, p0, Lcom/vkontakte/android/data/Friends$2$1;->this$0:Lcom/vkontakte/android/data/Friends$2;

    iget-object v1, v1, Lcom/vkontakte/android/data/Friends$2;->val$profiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 449
    iget-object v1, p0, Lcom/vkontakte/android/data/Friends$2$1;->val$retriesLeft:[I

    const/4 v2, 0x0

    aget v3, v1, v2

    add-int/lit8 v3, v3, -0x1

    aput v3, v1, v2

    .line 450
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 429
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Friends$2$1;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 432
    .local p1, "r":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vkontakte/android/data/Friends$2$1;->this$0:Lcom/vkontakte/android/data/Friends$2;

    iget v2, v2, Lcom/vkontakte/android/data/Friends$2;->val$nameCase:I

    invoke-static {p1, v1, v2}, Lcom/vkontakte/android/cache/Cache;->updatePeers(Ljava/util/List;ZI)V

    .line 433
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 434
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->access$800()Landroid/util/LruCache;

    move-result-object v2

    iget v3, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v4, p0, Lcom/vkontakte/android/data/Friends$2$1;->this$0:Lcom/vkontakte/android/data/Friends$2;

    iget v4, v4, Lcom/vkontakte/android/data/Friends$2;->val$nameCase:I

    shl-int/lit8 v4, v4, 0x18

    or-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 439
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/data/Friends$2$1;->this$0:Lcom/vkontakte/android/data/Friends$2;

    iget-object v1, v1, Lcom/vkontakte/android/data/Friends$2;->val$profiles:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 440
    return-void
.end method
