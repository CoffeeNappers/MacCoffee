.class Lcom/wmspanel/libstream/VideoListenerGLES16$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListenerGLES16;->setCameraParameters(Landroid/hardware/Camera$Parameters;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

.field final synthetic val$param:Landroid/hardware/Camera$Parameters;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListenerGLES16;Landroid/hardware/Camera$Parameters;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListenerGLES16;

    .prologue
    .line 416
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$4;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iput-object p2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$4;->val$param:Landroid/hardware/Camera$Parameters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 418
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$4;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    const-string/jumbo v1, "set camera params"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$000(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V

    .line 420
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$4;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$4;->val$param:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 424
    :goto_0
    return-void

    .line 421
    :catch_0
    move-exception v0

    .line 422
    const-string/jumbo v1, "VideoListenerGLES16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
