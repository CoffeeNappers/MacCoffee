.class Lcom/vk/media/utils/RenderBase$GLRenderer;
.super Ljava/lang/Object;
.source "RenderBase.java"

# interfaces
.implements Lcom/vk/media/utils/RenderHelpers$Renderer;
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GLRenderer"
.end annotation


# instance fields
.field private mView:Landroid/opengl/GLSurfaceView;

.field final synthetic this$0:Lcom/vk/media/utils/RenderBase;


# direct methods
.method public constructor <init>(Lcom/vk/media/utils/RenderBase;Landroid/content/Context;)V
    .locals 8
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/16 v1, 0x8

    .line 127
    iput-object p1, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    new-instance v0, Landroid/opengl/GLSurfaceView;

    invoke-direct {v0, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    .line 129
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/opengl/GLSurfaceView;->setEGLContextClientVersion(I)V

    .line 130
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    const/16 v5, 0x10

    move v2, v1

    move v3, v1

    move v4, v1

    invoke-virtual/range {v0 .. v6}, Landroid/opengl/GLSurfaceView;->setEGLConfigChooser(IIIIII)V

    .line 131
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0, v7}, Landroid/opengl/GLSurfaceView;->setPreserveEGLContextOnPause(Z)V

    .line 132
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0, v7}, Landroid/opengl/GLSurfaceView;->setZOrderMediaOverlay(Z)V

    .line 133
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0, p0}, Landroid/opengl/GLSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 134
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0, v6}, Landroid/opengl/GLSurfaceView;->setRenderMode(I)V

    .line 135
    return-void
.end method


# virtual methods
.method public draw()V
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->requestRender()V

    .line 149
    return-void
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    return-object v0
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    .line 170
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-virtual {v0}, Lcom/vk/media/utils/RenderBase;->onDraw()V

    .line 171
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 2
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 163
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v0, p2, p3}, Lcom/vk/media/utils/RenderBase;->access$300(Lcom/vk/media/utils/RenderBase;II)V

    .line 164
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-virtual {v0, p2, p3}, Lcom/vk/media/utils/RenderBase;->onSurfaceChanged(II)V

    .line 165
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    iget-object v1, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v1}, Lcom/vk/media/utils/RenderBase;->access$400(Lcom/vk/media/utils/RenderBase;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderBase;->access$200(Lcom/vk/media/utils/RenderBase;Ljava/lang/Runnable;)V

    .line 166
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 2
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/media/utils/RenderBase;->onSurfaceCreated(Landroid/view/Surface;)V

    .line 158
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    iget-object v1, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v1}, Lcom/vk/media/utils/RenderBase;->access$100(Lcom/vk/media/utils/RenderBase;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderBase;->access$200(Lcom/vk/media/utils/RenderBase;Ljava/lang/Runnable;)V

    .line 159
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 143
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$GLRenderer;->mView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0, p1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 144
    return-void
.end method

.method public release()V
    .locals 0

    .prologue
    .line 153
    return-void
.end method
