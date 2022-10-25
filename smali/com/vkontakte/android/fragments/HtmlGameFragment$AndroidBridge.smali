.class Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AndroidBridge"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 167
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->getUriQueryParamsAsDict(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method private getUriQueryParamsAsDict(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 6
    .param p1, "arguments"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 324
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 326
    .local v2, "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "vk://method/?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 328
    .local v3, "uri":Landroid/net/Uri;
    invoke-virtual {v3}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 330
    .local v0, "paramName":Ljava/lang/String;
    invoke-virtual {v3, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 331
    .local v1, "paramValue":Ljava/lang/String;
    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 334
    .end local v0    # "paramName":Ljava/lang/String;
    .end local v1    # "paramValue":Ljava/lang/String;
    :cond_0
    return-object v2
.end method


# virtual methods
.method public apiCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "arguments"    # Ljava/lang/String;
    .param p3, "callbackId"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 269
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1000(Lcom/vkontakte/android/fragments/HtmlGameFragment;)Landroid/webkit/WebView;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->post(Ljava/lang/Runnable;)Z

    .line 320
    return-void
.end method

.method public callMethod(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "queryParams"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1000(Lcom/vkontakte/android/fragments/HtmlGameFragment;)Landroid/webkit/WebView;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->post(Ljava/lang/Runnable;)Z

    .line 265
    return-void
.end method
