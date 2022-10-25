.class Lcom/vk/media/utils/RenderBase$CustomRenderer;
.super Lcom/vk/media/utils/RenderHelpers$RenderThread;
.source "RenderBase.java"

# interfaces
.implements Lcom/vk/media/utils/RenderHelpers$Renderer;
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomRenderer"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/media/utils/RenderBase;


# direct methods
.method constructor <init>(Lcom/vk/media/utils/RenderBase;Landroid/view/SurfaceView;)V
    .locals 1
    .param p2, "view"    # Landroid/view/SurfaceView;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-direct {p0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;-><init>()V

    .line 178
    invoke-virtual {p2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 179
    .local v0, "holder":Landroid/view/SurfaceHolder;
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 180
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->start()V

    .line 181
    return-void
.end method


# virtual methods
.method public draw()V
    .locals 4

    .prologue
    .line 201
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->getHandler()Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    move-result-object v0

    .line 202
    .local v0, "rh":Lcom/vk/media/utils/RenderHelpers$RenderHandler;
    if-eqz v0, :cond_0

    .line 203
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendDoFrame(J)V

    .line 205
    :cond_0
    return-void
.end method

.method protected notifyDoFrame(J)V
    .locals 1
    .param p1, "timestamp"    # J

    .prologue
    .line 260
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-virtual {v0}, Lcom/vk/media/utils/RenderBase;->onDraw()V

    .line 263
    :cond_0
    return-void
.end method

.method protected notifySurfaceChanged(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 244
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v0, p1, p2}, Lcom/vk/media/utils/RenderBase;->access$300(Lcom/vk/media/utils/RenderBase;II)V

    .line 245
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-virtual {v0, p1, p2}, Lcom/vk/media/utils/RenderBase;->onSurfaceChanged(II)V

    .line 246
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    iget-object v1, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v1}, Lcom/vk/media/utils/RenderBase;->access$400(Lcom/vk/media/utils/RenderBase;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderBase;->access$200(Lcom/vk/media/utils/RenderBase;Ljava/lang/Runnable;)V

    .line 247
    return-void
.end method

.method protected notifySurfaceCreated(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 238
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-virtual {v0, p1}, Lcom/vk/media/utils/RenderBase;->onSurfaceCreated(Landroid/view/Surface;)V

    .line 239
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    iget-object v1, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v1}, Lcom/vk/media/utils/RenderBase;->access$100(Lcom/vk/media/utils/RenderBase;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderBase;->access$200(Lcom/vk/media/utils/RenderBase;Ljava/lang/Runnable;)V

    .line 240
    return-void
.end method

.method protected notifySurfaceDestroyed()V
    .locals 2

    .prologue
    .line 251
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-virtual {v0}, Lcom/vk/media/utils/RenderBase;->onSurfaceDestroyed()V

    .line 252
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    iget-object v1, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v1}, Lcom/vk/media/utils/RenderBase;->access$500(Lcom/vk/media/utils/RenderBase;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderBase;->access$200(Lcom/vk/media/utils/RenderBase;Ljava/lang/Runnable;)V

    .line 253
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v0}, Lcom/vk/media/utils/RenderBase;->access$600(Lcom/vk/media/utils/RenderBase;)Lcom/vk/media/utils/RenderHelpers$Renderer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 254
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$CustomRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v0}, Lcom/vk/media/utils/RenderBase;->access$600(Lcom/vk/media/utils/RenderBase;)Lcom/vk/media/utils/RenderHelpers$Renderer;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/media/utils/RenderHelpers$Renderer;->release()V

    .line 256
    :cond_0
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 185
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->getHandler()Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    move-result-object v0

    .line 186
    .local v0, "rh":Lcom/vk/media/utils/RenderHelpers$RenderHandler;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    invoke-virtual {v0, p1}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendEvent(Ljava/lang/Runnable;)V

    .line 189
    :cond_0
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->getHandler()Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    move-result-object v0

    .line 194
    .local v0, "rh":Lcom/vk/media/utils/RenderHelpers$RenderHandler;
    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendShutdown()V

    .line 197
    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 220
    sget-object v1, Lcom/vk/media/utils/RenderBase$CustomRenderer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "surfaceChanged="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->getHandler()Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    move-result-object v0

    .line 222
    .local v0, "rh":Lcom/vk/media/utils/RenderHelpers$RenderHandler;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 223
    invoke-virtual {v0, p3, p4}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendSurfaceChanged(II)V

    .line 225
    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 209
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->start()V

    .line 211
    sget-object v1, Lcom/vk/media/utils/RenderBase$CustomRenderer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "surfaceCreated="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->getHandler()Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    move-result-object v0

    .line 213
    .local v0, "rh":Lcom/vk/media/utils/RenderHelpers$RenderHandler;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 214
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendSurfaceCreated(Landroid/view/Surface;)V

    .line 216
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 229
    sget-object v1, Lcom/vk/media/utils/RenderBase$CustomRenderer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "surfaceDestroyed="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->getHandler()Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    move-result-object v0

    .line 231
    .local v0, "rh":Lcom/vk/media/utils/RenderHelpers$RenderHandler;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/media/utils/RenderBase$CustomRenderer;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 232
    invoke-virtual {v0}, Lcom/vk/media/utils/RenderHelpers$RenderHandler;->sendSurfaceDestroyed()V

    .line 234
    :cond_0
    return-void
.end method
