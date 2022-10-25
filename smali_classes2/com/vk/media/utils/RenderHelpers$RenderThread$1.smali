.class Lcom/vk/media/utils/RenderHelpers$RenderThread$1;
.super Ljava/lang/Object;
.source "RenderHelpers.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderHelpers$RenderThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;


# direct methods
.method constructor <init>(Lcom/vk/media/utils/RenderHelpers$RenderThread;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/media/utils/RenderHelpers$RenderThread;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 24
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 25
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    new-instance v1, Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    iget-object v2, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    invoke-direct {v1, v2}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;-><init>(Lcom/vk/media/utils/RenderHelpers$RenderThread;)V

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->access$002(Lcom/vk/media/utils/RenderHelpers$RenderThread;Lcom/vk/media/utils/RenderHelpers$RenderHandler;)Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    .line 27
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    invoke-static {v0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->access$100(Lcom/vk/media/utils/RenderHelpers$RenderThread;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->access$202(Lcom/vk/media/utils/RenderHelpers$RenderThread;Z)Z

    .line 29
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    invoke-static {v0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->access$100(Lcom/vk/media/utils/RenderHelpers$RenderThread;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 30
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    sget-object v0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "looper loop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 33
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    invoke-static {v0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->access$100(Lcom/vk/media/utils/RenderHelpers$RenderThread;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 34
    :try_start_1
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->access$202(Lcom/vk/media/utils/RenderHelpers$RenderThread;Z)Z

    .line 35
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 36
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderThread;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->access$002(Lcom/vk/media/utils/RenderHelpers$RenderThread;Lcom/vk/media/utils/RenderHelpers$RenderHandler;)Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    .line 37
    sget-object v0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "looper quit"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    return-void

    .line 30
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 35
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method
