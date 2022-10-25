.class Lcom/vk/media/utils/RenderBase$3;
.super Ljava/lang/Object;
.source "RenderBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/media/utils/RenderBase;


# direct methods
.method constructor <init>(Lcom/vk/media/utils/RenderBase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/media/utils/RenderBase;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vk/media/utils/RenderBase$3;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$3;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v0}, Lcom/vk/media/utils/RenderBase;->access$000(Lcom/vk/media/utils/RenderBase;)Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase$3;->this$0:Lcom/vk/media/utils/RenderBase;

    invoke-static {v0}, Lcom/vk/media/utils/RenderBase;->access$000(Lcom/vk/media/utils/RenderBase;)Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/media/utils/RenderBase$3;->this$0:Lcom/vk/media/utils/RenderBase;

    iget-object v1, v1, Lcom/vk/media/utils/RenderBase;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-virtual {v1}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->texture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    .line 61
    :cond_0
    return-void
.end method
