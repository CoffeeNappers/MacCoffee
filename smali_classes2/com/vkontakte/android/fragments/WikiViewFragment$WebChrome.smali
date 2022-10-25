.class Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;
.super Landroid/webkit/WebChromeClient;
.source "WikiViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/WikiViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebChrome"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment;)V
    .locals 0

    .prologue
    .line 307
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment;Lcom/vkontakte/android/fragments/WikiViewFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/WikiViewFragment$1;

    .prologue
    .line 307
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment;)V

    return-void
.end method


# virtual methods
.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "result"    # Landroid/webkit/JsResult;

    .prologue
    .line 321
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ALERT -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    const/4 v0, 0x1

    return v0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 309
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$1000(Lcom/vkontakte/android/fragments/WikiViewFragment;)Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    move-result-object v0

    mul-int/lit8 v1, p2, 0x64

    invoke-virtual {v0, v1}, Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;->setProgress(I)V

    .line 310
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$1000(Lcom/vkontakte/android/fragments/WikiViewFragment;)Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    move-result-object v1

    const/16 v0, 0x64

    if-ne p2, v0, :cond_2

    const/16 v0, 0x8

    :goto_0
    invoke-static {v1, v0}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 311
    if-lez p2, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/WikiViewFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 312
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->dataLoaded()V

    .line 314
    :cond_0
    const/16 v0, 0x32

    if-lt p2, v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$1100(Lcom/vkontakte/android/fragments/WikiViewFragment;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$900(Lcom/vkontakte/android/fragments/WikiViewFragment;)V

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$1102(Lcom/vkontakte/android/fragments/WikiViewFragment;Z)Z

    .line 318
    :cond_1
    return-void

    .line 310
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
