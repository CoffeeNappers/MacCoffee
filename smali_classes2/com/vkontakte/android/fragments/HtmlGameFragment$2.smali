.class Lcom/vkontakte/android/fragments/HtmlGameFragment$2;
.super Landroid/webkit/WebChromeClient;
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
    .line 359
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 3
    .param p1, "consoleMessage"    # Landroid/webkit/ConsoleMessage;

    .prologue
    .line 370
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "WebChromeClient"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->lineNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->sourceId()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 371
    invoke-super {p0, p1}, Landroid/webkit/WebChromeClient;->onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z

    move-result v0

    return v0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 363
    const/16 v0, 0x64

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 364
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dataLoaded()V

    .line 366
    :cond_0
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 376
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1200(Lcom/vkontakte/android/fragments/HtmlGameFragment;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 377
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 379
    :cond_0
    return-void
.end method
