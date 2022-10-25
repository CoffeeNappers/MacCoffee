.class Lcom/vk/media/camera/CameraRender$RenderDrawable2D;
.super Lcom/vk/media/utils/RenderDrawable;
.source "CameraRender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RenderDrawable2D"
.end annotation


# static fields
.field private static final SKIP_FIRST_FRAMES:I = 0xa


# instance fields
.field private mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

.field private mFrames:I

.field private mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

.field private mTextureId:I

.field final synthetic this$0:Lcom/vk/media/camera/CameraRender;


# direct methods
.method public constructor <init>(Lcom/vk/media/camera/CameraRender;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 209
    iput-object p1, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->this$0:Lcom/vk/media/camera/CameraRender;

    .line 210
    new-instance v0, Lcom/vk/media/utils/grafika/Texture2dProgram;

    sget-object v1, Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;->TEXTURE_2D:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    invoke-direct {v0, v1}, Lcom/vk/media/utils/grafika/Texture2dProgram;-><init>(Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;)V

    invoke-direct {p0, v0}, Lcom/vk/media/utils/RenderDrawable;-><init>(Lcom/vk/media/utils/grafika/Texture2dProgram;)V

    .line 204
    iput v2, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mTextureId:I

    .line 206
    new-instance v0, Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-direct {v0}, Lcom/vk/media/camera/CameraUtils$Frame;-><init>()V

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    .line 207
    iput v2, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrames:I

    .line 211
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->createTextureObject()I

    move-result v0

    iput v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mTextureId:I

    .line 212
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

    invoke-interface {v0}, Lcom/vk/media/camera/CameraUtils$FrameReader;->clear()V

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraUtils$Frame;->clear()V

    .line 250
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrames:I

    .line 251
    return-void
.end method

.method public drawFrame(Lcom/vk/media/camera/CameraUtils$Frame;[FLcom/vk/media/utils/RenderDrawable$Flip;)J
    .locals 7
    .param p1, "frame"    # Lcom/vk/media/camera/CameraUtils$Frame;
    .param p2, "texMatrix"    # [F
    .param p3, "flip"    # Lcom/vk/media/utils/RenderDrawable$Flip;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrames:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    .line 238
    :cond_0
    iget v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrames:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrames:I

    .line 239
    const-wide/16 v0, 0x0

    .line 242
    :goto_0
    return-wide v0

    .line 241
    :cond_1
    iget v1, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mTextureId:I

    invoke-virtual {p1}, Lcom/vk/media/camera/CameraUtils$Frame;->getPixels()Ljava/nio/IntBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lcom/vk/media/camera/CameraUtils$Frame;->getWidth()I

    move-result v5

    invoke-virtual {p1}, Lcom/vk/media/camera/CameraUtils$Frame;->getHeight()I

    move-result v6

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    invoke-super/range {v0 .. v6}, Lcom/vk/media/utils/RenderDrawable;->drawFrame2D(I[FLcom/vk/media/utils/RenderDrawable$Flip;Ljava/nio/IntBuffer;II)V

    .line 242
    invoke-virtual {p1}, Lcom/vk/media/camera/CameraUtils$Frame;->getTimestamp()J

    move-result-wide v0

    goto :goto_0
.end method

.method public pull()Lcom/vk/media/camera/CameraUtils$Frame;
    .locals 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-interface {v0, v1}, Lcom/vk/media/camera/CameraUtils$FrameReader;->pull(Lcom/vk/media/camera/CameraUtils$Frame;)V

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    return-object v0
.end method

.method public setReader(Lcom/vk/media/camera/CameraUtils$FrameReader;ZZ)V
    .locals 2
    .param p1, "reader"    # Lcom/vk/media/camera/CameraUtils$FrameReader;
    .param p2, "delayRendering"    # Z
    .param p3, "backCamera"    # Z

    .prologue
    .line 216
    if-eqz p1, :cond_1

    .line 217
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->getDrawable()Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->makeTexCoordArrays(Z)V

    .line 219
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

    if-nez v0, :cond_0

    .line 220
    const/16 v0, 0xa

    iput v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mFrames:I

    .line 222
    :cond_0
    iput-object p1, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

    .line 223
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->mReader:Lcom/vk/media/camera/CameraUtils$FrameReader;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->this$0:Lcom/vk/media/camera/CameraRender;

    invoke-static {v1}, Lcom/vk/media/camera/CameraRender;->access$300(Lcom/vk/media/camera/CameraRender;)Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/media/camera/CameraUtils$FrameReader;->setTexture(Lcom/vk/media/utils/RenderHelpers$RenderTexture;)V

    .line 227
    :goto_0
    return-void

    .line 225
    :cond_1
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->clear()V

    goto :goto_0
.end method
