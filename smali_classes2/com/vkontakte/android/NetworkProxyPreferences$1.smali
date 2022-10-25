.class Lcom/vkontakte/android/NetworkProxyPreferences$1;
.super Ljava/lang/Object;
.source "NetworkProxyPreferences.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/NetworkProxyPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/NetworkProxyPreferences;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/NetworkProxyPreferences;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/NetworkProxyPreferences;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$1;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;)V
    .locals 5
    .param p1, "result"    # Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$1;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/NetworkProxyPreferences;->access$002(Lcom/vkontakte/android/NetworkProxyPreferences;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 57
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-class v3, Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "response="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->type:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 58
    iget v1, p1, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->type:I

    packed-switch v1, :pswitch_data_0

    .line 87
    :goto_0
    return-void

    .line 60
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$1;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-virtual {v1}, Lcom/vkontakte/android/NetworkProxyPreferences;->onProxyDisabled()V

    goto :goto_0

    .line 63
    :pswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$1;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-virtual {v1}, Lcom/vkontakte/android/NetworkProxyPreferences;->onProxyEnabled()V

    goto :goto_0

    .line 67
    :pswitch_2
    iget v1, p1, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->type:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 68
    iget-object v1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$1;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-virtual {v1}, Lcom/vkontakte/android/NetworkProxyPreferences;->onProxyDisabled()V

    .line 71
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    .line 72
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_1

    .line 73
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 75
    :cond_1
    new-instance v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;-><init>()V

    const v2, 0x7f02012c

    .line 76
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->setIcon(I)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->title:Ljava/lang/String;

    .line 77
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->message:Ljava/lang/String;

    .line 78
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->setMessage(Ljava/lang/String;)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->button:Ljava/lang/String;

    .line 79
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->setPositiveButtonTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->url:Ljava/lang/String;

    .line 80
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->setUrl(Ljava/lang/String;)Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/fragments/VKAlertBannerFragment;

    .line 81
    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->show(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_0

    .line 58
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 53
    check-cast p1, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/NetworkProxyPreferences$1;->accept(Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;)V

    return-void
.end method
