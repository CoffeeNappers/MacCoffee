.class Lcom/vk/medianative/AYUVFile;
.super Ljava/lang/Object;
.source "AYUVFile.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "[YUV]"


# instance fields
.field private ayuvPath:Ljava/lang/String;

.field private final overlay:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "overlay"    # Landroid/graphics/Bitmap;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/vk/medianative/AYUVFile;->overlay:Landroid/graphics/Bitmap;

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "overlayFile"    # Ljava/io/File;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 26
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 27
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/medianative/AYUVFile;->overlay:Landroid/graphics/Bitmap;

    .line 28
    return-void
.end method

.method private writeFile(Landroid/graphics/Bitmap;)V
    .locals 22
    .param p1, "overlayBitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    const/4 v14, 0x0

    .line 58
    .local v14, "out":Ljava/io/DataOutputStream;
    :try_start_0
    new-instance v15, Ljava/io/DataOutputStream;

    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/medianative/AYUVFile;->ayuvPath:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v15, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    .end local v14    # "out":Ljava/io/DataOutputStream;
    .local v15, "out":Ljava/io/DataOutputStream;
    const/16 v1, 0x8

    :try_start_1
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 60
    .local v11, "buffer":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v11, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 61
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v11, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 62
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {v11, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 63
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/io/DataOutputStream;->write([B)V

    .line 65
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    mul-int/2addr v1, v3

    new-array v2, v1, [I

    .line 66
    .local v2, "pixels":[I
    const/4 v3, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 68
    const/16 v18, 0x0

    .local v18, "row":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    move/from16 v0, v18

    if-ge v0, v1, :cond_1

    .line 69
    const/4 v12, 0x0

    .local v12, "col":I
    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-ge v12, v1, :cond_0

    .line 70
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    mul-int v1, v1, v18

    add-int/2addr v1, v12

    aget v16, v2, v1

    .line 71
    .local v16, "pixel":I
    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->alpha(I)I

    move-result v9

    .line 72
    .local v9, "a":I
    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->red(I)I

    move-result v17

    .line 73
    .local v17, "r":I
    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->green(I)I

    move-result v13

    .line 74
    .local v13, "g":I
    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->blue(I)I

    move-result v10

    .line 76
    .local v10, "b":I
    const v1, 0x3e839581    # 0.257f

    move/from16 v0, v17

    int-to-float v3, v0

    mul-float/2addr v1, v3

    const v3, 0x3f010625    # 0.504f

    int-to-float v4, v13

    mul-float/2addr v3, v4

    add-float/2addr v1, v3

    const v3, 0x3dc8b439

    int-to-float v4, v10

    mul-float/2addr v3, v4

    add-float/2addr v1, v3

    float-to-int v1, v1

    add-int/lit8 v1, v1, 0x10

    and-int/lit16 v0, v1, 0xff

    move/from16 v21, v0

    .line 77
    .local v21, "y":I
    const v1, -0x41e872b0    # -0.148f

    move/from16 v0, v17

    int-to-float v3, v0

    mul-float/2addr v1, v3

    const v3, 0x3e94fdf4    # 0.291f

    int-to-float v4, v13

    mul-float/2addr v3, v4

    sub-float/2addr v1, v3

    const v3, 0x3ee0c49c    # 0.439f

    int-to-float v4, v10

    mul-float/2addr v3, v4

    add-float/2addr v1, v3

    float-to-int v1, v1

    add-int/lit16 v1, v1, 0x80

    and-int/lit16 v0, v1, 0xff

    move/from16 v19, v0

    .line 78
    .local v19, "u":I
    const v1, 0x3ee0c49c    # 0.439f

    move/from16 v0, v17

    int-to-float v3, v0

    mul-float/2addr v1, v3

    const v3, 0x3ebc6a7f    # 0.368f

    int-to-float v4, v13

    mul-float/2addr v3, v4

    sub-float/2addr v1, v3

    const v3, 0x3d916873    # 0.071f

    int-to-float v4, v10

    mul-float/2addr v3, v4

    sub-float/2addr v1, v3

    float-to-int v1, v1

    add-int/lit16 v1, v1, 0x80

    and-int/lit16 v0, v1, 0xff

    move/from16 v20, v0

    .line 80
    .local v20, "v":I
    invoke-virtual {v15, v9}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 81
    move/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 82
    move/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 83
    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/io/DataOutputStream;->writeByte(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 69
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_1

    .line 68
    .end local v9    # "a":I
    .end local v10    # "b":I
    .end local v13    # "g":I
    .end local v16    # "pixel":I
    .end local v17    # "r":I
    .end local v19    # "u":I
    .end local v20    # "v":I
    .end local v21    # "y":I
    :cond_0
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_0

    .line 87
    .end local v12    # "col":I
    :cond_1
    if-eqz v15, :cond_2

    .line 88
    invoke-virtual {v15}, Ljava/io/DataOutputStream;->close()V

    .line 91
    :cond_2
    return-void

    .line 87
    .end local v2    # "pixels":[I
    .end local v11    # "buffer":Ljava/nio/ByteBuffer;
    .end local v15    # "out":Ljava/io/DataOutputStream;
    .end local v18    # "row":I
    .restart local v14    # "out":Ljava/io/DataOutputStream;
    :catchall_0
    move-exception v1

    :goto_2
    if-eqz v14, :cond_3

    .line 88
    invoke-virtual {v14}, Ljava/io/DataOutputStream;->close()V

    :cond_3
    throw v1

    .line 87
    .end local v14    # "out":Ljava/io/DataOutputStream;
    .restart local v15    # "out":Ljava/io/DataOutputStream;
    :catchall_1
    move-exception v1

    move-object v14, v15

    .end local v15    # "out":Ljava/io/DataOutputStream;
    .restart local v14    # "out":Ljava/io/DataOutputStream;
    goto :goto_2
.end method


# virtual methods
.method create(Ljava/lang/String;)Z
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 40
    :try_start_0
    iput-object p1, p0, Lcom/vk/medianative/AYUVFile;->ayuvPath:Ljava/lang/String;

    .line 41
    iget-object v1, p0, Lcom/vk/medianative/AYUVFile;->overlay:Landroid/graphics/Bitmap;

    invoke-direct {p0, v1}, Lcom/vk/medianative/AYUVFile;->writeFile(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    const/4 v1, 0x1

    .line 46
    :goto_0
    return v1

    .line 43
    :catch_0
    move-exception v0

    .line 44
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "[YUV]"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    const/4 v1, 0x0

    goto :goto_0
.end method

.method delete()V
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vk/medianative/AYUVFile;->ayuvPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vk/medianative/AYUVFile;->ayuvPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 53
    :cond_0
    return-void
.end method

.method getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vk/medianative/AYUVFile;->ayuvPath:Ljava/lang/String;

    return-object v0
.end method
