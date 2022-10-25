.class Lcom/vk/webapp/VKUIWebContainerFragment$1$1;
.super Lme/grishka/appkit/api/ErrorResponse;
.source "VKUIWebContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/webapp/VKUIWebContainerFragment$1;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/webapp/VKUIWebContainerFragment$1;


# direct methods
.method constructor <init>(Lcom/vk/webapp/VKUIWebContainerFragment$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/webapp/VKUIWebContainerFragment$1;

    .prologue
    .line 131
    iput-object p1, p0, Lcom/vk/webapp/VKUIWebContainerFragment$1$1;->this$1:Lcom/vk/webapp/VKUIWebContainerFragment$1;

    invoke-direct {p0}, Lme/grishka/appkit/api/ErrorResponse;-><init>()V

    return-void
.end method


# virtual methods
.method public bindErrorView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 134
    new-instance v0, Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/ErrorViewHelper;-><init>(Landroid/view/View;)V

    .line 135
    .local v0, "evh":Lcom/vkontakte/android/ui/ErrorViewHelper;
    iget-object v1, p0, Lcom/vk/webapp/VKUIWebContainerFragment$1$1;->this$1:Lcom/vk/webapp/VKUIWebContainerFragment$1;

    iget-object v1, v1, Lcom/vk/webapp/VKUIWebContainerFragment$1;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    const v2, 0x7f0801f9

    invoke-virtual {v1, v2}, Lcom/vk/webapp/VKUIWebContainerFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setMessage(Ljava/lang/String;)V

    .line 136
    return-void
.end method

.method public showToast(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 140
    return-void
.end method
