.class Lcom/vk/webapp/VKUIWebContainerFragment$1;
.super Landroid/webkit/WebViewClient;
.source "VKUIWebContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/webapp/VKUIWebContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/webapp/VKUIWebContainerFragment;


# direct methods
.method constructor <init>(Lcom/vk/webapp/VKUIWebContainerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/webapp/VKUIWebContainerFragment;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/vk/webapp/VKUIWebContainerFragment$1;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 130
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$1;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    iget-boolean v0, v0, Lcom/vk/webapp/VKUIWebContainerFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$1;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    new-instance v1, Lcom/vk/webapp/VKUIWebContainerFragment$1$1;

    invoke-direct {v1, p0}, Lcom/vk/webapp/VKUIWebContainerFragment$1$1;-><init>(Lcom/vk/webapp/VKUIWebContainerFragment$1;)V

    invoke-virtual {v0, v1}, Lcom/vk/webapp/VKUIWebContainerFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 143
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$1;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-static {v0, v3}, Lcom/vk/webapp/VKUIWebContainerFragment;->access$002(Lcom/vk/webapp/VKUIWebContainerFragment;Z)Z

    .line 149
    :goto_0
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "VKUIWebContainerFragment"

    aput-object v2, v0, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "failed to load: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", errorCode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 150
    return-void

    .line 146
    :cond_0
    const v0, 0x7f0801f9

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    goto :goto_0
.end method
