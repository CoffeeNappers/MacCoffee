.class final Lcom/vkontakte/android/LongPollService$6;
.super Ljava/lang/Object;
.source "LongPollService.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->updateCounters()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
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


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 735
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 772
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 735
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LongPollService$6;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 738
    :try_start_0
    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 739
    .local v2, "r":Lorg/json/JSONObject;
    if-nez v2, :cond_0

    .line 740
    new-instance v2, Lorg/json/JSONObject;

    .end local v2    # "r":Lorg/json/JSONObject;
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 742
    .restart local v2    # "r":Lorg/json/JSONObject;
    :cond_0
    const-string/jumbo v4, "friends_suggestions"

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    sput v4, Lcom/vkontakte/android/LongPollService;->numFriendSuggestions:I

    .line 743
    const-string/jumbo v4, "friends"

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    .line 744
    .local v1, "numReqs":I
    sget v4, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    if-eq v1, v4, :cond_1

    .line 745
    sput v1, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    .line 746
    sget v4, Lcom/vkontakte/android/LongPollService;->numFriendRequests:I

    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->notifyRequestsChanged(I)V

    .line 748
    :cond_1
    const-string/jumbo v4, "notifications"

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    sput v4, Lcom/vkontakte/android/LongPollService;->numNotifications:I

    .line 749
    const-string/jumbo v4, "groups"

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    sput v4, Lcom/vkontakte/android/LongPollService;->numGroupInvitations:I

    .line 750
    const-string/jumbo v4, "messages"

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    .line 751
    .local v0, "numMsgs":I
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v4

    if-eq v0, v4, :cond_2

    .line 752
    const/4 v4, 0x1

    sput-boolean v4, Lcom/vkontakte/android/LongPollService;->needReloadDialogs:Z

    .line 753
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "com.vkontakte.android.REFRESH_DIALOGS"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 754
    invoke-static {v0}, Lcom/vkontakte/android/LongPollService;->setNumNewMessages(I)V

    .line 758
    :cond_2
    invoke-static {v2}, Lcom/vkontakte/android/LongPollService;->parseCountersInfo(Lorg/json/JSONObject;)V

    .line 759
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->notifyCountersChanged()V

    .line 761
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v4

    const-string/jumbo v5, "intro"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/auth/VKAccountEditor;->setIntro(I)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    .line 762
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "com.vkontakte.android.COUNTERS_UPDATED"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 767
    .end local v0    # "numMsgs":I
    .end local v1    # "numReqs":I
    .end local v2    # "r":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 764
    :catch_0
    move-exception v3

    .line 765
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
