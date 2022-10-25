.class final Lcom/vkontakte/android/utils/LinkUtils$1;
.super Landroid/webkit/WebViewClient;
.source "LinkUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/utils/LinkUtils;->processInternalHiddenLink(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$progress:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/app/ProgressDialog;)V
    .locals 0

    .prologue
    .line 100
    iput-object p1, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0, p1, p2, v1}, Lcom/vkontakte/android/utils/LinkUtils;->access$000(Landroid/content/Context;Landroid/webkit/WebView;Ljava/lang/String;Landroid/app/ProgressDialog;)V

    .line 105
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$ctx:Landroid/content/Context;

    const v1, 0x7f0801f6

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 121
    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 124
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 109
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 110
    .local v0, "uri":Landroid/net/Uri;
    const-string/jumbo v1, "http"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "https"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const-string/jumbo v1, "play.google.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 111
    const/4 v1, 0x0

    .line 115
    :goto_0
    return v1

    .line 113
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/utils/LinkUtils$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v1, p1, p2, v2}, Lcom/vkontakte/android/utils/LinkUtils;->access$000(Landroid/content/Context;Landroid/webkit/WebView;Ljava/lang/String;Landroid/app/ProgressDialog;)V

    .line 115
    const/4 v1, 0x1

    goto :goto_0
.end method
