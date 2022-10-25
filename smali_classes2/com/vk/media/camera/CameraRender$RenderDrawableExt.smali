.class Lcom/vk/media/camera/CameraRender$RenderDrawableExt;
.super Lcom/vk/media/utils/RenderDrawable;
.source "CameraRender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RenderDrawableExt"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/media/camera/CameraRender;


# direct methods
.method public constructor <init>(Lcom/vk/media/camera/CameraRender;)V
    .locals 2

    .prologue
    .line 197
    iput-object p1, p0, Lcom/vk/media/camera/CameraRender$RenderDrawableExt;->this$0:Lcom/vk/media/camera/CameraRender;

    .line 198
    new-instance v0, Lcom/vk/media/utils/grafika/Texture2dProgram;

    sget-object v1, Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;->TEXTURE_EXT:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    invoke-direct {v0, v1}, Lcom/vk/media/utils/grafika/Texture2dProgram;-><init>(Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;)V

    invoke-direct {p0, v0}, Lcom/vk/media/utils/RenderDrawable;-><init>(Lcom/vk/media/utils/grafika/Texture2dProgram;)V

    .line 199
    return-void
.end method
