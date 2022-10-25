.class Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->apiCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

.field final synthetic val$arguments:Ljava/lang/String;

.field final synthetic val$callbackId:Ljava/lang/String;

.field final synthetic val$methodName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    .prologue
    .line 269
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$methodName:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$arguments:Ljava/lang/String;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$callbackId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 272
    invoke-static {}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$000()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Method name = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$methodName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", arguments = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$arguments:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", callbackId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->tryParseLong(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 276
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unexpected format of callbackId. Callback Id should be integer: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 318
    :goto_0
    return-void

    .line 280
    :cond_0
    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$methodName:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 282
    .local v2, "request":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-boolean v6, v2, Lcom/vkontakte/android/api/VKAPIRequest;->handleAuthErrorsManually:Z

    .line 283
    iput-boolean v6, v2, Lcom/vkontakte/android/api/VKAPIRequest;->unreliable3rdPartyRequest:Z

    .line 285
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$arguments:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->access$100(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    .line 287
    .local v1, "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$arguments:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->access$100(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 288
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1

    .line 291
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    new-instance v3, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2$1;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .line 317
    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method
