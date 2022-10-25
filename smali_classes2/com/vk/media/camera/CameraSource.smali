.class public Lcom/vk/media/camera/CameraSource;
.super Ljava/lang/Object;
.source "CameraSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;,
        Lcom/vk/media/camera/CameraSource$SizePair;
    }
.end annotation


# static fields
.field private static final ASPECT_RATIO_TOLERANCE:F = 0.01f

.field private static final PREVIEW_BUFFERS:I = 0x3

.field private static final TAG:Ljava/lang/String; = "CameraSource"


# instance fields
.field private mBufferSize:I

.field private mCamera:Landroid/hardware/Camera;

.field private mCameraInfo:Landroid/hardware/Camera$CameraInfo;

.field private mContext:Landroid/content/Context;

.field private mHeight:I

.field private mObserver:Lcom/vk/media/camera/CameraUtils$FrameObserver;

.field private mRequestedCameraId:I

.field private mRequestedFps:F

.field private mSize:Lcom/vk/media/utils/MediaUtils$Size;

.field private mWidth:I


# direct methods
.method public constructor <init>(Lcom/vk/media/camera/CameraUtils$FrameObserver;IILandroid/content/Context;F)V
    .locals 3
    .param p1, "observer"    # Lcom/vk/media/camera/CameraUtils$FrameObserver;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "context"    # Landroid/content/Context;
    .param p5, "fps"    # F

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object v0, p0, Lcom/vk/media/camera/CameraSource;->mObserver:Lcom/vk/media/camera/CameraUtils$FrameObserver;

    .line 27
    iput-object v0, p0, Lcom/vk/media/camera/CameraSource;->mSize:Lcom/vk/media/utils/MediaUtils$Size;

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/media/camera/CameraSource;->mRequestedFps:F

    .line 31
    iput v1, p0, Lcom/vk/media/camera/CameraSource;->mWidth:I

    .line 32
    iput v1, p0, Lcom/vk/media/camera/CameraSource;->mHeight:I

    .line 33
    iput v1, p0, Lcom/vk/media/camera/CameraSource;->mRequestedCameraId:I

    .line 34
    iput v1, p0, Lcom/vk/media/camera/CameraSource;->mBufferSize:I

    .line 38
    iput-object p1, p0, Lcom/vk/media/camera/CameraSource;->mObserver:Lcom/vk/media/camera/CameraUtils$FrameObserver;

    .line 39
    iput p2, p0, Lcom/vk/media/camera/CameraSource;->mWidth:I

    .line 40
    iput p3, p0, Lcom/vk/media/camera/CameraSource;->mHeight:I

    .line 41
    iput-object p4, p0, Lcom/vk/media/camera/CameraSource;->mContext:Landroid/content/Context;

    .line 42
    iput p5, p0, Lcom/vk/media/camera/CameraSource;->mRequestedFps:F

    .line 43
    const-string/jumbo v0, "CameraSource"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CameraSource res: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraSource;->mWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraSource;->mHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    return-void
.end method

.method static synthetic access$100(Lcom/vk/media/camera/CameraSource;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraSource;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/vk/media/camera/CameraSource;->getDeviceOrientation()I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/vk/media/camera/CameraSource;)Landroid/hardware/Camera$CameraInfo;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraSource;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/media/camera/CameraSource;)Lcom/vk/media/camera/CameraUtils$FrameObserver;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraSource;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource;->mObserver:Lcom/vk/media/camera/CameraUtils$FrameObserver;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/media/camera/CameraSource;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraSource;

    .prologue
    .line 17
    iget v0, p0, Lcom/vk/media/camera/CameraSource;->mBufferSize:I

    return v0
.end method

.method static synthetic access$500(Lcom/vk/media/camera/CameraSource;)Lcom/vk/media/utils/MediaUtils$Size;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraSource;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource;->mSize:Lcom/vk/media/utils/MediaUtils$Size;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/media/camera/CameraSource;)Landroid/hardware/Camera;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraSource;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    return-object v0
.end method

