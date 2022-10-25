.class public Lcom/vk/media/utils/RenderHelpers$RenderHandler;
.super Landroid/os/Handler;
.source "RenderHelpers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderHelpers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RenderHandler"
.end annotation


# static fields
.field private static final MSG_DO_EVENT:I = 0x4

.field private static final MSG_DO_FRAME:I = 0x3

.field private static final MSG_SHUTDOWN:I = 0x5

.field private static final MSG_SURFACE_CHANGED:I = 0x1

.field private static final MSG_SURFACE_CREATED:I = 0x0

.field private static final MSG_SURFACE_DESTROYED:I = 0x2


# instance fields
.field private mWeakRenderThread:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vk/media/utils/RenderHelpers$RenderThread;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vk/media/utils/RenderHelpers$RenderThread;)V
    .locals 1
    .param p1, "rt"    # Lcom/vk/media/utils/RenderHelpers$RenderThread;

    .prologue
    .line 112
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 113
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->mWeakRenderThread:Ljava/lang/ref/WeakReference;

    .line 114
    return-void
.end method

.method private isAlive()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 178
    iget-object v2, p0, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->mWeakRenderThread:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_0

    .line 179
    iget-object v2, p0, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->mWeakRenderThread:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/media/utils/RenderHelpers$RenderThread;

    .line 180
    .local v0, "renderThread":Lcom/vk/media/utils/RenderHelpers$RenderThread;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 182
    .end local v0    # "renderThread":Lcom/vk/media/utils/RenderHelpers$RenderThread;
    :cond_0
    return v1
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 145
    iget v1, p1, Landroid/os/Message;->what:I

    .line 146
    .local v1, "what":I
    iget-object v4, p0, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->mWeakRenderThread:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/media/utils/RenderHelpers$RenderThread;

    .line 147
    .local v0, "renderThread":Lcom/vk/media/utils/RenderHelpers$RenderThread;
    if-nez v0, :cond_0

    .line 175
    :goto_0
    return-void

    .line 151
    :cond_0
    packed-switch v1, :pswitch_data_0

    .line 173
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "unknown message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 153
    :pswitch_0
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/view/Surface;

    invoke-virtual {v0, v4}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->notifySurfaceCreated(Landroid/view/Surface;)V

    goto :goto_0

    .line 156
    :pswitch_1
    iget v4, p1, Landroid/os/Message;->arg1:I

    iget v5, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v0, v4, v5}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->notifySurfaceChanged(II)V

    goto :goto_0

    .line 159
    :pswitch_2
    invoke-virtual {v0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->notifySurfaceDestroyed()V

    goto :goto_0

    .line 162
    :pswitch_3
    iget v4, p1, Landroid/os/Message;->arg1:I

    int-to-long v4, v4

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    iget v6, p1, Landroid/os/Message;->arg2:I

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    or-long v2, v4, v6

    .line 164
    .local v2, "timestamp":J
    invoke-virtual {v0, v2, v3}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->notifyDoFrame(J)V

    goto :goto_0

    .line 167
    .end local v2    # "timestamp":J
    :pswitch_4
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Runnable;

    invoke-virtual {v0, v4}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->notifyDoEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 170
    :pswitch_5
    invoke-static {v0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->access$300(Lcom/vk/media/utils/RenderHelpers$RenderThread;)V

    goto :goto_0

    .line 151
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public sendDoFrame(J)V
    .locals 5
    .param p1, "frameTimeNanos"    # J

    .prologue
    .line 131
    const/4 v0, 0x3

    const/16 v1, 0x20

    shr-long v2, p1, v1

    long-to-int v1, v2

    long-to-int v2, p1

    invoke-virtual {p0, v0, v1, v2}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    .line 133
    return-void
.end method

.method public sendEvent(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 136
    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    .line 137
    return-void
.end method

.method public sendShutdown()V
    .locals 1

    .prologue
    .line 140
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    .line 141
    return-void
.end method

.method public sendSurfaceChanged(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 121
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1, p2}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    .line 122
    return-void
.end method

.method public sendSurfaceCreated(Landroid/view/Surface;)V
    .locals 1
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 117
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    .line 118
    return-void
.end method

.method public sendSurfaceDestroyed()V
    .locals 1

    .prologue
    .line 125
    invoke-direct {p0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    .line 128
    :cond_0
    return-void
.end method
