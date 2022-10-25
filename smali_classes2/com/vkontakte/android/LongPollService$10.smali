.class Lcom/vkontakte/android/LongPollService$10;
.super Ljava/lang/Object;
.source "LongPollService.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->sendOnline()V
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
    .line 1849
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService$10;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v2, 0x1

    .line 1857
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService$10;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-static {v0, v2}, Lcom/vkontakte/android/LongPollService;->access$802(Lcom/vkontakte/android/LongPollService;Z)Z

    .line 1858
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->cleanGeoDataEvents()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1859
    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->clear(Z)V

    .line 1861
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1849
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LongPollService$10;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "j"    # Lorg/json/JSONObject;

    .prologue
    const/4 v2, 0x0

    .line 1851
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService$10;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-static {v0, v2}, Lcom/vkontakte/android/LongPollService;->access$802(Lcom/vkontakte/android/LongPollService;Z)Z

    .line 1852
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "push_counter"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1853
    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->clear(Z)V

    .line 1854
    return-void
.end method
