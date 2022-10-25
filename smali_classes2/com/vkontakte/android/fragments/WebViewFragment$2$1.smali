.class Lcom/vkontakte/android/fragments/WebViewFragment$2$1;
.super Landroid/webkit/WebViewClient;
.source "WebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/WebViewFragment$2;->onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/WebViewFragment$2;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/WebViewFragment$2;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/WebViewFragment$2;

    .prologue
    .line 183
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2$1;->this$1:Lcom/vkontakte/android/fragments/WebViewFragment$2;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 186
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2$1;->this$1:Lcom/vkontakte/android/fragments/WebViewFragment$2;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 187
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 188
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2$1;->this$1:Lcom/vkontakte/android/fragments/WebViewFragment$2;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->startActivity(Landroid/content/Intent;)V

    .line 189
    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V

    .line 190
    const/4 v1, 0x1

    return v1
.end method
