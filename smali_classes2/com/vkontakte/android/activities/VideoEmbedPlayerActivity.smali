.class public Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "VideoEmbedPlayerActivity.java"


# instance fields
.field canShowProgress:Z

.field content:Landroid/widget/FrameLayout;

.field file:Lcom/vkontakte/android/api/VideoFile;

.field post:Lcom/vkontakte/android/NewsEntry;

.field progress:Lcom/vkontakte/android/ui/CircularProgressBar;

.field referrer:Ljava/lang/String;

.field webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->canShowProgress:Z

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 46
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->convertToPost()Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->post:Lcom/vkontakte/android/NewsEntry;

    .line 50
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "referrer"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->referrer:Ljava/lang/String;

    .line 52
    const v0, 0x7f030096

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->setContentView(I)V

    .line 54
    const v0, 0x7f100201

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    .line 55
    const v0, 0x7f100184

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/CircularProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->progress:Lcom/vkontakte/android/ui/CircularProgressBar;

    .line 56
    const v0, 0x7f10028e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->content:Landroid/widget/FrameLayout;

    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/webkit/WebView;->setPadding(IIII)V

    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->urlEmbed:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 65
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->startLoading()V

    .line 76
    :goto_0
    return-void

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->progress:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/CircularProgressBar;->setVisibility(I)V

    .line 68
    new-instance v0, Lcom/vkontakte/android/api/video/VideoGetById;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/video/VideoGetById;-><init>(IILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$1;-><init>(Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 74
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 98
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 100
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    .line 101
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 80
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onPause()V

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 82
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 86
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    .line 94
    return-void
.end method

.method startLoading()V
    .locals 9

    .prologue
    .line 104
    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v6, v6, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v6, v6, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    const-string/jumbo v7, ".mp4"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v5, v6, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    .line 105
    .local v5, "url":Ljava/lang/String;
    :goto_0
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 106
    .local v4, "uri":Landroid/net/Uri;
    invoke-virtual {v4}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "\\."

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 107
    .local v2, "domainParts":[Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    array-length v7, v2

    add-int/lit8 v7, v7, -0x2

    aget-object v7, v2, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    aget-object v7, v2, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "baseDomain":Ljava/lang/String;
    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    new-instance v7, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$2;

    invoke-direct {v7, p0, v0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$2;-><init>(Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 131
    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    new-instance v7, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;-><init>(Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;)V

    invoke-virtual {v6, v7}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 182
    const-string/jumbo v6, ".mp4"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 183
    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v6, v6, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string/jumbo v3, "http://vk.com/images/blank.gif"

    .line 185
    .local v3, "poster":Ljava/lang/String;
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "<!DOCTYPE html><html><body leftmargin=\"0\" topmargin=\"0\" rightmargin=\"0\" bottommargin=\"0\" style=\'margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;\'><div style=\'height:100vh; margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;\'><video width=\'100%\' height=\'100%\' controls preload=\'metadata\' poster=\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\'><source src=\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\' type=\"video/mp4\" /></video></div></body></html>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 186
    .local v1, "code":Ljava/lang/String;
    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    const-string/jumbo v7, "text/html"

    const-string/jumbo v8, "utf-8"

    invoke-virtual {v6, v1, v7, v8}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .end local v1    # "code":Ljava/lang/String;
    .end local v3    # "poster":Ljava/lang/String;
    :goto_2
    return-void

    .line 104
    .end local v0    # "baseDomain":Ljava/lang/String;
    .end local v2    # "domainParts":[Ljava/lang/String;
    .end local v4    # "uri":Landroid/net/Uri;
    .end local v5    # "url":Ljava/lang/String;
    :cond_0
    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v5, v6, Lcom/vkontakte/android/api/VideoFile;->urlEmbed:Ljava/lang/String;

    goto/16 :goto_0

    .line 183
    .restart local v0    # "baseDomain":Ljava/lang/String;
    .restart local v2    # "domainParts":[Ljava/lang/String;
    .restart local v4    # "uri":Landroid/net/Uri;
    .restart local v5    # "url":Ljava/lang/String;
    :cond_1
    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v6, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    goto :goto_1

    .line 188
    :cond_2
    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_2
.end method
