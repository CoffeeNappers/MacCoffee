.class Lcom/vkontakte/android/ui/PhotoView$1;
.super Landroid/content/BroadcastReceiver;
.source "PhotoView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/PhotoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/PhotoView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/PhotoView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$1;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x0

    .line 119
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$1;->isInitialStickyBroadcast()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 127
    :cond_0
    :goto_0
    return-void

    .line 121
    :cond_1
    const-string/jumbo v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 122
    const-string/jumbo v1, "noConnectivity"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v0, 0x1

    .line 123
    .local v0, "isConnected":Z
    :cond_2
    if-eqz v0, :cond_0

    .line 124
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$1;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/PhotoView;->onRetryClick()V

    goto :goto_0
.end method
