.class public Lcom/vk/media/camera/CameraUtils;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/camera/CameraUtils$Recorder;,
        Lcom/vk/media/camera/CameraUtils$FrameReader;,
        Lcom/vk/media/camera/CameraUtils$FrameObserver;,
        Lcom/vk/media/camera/CameraUtils$Frame;,
        Lcom/vk/media/camera/CameraUtils$Settings;
    }
.end annotation


# static fields
.field static final DEVICE_MODELS_FLIP_BACK:[Ljava/lang/String;

.field static final DEVICE_MODELS_FLIP_FRONT:[Ljava/lang/String;

.field public static final MEDIA_ERROR:I = 0x3e8

.field public static final MEDIA_ERROR_ENCODER:I = 0x3e9

.field public static final MEDIA_ERROR_EXTRA_AUDIO:I = 0x1

.field public static final MEDIA_ERROR_EXTRA_VIDEO:I = 0x2

.field private static final OUTPUT_FORMAT:I = 0x11

.field private static final PNG_EXT:Ljava/lang/String; = ".png"

.field private static final RENDER_FORMAT:I = 0x4

.field private static final TAG:Ljava/lang/String;

.field private static final YUV_EXT:Ljava/lang/String; = ".yuv"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 28
    const-class v0, Lcom/vk/media/camera/CameraUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/media/camera/CameraUtils;->TAG:Ljava/lang/String;

    .line 30
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "Nexus 6"

    aput-object v1, v0, v2

    const-string/jumbo v1, "Swift 2 X"

    aput-object v1, v0, v3

    sput-object v0, Lcom/vk/media/camera/CameraUtils;->DEVICE_MODELS_FLIP_FRONT:[Ljava/lang/String;

    .line 35
    new-array v0, v3, [Ljava/lang/String;

    const-string/jumbo v1, "Nexus 5X"

    aput-object v1, v0, v2

    sput-object v0, Lcom/vk/media/camera/CameraUtils;->DEVICE_MODELS_FLIP_BACK:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/vk/media/camera/CameraUtils;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private static convertABGRtoARGB(Lcom/vk/media/camera/CameraUtils$Frame;)V
    .locals 12
    .param p0, "frame"    # Lcom/vk/media/camera/CameraUtils$Frame;

    .prologue
    .line 152
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraUtils$Frame;->getWidth()I

    move-result v10

    .line 153
    .local v10, "width":I
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraUtils$Frame;->getHeight()I

    move-result v3

    .line 154
    .local v3, "height":I
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraUtils$Frame;->getPixels()Ljava/nio/IntBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v7

    .line 155
    .local v7, "pixels":[I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 156
    mul-int v8, v4, v10

    .line 157
    .local v8, "position":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    if-ge v5, v10, :cond_0

    .line 158
    aget v6, v7, v8

    .line 160
    .local v6, "p":I
    shr-int/lit8 v11, v6, 0x18

    and-int/lit16 v0, v11, 0xff

    .line 161
    .local v0, "a":I
    shr-int/lit8 v11, v6, 0x10

    and-int/lit16 v1, v11, 0xff

    .line 162
    .local v1, "b":I
    shr-int/lit8 v11, v6, 0x8

    and-int/lit16 v2, v11, 0xff

    .line 163
    .local v2, "g":I
    and-int/lit16 v9, v6, 0xff

    .line 165
    .local v9, "r":I
    invoke-static {v0, v9, v2, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v11

    aput v11, v7, v8

    .line 166
    add-int/lit8 v8, v8, 0x1

    .line 157
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 155
    .end local v0    # "a":I
    .end local v1    # "b":I
    .end local v2    # "g":I
    .end local v6    # "p":I
    .end local v9    # "r":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 169
    .end local v5    # "j":I
    .end local v8    # "position":I
    :cond_1
    return-void
.end method

.method public static dumpFrame(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p0, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 70
    const/4 v0, 0x0

    .line 72
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-eqz v3, :cond_0

    .line 73
    const-string/jumbo v3, ".yuv"

    invoke-static {v3}, Lcom/vk/media/camera/CameraUtils;->getFrameFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, "path":Ljava/lang/String;
    sget-object v3, Lcom/vk/media/camera/CameraUtils;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "save frame to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .local v1, "bos":Ljava/io/BufferedOutputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 77
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v0, v1

    .line 81
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .end local v2    # "path":Ljava/lang/String;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    :cond_0
    if-eqz v0, :cond_1

    .line 83
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 88
    :cond_1
    :goto_0
    return-void

    .line 79
    :catch_0
    move-exception v3

    .line 81
    :goto_1
    if-eqz v0, :cond_1

    .line 83
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 84
    :catch_1
    move-exception v3

    goto :goto_0

    .line 81
    :catchall_0
    move-exception v3

    :goto_2
    if-eqz v0, :cond_2

    .line 83
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 85
    :cond_2
    :goto_3
    throw v3

    .line 84
    :catch_2
    move-exception v3

    goto :goto_0

    :catch_3
    move-exception v4

    goto :goto_3

    .line 81
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v2    # "path":Ljava/lang/String;
    :catchall_1
    move-exception v3

    move-object v0, v1

    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_2

    .line 79
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    :catch_4
    move-exception v3

    move-object v0, v1

    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_1
.end method

.method public static dumpFrame([BII)V
    .locals 13
    .param p0, "data"    # [B
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 91
    new-instance v0, Landroid/graphics/YuvImage;

    const/16 v2, 0x11

    const/4 v5, 0x0

    move-object v1, p0

    move v3, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 92
    .local v0, "yuv":Landroid/graphics/YuvImage;
    new-instance v12, Landroid/graphics/Rect;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v12, v1, v2, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 93
    .local v12, "rect":Landroid/graphics/Rect;
    new-instance v10, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v10}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 94
    .local v10, "output":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x64

    invoke-virtual {v0, v12, v1, v10}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 96
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    .line 97
    .local v6, "byt":[B
    const/4 v8, 0x0

    .line 99
    .local v8, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    const-string/jumbo v1, ".yuv.png"

    invoke-static {v1}, Lcom/vk/media/camera/CameraUtils;->getFrameFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 100
    .local v11, "path":Ljava/lang/String;
    sget-object v1, Lcom/vk/media/camera/CameraUtils;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "save yuv frame to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 102
    .local v7, "file":Ljava/io/File;
    new-instance v9, Ljava/io/FileOutputStream;

    invoke-direct {v9, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .local v9, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {v9, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 104
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 107
    if-eqz v9, :cond_2

    .line 109
    :try_start_2
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v8, v9

    .line 114
    .end local v7    # "file":Ljava/io/File;
    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .end local v11    # "path":Ljava/lang/String;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 110
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "file":Ljava/io/File;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "path":Ljava/lang/String;
    :catch_0
    move-exception v1

    move-object v8, v9

    .line 111
    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 105
    .end local v7    # "file":Ljava/io/File;
    .end local v11    # "path":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 107
    :goto_1
    if-eqz v8, :cond_0

    .line 109
    :try_start_3
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 110
    :catch_2
    move-exception v1

    goto :goto_0

    .line 107
    :catchall_0
    move-exception v1

    :goto_2
    if-eqz v8, :cond_1

    .line 109
    :try_start_4
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 111
    :cond_1
    :goto_3
    throw v1

    .line 110
    :catch_3
    move-exception v2

    goto :goto_3

    .line 107
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "file":Ljava/io/File;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "path":Ljava/lang/String;
    :catchall_1
    move-exception v1

    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 105
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v1

    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    :cond_2
    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method public static dumpFrame([III)V
    .locals 11
    .param p0, "data"    # [I
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v2, 0x0

    .line 117
    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, "bitmap":Landroid/graphics/Bitmap;
    move-object v1, p0

    move v3, p1

    move v4, v2

    move v5, v2

    move v6, p1

    move v7, p2

    .line 118
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 120
    const/4 v8, 0x0

    .line 122
    .local v8, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    const-string/jumbo v1, ".png"

    invoke-static {v1}, Lcom/vk/media/camera/CameraUtils;->getFrameFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 123
    .local v10, "path":Ljava/lang/String;
    sget-object v1, Lcom/vk/media/camera/CameraUtils;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "save rgb frame to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    new-instance v9, Ljava/io/FileOutputStream;

    invoke-direct {v9, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .local v9, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v9}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 129
    if-eqz v9, :cond_0

    .line 130
    :try_start_2
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :cond_0
    move-object v8, v9

    .line 135
    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .end local v10    # "path":Ljava/lang/String;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :cond_1
    :goto_0
    return-void

    .line 132
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v10    # "path":Ljava/lang/String;
    :catch_0
    move-exception v1

    move-object v8, v9

    .line 134
    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 126
    .end local v10    # "path":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 129
    :goto_1
    if-eqz v8, :cond_1

    .line 130
    :try_start_3
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 132
    :catch_2
    move-exception v1

    goto :goto_0

    .line 128
    :catchall_0
    move-exception v1

    .line 129
    :goto_2
    if-eqz v8, :cond_2

    .line 130
    :try_start_4
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 133
    :cond_2
    :goto_3
    throw v1

    .line 132
    :catch_3
    move-exception v2

    goto :goto_3

    .line 128
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v10    # "path":Ljava/lang/String;
    :catchall_1
    move-exception v1

    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 126
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v1

    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method public static getCameraFormat()I
    .locals 1

    .prologue
    .line 52
    const/16 v0, 0x11

    return v0
.end method

.method public static getFrameFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "ext"    # Ljava/lang/String;

    .prologue
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "frame"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFrameSize(III)I
    .locals 8
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "format"    # I

    .prologue
    .line 60
    invoke-static {p2}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    move-result v0

    .line 61
    .local v0, "bitsPerPixel":I
    mul-int v1, p0, p1

    mul-int/2addr v1, v0

    int-to-long v2, v1

    .line 62
    .local v2, "sizeInBits":J
    long-to-double v4, v2

    const-wide/high16 v6, 0x4020000000000000L    # 8.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v1, v4

    add-int/lit8 v1, v1, 0x1

    return v1
.end method

.method public static hasVerticalFlipByModel(Z)Z
    .locals 8
    .param p0, "backCamera"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 323
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 324
    .local v1, "model":Ljava/lang/String;
    if-eqz p0, :cond_2

    .line 325
    sget-object v5, Lcom/vk/media/camera/CameraUtils;->DEVICE_MODELS_FLIP_BACK:[Ljava/lang/String;

    array-length v6, v5

    move v4, v3

    :goto_0
    if-ge v4, v6, :cond_3

    aget-object v0, v5, v4

    .line 326
    .local v0, "mo":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 337
    .end local v0    # "mo":Ljava/lang/String;
    :cond_0
    :goto_1
    return v2

    .line 325
    .restart local v0    # "mo":Ljava/lang/String;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 331
    .end local v0    # "mo":Ljava/lang/String;
    :cond_2
    sget-object v5, Lcom/vk/media/camera/CameraUtils;->DEVICE_MODELS_FLIP_FRONT:[Ljava/lang/String;

    array-length v6, v5

    move v4, v3

    :goto_2
    if-ge v4, v6, :cond_3

    aget-object v0, v5, v4

    .line 332
    .restart local v0    # "mo":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 331
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .end local v0    # "mo":Ljava/lang/String;
    :cond_3
    move v2, v3

    .line 337
    goto :goto_1
.end method

.method public static makeJpeg(Lcom/vk/media/camera/CameraUtils$Frame;)[B
    .locals 6
    .param p0, "frame"    # Lcom/vk/media/camera/CameraUtils$Frame;

    .prologue
    .line 138
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraUtils$Frame;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 139
    invoke-static {p0}, Lcom/vk/media/camera/CameraUtils;->convertABGRtoARGB(Lcom/vk/media/camera/CameraUtils$Frame;)V

    .line 140
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraUtils$Frame;->getPixels()Ljava/nio/IntBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/media/camera/CameraUtils$Frame;->getWidth()I

    move-result v3

    .line 141
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraUtils$Frame;->getHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 140
    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 142
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 143
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 144
    .local v1, "stream":Ljava/io/ByteArrayOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x56

    invoke-virtual {v0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 145
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 148
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "stream":Ljava/io/ByteArrayOutputStream;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static useYUVRender()Z
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x0

    return v0
.end method
