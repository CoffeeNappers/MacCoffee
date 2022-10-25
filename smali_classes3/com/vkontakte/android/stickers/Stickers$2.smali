.class Lcom/vkontakte/android/stickers/Stickers$2;
.super Ljava/lang/Object;
.source "Stickers.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/Stickers;->reloadAutoSuggestDictionaryIfNeeded(Z)V
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
.field final synthetic this$0:Lcom/vkontakte/android/stickers/Stickers;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/Stickers;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/vkontakte/android/stickers/Stickers$2;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 248
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 229
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/stickers/Stickers$2;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "result"    # Lorg/json/JSONObject;

    .prologue
    .line 232
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers$2;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/Stickers;->access$000(Lcom/vkontakte/android/stickers/Stickers;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 234
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers$2;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/Stickers;->access$500(Lcom/vkontakte/android/stickers/Stickers;)Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;->initializeWithJsonAndSave(Lorg/json/JSONObject;)V

    .line 236
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers$2;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/Stickers;->access$300(Lcom/vkontakte/android/stickers/Stickers;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 237
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v2, "auto_suggest_last_loaded"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 238
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :goto_0
    :try_start_1
    monitor-exit v3

    .line 244
    return-void

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, "e":Ljava/lang/Throwable;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 243
    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method
