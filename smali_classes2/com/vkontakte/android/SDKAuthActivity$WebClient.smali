.class Lcom/vkontakte/android/SDKAuthActivity$WebClient;
.super Landroid/webkit/WebViewClient;
.source "SDKAuthActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SDKAuthActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/SDKAuthActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/SDKAuthActivity;)V
    .locals 0

    .prologue
    .line 166
    iput-object p1, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/SDKAuthActivity;Lcom/vkontakte/android/SDKAuthActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/SDKAuthActivity;
    .param p2, "x1"    # Lcom/vkontakte/android/SDKAuthActivity$1;

    .prologue
    .line 166
    invoke-direct {p0, p1}, Lcom/vkontakte/android/SDKAuthActivity$WebClient;-><init>(Lcom/vkontakte/android/SDKAuthActivity;)V

    return-void
.end method


# virtual methods
.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errCode"    # I
    .param p3, "descr"    # Ljava/lang/String;
    .param p4, "url"    # Ljava/lang/String;

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-static {v0}, Lcom/vkontakte/android/SDKAuthActivity;->access$300(Lcom/vkontakte/android/SDKAuthActivity;)Lcom/vkontakte/android/ui/ErrorView;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Lcom/vkontakte/android/ui/ErrorView;->setErrorInfo(ILjava/lang/String;)V

    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-static {v0}, Lcom/vkontakte/android/SDKAuthActivity;->access$300(Lcom/vkontakte/android/SDKAuthActivity;)Lcom/vkontakte/android/ui/ErrorView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ErrorView;->setVisibility(I)V

    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-static {v0}, Lcom/vkontakte/android/SDKAuthActivity;->access$400(Lcom/vkontakte/android/SDKAuthActivity;)Landroid/webkit/WebView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 228
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 11
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 169
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 170
    .local v6, "uri":Landroid/net/Uri;
    const-string/jumbo v7, "oauth.vk.com"

    invoke-virtual {v6}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const-string/jumbo v7, "/blank.html"

    invoke-virtual {v6}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 171
    const/16 v7, 0x23

    const/16 v8, 0x3f

    invoke-virtual {p2, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 174
    const-string/jumbo v7, "error"

    invoke-virtual {v6, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 176
    const-string/jumbo v7, "vk_sdk_auth"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Auth not successful [fail]: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 179
    .local v2, "result":Landroid/content/Intent;
    const-string/jumbo v7, "error"

    const-string/jumbo v8, "error"

    invoke-virtual {v6, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 180
    const-string/jumbo v7, "error_reason"

    const-string/jumbo v8, "error_reason"

    invoke-virtual {v6, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    const-string/jumbo v7, "error_description"

    const-string/jumbo v8, "error_description"

    invoke-virtual {v6, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    iget-object v7, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-virtual {v7, v10, v2}, Lcom/vkontakte/android/SDKAuthActivity;->setResult(ILandroid/content/Intent;)V

    .line 183
    iget-object v7, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-virtual {v7}, Lcom/vkontakte/android/SDKAuthActivity;->finish()V

    .line 217
    .end local v2    # "result":Landroid/content/Intent;
    :goto_0
    const/4 v7, 0x1

    return v7

    .line 184
    :cond_0
    const-string/jumbo v7, "access_token"

    invoke-virtual {v6, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 185
    const-string/jumbo v7, "access_token"

    invoke-virtual {v6, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 186
    .local v4, "token":Ljava/lang/String;
    const-string/jumbo v7, "secret"

    invoke-virtual {v6, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 187
    .local v3, "secret":Ljava/lang/String;
    const-string/jumbo v7, "expires_in"

    invoke-virtual {v6, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "expiresIn":Ljava/lang/String;
    const-string/jumbo v7, "email"

    invoke-virtual {v6, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "email":Ljava/lang/String;
    const-string/jumbo v7, "user_id"

    invoke-virtual {v6, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 190
    .local v5, "uid":I
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 191
    .restart local v2    # "result":Landroid/content/Intent;
    const-string/jumbo v7, "access_token"

    invoke-virtual {v2, v7, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 192
    if-eqz v3, :cond_1

    .line 193
    const-string/jumbo v7, "secret"

    invoke-virtual {v2, v7, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 195
    :cond_1
    if-eqz v0, :cond_2

    .line 196
    const-string/jumbo v7, "email"

    invoke-virtual {v2, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 198
    :cond_2
    const-string/jumbo v7, "user_id"

    invoke-virtual {v2, v7, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 199
    const-string/jumbo v7, "https_required"

    const-string/jumbo v8, "1"

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 201
    if-eqz v1, :cond_3

    .line 202
    :try_start_0
    const-string/jumbo v7, "expires_in"

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    :cond_3
    :goto_1
    const-string/jumbo v7, "vk_sdk_auth"

    const-string/jumbo v8, "Auth ok"

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    iget-object v7, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    const/4 v8, -0x1

    invoke-virtual {v7, v8, v2}, Lcom/vkontakte/android/SDKAuthActivity;->setResult(ILandroid/content/Intent;)V

    .line 208
    iget-object v7, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-virtual {v7}, Lcom/vkontakte/android/SDKAuthActivity;->finish()V

    goto :goto_0

    .line 210
    .end local v0    # "email":Ljava/lang/String;
    .end local v1    # "expiresIn":Ljava/lang/String;
    .end local v2    # "result":Landroid/content/Intent;
    .end local v3    # "secret":Ljava/lang/String;
    .end local v4    # "token":Ljava/lang/String;
    .end local v5    # "uid":I
    :cond_4
    const-string/jumbo v7, "vk_sdk_auth"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Auth not successful [unknown]: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    iget-object v7, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/SDKAuthActivity;->setResult(I)V

    .line 212
    iget-object v7, p0, Lcom/vkontakte/android/SDKAuthActivity$WebClient;->this$0:Lcom/vkontakte/android/SDKAuthActivity;

    invoke-virtual {v7}, Lcom/vkontakte/android/SDKAuthActivity;->finish()V

    goto/16 :goto_0

    .line 215
    :cond_5
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 204
    .restart local v0    # "email":Ljava/lang/String;
    .restart local v1    # "expiresIn":Ljava/lang/String;
    .restart local v2    # "result":Landroid/content/Intent;
    .restart local v3    # "secret":Ljava/lang/String;
    .restart local v4    # "token":Ljava/lang/String;
    .restart local v5    # "uid":I
    :catch_0
    move-exception v7

    goto :goto_1
.end method
