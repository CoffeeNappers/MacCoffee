.class public Lcom/wmspanel/libstream/SnapshotWriter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SnapshotWriter"

.field private static mFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private static mQuality:I


# instance fields
.field private mBuffer:Ljava/nio/ByteBuffer;

.field private mCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

.field private mFile:Ljava/io/File;

.field private mHeight:I

.field private mMirror:Z

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lcom/wmspanel/libstream/SnapshotWriter;->mFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 24
    const/16 v0, 0x5a

    sput v0, Lcom/wmspanel/libstream/SnapshotWriter;->mQuality:I

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;Ljava/io/File;IIZ)V
    .locals 0
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "callback"    # Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;
    .param p3, "file"    # Ljava/io/File;
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "mirror"    # Z

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mBuffer:Ljava/nio/ByteBuffer;

    .line 35
    iput-object p3, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mFile:Ljava/io/File;

    .line 36
    iput-object p2, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

    .line 37
    iput p4, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mWidth:I

    .line 38
    iput p5, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mHeight:I

    .line 39
    iput-boolean p6, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mMirror:Z

    .line 40
    return-void
.end method

.method public static setCompressFormat(Landroid/graphics/Bitmap$CompressFormat;)V
    .locals 0
    .param p0, "format"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    .line 43
    sput-object p0, Lcom/wmspanel/libstream/SnapshotWriter;->mFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 44
    return-void
.end method

.method public static setQuality(I)V
    .locals 2
    .param p0, "quality"    # I

    .prologue
    .line 47
    if-ltz p0, :cond_0

    const/16 v0, 0x64

    if-le p0, v0, :cond_1

    .line 48
    :cond_0
    const-string/jumbo v0, "SnapshotWriter"

    const-string/jumbo v1, "quality must be 0..100"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :goto_0
    return-void

    .line 51
    :cond_1
    sput p0, Lcom/wmspanel/libstream/SnapshotWriter;->mQuality:I

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/high16 v1, -0x40800000    # -1.0f

    .line 55
    const/4 v7, 0x0

    .line 57
    :try_start_0
    iget v0, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mWidth:I

    iget v2, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mHeight:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 58
    iget-object v2, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 59
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 60
    iget-boolean v2, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mMirror:Z

    if-eqz v2, :cond_1

    :goto_0
    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v5, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 61
    const/4 v1, 0x0

    const/4 v2, 0x0

    iget v3, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mWidth:I

    iget v4, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mHeight:I

    const/4 v6, 0x1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

    if-eqz v1, :cond_2

    .line 63
    iget-object v1, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

    invoke-interface {v1, v0}, Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;->onSnapshotTaken(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    if-eqz v7, :cond_0

    .line 75
    :try_start_1
    invoke-virtual {v7}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 81
    :cond_0
    :goto_1
    return-void

    .line 60
    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    .line 76
    :catch_0
    move-exception v0

    .line 77
    const-string/jumbo v1, "SnapshotWriter"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 66
    :cond_2
    :try_start_2
    iget-object v1, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mFile:Ljava/io/File;

    if-eqz v1, :cond_4

    .line 67
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/wmspanel/libstream/SnapshotWriter;->mFile:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    :try_start_3
    sget-object v2, Lcom/wmspanel/libstream/SnapshotWriter;->mFormat:Landroid/graphics/Bitmap$CompressFormat;

    sget v3, Lcom/wmspanel/libstream/SnapshotWriter;->mQuality:I

    invoke-virtual {v0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 74
    :goto_2
    if-eqz v1, :cond_0

    .line 75
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 76
    :catch_1
    move-exception v0

    .line 77
    const-string/jumbo v1, "SnapshotWriter"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 70
    :catch_2
    move-exception v0

    move-object v1, v7

    .line 71
    :goto_3
    :try_start_5
    const-string/jumbo v2, "SnapshotWriter"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 74
    if-eqz v1, :cond_0

    .line 75
    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_1

    .line 76
    :catch_3
    move-exception v0

    .line 77
    const-string/jumbo v1, "SnapshotWriter"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 73
    :catchall_0
    move-exception v0

    .line 74
    :goto_4
    if-eqz v7, :cond_3

    .line 75
    :try_start_7
    invoke-virtual {v7}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 78
    :cond_3
    :goto_5
    throw v0

    .line 76
    :catch_4
    move-exception v1

    .line 77
    const-string/jumbo v2, "SnapshotWriter"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 73
    :catchall_1
    move-exception v0

    move-object v7, v1

    goto :goto_4

    .line 70
    :catch_5
    move-exception v0

    goto :goto_3

    :cond_4
    move-object v1, v7

    goto :goto_2
.end method
