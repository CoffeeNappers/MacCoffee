.class Lcom/vkontakte/android/media/VideoPools$SerialExecutor$1;
.super Ljava/lang/Object;
.source "VideoPools.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/media/VideoPools$SerialExecutor;->execute(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/media/VideoPools$SerialExecutor;

.field final synthetic val$r:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/media/VideoPools$SerialExecutor;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/media/VideoPools$SerialExecutor;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoPools$SerialExecutor$1;->this$0:Lcom/vkontakte/android/media/VideoPools$SerialExecutor;

    iput-object p2, p0, Lcom/vkontakte/android/media/VideoPools$SerialExecutor$1;->val$r:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 57
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$SerialExecutor$1;->val$r:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoPools$SerialExecutor$1;->this$0:Lcom/vkontakte/android/media/VideoPools$SerialExecutor;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoPools$SerialExecutor;->scheduleNext()V

    .line 61
    return-void

    .line 59
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$SerialExecutor$1;->this$0:Lcom/vkontakte/android/media/VideoPools$SerialExecutor;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VideoPools$SerialExecutor;->scheduleNext()V

    throw v0
.end method
