.class public Lcom/vk/webapp/VKUIWebContainerFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "VKUIWebContainerFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/webapp/VKUIWebContainerFragment$AndroidBridge;,
        Lcom/vk/webapp/VKUIWebContainerFragment$Builder;
    }
.end annotation


# static fields
.field private static final BRIDGE_NAME:Ljava/lang/String; = "AndroidBridge"

.field private static final CACHE_PATH:Ljava/io/File;

.field private static final DEFAULT_SPA_URI:Ljava/lang/String; = "vk.com/spa"

.field private static final TAG:Ljava/lang/String; = "VKUIWebContainerFragment"


# instance fields
.field private isInErrorState:Z

.field private uriToLoad:Ljava/lang/String;

.field private final webChromeClient:Landroid/webkit/WebChromeClient;

.field private webView:Landroid/webkit/WebView;

.field private final webViewClient:Landroid/webkit/WebViewClient;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 57
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string/jumbo v2, ".vkontakte/cache/html"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/webapp/VKUIWebContainerFragment;->CACHE_PATH:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 110
    new-instance v0, Lcom/vk/webapp/VKUIWebContainerFragment$1;

    invoke-direct {v0, p0}, Lcom/vk/webapp/VKUIWebContainerFragment$1;-><init>(Lcom/vk/webapp/VKUIWebContainerFragment;)V

    iput-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webViewClient:Landroid/webkit/WebViewClient;

    .line 153
    new-instance v0, Lcom/vk/webapp/VKUIWebContainerFragment$2;

    invoke-direct {v0, p0}, Lcom/vk/webapp/VKUIWebContainerFragment$2;-><init>(Lcom/vk/webapp/VKUIWebContainerFragment;)V

    iput-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webChromeClient:Landroid/webkit/WebChromeClient;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/webapp/VKUIWebContainerFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/webapp/VKUIWebContainerFragment;

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->isInErrorState:Z

    return v0
.end method

.method static synthetic access$002(Lcom/vk/webapp/VKUIWebContainerFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/webapp/VKUIWebContainerFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->isInErrorState:Z

    return p1
.end method

.method static synthetic access$100(Lcom/vk/webapp/VKUIWebContainerFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/webapp/VKUIWebContainerFragment;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/vk/webapp/VKUIWebContainerFragment;->handleLoaded()V

    return-void
.end method

.method private configureWebView()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 214
    iget-object v1, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 216
    .local v0, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 217
    sget-object v1, Lcom/vk/webapp/VKUIWebContainerFragment;->CACHE_PATH:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 219
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 221
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 223
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 225
    iget-object v1, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webViewClient:Landroid/webkit/WebViewClient;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 226
    iget-object v1, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 228
    iget-object v1, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    new-instance v2, Lcom/vk/webapp/VKUIWebContainerFragment$AndroidBridge;

    invoke-direct {v2, p0}, Lcom/vk/webapp/VKUIWebContainerFragment$AndroidBridge;-><init>(Lcom/vk/webapp/VKUIWebContainerFragment;)V

    const-string/jumbo v3, "AndroidBridge"

    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 229
    return-void
.end method

.method public static getSPAUri()Ljava/lang/String;
    .locals 5

    .prologue
    .line 51
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 52
    .local v0, "prefs":Landroid/content/SharedPreferences;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "https://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "spaUri"

    const-string/jumbo v4, "vk.com/spa"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 54
    .local v1, "spaUri":Ljava/lang/String;
    return-object v1
.end method

.method private handleLoaded()V
    .locals 0

    .prologue
    .line 239
    invoke-virtual {p0}, Lcom/vk/webapp/VKUIWebContainerFragment;->dataLoaded()V

    .line 240
    return-void
.end method


# virtual methods
.method protected doLoadData()V
    .locals 2

    .prologue
    .line 233
    const-string/jumbo v0, "VKUIWebContainerFragment"

    const-string/jumbo v1, "doLoadData"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->isInErrorState:Z

    .line 235
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->uriToLoad:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 236
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 251
    const/4 v0, 0x1

    .line 253
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 170
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 171
    invoke-virtual {p0}, Lcom/vk/webapp/VKUIWebContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_url"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->uriToLoad:Ljava/lang/String;

    .line 172
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 195
    new-instance v0, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vk/webapp/VKUIWebContainerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    .line 196
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    const v1, 0x7f10008f

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setId(I)V

    .line 197
    invoke-direct {p0}, Lcom/vk/webapp/VKUIWebContainerFragment;->configureWebView()V

    .line 198
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 188
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroyView()V

    .line 189
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 190
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    .line 191
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 176
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onPause()V

    .line 177
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 178
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 245
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 182
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onResume()V

    .line 183
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    .line 184
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 203
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 205
    iget-boolean v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 206
    invoke-virtual {p0}, Lcom/vk/webapp/VKUIWebContainerFragment;->loadData()V

    .line 210
    :cond_0
    invoke-virtual {p0}, Lcom/vk/webapp/VKUIWebContainerFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 211
    return-void
.end method
