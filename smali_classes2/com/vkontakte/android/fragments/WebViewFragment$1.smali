.class Lcom/vkontakte/android/fragments/WebViewFragment$1;
.super Landroid/webkit/WebViewClient;
.source "WebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/WebViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/WebViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/WebViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/WebViewFragment;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    new-instance v1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-direct {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WebViewFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 153
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    .line 122
    iget-object v3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v3, p2}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$002(Lcom/vkontakte/android/fragments/WebViewFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 123
    iget-object v3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "open_internally"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 124
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 125
    .local v2, "uri":Landroid/net/Uri;
    const-string/jumbo v3, "http"

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "https"

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_0
    const-string/jumbo v3, "play.google.com"

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 126
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 147
    .end local v2    # "uri":Landroid/net/Uri;
    :cond_1
    :goto_0
    return v6

    .line 128
    .restart local v2    # "uri":Landroid/net/Uri;
    :cond_2
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 129
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "play.google.com"

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 130
    const-string/jumbo v3, "com.android.vending"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 133
    :cond_3
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/fragments/WebViewFragment;->startActivity(Landroid/content/Intent;)V

    .line 134
    iget-object v3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v3

    if-nez v3, :cond_1

    .line 135
    iget-object v3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 137
    :catch_0
    move-exception v0

    .line 138
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "VK"

    aput-object v5, v3, v4

    aput-object v0, v3, v6

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0

    .line 143
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "uri":Landroid/net/Uri;
    :cond_4
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 144
    .restart local v1    # "intent":Landroid/content/Intent;
    new-instance v3, Landroid/content/ComponentName;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-class v5, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 145
    const-string/jumbo v3, "no_browser"

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 146
    iget-object v3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    const/16 v4, 0x65

    invoke-virtual {v3, v1, v4}, Lcom/vkontakte/android/fragments/WebViewFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method
