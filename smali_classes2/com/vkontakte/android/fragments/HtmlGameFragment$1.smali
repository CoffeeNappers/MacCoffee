.class Lcom/vkontakte/android/fragments/HtmlGameFragment$1;
.super Landroid/webkit/WebViewClient;
.source "HtmlGameFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 339
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$1;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

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
    .line 355
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$1;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    new-instance v1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-direct {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 356
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 342
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 343
    .local v1, "uri":Landroid/net/Uri;
    const-string/jumbo v2, "vk"

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 344
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 345
    .local v0, "intent":Landroid/content/Intent;
    new-instance v2, Landroid/content/ComponentName;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$1;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 346
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$1;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->startActivity(Landroid/content/Intent;)V

    .line 347
    const/4 v2, 0x1

    .line 350
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
