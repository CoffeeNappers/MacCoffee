.class Lcom/vkontakte/android/LongPollService$1;
.super Ljava/lang/Object;
.source "LongPollService.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->updateServerInfo()Z
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
.field final synthetic this$0:Lcom/vkontakte/android/LongPollService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LongPollService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LongPollService;

    .prologue
    .line 290
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService$1;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 330
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 290
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LongPollService$1;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "r"    # Lorg/json/JSONObject;

    .prologue
    .line 293
    :try_start_0
    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string/jumbo v10, "s"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 294
    .local v5, "o":Lorg/json/JSONObject;
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$1;->this$0:Lcom/vkontakte/android/LongPollService;

    const-string/jumbo v10, "ts"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-static {v9, v10}, Lcom/vkontakte/android/LongPollService;->access$002(Lcom/vkontakte/android/LongPollService;I)I

    .line 295
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$1;->this$0:Lcom/vkontakte/android/LongPollService;

    const-string/jumbo v10, "key"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/vkontakte/android/LongPollService;->access$102(Lcom/vkontakte/android/LongPollService;Ljava/lang/String;)Ljava/lang/String;

    .line 296
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$1;->this$0:Lcom/vkontakte/android/LongPollService;

    const-string/jumbo v10, "server"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/vkontakte/android/LongPollService;->access$202(Lcom/vkontakte/android/LongPollService;Ljava/lang/String;)Ljava/lang/String;

    .line 300
    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string/jumbo v10, "c"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 302
    .local v6, "o1":Lorg/json/JSONObject;
    invoke-static {v6}, Lcom/vkontakte/android/LongPollService;->parseCountersInfo(Lorg/json/JSONObject;)V

    .line 303
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$1;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/LongPollService;->setNumUnread(I)V

    .line 305
    sget v9, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    invoke-static {v9}, Lcom/vkontakte/android/data/Friends;->notifyRequestsChanged(I)V

    .line 306
    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string/jumbo v10, "fo"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 307
    .local v2, "fo":Lorg/json/JSONObject;
    const-string/jumbo v9, "online"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 308
    .local v0, "fdo":Lorg/json/JSONArray;
    const-string/jumbo v9, "online_mobile"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 315
    .local v1, "fmo":Lorg/json/JSONArray;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .local v7, "onlines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 316
    .local v4, "mobileOnlines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v3, v9, :cond_0

    .line 317
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 316
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 319
    :cond_0
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v3, v9, :cond_1

    .line 320
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 319
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 322
    :cond_1
    invoke-static {v7, v4}, Lcom/vkontakte/android/data/Friends;->setOnlines(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 326
    .end local v0    # "fdo":Lorg/json/JSONArray;
    .end local v1    # "fmo":Lorg/json/JSONArray;
    .end local v2    # "fo":Lorg/json/JSONObject;
    .end local v3    # "i":I
    .end local v4    # "mobileOnlines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v5    # "o":Lorg/json/JSONObject;
    .end local v6    # "o1":Lorg/json/JSONObject;
    .end local v7    # "onlines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :goto_2
    return-void

    .line 323
    :catch_0
    move-exception v8

    .line 324
    .local v8, "x":Ljava/lang/Exception;
    const-string/jumbo v9, "vk"

    invoke-static {v9, v8}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method
