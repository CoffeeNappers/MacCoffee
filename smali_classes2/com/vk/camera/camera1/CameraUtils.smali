.class public Lcom/vk/camera/camera1/CameraUtils;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# static fields
.field private static final AUTO_EXPOSURE_LOCK_SUPPORTED:Ljava/lang/String; = "auto-exposure-lock-supported"

.field private static final AUTO_WHITE_BALANCE_LOCK_SUPPORTED:Ljava/lang/String; = "auto-whitebalance-lock-supported"

.field public static final FOCUS_MODE_CONTINUOUS_PICTURE:Ljava/lang/String; = "continuous-picture"

.field public static final HAS_CAMERA_FOCUS_AREA:Z

.field public static final HAS_CAMERA_METERING_AREA:Z

.field private static final MAX_IMAGE_SIZE:I = 0x500

.field private static final TAG:Ljava/lang/String; = "Util"

.field public static final TRUE:Ljava/lang/String; = "true"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/16 v3, 0xe

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 34
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v3, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/vk/camera/camera1/CameraUtils;->HAS_CAMERA_FOCUS_AREA:Z

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v3, :cond_1

    :goto_1
    sput-boolean v1, Lcom/vk/camera/camera1/CameraUtils;->HAS_CAMERA_METERING_AREA:Z

    return-void

    :cond_0
    move v0, v2

    .line 34
    goto :goto_0

    :cond_1
    move v1, v2

    .line 37
    goto :goto_1
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method public static clamp(III)I
    .locals 0
    .param p0, "x"    # I
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 123
    if-le p0, p2, :cond_0

    .line 125
    .end local p2    # "max":I
    :goto_0
    return p2

    .line 124
    .restart local p2    # "max":I
    :cond_0
    if-ge p0, p1, :cond_1

    move p2, p1

    goto :goto_0

    :cond_1
    move p2, p0

    .line 125
    goto :goto_0
.end method

