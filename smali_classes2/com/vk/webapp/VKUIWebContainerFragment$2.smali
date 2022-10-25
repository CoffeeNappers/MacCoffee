.class Lcom/vk/webapp/VKUIWebContainerFragment$2;
.super Landroid/webkit/WebChromeClient;
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
    .line 153
    iput-object p1, p0, Lcom/vk/webapp/VKUIWebContainerFragment$2;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 3
    .param p1, "consoleMessage"    # Landroid/webkit/ConsoleMessage;

    .prologue
    .line 162
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "VKUIWebContainerFragment"

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

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->i([Ljava/lang/Object;)V

    .line 163
    invoke-super {p0, p1}, Landroid/webkit/WebChromeClient;->onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z

    move-result v0

    return v0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 155
    const-string/jumbo v0, "VKUIWebContainerFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onProgressChanged newProgress="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const/16 v0, 0x64

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$2;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    iget-boolean v0, v0, Lcom/vk/webapp/VKUIWebContainerFragment;->loaded:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$2;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-static {v0}, Lcom/vk/webapp/VKUIWebContainerFragment;->access$000(Lcom/vk/webapp/VKUIWebContainerFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$2;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-static {v0}, Lcom/vk/webapp/VKUIWebContainerFragment;->access$100(Lcom/vk/webapp/VKUIWebContainerFragment;)V

    .line 159
    :cond_0
    return-void
.end method
