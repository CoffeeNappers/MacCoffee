.class Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$1;
.super Landroid/webkit/WebViewClient;
.source "MoneyWebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

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
    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    new-instance v1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-direct {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 128
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 111
    .local v0, "uri":Landroid/net/Uri;
    const-string/jumbo v1, "oauth.vk.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "/blank.html"

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    const/16 v1, 0x23

    const/16 v2, 0x3f

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 114
    const-string/jumbo v1, "success"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->access$000(Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;)V

    .line 118
    const/4 v1, 0x1

    .line 122
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
