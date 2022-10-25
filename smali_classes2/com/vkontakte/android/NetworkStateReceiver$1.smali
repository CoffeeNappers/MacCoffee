.class Lcom/vkontakte/android/NetworkStateReceiver$1;
.super Ljava/lang/Object;
.source "NetworkStateReceiver.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/NetworkStateReceiver;->lambda$onReceive$0()V
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
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/NetworkStateReceiver;

.field final synthetic val$preq:Lcom/vkontakte/android/data/PersistentAPIRequest;

.field final synthetic val$req:Lcom/vkontakte/android/api/VKAPIRequest;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/NetworkStateReceiver;Lcom/vkontakte/android/api/VKAPIRequest;Lcom/vkontakte/android/data/PersistentAPIRequest;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/NetworkStateReceiver;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->this$0:Lcom/vkontakte/android/NetworkStateReceiver;

    iput-object p2, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$req:Lcom/vkontakte/android/api/VKAPIRequest;

    iput-object p3, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$preq:Lcom/vkontakte/android/data/PersistentAPIRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 152
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    .line 153
    .local v0, "errorCode":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    if-lez v0, :cond_0

    .line 157
    iget-object v1, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$preq:Lcom/vkontakte/android/data/PersistentAPIRequest;

    iget v1, v1, Lcom/vkontakte/android/data/PersistentAPIRequest;->id:I

    invoke-static {v1}, Lcom/vkontakte/android/cache/Cache;->deleteApiRequest(I)V

    .line 159
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 130
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/NetworkStateReceiver$1;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 10
    .param p1, "r"    # Lorg/json/JSONObject;

    .prologue
    const/4 v7, 0x0

    .line 132
    iget-object v5, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$req:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v5, v5, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v6, "method"

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 133
    .local v0, "m":Ljava/lang/String;
    const-string/jumbo v5, "friends.add"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 134
    iget-object v5, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$req:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v5, v5, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v6, "user_id"

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 135
    .local v2, "uid":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .local v3, "uids":Ljava/util/ArrayList;
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    invoke-static {v3}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v1

    .line 138
    .local v1, "p":Ljava/util/ArrayList;
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/UserProfile;

    invoke-static {v5}, Lcom/vkontakte/android/data/Friends;->addLocally(Lcom/vkontakte/android/UserProfile;)V

    .line 140
    .end local v1    # "p":Ljava/util/ArrayList;
    .end local v2    # "uid":I
    .end local v3    # "uids":Ljava/util/ArrayList;
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$preq:Lcom/vkontakte/android/data/PersistentAPIRequest;

    iget v5, v5, Lcom/vkontakte/android/data/PersistentAPIRequest;->id:I

    invoke-static {v5}, Lcom/vkontakte/android/cache/Cache;->deleteApiRequest(I)V

    .line 141
    iget-object v5, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$preq:Lcom/vkontakte/android/data/PersistentAPIRequest;

    iget-object v5, v5, Lcom/vkontakte/android/data/PersistentAPIRequest;->callback:Ljava/lang/reflect/Method;

    if-eqz v5, :cond_1

    .line 143
    :try_start_0
    iget-object v5, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$preq:Lcom/vkontakte/android/data/PersistentAPIRequest;

    iget-object v5, v5, Lcom/vkontakte/android/data/PersistentAPIRequest;->callback:Ljava/lang/reflect/Method;

    const/4 v6, 0x0

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/vkontakte/android/NetworkStateReceiver$1;->val$preq:Lcom/vkontakte/android/data/PersistentAPIRequest;

    iget-object v9, v9, Lcom/vkontakte/android/data/PersistentAPIRequest;->userdata:Lorg/json/JSONObject;

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    :cond_1
    :goto_0
    return-void

    .line 144
    :catch_0
    move-exception v4

    .line 145
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