.method private createPreviewBuffer(Lcom/vk/media/utils/MediaUtils$Size;I)[B
    .locals 4
    .param p1, "previewSize"    # Lcom/vk/media/utils/MediaUtils$Size;
    .param p2, "format"    # I

    .prologue
    .line 193
    .line 194
    invoke-virtual {p1}, Lcom/vk/media/utils/MediaUtils$Size;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Lcom/vk/media/utils/MediaUtils$Size;->getHeight()I

    move-result v3

    .line 193
    invoke-static {v2, v3, p2}, Lcom/vk/media/camera/CameraUtils;->getFrameSize(III)I

    move-result v2

    iput v2, p0, Lcom/vk/media/camera/CameraSource;->mBufferSize:I

    .line 196
    iget v2, p0, Lcom/vk/media/camera/CameraSource;->mBufferSize:I

    new-array v1, v2, [B

    .line 197
    .local v1, "byteArray":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 198
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    if-eq v2, v1, :cond_1

    .line 199
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Failed to create valid buffer for camera source."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 201
    :cond_1
    return-object v1
.end method

.method private static generateValidPreviewSizeList(Landroid/hardware/Camera;)Ljava/util/List;
    .locals 12
    .param p0, "camera"    # Landroid/hardware/Camera;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/Camera;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vk/media/camera/CameraSource$SizePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 148
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 150
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v6

    .line 152
    .local v6, "supportedPreviewSizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object v5

    .line 153
    .local v5, "supportedPictureSizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v7, "validPreviewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/vk/media/camera/CameraSource$SizePair;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/Camera$Size;

    .line 155
    .local v4, "previewSize":Landroid/hardware/Camera$Size;
    iget v9, v4, Landroid/hardware/Camera$Size;->width:I

    int-to-float v9, v9

    iget v10, v4, Landroid/hardware/Camera$Size;->height:I

    int-to-float v10, v10

    div-float v3, v9, v10

    .line 156
    .local v3, "previewAspectRatio":F
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/Camera$Size;

    .line 157
    .local v2, "pictureSize":Landroid/hardware/Camera$Size;
    iget v10, v2, Landroid/hardware/Camera$Size;->width:I

    int-to-float v10, v10

    iget v11, v2, Landroid/hardware/Camera$Size;->height:I

    int-to-float v11, v11

    div-float v1, v10, v11

    .line 158
    .local v1, "pictureAspectRatio":F
    sub-float v10, v3, v1

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    const v11, 0x3c23d70a    # 0.01f

    cmpg-float v10, v10, v11

    if-gez v10, :cond_1

    .line 159
    new-instance v9, Lcom/vk/media/camera/CameraSource$SizePair;

    invoke-direct {v9, v4, v2}, Lcom/vk/media/camera/CameraSource$SizePair;-><init>(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)V

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 165
    .end local v1    # "pictureAspectRatio":F
    .end local v2    # "pictureSize":Landroid/hardware/Camera$Size;
    .end local v3    # "previewAspectRatio":F
    .end local v4    # "previewSize":Landroid/hardware/Camera$Size;
    :cond_2
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_3

    .line 166
    const-string/jumbo v8, "CameraSource"

    const-string/jumbo v9, "No preview sizes have a corresponding same-aspect-ratio picture size"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/Camera$Size;

    .line 168
    .restart local v4    # "previewSize":Landroid/hardware/Camera$Size;
    new-instance v9, Lcom/vk/media/camera/CameraSource$SizePair;

    const/4 v10, 0x0

    invoke-direct {v9, v4, v10}, Lcom/vk/media/camera/CameraSource$SizePair;-><init>(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)V

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 172
    .end local v4    # "previewSize":Landroid/hardware/Camera$Size;
    :cond_3
    return-object v7
.end method

.method private getDeviceOrientation()I
    .locals 4

    .prologue
    .line 205
    const/4 v0, 0x0

    .line 206
    .local v0, "orientation":I
    iget-object v2, p0, Lcom/vk/media/camera/CameraSource;->mContext:Landroid/content/Context;

    const-string/jumbo v3, "window"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 208
    .local v1, "wm":Landroid/view/WindowManager;
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 220
    const/4 v0, 0x0

    .line 223
    :goto_0
    return v0

    .line 210
    :pswitch_0
    const/16 v0, 0x5a

    .line 211
    goto :goto_0

    .line 213
    :pswitch_1
    const/16 v0, 0xb4

    .line 214
    goto :goto_0

    .line 216
    :pswitch_2
    const/16 v0, 0x10e

    .line 217
    goto :goto_0

    .line 208
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private selectPreviewFpsRange(Landroid/hardware/Camera;F)[I
    .locals 11
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "desiredPreviewFps"    # F

    .prologue
    .line 176
    const/high16 v8, 0x447a0000    # 1000.0f

    mul-float/2addr v8, p2

    float-to-int v2, v8

    .line 177
    .local v2, "desiredPreviewFpsScaled":I
    const/4 v7, 0x0

    .line 178
    .local v7, "selectedFpsRange":[I
    const v4, 0x7fffffff

    .line 179
    .local v4, "minDiff":I
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v8

    invoke-virtual {v8}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object v5

    .line 180
    .local v5, "previewFpsRangeList":Ljava/util/List;, "Ljava/util/List<[I>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [I

    .line 181
    .local v6, "range":[I
    const/4 v9, 0x0

    aget v9, v6, v9

    sub-int v1, v2, v9

    .line 182
    .local v1, "deltaMin":I
    const/4 v9, 0x1

    aget v9, v6, v9

    sub-int v0, v2, v9

    .line 183
    .local v0, "deltaMax":I
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v9

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v10

    add-int v3, v9, v10

    .line 184
    .local v3, "diff":I
    if-ge v3, v4, :cond_0

    .line 185
    move-object v7, v6

    .line 186
    move v4, v3

    goto :goto_0

    .line 189
    .end local v0    # "deltaMax":I
    .end local v1    # "deltaMin":I
    .end local v3    # "diff":I
    .end local v6    # "range":[I
    :cond_1
    return-object v7
.end method

.method private static selectSizePair(Landroid/hardware/Camera;II)Lcom/vk/media/camera/CameraSource$SizePair;
    .locals 9
    .param p0, "camera"    # Landroid/hardware/Camera;
    .param p1, "desiredWidth"    # I
    .param p2, "desiredHeight"    # I

    .prologue
    .line 109
    invoke-static {p0}, Lcom/vk/media/camera/CameraSource;->generateValidPreviewSizeList(Landroid/hardware/Camera;)Ljava/util/List;

    move-result-object v5

    .line 111
    .local v5, "validPreviewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/vk/media/camera/CameraSource$SizePair;>;"
    const/4 v2, 0x0

    .line 112
    .local v2, "selectedPair":Lcom/vk/media/camera/CameraSource$SizePair;
    const v1, 0x7fffffff

    .line 113
    .local v1, "minDiff":I
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vk/media/camera/CameraSource$SizePair;

    .line 114
    .local v4, "sizePair":Lcom/vk/media/camera/CameraSource$SizePair;
    invoke-virtual {v4}, Lcom/vk/media/camera/CameraSource$SizePair;->previewSize()Lcom/vk/media/utils/MediaUtils$Size;

    move-result-object v3

    .line 115
    .local v3, "size":Lcom/vk/media/utils/MediaUtils$Size;
    invoke-virtual {v3}, Lcom/vk/media/utils/MediaUtils$Size;->getWidth()I

    move-result v7

    sub-int/2addr v7, p1

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 116
    invoke-virtual {v3}, Lcom/vk/media/utils/MediaUtils$Size;->getHeight()I

    move-result v8

    sub-int/2addr v8, p2

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    add-int v0, v7, v8

    .line 117
    .local v0, "diff":I
    if-ge v0, v1, :cond_0

    .line 118
    move-object v2, v4

    .line 119
    move v1, v0

    goto :goto_0

    .line 122
    .end local v0    # "diff":I
    .end local v3    # "size":Lcom/vk/media/utils/MediaUtils$Size;
    .end local v4    # "sizePair":Lcom/vk/media/camera/CameraSource$SizePair;
    :cond_1
    return-object v2
.end method

.method private setParameters(Landroid/hardware/Camera;Landroid/hardware/Camera$Parameters;)V
    .locals 4
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 89
    iget v2, p0, Lcom/vk/media/camera/CameraSource;->mWidth:I

    iget v3, p0, Lcom/vk/media/camera/CameraSource;->mHeight:I

    invoke-static {p1, v2, v3}, Lcom/vk/media/camera/CameraSource;->selectSizePair(Landroid/hardware/Camera;II)Lcom/vk/media/camera/CameraSource$SizePair;

    move-result-object v1

    .line 90
    .local v1, "sizePair":Lcom/vk/media/camera/CameraSource$SizePair;
    if-nez v1, :cond_0

    .line 91
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "Could not find suitable preview size."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 94
    :cond_0
    invoke-virtual {v1}, Lcom/vk/media/camera/CameraSource$SizePair;->previewSize()Lcom/vk/media/utils/MediaUtils$Size;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/media/camera/CameraSource;->mSize:Lcom/vk/media/utils/MediaUtils$Size;

    .line 95
    iget v2, p0, Lcom/vk/media/camera/CameraSource;->mRequestedFps:F

    invoke-direct {p0, p1, v2}, Lcom/vk/media/camera/CameraSource;->selectPreviewFpsRange(Landroid/hardware/Camera;F)[I

    move-result-object v0

    .line 96
    .local v0, "previewFpsRange":[I
    if-nez v0, :cond_1

    .line 97
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "Could not find suitable preview frames per second range."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 99
    :cond_1
    iget-object v2, p0, Lcom/vk/media/camera/CameraSource;->mSize:Lcom/vk/media/utils/MediaUtils$Size;

    invoke-virtual {v2}, Lcom/vk/media/utils/MediaUtils$Size;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vk/media/camera/CameraSource;->mSize:Lcom/vk/media/utils/MediaUtils$Size;

    invoke-virtual {v3}, Lcom/vk/media/utils/MediaUtils$Size;->getHeight()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 101
    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v3, v0, v3

    invoke-virtual {p2, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 105
    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 106
    return-void
.end method


# virtual methods
.method public isReady()Z
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public start(Landroid/hardware/Camera;I)Z
    .locals 7
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "cameraId"    # I

    .prologue
    const/4 v3, 0x0

    .line 47
    iget-object v4, p0, Lcom/vk/media/camera/CameraSource;->mObserver:Lcom/vk/media/camera/CameraUtils$FrameObserver;

    if-eqz v4, :cond_0

    if-nez p1, :cond_1

    .line 72
    :cond_0
    :goto_0
    return v3

    .line 51
    :cond_1
    iget-object v4, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    if-eqz v4, :cond_2

    .line 52
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraSource;->stop()V

    .line 56
    :cond_2
    :try_start_0
    iput p2, p0, Lcom/vk/media/camera/CameraSource;->mRequestedCameraId:I

    .line 57
    iput-object p1, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    .line 58
    new-instance v4, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v4}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    iput-object v4, p0, Lcom/vk/media/camera/CameraSource;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    .line 59
    iget v4, p0, Lcom/vk/media/camera/CameraSource;->mRequestedCameraId:I

    iget-object v5, p0, Lcom/vk/media/camera/CameraSource;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    invoke-static {v4, v5}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 61
    invoke-static {}, Lcom/vk/media/camera/CameraUtils;->getCameraFormat()I

    move-result v0

    .line 62
    .local v0, "format":I
    iget-object v4, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v4}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    .line 63
    .local v2, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v2, v0}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 64
    iget-object v4, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    invoke-direct {p0, v4, v2}, Lcom/vk/media/camera/CameraSource;->setParameters(Landroid/hardware/Camera;Landroid/hardware/Camera$Parameters;)V

    .line 66
    iget-object v4, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    new-instance v5, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;-><init>(Lcom/vk/media/camera/CameraSource;Lcom/vk/media/camera/CameraSource$1;)V

    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 67
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    const/4 v4, 0x3

    if-ge v1, v4, :cond_3

    .line 68
    iget-object v4, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    iget-object v5, p0, Lcom/vk/media/camera/CameraSource;->mSize:Lcom/vk/media/utils/MediaUtils$Size;

    invoke-direct {p0, v5, v0}, Lcom/vk/media/camera/CameraSource;->createPreviewBuffer(Lcom/vk/media/utils/MediaUtils$Size;I)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->addCallbackBuffer([B)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 70
    :cond_3
    const/4 v3, 0x1

    goto :goto_0

    .line 71
    .end local v0    # "format":I
    .end local v1    # "i":I
    .end local v2    # "parameters":Landroid/hardware/Camera$Parameters;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public stop()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 77
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :cond_0
    :goto_0
    iput-object v2, p0, Lcom/vk/media/camera/CameraSource;->mCamera:Landroid/hardware/Camera;

    .line 82
    return-void

    .line 80
    :catch_0
    move-exception v0

    goto :goto_0
.end method
