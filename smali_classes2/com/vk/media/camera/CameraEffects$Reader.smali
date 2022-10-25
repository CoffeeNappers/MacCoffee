.class public Lcom/vk/media/camera/CameraEffects$Reader;
.super Ljava/lang/Object;
.source "CameraEffects.java"

# interfaces
.implements Lcom/vk/media/camera/CameraUtils$FrameObserver;
.implements Lcom/vk/media/camera/CameraUtils$FrameReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraEffects;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Reader"
.end annotation


# instance fields
.field private mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

.field private final mLock:Ljava/lang/Object;

.field private mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

.field final synthetic this$0:Lcom/vk/media/camera/CameraEffects;


# direct methods
.method public constructor <init>(Lcom/vk/media/camera/CameraEffects;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vk/media/camera/CameraEffects;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/vk/media/camera/CameraEffects$Reader;->this$0:Lcom/vk/media/camera/CameraEffects;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mLock:Ljava/lang/Object;

    .line 185
    new-instance v0, Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-direct {v0}, Lcom/vk/media/camera/CameraUtils$Frame;-><init>()V

    iput-object v0, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    return-void
.end method

.method private getTimestamp()J
    .locals 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-virtual {v0}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->getTimestamp()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 216
    iget-object v1, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 217
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraUtils$Frame;->clear()V

    .line 218
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects$Reader;->this$0:Lcom/vk/media/camera/CameraEffects;

    invoke-static {v0}, Lcom/vk/media/camera/CameraEffects;->access$200(Lcom/vk/media/camera/CameraEffects;)Lcom/vk/media/camera/CameraEffects$Stat;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraEffects$Stat;->clear()V

    .line 219
    monitor-exit v1

    .line 220
    return-void

    .line 219
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onFrameCaptured(Landroid/hardware/Camera;[BIII)V
    .locals 16
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "frame"    # [B
    .param p3, "w"    # I
    .param p4, "h"    # I
    .param p5, "rotation"    # I

    .prologue
    .line 195
    if-nez p2, :cond_0

    .line 207
    :goto_0
    return-void

    .line 198
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vk/media/camera/CameraEffects$Reader;->mLock:Ljava/lang/Object;

    monitor-enter v13

    .line 199
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/media/camera/CameraEffects$Reader;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    move/from16 v0, p3

    move/from16 v1, p4

    invoke-virtual {v4, v0, v1}, Lcom/vk/media/camera/CameraUtils$Frame;->resize(II)Z

    .line 200
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/media/camera/CameraEffects$Reader;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-virtual {v4}, Lcom/vk/media/camera/CameraUtils$Frame;->getPixels()Ljava/nio/IntBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v11

    .line 201
    .local v11, "pixels":[I
    invoke-direct/range {p0 .. p0}, Lcom/vk/media/camera/CameraEffects$Reader;->getTimestamp()J

    move-result-wide v8

    .line 202
    .local v8, "pts":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/media/camera/CameraEffects$Reader;->this$0:Lcom/vk/media/camera/CameraEffects;

    invoke-static {v4}, Lcom/vk/media/camera/CameraEffects;->access$100(Lcom/vk/media/camera/CameraEffects;)Z

    move-result v12

    move-object/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v10, p5

    invoke-static/range {v5 .. v12}, Lcom/vk/medianative/MediaNative;->nativeProcessorDoFrame([BIIJI[IZ)J

    move-result-wide v14

    .line 203
    .local v14, "dts":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/media/camera/CameraEffects$Reader;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-virtual {v4, v14, v15}, Lcom/vk/media/camera/CameraUtils$Frame;->setTimestamp(J)V

    .line 204
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/media/camera/CameraEffects$Reader;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    move/from16 v0, p5

    invoke-virtual {v4, v0}, Lcom/vk/media/camera/CameraUtils$Frame;->setRotation(I)V

    .line 205
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/media/camera/CameraEffects$Reader;->this$0:Lcom/vk/media/camera/CameraEffects;

    invoke-static {v4}, Lcom/vk/media/camera/CameraEffects;->access$200(Lcom/vk/media/camera/CameraEffects;)Lcom/vk/media/camera/CameraEffects$Stat;

    move-result-object v4

    move/from16 v0, p3

    move/from16 v1, p4

    move/from16 v2, p5

    invoke-virtual {v4, v0, v1, v2}, Lcom/vk/media/camera/CameraEffects$Stat;->update(III)V

    .line 206
    monitor-exit v13

    goto :goto_0

    .end local v8    # "pts":J
    .end local v11    # "pixels":[I
    .end local v14    # "dts":J
    :catchall_0
    move-exception v4

    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public pull(Lcom/vk/media/camera/CameraUtils$Frame;)V
    .locals 2
    .param p1, "frame"    # Lcom/vk/media/camera/CameraUtils$Frame;

    .prologue
    .line 210
    iget-object v1, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 211
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mFrame:Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-virtual {v0, p1}, Lcom/vk/media/camera/CameraUtils$Frame;->pull(Lcom/vk/media/camera/CameraUtils$Frame;)V

    .line 212
    monitor-exit v1

    .line 213
    return-void

    .line 212
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setTexture(Lcom/vk/media/utils/RenderHelpers$RenderTexture;)V
    .locals 0
    .param p1, "texture"    # Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    .prologue
    .line 190
    iput-object p1, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    .line 191
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    .line 227
    iget-object v1, p0, Lcom/vk/media/camera/CameraEffects$Reader;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 228
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects$Reader;->this$0:Lcom/vk/media/camera/CameraEffects;

    invoke-static {v0}, Lcom/vk/media/camera/CameraEffects;->access$200(Lcom/vk/media/camera/CameraEffects;)Lcom/vk/media/camera/CameraEffects$Stat;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraEffects$Stat;->clear()V

    .line 229
    monitor-exit v1

    .line 230
    return-void

    .line 229
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
