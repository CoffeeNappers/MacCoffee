.class final Lcom/vkontakte/android/LongPollService$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "LongPollService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->syncStateWithServer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 651
    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 651
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LongPollService$4;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const/4 v6, 0x0

    .line 654
    :try_start_0
    const-string/jumbo v5, "response"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v7, "conversations"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v7, "items"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 655
    .local v0, "array":Lorg/json/JSONArray;
    new-instance v4, Ljava/util/ArrayList;

    if-nez v0, :cond_0

    move v5, v6

    :goto_0
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 656
    .local v4, "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/orm/ConversationInfo;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 657
    new-instance v3, Lcom/vkontakte/android/data/orm/ConversationInfo;

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/vkontakte/android/data/orm/ConversationInfo;-><init>(Lorg/json/JSONObject;)V

    .line 658
    .local v3, "info":Lcom/vkontakte/android/data/orm/ConversationInfo;
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 656
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 655
    .end local v2    # "i":I
    .end local v3    # "info":Lcom/vkontakte/android/data/orm/ConversationInfo;
    .end local v4    # "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/orm/ConversationInfo;>;"
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    goto :goto_0

    .line 660
    .restart local v2    # "i":I
    .restart local v4    # "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/orm/ConversationInfo;>;"
    :cond_1
    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v5, v4}, Lcom/vkontakte/android/NotificationUtils;->syncNotificationSettings(Landroid/content/Context;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 664
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v4    # "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/orm/ConversationInfo;>;"
    :goto_2
    return-void

    .line 661
    :catch_0
    move-exception v1

    .line 662
    .local v1, "e":Ljava/lang/Exception;
    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v1, v5}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2
.end method
