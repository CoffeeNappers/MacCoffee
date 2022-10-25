.class final Lcom/vkontakte/android/data/Games$3;
.super Ljava/lang/Object;
.source "Games.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Games;->openHtml5Game(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
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
.field final synthetic val$app:Lcom/vkontakte/android/data/ApiApplication;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$cs:Ljava/lang/String;

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$vs:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Bundle;Lcom/vkontakte/android/data/ApiApplication;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 145
    iput-object p1, p0, Lcom/vkontakte/android/data/Games$3;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/vkontakte/android/data/Games$3;->val$extras:Landroid/os/Bundle;

    iput-object p3, p0, Lcom/vkontakte/android/data/Games$3;->val$app:Lcom/vkontakte/android/data/ApiApplication;

    iput-object p4, p0, Lcom/vkontakte/android/data/Games$3;->val$vs:Ljava/lang/String;

    iput-object p5, p0, Lcom/vkontakte/android/data/Games$3;->val$cs:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v2, 0x0

    .line 161
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v0

    const/16 v1, 0xf

    if-ne v0, v1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/data/Games$3;->val$context:Landroid/content/Context;

    const v1, 0x7f0801f3

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 167
    :goto_0
    return-void

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/Games$3;->val$context:Landroid/content/Context;

    const v1, 0x7f0801f9

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 145
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Games$3;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "result"    # Lorg/json/JSONObject;

    .prologue
    .line 149
    :try_start_0
    const-string/jumbo v0, "response"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 150
    .local v10, "response":Lorg/json/JSONObject;
    const-string/jumbo v0, "screen_title"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 151
    .local v4, "title":Ljava/lang/String;
    const-string/jumbo v0, "original_url"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 152
    .local v3, "origUrl":Ljava/lang/String;
    const-string/jumbo v0, "view_url"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "viewUrl":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/data/Games$3;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/data/Games$3;->val$extras:Landroid/os/Bundle;

    iget-object v5, p0, Lcom/vkontakte/android/data/Games$3;->val$app:Lcom/vkontakte/android/data/ApiApplication;

    iget v5, v5, Lcom/vkontakte/android/data/ApiApplication;->id:I

    iget-object v6, p0, Lcom/vkontakte/android/data/Games$3;->val$app:Lcom/vkontakte/android/data/ApiApplication;

    iget v6, v6, Lcom/vkontakte/android/data/ApiApplication;->screenOrientation:I

    iget-object v7, p0, Lcom/vkontakte/android/data/Games$3;->val$vs:Ljava/lang/String;

    iget-object v8, p0, Lcom/vkontakte/android/data/Games$3;->val$cs:Ljava/lang/String;

    invoke-static/range {v0 .. v8}, Lcom/vkontakte/android/data/Games;->openHtml5Game(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    .end local v2    # "viewUrl":Ljava/lang/String;
    .end local v3    # "origUrl":Ljava/lang/String;
    .end local v4    # "title":Ljava/lang/String;
    .end local v10    # "response":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v9

    .line 155
    .local v9, "e":Lorg/json/JSONException;
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v5, "vk"

    aput-object v5, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v5, "get embedded url failure"

    aput-object v5, v0, v1

    const/4 v1, 0x2

    aput-object v9, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method
