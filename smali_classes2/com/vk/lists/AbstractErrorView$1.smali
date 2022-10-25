.class Lcom/vk/lists/AbstractErrorView$1;
.super Landroid/content/BroadcastReceiver;
.source "AbstractErrorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/AbstractErrorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/AbstractErrorView;


# direct methods
.method constructor <init>(Lcom/vk/lists/AbstractErrorView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/AbstractErrorView;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/vk/lists/AbstractErrorView$1;->this$0:Lcom/vk/lists/AbstractErrorView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0}, Lcom/vk/lists/AbstractErrorView$1;->isInitialStickyBroadcast()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 32
    :cond_0
    :goto_0
    return-void

    .line 21
    :cond_1
    const-string/jumbo v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 22
    const-string/jumbo v1, "noConnectivity"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v0, 0x1

    .line 23
    .local v0, "isConnected":Z
    :cond_2
    if-eqz v0, :cond_0

    .line 24
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/vk/lists/AbstractErrorView$1$1;

    invoke-direct {v2, p0}, Lcom/vk/lists/AbstractErrorView$1$1;-><init>(Lcom/vk/lists/AbstractErrorView$1;)V

    const-wide/16 v4, 0x3e8

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