.method private static determineBestSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;
    .locals 11
    .param p1, "originalWidth"    # I
    .param p2, "originalHeight"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Size;",
            ">;II)",
            "Landroid/hardware/Camera$Size;"
        }
    .end annotation

    .prologue
    .line 198
    .local p0, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    const/4 v0, 0x0

    .line 200
    .local v0, "bestSize":Landroid/hardware/Camera$Size;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    .line 201
    .local v6, "numOfSizes":I
    invoke-static {p1, p2}, Lcom/vk/camera/camera1/CameraUtils;->gcd(II)I

    move-result v1

    .line 202
    .local v1, "gcd":I
    div-int v8, p1, v1

    .line 203
    .local v8, "width":I
    div-int v2, p2, v1

    .line 204
    .local v2, "height":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v6, :cond_5

    .line 205
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/hardware/Camera$Size;

    .line 206
    .local v7, "size":Landroid/hardware/Camera$Size;
    iget v9, v7, Landroid/hardware/Camera$Size;->width:I

    if-ne v9, p1, :cond_0

    iget v9, v7, Landroid/hardware/Camera$Size;->height:I

    if-ne v9, p2, :cond_0

    .line 223
    .end local v7    # "size":Landroid/hardware/Camera$Size;
    :goto_1
    return-object v7

    .line 210
    .restart local v7    # "size":Landroid/hardware/Camera$Size;
    :cond_0
    iget v9, v7, Landroid/hardware/Camera$Size;->width:I

    div-int/2addr v9, v8

    iget v10, v7, Landroid/hardware/Camera$Size;->height:I

    div-int/2addr v10, v2

    if-ne v9, v10, :cond_3

    const/4 v5, 0x1

    .line 211
    .local v5, "isDesireRatio":Z
    :goto_2
    if-eqz v0, :cond_1

    iget v9, v7, Landroid/hardware/Camera$Size;->width:I

    iget v10, v0, Landroid/hardware/Camera$Size;->width:I

    if-le v9, v10, :cond_4

    iget v9, v7, Landroid/hardware/Camera$Size;->height:I

    const/16 v10, 0x500

    if-gt v9, v10, :cond_4

    :cond_1
    const/4 v4, 0x1

    .line 213
    .local v4, "isBetterSize":Z
    :goto_3
    if-eqz v5, :cond_2

    if-eqz v4, :cond_2

    iget v9, v7, Landroid/hardware/Camera$Size;->width:I

    const/16 v10, 0x500

    if-gt v9, v10, :cond_2

    .line 214
    move-object v0, v7

    .line 204
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 210
    .end local v4    # "isBetterSize":Z
    .end local v5    # "isDesireRatio":Z
    :cond_3
    const/4 v5, 0x0

    goto :goto_2

    .line 211
    .restart local v5    # "isDesireRatio":Z
    :cond_4
    const/4 v4, 0x0

    goto :goto_3

    .line 218
    .end local v5    # "isDesireRatio":Z
    .end local v7    # "size":Landroid/hardware/Camera$Size;
    :cond_5
    if-nez v0, :cond_6

    .line 219
    const-string/jumbo v9, "Util"

    const-string/jumbo v10, "cannot find the best camera size"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-interface {p0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/hardware/Camera$Size;

    move-object v7, v9

    goto :goto_1

    :cond_6
    move-object v7, v0

    .line 223
    goto :goto_1
.end method

.method public static dumpParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 4
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 236
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v0

    .line 237
    .local v0, "flattened":Ljava/lang/String;
    new-instance v1, Ljava/util/StringTokenizer;

    const-string/jumbo v2, ";"

    invoke-direct {v1, v0, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .local v1, "tokenizer":Ljava/util/StringTokenizer;
    const-string/jumbo v2, "tmp"

    const-string/jumbo v3, "Dump all camera parameters:"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 240
    const-string/jumbo v2, "tmp"

    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 242
    :cond_0
    return-void
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    .line 119
    if-eq p0, p1, :cond_2

    if-nez p0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static gcd(II)I
    .locals 1
    .param p0, "a"    # I
    .param p1, "b"    # I

    .prologue
    .line 227
    :goto_0
    if-eqz p1, :cond_0

    .line 228
    rem-int v0, p0, p1

    .line 229
    .local v0, "tmp":I
    move p0, p1

    .line 230
    move p1, v0

    .line 231
    goto :goto_0

    .line 232
    .end local v0    # "tmp":I
    :cond_0
    return p0
.end method

.method public static getCameraOrientation(I)I
    .locals 2
    .param p0, "cameraId"    # I

    .prologue
    .line 160
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 161
    .local v0, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-static {p0, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 162
    iget v1, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    return v1
.end method

.method public static getCameraPictureRotation(II)I
    .locals 4
    .param p0, "orientation"    # I
    .param p1, "cameraId"    # I

    .prologue
    .line 166
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 167
    .local v0, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 168
    const/4 v1, 0x0

    .line 170
    .local v1, "rotation":I
    add-int/lit8 v2, p0, 0x2d

    div-int/lit8 v2, v2, 0x5a

    mul-int/lit8 p0, v2, 0x5a

    .line 172
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 173
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v2, p0

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v1, v2, 0x168

    .line 178
    :goto_0
    return v1

    .line 175
    :cond_0
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v2, p0

    rem-int/lit16 v1, v2, 0x168

    goto :goto_0
.end method

.method public static getDisplayOrientation(II)I
    .locals 4
    .param p0, "degrees"    # I
    .param p1, "cameraId"    # I

    .prologue
    .line 147
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 148
    .local v0, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 150
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 151
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v2, p0

    rem-int/lit16 v1, v2, 0x168

    .line 152
    .local v1, "result":I
    rsub-int v2, v1, 0x168

    rem-int/lit16 v1, v2, 0x168

    .line 156
    :goto_0
    return v1

    .line 154
    .end local v1    # "result":I
    :cond_0
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v2, p0

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v1, v2, 0x168

    .restart local v1    # "result":I
    goto :goto_0
.end method

.method public static getDisplayRotation(Landroid/app/Activity;)I
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x0

    .line 129
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 130
    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v0

    .line 131
    .local v0, "rotation":I
    packed-switch v0, :pswitch_data_0

    .line 141
    :goto_0
    :pswitch_0
    return v1

    .line 135
    :pswitch_1
    const/16 v1, 0x5a

    goto :goto_0

    .line 137
    :pswitch_2
    const/16 v1, 0xb4

    goto :goto_0

    .line 139
    :pswitch_3
    const/16 v1, 0x10e

    goto :goto_0

    .line 131
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static getOptimalPhotoPictureSize(Landroid/hardware/Camera$Parameters;II)Landroid/hardware/Camera$Size;
    .locals 1
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 186
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/vk/camera/camera1/CameraUtils;->determineBestSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    move-result-object v0

    return-object v0
.end method

.method public static getOptimalPhotoPictureSize4x3(Landroid/hardware/Camera$Parameters;)Landroid/hardware/Camera$Size;
    .locals 3
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 182
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x4

    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Lcom/vk/camera/camera1/CameraUtils;->determineBestSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    move-result-object v0

    return-object v0
.end method

.method public static getOptimalPhotoPreviewSize(Landroid/hardware/Camera$Parameters;)Landroid/hardware/Camera$Size;
    .locals 3
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 190
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x4

    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Lcom/vk/camera/camera1/CameraUtils;->determineBestSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    move-result-object v0

    return-object v0
.end method

.method public static getOptimalVideoPreviewSize(Landroid/hardware/Camera$Parameters;II)Landroid/hardware/Camera$Size;
    .locals 1
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 194
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/vk/camera/camera1/CameraUtils;->determineBestSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    move-result-object v0

    return-object v0
.end method

.method public static isAutoExposureLockSupported(Landroid/hardware/Camera$Parameters;)Z
    .locals 2
    .param p0, "params"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 46
    const-string/jumbo v0, "true"

    const-string/jumbo v1, "auto-exposure-lock-supported"

    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isAutoWhiteBalanceLockSupported(Landroid/hardware/Camera$Parameters;)Z
    .locals 2
    .param p0, "params"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 50
    const-string/jumbo v0, "true"

    const-string/jumbo v1, "auto-whitebalance-lock-supported"

    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isFocusAreaSupported(Landroid/hardware/Camera$Parameters;)Z
    .locals 3
    .param p0, "params"    # Landroid/hardware/Camera$Parameters;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 63
    sget-boolean v1, Lcom/vk/camera/camera1/CameraUtils;->HAS_CAMERA_FOCUS_AREA:Z

    if-eqz v1, :cond_0

    .line 64
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxNumFocusAreas()I

    move-result v1

    if-lez v1, :cond_0

    const-string/jumbo v1, "auto"

    .line 66
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v2

    .line 65
    invoke-static {v1, v2}, Lcom/vk/camera/camera1/CameraUtils;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 68
    :cond_0
    return v0
.end method

.method public static isMeteringAreaSupported(Landroid/hardware/Camera$Parameters;)Z
    .locals 2
    .param p0, "params"    # Landroid/hardware/Camera$Parameters;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 55
    sget-boolean v1, Lcom/vk/camera/camera1/CameraUtils;->HAS_CAMERA_METERING_AREA:Z

    if-eqz v1, :cond_0

    .line 56
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxNumMeteringAreas()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    .line 58
    :cond_0
    return v0
.end method

.method public static isSupported(Ljava/lang/String;Ljava/util/List;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "supported":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 42
    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-interface {p1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static prepareMatrix(Landroid/graphics/Matrix;ZIII)V
    .locals 5
    .param p0, "matrix"    # Landroid/graphics/Matrix;
    .param p1, "mirror"    # Z
    .param p2, "displayOrientation"    # I
    .param p3, "viewWidth"    # I
    .param p4, "viewHeight"    # I

    .prologue
    const/high16 v4, 0x44fa0000    # 2000.0f

    const/high16 v3, 0x40000000    # 2.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v1, -0x40800000    # -1.0f

    .line 256
    if-eqz p1, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {p0, v0, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 257
    invoke-static {}, Lcom/vk/core/util/Device;->isNexus5X()Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 258
    invoke-virtual {p0, v1, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 261
    :cond_0
    int-to-float v0, p2

    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 264
    int-to-float v0, p3

    div-float/2addr v0, v4

    int-to-float v1, p4

    div-float/2addr v1, v4

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 265
    int-to-float v0, p3

    div-float/2addr v0, v3

    int-to-float v1, p4

    div-float/2addr v1, v3

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 267
    return-void

    :cond_1
    move v0, v2

    .line 256
    goto :goto_0
.end method

.method public static rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V
    .locals 1
    .param p0, "rectF"    # Landroid/graphics/RectF;
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 245
    iget v0, p0, Landroid/graphics/RectF;->left:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 246
    iget v0, p0, Landroid/graphics/RectF;->top:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 247
    iget v0, p0, Landroid/graphics/RectF;->right:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 248
    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 249
    return-void
.end method

.method public static rotate(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "b"    # Landroid/graphics/Bitmap;
    .param p1, "degrees"    # I

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/vk/camera/camera1/CameraUtils;->rotateAndMirror(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static rotateAndMirror(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .locals 8
    .param p0, "b"    # Landroid/graphics/Bitmap;
    .param p1, "degrees"    # I
    .param p2, "mirror"    # Z

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    const/4 v2, 0x0

    .line 83
    if-nez p1, :cond_0

    if-eqz p2, :cond_4

    :cond_0
    if-eqz p0, :cond_4

    .line 84
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 87
    .local v5, "m":Landroid/graphics/Matrix;
    if-eqz p2, :cond_2

    .line 88
    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v5, v0, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 89
    add-int/lit16 v0, p1, 0x168

    rem-int/lit16 p1, v0, 0x168

    .line 90
    if-eqz p1, :cond_1

    const/16 v0, 0xb4

    if-ne p1, v0, :cond_5

    .line 91
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v5, v0, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 98
    :cond_2
    :goto_0
    if-eqz p1, :cond_3

    .line 100
    int-to-float v0, p1

    .line 101
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v3

    .line 100
    invoke-virtual {v5, v0, v1, v2}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 105
    :cond_3
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 106
    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    .line 105
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 107
    .local v7, "b2":Landroid/graphics/Bitmap;
    if-eq p0, v7, :cond_4

    .line 108
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    move-object p0, v7

    .line 115
    .end local v5    # "m":Landroid/graphics/Matrix;
    .end local v7    # "b2":Landroid/graphics/Bitmap;
    :cond_4
    :goto_1
    return-object p0

    .line 92
    .restart local v5    # "m":Landroid/graphics/Matrix;
    :cond_5
    const/16 v0, 0x5a

    if-eq p1, v0, :cond_6

    const/16 v0, 0x10e

    if-ne p1, v0, :cond_7

    .line 93
    :cond_6
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v5, v0, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    .line 95
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Invalid degrees="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :catch_0
    move-exception v0

    goto :goto_1
.end method
