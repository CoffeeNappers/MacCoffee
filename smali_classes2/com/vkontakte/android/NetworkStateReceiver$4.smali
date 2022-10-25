.class final Lcom/vkontakte/android/NetworkStateReceiver$4;
.super Ljava/lang/Object;
.source "NetworkStateReceiver.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/NetworkStateReceiver;->getAppNotifications(Landroid/content/Context;)V
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


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 317
    iput-object p1, p0, Lcom/vkontakte/android/NetworkStateReceiver$4;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 346
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 317
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/NetworkStateReceiver$4;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 12
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 319
    iget-object v5, p0, Lcom/vkontakte/android/NetworkStateReceiver$4;->val$context:Landroid/content/Context;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string/jumbo v6, "last_get_notify_app"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    long-to-int v7, v8

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 321
    :try_start_0
    const-string/jumbo v5, "response"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/data/UserNotification;->parse(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v2

    .line 322
    .local v2, "notifications":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/UserNotification;>;"
    if-eqz v2, :cond_2

    .line 323
    const/4 v3, 0x0

    .line 325
    .local v3, "userNotification":Lcom/vkontakte/android/data/UserNotification;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/UserNotification;

    .line 326
    .local v1, "notification":Lcom/vkontakte/android/data/UserNotification;
    const-string/jumbo v6, "alert"

    iget-object v7, v1, Lcom/vkontakte/android/data/UserNotification;->type:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 327
    move-object v3, v1

    goto :goto_0

    .line 331
    .end local v1    # "notification":Lcom/vkontakte/android/data/UserNotification;
    :cond_1
    if-eqz v3, :cond_2

    .line 332
    new-instance v0, Landroid/content/Intent;

    iget-object v5, p0, Lcom/vkontakte/android/NetworkStateReceiver$4;->val$context:Landroid/content/Context;

    const-class v6, Lcom/vkontakte/android/NotificationActivity;

    invoke-direct {v0, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 333
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v5, "user_notification"

    invoke-virtual {v0, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 334
    const/high16 v5, 0x10000000

    invoke-virtual {v0, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 335
    iget-object v5, p0, Lcom/vkontakte/android/NetworkStateReceiver$4;->val$context:Landroid/content/Context;

    invoke-virtual {v5, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v2    # "notifications":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/UserNotification;>;"
    .end local v3    # "userNotification":Lcom/vkontakte/android/data/UserNotification;
    :cond_2
    :goto_1
    return-void

    .line 338
    :catch_0
    move-exception v4

    .line 339
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
