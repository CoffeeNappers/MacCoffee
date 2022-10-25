.class public Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "MoneyWebViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# static fields
.field private static final REQUEST_CODE:Ljava/lang/String; = "request_code"

.field public static final REQUEST_TYPE_ACCEPT_TRANSFER:I = 0x2

.field public static final REQUEST_TYPE_NEW_TRANSFER:I = 0x1

.field public static final REQUEST_TYPE_SHOW_TERMS:I = 0x3

.field private static final TRANSFER_ID_ARG:Ljava/lang/String; = "transfer_id"

.field public static final URL_ARGUMENT:Ljava/lang/String; = "url_to_load"


# instance fields
.field private mChromeClient:Landroid/webkit/WebChromeClient;

.field private mClient:Landroid/webkit/WebViewClient;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 106
    new-instance v0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$1;-><init>(Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mClient:Landroid/webkit/WebViewClient;

    .line 152
    new-instance v0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$2;-><init>(Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mChromeClient:Landroid/webkit/WebChromeClient;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->handleSuccess()V

    return-void
.end method

.method private handleSuccess()V
    .locals 5

    .prologue
    .line 132
    const/4 v0, 0x0

    .line 133
    .local v0, "broadcastIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "request_code"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 142
    :goto_0
    if-eqz v0, :cond_0

    .line 143
    const-string/jumbo v2, "transfer_id"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "transfer_id"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 144
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v2, v0, v3}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 147
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 148
    .local v1, "result":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 149
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 150
    return-void

    .line 135
    .end local v1    # "result":Landroid/content/Intent;
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    .end local v0    # "broadcastIntent":Landroid/content/Intent;
    const-string/jumbo v2, "com.vkontakte.android.ACTION_MONEY_TRANSFER_SENT"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 136
    .restart local v0    # "broadcastIntent":Landroid/content/Intent;
    goto :goto_0

    .line 138
    :pswitch_1
    new-instance v0, Landroid/content/Intent;

    .end local v0    # "broadcastIntent":Landroid/content/Intent;
    const-string/jumbo v2, "com.vkontakte.android.ACTION_MONEY_TRANSFER_ACCEPTED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .restart local v0    # "broadcastIntent":Landroid/content/Intent;
    goto :goto_0

    .line 133
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static showTerms(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 65
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 66
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "url_to_load"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string/jumbo v1, "request_code"

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 68
    const-string/jumbo v1, "transfer_id"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 69
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 75
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 76
    return-void
.end method

.method public static start(Landroid/app/Activity;Ljava/lang/String;II)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "transferId"    # I
    .param p3, "requestCode"    # I

    .prologue
    .line 93
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 94
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "url_to_load"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    const-string/jumbo v1, "request_code"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 96
    const-string/jumbo v1, "transfer_id"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 97
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 103
    invoke-virtual {v1, p0, p3}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Activity;I)Z

    .line 104
    return-void
.end method

.method public static start(Landroid/app/Fragment;Ljava/lang/String;II)V
    .locals 3
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "transferId"    # I
    .param p3, "requestCode"    # I

    .prologue
    .line 79
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 80
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "url_to_load"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const-string/jumbo v1, "request_code"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 82
    const-string/jumbo v1, "transfer_id"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 83
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 89
    invoke-virtual {v1, p0, p3}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 90
    return-void
.end method


# virtual methods
.method public doLoadData()V
    .locals 3

    .prologue
    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "url_to_load"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 214
    return-void
.end method

.method synthetic lambda$onViewCreated$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 178
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 226
    const/4 v0, 0x1

    .line 228
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 206
    new-instance v0, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 207
    .local v0, "wv":Landroid/webkit/WebView;
    const v1, 0x7f10008f

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setId(I)V

    .line 208
    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 195
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroyView()V

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 201
    iput-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    .line 202
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 220
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x1

    .line 165
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 166
    const v0, 0x7f10008f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mClient:Landroid/webkit/WebViewClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 171
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 172
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1, v2}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 177
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f0202c5

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 178
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "request_code"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 182
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08036d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 188
    :goto_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->loaded:Z

    if-nez v0, :cond_1

    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->loadData()V

    .line 191
    :cond_1
    return-void

    .line 185
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f080379

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setTitle(I)V

    goto :goto_0
.end method
