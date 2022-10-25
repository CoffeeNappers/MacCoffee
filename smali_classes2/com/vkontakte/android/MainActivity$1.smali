.class Lcom/vkontakte/android/MainActivity$1;
.super Landroid/webkit/WebViewClient;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/MainActivity;

.field final synthetic val$webView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/MainActivity;Landroid/webkit/WebView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/MainActivity;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/vkontakte/android/MainActivity$1;->this$0:Lcom/vkontakte/android/MainActivity;

    iput-object p2, p0, Lcom/vkontakte/android/MainActivity$1;->val$webView:Landroid/webkit/WebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 107
    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V

    .line 108
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 101
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/MainActivity$1;->val$webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1, p2}, Lcom/vk/core/network/NetworkProxy;->loadUrl(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 102
    const/4 v0, 0x1

    return v0
.end method
