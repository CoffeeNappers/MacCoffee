.class Lcom/vkontakte/android/ValidationActivity$1;
.super Landroid/webkit/WebViewClient;
.source "ValidationActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ValidationActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ValidationActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ValidationActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ValidationActivity;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 5
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 175
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 176
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 177
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 178
    const-string/jumbo v1, "m.vk.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "/restore"

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "rh"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 179
    iget-object v1, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-static {v1}, Lcom/vkontakte/android/ValidationActivity;->access$200(Lcom/vkontakte/android/ValidationActivity;)Landroid/webkit/WebView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "javascript:document.getElementsByTagName(\'input\')[0].value=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v3}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\';void(0);"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 182
    :cond_0
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 13
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 73
    .local v8, "uri":Landroid/net/Uri;
    invoke-static {v8}, Lcom/vkontakte/android/ValidationActivity;->access$000(Landroid/net/Uri;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 74
    const-string/jumbo v10, "type"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 75
    .local v6, "type":Ljava/lang/String;
    const-string/jumbo v10, "id"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/vkontakte/android/LinkRedirActivity;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 77
    .local v1, "id":I
    new-instance v10, Lcom/vkontakte/android/api/store/GetStockItemByProductId;

    invoke-direct {v10}, Lcom/vkontakte/android/api/store/GetStockItemByProductId;-><init>()V

    .line 78
    invoke-virtual {v10, v1}, Lcom/vkontakte/android/api/store/GetStockItemByProductId;->productId(I)Lcom/vkontakte/android/api/store/GetStockItemByProductId;

    move-result-object v10

    .line 79
    invoke-virtual {v10, v6}, Lcom/vkontakte/android/api/store/GetStockItemByProductId;->type(Ljava/lang/String;)Lcom/vkontakte/android/api/store/GetStockItemByProductId;

    move-result-object v10

    const/4 v11, 0x1

    .line 80
    invoke-virtual {v10, v11}, Lcom/vkontakte/android/api/store/GetStockItemByProductId;->ignoreValidation(Z)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v10

    .line 81
    invoke-virtual {v10}, Lcom/vkontakte/android/api/VKAPIRequest;->toObservable()Lio/reactivex/Observable;

    move-result-object v3

    .line 82
    .local v3, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/vkontakte/android/data/PurchasesManager$Product;>;"
    new-instance v10, Lcom/vkontakte/android/ValidationActivity$1$1;

    invoke-direct {v10, p0}, Lcom/vkontakte/android/ValidationActivity$1$1;-><init>(Lcom/vkontakte/android/ValidationActivity$1;)V

    new-instance v11, Lcom/vkontakte/android/ValidationActivity$1$2;

    invoke-direct {v11, p0}, Lcom/vkontakte/android/ValidationActivity$1$2;-><init>(Lcom/vkontakte/android/ValidationActivity$1;)V

    invoke-virtual {v3, v10, v11}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 108
    const/4 v10, 0x1

    .line 171
    .end local v1    # "id":I
    .end local v3    # "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/vkontakte/android/data/PurchasesManager$Product;>;"
    .end local v6    # "type":Ljava/lang/String;
    :goto_0
    return v10

    .line 109
    :cond_0
    const-string/jumbo v10, "oauth.vk.com"

    invoke-virtual {v8}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c

    const-string/jumbo v10, "/blank.html"

    invoke-virtual {v8}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 110
    const/16 v10, 0x23

    const/16 v11, 0x3f

    invoke-virtual {p2, v10, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 113
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v10}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    const-string/jumbo v11, "return_result"

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 114
    const-string/jumbo v10, "success"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_2

    .line 115
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 116
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v10, "access_token"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_1

    .line 117
    const-string/jumbo v10, "access_token"

    const-string/jumbo v11, "access_token"

    invoke-virtual {v8, v11}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 118
    const-string/jumbo v10, "secret"

    const-string/jumbo v11, "secret"

    invoke-virtual {v8, v11}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 119
    const-string/jumbo v10, "user_id"

    const-string/jumbo v11, "user_id"

    invoke-virtual {v8, v11}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 121
    :cond_1
    const-string/jumbo v10, "auth_state"

    iget-object v11, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v11}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v11

    const-string/jumbo v12, "auth_state"

    invoke-virtual {v11, v12}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v11

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 122
    invoke-virtual {v2, v8}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 123
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    const/4 v11, -0x1

    invoke-virtual {v10, v11, v2}, Lcom/vkontakte/android/ValidationActivity;->setResult(ILandroid/content/Intent;)V

    .line 132
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_1
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v10}, Lcom/vkontakte/android/ValidationActivity;->finish()V

    .line 133
    const/4 v10, 0x1

    goto/16 :goto_0

    .line 124
    :cond_2
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v10}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    const-string/jumbo v11, "require_access_token"

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_3

    const-string/jumbo v10, "access_token"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 125
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 126
    .restart local v2    # "intent":Landroid/content/Intent;
    const-string/jumbo v10, "access_token"

    const-string/jumbo v11, "access_token"

    invoke-virtual {v8, v11}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 127
    invoke-virtual {v2, v8}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 128
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    const/4 v11, -0x1

    invoke-virtual {v10, v11, v2}, Lcom/vkontakte/android/ValidationActivity;->setResult(ILandroid/content/Intent;)V

    goto :goto_1

    .line 130
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_3
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/ValidationActivity;->setResult(I)V

    goto :goto_1

    .line 135
    :cond_4
    const-string/jumbo v10, "fail"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_6

    .line 136
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string/jumbo v12, "Validation fail"

    aput-object v12, v10, v11

    invoke-static {v10}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 137
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->logout()Z

    .line 138
    const/4 v10, 0x1

    sput v10, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 139
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v10}, Lcom/vkontakte/android/ValidationActivity;->finish()V

    .line 171
    :cond_5
    :goto_2
    const/4 v10, 0x1

    goto/16 :goto_0

    .line 140
    :cond_6
    const-string/jumbo v10, "cancel"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_7

    .line 141
    const/4 v10, 0x1

    sput v10, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 142
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v10}, Lcom/vkontakte/android/ValidationActivity;->finish()V

    goto :goto_2

    .line 143
    :cond_7
    const-string/jumbo v10, "success"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_5

    .line 144
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v10}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    const-string/jumbo v11, "device_token"

    invoke-virtual {v10, v11}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 145
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v10}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    const-string/jumbo v11, "device_token"

    invoke-virtual {v10, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "devToken":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    .line 148
    .local v9, "userId":I
    const-string/jumbo v10, "user_id"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_8

    .line 149
    const-string/jumbo v10, "user_id"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 152
    :cond_8
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Lcom/vkontakte/android/ValidationActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "device_token"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 154
    .end local v0    # "devToken":Ljava/lang/String;
    .end local v9    # "userId":I
    :cond_9
    const-string/jumbo v10, "access_token"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_a

    .line 155
    const-string/jumbo v10, "access_token"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 156
    .local v5, "token":Ljava/lang/String;
    const-string/jumbo v10, "secret"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 157
    .local v4, "secret":Ljava/lang/String;
    const-string/jumbo v10, "user_id"

    invoke-virtual {v8, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 158
    .local v7, "uid":I
    invoke-static {v7}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v10

    if-nez v10, :cond_b

    .line 159
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string/jumbo v12, "Current user is not current"

    aput-object v12, v10, v11

    invoke-static {v10}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 160
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->logout()Z

    .line 165
    .end local v4    # "secret":Ljava/lang/String;
    .end local v5    # "token":Ljava/lang/String;
    .end local v7    # "uid":I
    :cond_a
    :goto_3
    const/4 v10, 0x2

    sput v10, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 166
    iget-object v10, p0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v10}, Lcom/vkontakte/android/ValidationActivity;->finish()V

    goto/16 :goto_2

    .line 162
    .restart local v4    # "secret":Ljava/lang/String;
    .restart local v5    # "token":Ljava/lang/String;
    .restart local v7    # "uid":I
    :cond_b
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v10

    invoke-virtual {v10, v5}, Lcom/vkontakte/android/auth/VKAccountEditor;->setAccessToken(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v10

    invoke-virtual {v10, v4}, Lcom/vkontakte/android/auth/VKAccountEditor;->setSecret(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    goto :goto_3

    .line 169
    .end local v4    # "secret":Ljava/lang/String;
    .end local v5    # "token":Ljava/lang/String;
    .end local v7    # "uid":I
    :cond_c
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto/16 :goto_2
.end method
