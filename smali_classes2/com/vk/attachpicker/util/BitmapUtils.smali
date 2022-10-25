.class public Lcom/vk/attachpicker/util/BitmapUtils;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/util/BitmapUtils$BitmapSize;
    }
.end annotation


# static fields
.field private static final BITMAP_PAINT:Landroid/graphics/Paint;

.field private static final TAG:Ljava/lang/String; = "BitmapUtils"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 27
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vk/attachpicker/util/BitmapUtils;->BITMAP_PAINT:Landroid/graphics/Paint;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static centerCropBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "image"    # Landroid/graphics/Bitmap;
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/vk/attachpicker/util/BitmapUtils;->centerCropBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static centerCropBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    .locals 11
    .param p0, "image"    # Landroid/graphics/Bitmap;
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "mirror"    # Z

    .prologue
    const/high16 v10, 0x3f000000    # 0.5f

    .line 37
    if-nez p0, :cond_0

    .line 38
    const/4 v3, 0x0

    .line 62
    :goto_0
    return-object v3

    .line 41
    :cond_0
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 42
    .local v3, "resultBitmap":Landroid/graphics/Bitmap;
    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 43
    .local v4, "resultCanvas":Landroid/graphics/Canvas;
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 45
    .local v2, "matrix":Landroid/graphics/Matrix;
    int-to-float v8, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    int-to-float v9, v9

    div-float v6, v8, v9

    .line 46
    .local v6, "scaleX":F
    int-to-float v8, p2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float v7, v8, v9

    .line 48
    .local v7, "scaleY":F
    cmpl-float v8, v7, v6

    if-lez v8, :cond_1

    .line 49
    move v5, v7

    .line 50
    .local v5, "scale":F
    int-to-float v8, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v5

    sub-float/2addr v8, v9

    mul-float v0, v8, v10

    .line 51
    .local v0, "dx":F
    const/4 v1, 0x0

    .line 57
    .local v1, "dy":F
    :goto_1
    if-eqz p3, :cond_2

    const/4 v8, -0x1

    :goto_2
    int-to-float v8, v8

    mul-float/2addr v8, v5

    invoke-virtual {v2, v8, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 58
    add-float v8, v0, v10

    float-to-int v8, v8

    int-to-float v8, v8

    add-float v9, v1, v10

    float-to-int v9, v9

    int-to-float v9, v9

    invoke-virtual {v2, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 60
    sget-object v8, Lcom/vk/attachpicker/util/BitmapUtils;->BITMAP_PAINT:Landroid/graphics/Paint;

    invoke-virtual {v4, p0, v2, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 53
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    .end local v5    # "scale":F
    :cond_1
    move v5, v6

    .line 54
    .restart local v5    # "scale":F
    const/4 v0, 0x0

    .line 55
    .restart local v0    # "dx":F
    int-to-float v8, p2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v5

    sub-float/2addr v8, v9

    mul-float v1, v8, v10

    .restart local v1    # "dy":F
    goto :goto_1

    .line 57
    :cond_2
    const/4 v8, 0x1

    goto :goto_2
.end method

.method public static decodeBitmapFromContentUri(Landroid/content/ContentResolver;Landroid/net/Uri;I)Landroid/graphics/Bitmap;
    .locals 16
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "MAX_DIM"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 92
    const/4 v14, 0x0

    new-array v2, v14, [B

    .line 93
    .local v2, "byteArr":[B
    const/16 v14, 0x400

    new-array v1, v14, [B

    .line 95
    .local v1, "buffer":[B
    const/4 v3, 0x0

    .line 99
    .local v3, "count":I
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "file"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 100
    new-instance v5, Ljava/io/FileInputStream;

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x7

    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v5, v14}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 104
    .local v5, "inputStream":Ljava/io/InputStream;
    :cond_0
    :goto_0
    invoke-virtual {v5, v1}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .local v7, "len":I
    const/4 v14, -0x1

    if-le v7, v14, :cond_3

    .line 105
    if-eqz v7, :cond_0

    .line 106
    add-int v14, v3, v7

    array-length v15, v2

    if-le v14, v15, :cond_1

    .line 107
    add-int v14, v3, v7

    mul-int/lit8 v14, v14, 0x2

    new-array v8, v14, [B

    .line 108
    .local v8, "newbuf":[B
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v2, v14, v8, v15, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 109
    move-object v2, v8

    .line 112
    .end local v8    # "newbuf":[B
    :cond_1
    const/4 v14, 0x0

    invoke-static {v1, v14, v2, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 113
    add-int/2addr v3, v7

    goto :goto_0

    .line 102
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v7    # "len":I
    :cond_2
    invoke-virtual/range {p0 .. p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5

    .restart local v5    # "inputStream":Ljava/io/InputStream;
    goto :goto_0

    .line 116
    .restart local v7    # "len":I
    :cond_3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 118
    new-instance v9, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v9}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 119
    .local v9, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v14, 0x1

    iput-boolean v14, v9, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 120
    const/4 v14, 0x0

    invoke-static {v2, v14, v3, v9}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 123
    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 124
    .local v11, "origWidth":I
    iget v10, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 125
    .local v10, "origHeight":I
    move/from16 v0, p2

    if-gt v11, v0, :cond_4

    move/from16 v0, p2

    if-le v10, v0, :cond_6

    .line 126
    :cond_4
    const/4 v6, 0x1

    .line 127
    .local v6, "k":I
    move v12, v10

    .local v12, "tmpHeight":I
    move v13, v11

    .line 129
    .local v13, "tmpWidth":I
    :cond_5
    div-int/lit8 v13, v13, 0x2

    .line 130
    div-int/lit8 v12, v12, 0x2

    .line 131
    mul-int/lit8 v6, v6, 0x2

    .line 132
    div-int/lit8 v14, v13, 0x2

    move/from16 v0, p2

    if-ge v14, v0, :cond_5

    div-int/lit8 v14, v12, 0x2

    move/from16 v0, p2

    if-ge v14, v0, :cond_5

    .line 133
    iput v6, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 138
    .end local v6    # "k":I
    .end local v12    # "tmpHeight":I
    .end local v13    # "tmpWidth":I
    :goto_1
    const/4 v14, 0x0

    iput-boolean v14, v9, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 139
    sget-object v14, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v14, v9, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 141
    const/4 v14, 0x0

    invoke-static {v2, v14, v3, v9}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v14

    .line 145
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v7    # "len":I
    .end local v9    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v10    # "origHeight":I
    .end local v11    # "origWidth":I
    :goto_2
    return-object v14

    .line 135
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "len":I
    .restart local v9    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v10    # "origHeight":I
    .restart local v11    # "origWidth":I
    :cond_6
    const/4 v14, 0x1

    iput v14, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 143
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v7    # "len":I
    .end local v9    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v10    # "origHeight":I
    .end local v11    # "origWidth":I
    :catch_0
    move-exception v4

    .line 145
    .local v4, "e":Ljava/lang/Throwable;
    const/4 v14, 0x0

    goto :goto_2
.end method

.method public static decodeBitmapFromContentUri(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 151
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "file"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 152
    new-instance v0, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 156
    .local v0, "inputStream":Ljava/io/InputStream;
    :goto_0
    const/4 v1, 0x0

    invoke-static {v0, v1, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1

    .line 154
    .end local v0    # "inputStream":Ljava/io/InputStream;
    :cond_0
    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    .restart local v0    # "inputStream":Ljava/io/InputStream;
    goto :goto_0
.end method

.method public static getAspectRatio(Landroid/graphics/Bitmap;)F
    .locals 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 233
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 234
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 236
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    goto :goto_0
.end method

.method public static getBitmapFromAsset(Ljava/lang/String;Landroid/app/Activity;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "strName"    # Ljava/lang/String;
    .param p1, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    invoke-virtual {p1}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 225
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    invoke-virtual {v0, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 226
    .local v2, "istr":Ljava/io/InputStream;
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 227
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 229
    return-object v1
.end method

.method public static processCameraBitmap([BZ)Landroid/graphics/Bitmap;
    .locals 6
    .param p0, "jpegData"    # [B
    .param p1, "mirror"    # Z

    .prologue
    const/16 v5, 0x500

    .line 66
    const/4 v3, 0x0

    array-length v4, p0

    invoke-static {p0, v3, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 68
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_3

    invoke-static {}, Lcom/vk/core/util/Device;->isLenovoK900()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 69
    const/16 v2, 0x10e

    .line 73
    .local v2, "rotation":I
    :goto_0
    if-eqz v0, :cond_0

    .line 74
    move-object v1, v0

    .line 75
    .local v1, "oldBitmap":Landroid/graphics/Bitmap;
    invoke-static {v0, v2, p1}, Lcom/vk/attachpicker/util/BitmapUtils;->rotateBitmap(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 76
    if-eq v0, v1, :cond_0

    .line 77
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 80
    .end local v1    # "oldBitmap":Landroid/graphics/Bitmap;
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    if-gt v3, v5, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-le v3, v5, :cond_2

    .line 81
    :cond_1
    move-object v1, v0

    .line 82
    .restart local v1    # "oldBitmap":Landroid/graphics/Bitmap;
    const/4 v3, 0x1

    invoke-static {v0, v5, v3}, Lcom/vk/attachpicker/util/BitmapUtils;->scaleBitmap(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 83
    if-eq v0, v1, :cond_2

    .line 84
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 87
    .end local v1    # "oldBitmap":Landroid/graphics/Bitmap;
    :cond_2
    return-object v0

    .line 71
    .end local v2    # "rotation":I
    :cond_3
    invoke-static {p0}, Lcom/vk/core/util/Exif;->getOrientation([B)I

    move-result v2

    .restart local v2    # "rotation":I
    goto :goto_0
.end method

.method public static rotateBitmap(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .locals 11
    .param p0, "original"    # Landroid/graphics/Bitmap;
    .param p1, "angle"    # I
    .param p2, "mirror"    # Z

    .prologue
    const/4 v10, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    .line 160
    if-nez p0, :cond_1

    .line 161
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string/jumbo v1, "BitmapUtils"

    aput-object v1, v0, v9

    const-string/jumbo v1, "Image cannot be rotated, because it\'s null"

    aput-object v1, v0, v10

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 162
    const/4 p0, 0x0

    .line 178
    .end local p0    # "original":Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    return-object p0

    .line 165
    .restart local p0    # "original":Landroid/graphics/Bitmap;
    :cond_1
    if-nez p1, :cond_2

    if-eqz p2, :cond_0

    .line 169
    :cond_2
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 170
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v0, p1

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 171
    if-eqz p2, :cond_3

    const/high16 v0, -0x40800000    # -1.0f

    :goto_1
    invoke-virtual {v5, v0, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 174
    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .local v7, "result":Landroid/graphics/Bitmap;
    move-object p0, v7

    .line 175
    goto :goto_0

    .end local v7    # "result":Landroid/graphics/Bitmap;
    :cond_3
    move v0, v1

    .line 171
    goto :goto_1

    .line 176
    :catch_0
    move-exception v8

    .line 177
    .local v8, "throwable":Ljava/lang/Throwable;
    new-array v0, v10, [Ljava/lang/Object;

    const-string/jumbo v1, "BitmapUtils"

    aput-object v1, v0, v9

    invoke-static {v8, v0}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static scaleBitmap(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .locals 10
    .param p0, "original"    # Landroid/graphics/Bitmap;
    .param p1, "desiredRes"    # I
    .param p2, "fast"    # Z

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 183
    if-nez p0, :cond_0

    .line 184
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const-string/jumbo v6, "BitmapUtils"

    aput-object v6, v5, v9

    const-string/jumbo v6, "Image cannot be resized, because it\'s null"

    aput-object v6, v5, v8

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 185
    const/4 v0, 0x0

    .line 206
    :goto_0
    return-object v0

    .line 188
    :cond_0
    int-to-float v5, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float v3, v5, v6

    .line 189
    .local v3, "scaleW":F
    int-to-float v5, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float v2, v5, v6

    .line 190
    .local v2, "scaleH":F
    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 195
    .local v1, "scale":F
    if-eqz p2, :cond_1

    .line 196
    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v1

    float-to-int v5, v5

    .line 197
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    float-to-int v6, v6

    const/4 v7, 0x1

    .line 196
    invoke-static {p0, v5, v6, v7}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, "result":Landroid/graphics/Bitmap;
    goto :goto_0

    .line 199
    .end local v0    # "result":Landroid/graphics/Bitmap;
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v1

    float-to-int v5, v5

    .line 200
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    float-to-int v6, v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 199
    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 201
    .restart local v0    # "result":Landroid/graphics/Bitmap;
    invoke-static {p0, v0}, Lcom/vk/attachpicker/jni/Native;->resizeBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 204
    .end local v0    # "result":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v4

    .line 205
    .local v4, "throwable":Ljava/lang/Throwable;
    new-array v5, v8, [Ljava/lang/Object;

    const-string/jumbo v6, "BitmapUtils"

    aput-object v6, v5, v9

    invoke-static {v4, v5}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    move-object v0, p0

    .line 206
    goto :goto_0
.end method
