.class public Lcom/vkontakte/android/audio/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final DIR_ANDROID:Ljava/lang/String; = "Android"

.field private static final DIR_DATA:Ljava/lang/String; = "data"

.field private static final DIR_FILES:Ljava/lang/String; = "files"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs buildPath(ZLjava/io/File;[Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .param p0, "mkdirs"    # Z
    .param p1, "base"    # Ljava/io/File;
    .param p2, "segments"    # [Ljava/lang/String;

    .prologue
    .line 398
    move-object v0, p1

    .line 399
    .local v0, "cur":Ljava/io/File;
    array-length v4, p2

    const/4 v3, 0x0

    move-object v1, v0

    .end local v0    # "cur":Ljava/io/File;
    .local v1, "cur":Ljava/io/File;
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v2, p2, v3

    .line 400
    .local v2, "segment":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 401
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 399
    .end local v1    # "cur":Ljava/io/File;
    .restart local v0    # "cur":Ljava/io/File;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    move-object v1, v0

    .end local v0    # "cur":Ljava/io/File;
    .restart local v1    # "cur":Ljava/io/File;
    goto :goto_0

    .line 402
    :cond_0
    if-eqz v2, :cond_3

    .line 403
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .end local v1    # "cur":Ljava/io/File;
    .restart local v0    # "cur":Ljava/io/File;
    goto :goto_1

    .line 406
    .end local v0    # "cur":Ljava/io/File;
    .end local v2    # "segment":Ljava/lang/String;
    .restart local v1    # "cur":Ljava/io/File;
    :cond_1
    if-eqz p0, :cond_2

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    .line 407
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 409
    :cond_2
    return-object v1

    .restart local v2    # "segment":Ljava/lang/String;
    :cond_3
    move-object v0, v1

    .end local v1    # "cur":Ljava/io/File;
    .restart local v0    # "cur":Ljava/io/File;
    goto :goto_1
.end method

.method public static byteArrayToHex([B)Ljava/lang/String;
    .locals 8
    .param p0, "data"    # [B

    .prologue
    const/16 v7, 0xa

    .line 228
    array-length v5, p0

    mul-int/lit8 v5, v5, 0x2

    new-array v3, v5, [C

    .line 229
    .local v3, "chars":[C
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, p0

    if-ge v4, v5, :cond_2

    .line 230
    aget-byte v0, p0, v4

    .line 231
    .local v0, "b":I
    ushr-int/lit8 v5, v0, 0x4

    and-int/lit8 v1, v5, 0xf

    .line 232
    .local v1, "b1":I
    and-int/lit8 v2, v0, 0xf

    .line 233
    .local v2, "b2":I
    mul-int/lit8 v6, v4, 0x2

    if-ge v1, v7, :cond_0

    add-int/lit8 v5, v1, 0x30

    :goto_1
    int-to-char v5, v5

    aput-char v5, v3, v6

    .line 234
    mul-int/lit8 v5, v4, 0x2

    add-int/lit8 v6, v5, 0x1

    if-ge v2, v7, :cond_1

    add-int/lit8 v5, v2, 0x30

    :goto_2
    int-to-char v5, v5

    aput-char v5, v3, v6

    .line 229
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 233
    :cond_0
    add-int/lit8 v5, v1, -0xa

    add-int/lit8 v5, v5, 0x61

    goto :goto_1

    .line 234
    :cond_1
    add-int/lit8 v5, v2, -0xa

    add-int/lit8 v5, v5, 0x61

    goto :goto_2

    .line 237
    .end local v0    # "b":I
    .end local v1    # "b1":I
    .end local v2    # "b2":I
    :cond_2
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v3}, Ljava/lang/String;-><init>([C)V

    return-object v5
.end method

.method public static calcDimensions(Landroid/graphics/Rect;IIZLandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 8
    .param p0, "areaRect"    # Landroid/graphics/Rect;
    .param p1, "pictureWidth"    # I
    .param p2, "pictureHeight"    # I
    .param p3, "clip"    # Z
    .param p4, "outRect"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v7, 0x40000000    # 2.0f

    .line 187
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v4, v5

    .line 188
    .local v4, "w1":F
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v1, v5

    .line 189
    .local v1, "h1":F
    int-to-float v5, p1

    int-to-float v6, p2

    div-float/2addr v5, v6

    div-float v6, v4, v1

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2

    const/4 v2, 0x1

    .line 191
    .local v2, "isNarrow":Z
    :goto_0
    if-eqz v2, :cond_0

    if-nez p3, :cond_1

    :cond_0
    if-nez v2, :cond_3

    if-nez p3, :cond_3

    .line 192
    :cond_1
    iget v5, p0, Landroid/graphics/Rect;->top:I

    iput v5, p4, Landroid/graphics/Rect;->top:I

    .line 193
    iget v5, p0, Landroid/graphics/Rect;->bottom:I

    iput v5, p4, Landroid/graphics/Rect;->bottom:I

    .line 194
    int-to-float v5, p2

    div-float v5, v1, v5

    int-to-float v6, p1

    mul-float v3, v5, v6

    .line 195
    .local v3, "w":F
    iget v5, p0, Landroid/graphics/Rect;->left:I

    iget v6, p0, Landroid/graphics/Rect;->right:I

    add-int/2addr v5, v6

    int-to-float v5, v5

    sub-float/2addr v5, v3

    div-float/2addr v5, v7

    float-to-int v5, v5

    iput v5, p4, Landroid/graphics/Rect;->left:I

    .line 196
    iget v5, p4, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    add-float/2addr v5, v3

    float-to-int v5, v5

    iput v5, p4, Landroid/graphics/Rect;->right:I

    .line 205
    .end local v3    # "w":F
    :goto_1
    return-object p4

    .line 189
    .end local v2    # "isNarrow":Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 198
    .restart local v2    # "isNarrow":Z
    :cond_3
    iget v5, p0, Landroid/graphics/Rect;->left:I

    iput v5, p4, Landroid/graphics/Rect;->left:I

    .line 199
    iget v5, p0, Landroid/graphics/Rect;->right:I

    iput v5, p4, Landroid/graphics/Rect;->right:I

    .line 200
    int-to-float v5, p1

    div-float v5, v4, v5

    int-to-float v6, p2

    mul-float v0, v5, v6

    .line 201
    .local v0, "h":F
    iget v5, p0, Landroid/graphics/Rect;->top:I

    iget v6, p0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    int-to-float v5, v5

    sub-float/2addr v5, v0

    div-float/2addr v5, v7

    float-to-int v5, v5

    iput v5, p4, Landroid/graphics/Rect;->top:I

    .line 202
    iget v5, p4, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    add-float/2addr v5, v0

    float-to-int v5, v5

    iput v5, p4, Landroid/graphics/Rect;->bottom:I

    goto :goto_1
.end method

.method public static checkedCast(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 103
    return-object p0
.end method

.method public static closeCloseable(Ljava/io/Closeable;)V
    .locals 5
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 124
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IncompatibleClassChangeError; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :goto_0
    return-void

    .line 127
    :catch_0
    move-exception v0

    .line 129
    .local v0, "e":Ljava/lang/IncompatibleClassChangeError;
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string/jumbo v3, "close"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_0

    .line 130
    :catch_1
    move-exception v1

    .line 131
    .local v1, "e2":Ljava/lang/Exception;
    :goto_1
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 125
    .end local v0    # "e":Ljava/lang/IncompatibleClassChangeError;
    .end local v1    # "e2":Ljava/lang/Exception;
    :catch_2
    move-exception v2

    goto :goto_0

    .line 132
    .restart local v0    # "e":Ljava/lang/IncompatibleClassChangeError;
    :catch_3
    move-exception v2

    goto :goto_0

    .line 130
    :catch_4
    move-exception v1

    goto :goto_1

    :catch_5
    move-exception v1

    goto :goto_1
.end method

.method public static compareIntegers(II)I
    .locals 1
    .param p0, "lhs"    # I
    .param p1, "rhs"    # I

    .prologue
    .line 183
    if-ge p0, p1, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    if-ne p0, p1, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static concatArrays_(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p0, "dst"    # Ljava/lang/Object;
    .param p1, "arrays"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 171
    const/4 v0, 0x0

    .line 172
    .local v0, "i":I
    array-length v5, p1

    move v3, v4

    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v2, p1, v3

    .line 173
    .local v2, "src":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 174
    invoke-static {v2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    .line 175
    .local v1, "length":I
    invoke-static {v2, v4, p0, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 176
    add-int/2addr v0, v1

    .line 172
    .end local v1    # "length":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 179
    .end local v2    # "src":Ljava/lang/Object;
    :cond_1
    return-object p0
.end method

.method public static varargs concatStringArrays([[Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p0, "arrays"    # [[Ljava/lang/String;

    .prologue
    .line 157
    move-object v0, p0

    check-cast v0, [[Ljava/lang/Object;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->getArraysLength([[Ljava/lang/Object;)I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/vkontakte/android/audio/utils/Utils;->concatArrays_(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public static createAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "group"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".action."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static createExtra(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "group"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".extra."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static doXor([BIIJ)V
    .locals 11
    .param p0, "buff"    # [B
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "pos"    # J

    .prologue
    .line 280
    move v0, p1

    .local v0, "i":I
    move-wide v2, p3

    .end local p3    # "pos":J
    .local v2, "pos":J
    :goto_0
    add-int v1, p2, p1

    if-ge v0, v1, :cond_0

    .line 281
    aget-byte v1, p0, v0

    int-to-long v4, v1

    const-wide/16 v6, 0xd

    const-wide/16 v8, 0x1

    add-long p3, v2, v8

    .end local v2    # "pos":J
    .restart local p3    # "pos":J
    const-wide/16 v8, 0x11

    mul-long/2addr v8, v2

    add-long/2addr v6, v8

    const-wide/16 v8, 0xff

    and-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v1, v4

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 280
    add-int/lit8 v0, v0, 0x1

    move-wide v2, p3

    .end local p3    # "pos":J
    .restart local v2    # "pos":J
    goto :goto_0

    .line 283
    :cond_0
    return-void
.end method

.method public static doXor([BIJ)V
    .locals 2
    .param p0, "buff"    # [B
    .param p1, "len"    # I
    .param p2, "pos"    # J

    .prologue
    .line 276
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, p2, p3}, Lcom/vkontakte/android/audio/utils/Utils;->doXor([BIIJ)V

    .line 277
    return-void
.end method

.method public static encryptSHA(Ljava/lang/String;)[B
    .locals 2
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 241
    const-string/jumbo v0, "SHA"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static equalsStringsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "str2"    # Ljava/lang/String;

    .prologue
    .line 262
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v0, "com.vkontakte.android"

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/vkontakte/android/audio/utils/Utils;->createAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v0, "com.vkontakte.android"

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/vkontakte/android/audio/utils/Utils;->createExtra(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAlarmManager(Landroid/content/Context;)Landroid/app/AlarmManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 88
    const-string/jumbo v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    return-object v0
.end method

.method private static varargs getArraysLength([[Ljava/lang/Object;)I
    .locals 5
    .param p0, "arrays"    # [[Ljava/lang/Object;

    .prologue
    .line 161
    const/4 v1, 0x0

    .line 162
    .local v1, "len":I
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, p0, v2

    .line 163
    .local v0, "array":[Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 164
    array-length v4, v0

    add-int/2addr v1, v4

    .line 162
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 166
    .end local v0    # "array":[Ljava/lang/Object;
    :cond_1
    return v1
.end method

.method public static getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 76
    const-string/jumbo v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    return-object v0
.end method

.method public static getConnectivityManager(Landroid/content/Context;)Landroid/net/ConnectivityManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 84
    const-string/jumbo v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    return-object v0
.end method

.method public static getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resId"    # I

    .prologue
    .line 210
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 211
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 213
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method

.method public static getExternalFilesDirs(Landroid/content/Context;Ljava/lang/String;)[Ljava/io/File;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 325
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-lt v3, v4, :cond_1

    .line 326
    invoke-virtual {p0, p1}, Landroid/content/Context;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v0

    .line 344
    :cond_0
    :goto_0
    return-object v0

    .line 328
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/audio/utils/Utils;->getExternalFilesDirsOld()[Ljava/io/File;

    move-result-object v0

    .line 329
    .local v0, "files":[Ljava/io/File;
    array-length v3, v0

    if-le v3, v6, :cond_2

    .line 330
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 331
    aget-object v3, v0, v1

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const-string/jumbo v5, "Android"

    aput-object v5, v4, v7

    const-string/jumbo v5, "data"

    aput-object v5, v4, v6

    .line 332
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    const-string/jumbo v5, "files"

    aput-object v5, v4, v9

    aput-object p1, v4, v10

    .line 331
    invoke-static {v6, v3, v4}, Lcom/vkontakte/android/audio/utils/Utils;->buildPath(ZLjava/io/File;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    aput-object v3, v0, v1

    .line 330
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 338
    .end local v1    # "i":I
    :cond_2
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x8

    if-lt v3, v4, :cond_3

    .line 339
    invoke-virtual {p0, p1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 344
    .local v2, "single":Ljava/io/File;
    :goto_2
    new-array v0, v6, [Ljava/io/File;

    .end local v0    # "files":[Ljava/io/File;
    aput-object v2, v0, v7

    goto :goto_0

    .line 341
    .end local v2    # "single":Ljava/io/File;
    .restart local v0    # "files":[Ljava/io/File;
    :cond_3
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const-string/jumbo v5, "Android"

    aput-object v5, v4, v7

    const-string/jumbo v5, "data"

    aput-object v5, v4, v6

    .line 342
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    const-string/jumbo v5, "files"

    aput-object v5, v4, v9

    aput-object p1, v4, v10

    .line 341
    invoke-static {v6, v3, v4}, Lcom/vkontakte/android/audio/utils/Utils;->buildPath(ZLjava/io/File;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .restart local v2    # "single":Ljava/io/File;
    goto :goto_2
.end method

.method public static getExternalFilesDirsOld()[Ljava/io/File;
    .locals 16

    .prologue
    const/4 v15, 0x0

    .line 349
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 350
    .local v11, "storagePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v13

    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 351
    .local v2, "extStorage":Ljava/lang/String;
    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 353
    :try_start_0
    new-instance v9, Ljava/io/BufferedReader;

    new-instance v13, Ljava/io/FileReader;

    const-string/jumbo v14, "/proc/mounts"

    invoke-direct {v13, v14}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v13}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 355
    .local v9, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 356
    .local v0, "aliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 357
    .local v10, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 358
    .local v1, "extDevice":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .local v7, "line":Ljava/lang/String;
    if-eqz v7, :cond_5

    .line 359
    const-string/jumbo v13, "/mnt"

    invoke-virtual {v7, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_1

    const-string/jumbo v13, "/storage"

    invoke-virtual {v7, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_1

    const-string/jumbo v13, "/sdcard"

    invoke-virtual {v7, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_0

    :cond_1
    const-string/jumbo v13, "asec"

    invoke-virtual {v7, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    const-string/jumbo v13, "tmpfs"

    invoke-virtual {v7, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    const-string/jumbo v13, "none"

    invoke-virtual {v7, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 362
    const-string/jumbo v13, " "

    invoke-virtual {v7, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 363
    .local v6, "info":[Ljava/lang/String;
    const/4 v13, 0x0

    aget-object v13, v6, v13

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 364
    const/4 v13, 0x0

    aget-object v13, v6, v13

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    :cond_2
    const/4 v13, 0x0

    aget-object v13, v6, v13

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/ArrayList;

    const/4 v14, 0x1

    aget-object v14, v6, v14

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 367
    const/4 v13, 0x1

    aget-object v13, v6, v13

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 368
    const/4 v13, 0x0

    aget-object v1, v6, v13

    .line 370
    :cond_3
    const/4 v13, 0x1

    aget-object v13, v6, v13

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 391
    .end local v0    # "aliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v1    # "extDevice":Ljava/lang/String;
    .end local v6    # "info":[Ljava/lang/String;
    .end local v7    # "line":Ljava/lang/String;
    .end local v9    # "reader":Ljava/io/BufferedReader;
    .end local v10    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v12

    .line 392
    .local v12, "x":Ljava/lang/Exception;
    new-array v13, v15, [Ljava/lang/Object;

    invoke-static {v12, v13}, Lcom/vkontakte/android/utils/L;->w(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 393
    new-array v4, v15, [Ljava/io/File;

    .end local v12    # "x":Ljava/lang/Exception;
    :cond_4
    return-object v4

    .line 373
    .restart local v0    # "aliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v1    # "extDevice":Ljava/lang/String;
    .restart local v7    # "line":Ljava/lang/String;
    .restart local v9    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_5
    :try_start_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V

    .line 374
    if-eqz v1, :cond_7

    .line 376
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Collection;

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 378
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_6
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_7

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 379
    .local v8, "path":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 380
    .local v3, "f":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->canWrite()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 383
    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 386
    .end local v3    # "f":Ljava/io/File;
    .end local v8    # "path":Ljava/lang/String;
    :cond_7
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v13

    new-array v4, v13, [Ljava/io/File;

    .line 387
    .local v4, "files":[Ljava/io/File;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    array-length v13, v4

    if-ge v5, v13, :cond_4

    .line 388
    new-instance v14, Ljava/io/File;

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-direct {v14, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    aput-object v14, v4, v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 387
    add-int/lit8 v5, v5, 0x1

    goto :goto_2
.end method

.method public static getMaxCoverSize()I
    .locals 3

    .prologue
    .line 51
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v1, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 52
    .local v1, "width":I
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 53
    .local v0, "height":I
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    return v2
.end method

.method public static getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    const-string/jumbo v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    return-object v0
.end method

.method public static getPowerManager(Landroid/content/Context;)Landroid/os/PowerManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 92
    const-string/jumbo v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    return-object v0
.end method

.method public static getTelephonyManager(Landroid/content/Context;)Landroid/telephony/TelephonyManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 80
    const-string/jumbo v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    return-object v0
.end method

.method public static isNetworkAvailable(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 96
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->getConnectivityManager(Landroid/content/Context;)Landroid/net/ConnectivityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 98
    .local v0, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isSdCardPath(Ljava/io/File;)Z
    .locals 1
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 258
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->isSdCardPath(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isSdCardPath(Ljava/lang/String;)Z
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 246
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 247
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/os/Environment;->isExternalStorageRemovable(Ljava/io/File;)Z

    move-result v1

    .line 254
    :goto_0
    return v1

    .line 248
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 249
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 251
    :catch_0
    move-exception v0

    .line 252
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 254
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "SD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    goto :goto_0
.end method

.method public static moveItemInList(Ljava/util/List;II)V
    .locals 2
    .param p1, "indexFrom"    # I
    .param p2, "indexTo"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;II)V"
        }
    .end annotation

    .prologue
    .line 266
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    if-le p2, p1, :cond_0

    .line 267
    move v0, p1

    .local v0, "index":I
    :goto_0
    if-ge v0, p2, :cond_1

    .line 268
    add-int/lit8 v1, v0, 0x1

    invoke-static {p0, v0, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 267
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 269
    .end local v0    # "index":I
    :cond_0
    if-ge p2, p1, :cond_1

    .line 270
    move v0, p1

    .restart local v0    # "index":I
    :goto_1
    if-le v0, p2, :cond_1

    .line 271
    add-int/lit8 v1, v0, -0x1

    invoke-static {p0, v0, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 270
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 273
    .end local v0    # "index":I
    :cond_1
    return-void
.end method

.method public static varargs objectToString(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "parameters"    # [Ljava/lang/Object;

    .prologue
    .line 139
    array-length v2, p1

    rem-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_0

    .line 140
    new-instance v2, Ljava/security/InvalidParameterException;

    const-string/jumbo v3, "Number of parameters must be even"

    invoke-direct {v2, v3}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 142
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string/jumbo v2, "["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_2

    .line 145
    aget-object v2, p1, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 146
    const/16 v2, 0x3d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 147
    add-int/lit8 v2, v1, 0x1

    aget-object v2, p1, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 148
    array-length v2, p1

    add-int/lit8 v2, v2, -0x2

    if-ge v1, v2, :cond_1

    .line 149
    const-string/jumbo v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    :cond_1
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 151
    :cond_2
    const-string/jumbo v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static openLink(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 413
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 414
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 415
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 416
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 418
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public static prepareBitmapForCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "bmp"    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 58
    if-nez p0, :cond_1

    .line 59
    const/4 p0, 0x0

    .line 67
    .end local p0    # "bmp":Landroid/graphics/Bitmap;
    .local v0, "maxImageSize":I
    :cond_0
    :goto_0
    return-object p0

    .line 62
    .end local v0    # "maxImageSize":I
    .restart local p0    # "bmp":Landroid/graphics/Bitmap;
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/audio/utils/Utils;->getMaxCoverSize()I

    move-result v0

    .line 63
    .restart local v0    # "maxImageSize":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-gt v1, v0, :cond_2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-le v1, v0, :cond_0

    .line 65
    :cond_2
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x1

    .line 64
    invoke-static {p0, v1, v2, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0
.end method

.method public static replaceFile(Ljava/io/File;Ljava/io/File;Z)V
    .locals 1
    .param p0, "from"    # Ljava/io/File;
    .param p1, "to"    # Ljava/io/File;
    .param p2, "useXor"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 286
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/vkontakte/android/audio/utils/Utils;->replaceFile(Ljava/io/File;Ljava/io/File;ZLcom/vkontakte/android/functions/VoidF2;)V

    .line 287
    return-void
.end method

.method public static replaceFile(Ljava/io/File;Ljava/io/File;ZLcom/vkontakte/android/functions/VoidF2;)V
    .locals 12
    .param p0, "from"    # Ljava/io/File;
    .param p1, "to"    # Ljava/io/File;
    .param p2, "useXor"    # Z
    .param p3    # Lcom/vkontakte/android/functions/VoidF2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/io/File;",
            "Z",
            "Lcom/vkontakte/android/functions/VoidF2",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p3, "progressFunc":Lcom/vkontakte/android/functions/VoidF2;, "Lcom/vkontakte/android/functions/VoidF2<Ljava/lang/Long;Ljava/lang/Long;>;"
    const/4 v11, 0x0

    .line 290
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 291
    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const-string/jumbo v9, "vk"

    aput-object v9, v8, v11

    const/4 v9, 0x1

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    const-string/jumbo v10, "->"

    aput-object v10, v8, v9

    const/4 v9, 0x3

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v8}, Lcom/vkontakte/android/utils/L;->i([Ljava/lang/Object;)V

    .line 292
    const/16 v8, 0x2800

    new-array v0, v8, [B

    .line 294
    .local v0, "buf":[B
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 295
    .local v1, "in":Ljava/io/FileInputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 297
    .local v4, "out":Ljava/io/FileOutputStream;
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    .line 299
    .local v2, "fileSize":J
    if-eqz p3, :cond_0

    .line 300
    const-wide/16 v8, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {p3, v8, v9}, Lcom/vkontakte/android/functions/VoidF2;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 303
    :cond_0
    const-wide/16 v6, 0x0

    .line 304
    .local v6, "pos":J
    :cond_1
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v5

    .local v5, "read":I
    if-lez v5, :cond_3

    .line 305
    if-eqz p2, :cond_2

    .line 306
    invoke-static {v0, v5, v6, v7}, Lcom/vkontakte/android/audio/utils/Utils;->doXor([BIJ)V

    .line 308
    :cond_2
    int-to-long v8, v5

    add-long/2addr v6, v8

    .line 309
    invoke-virtual {v4, v0, v11, v5}, Ljava/io/FileOutputStream;->write([BII)V

    .line 311
    if-eqz p3, :cond_1

    .line 312
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {p3, v8, v9}, Lcom/vkontakte/android/functions/VoidF2;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 316
    :cond_3
    if-eqz p3, :cond_4

    .line 317
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {p3, v8, v9}, Lcom/vkontakte/android/functions/VoidF2;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 319
    :cond_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 320
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 321
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 322
    return-void
.end method

.method public static stringToFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 217
    if-nez p0, :cond_0

    .line 218
    const/4 v1, 0x0

    .line 223
    :goto_0
    return-object v1

    .line 221
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->encryptSHA(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Utils;->byteArrayToHex([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 222
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
