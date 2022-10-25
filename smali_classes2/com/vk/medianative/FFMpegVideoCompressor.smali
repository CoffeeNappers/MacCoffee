.class public Lcom/vk/medianative/FFMpegVideoCompressor;
.super Ljava/lang/Object;
.source "FFMpegVideoCompressor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/medianative/FFMpegVideoCompressor$VideoCompressException;,
        Lcom/vk/medianative/FFMpegVideoCompressor$Callback;
    }
.end annotation


# instance fields
.field private aspectRatio:F

.field private audioBitrate:I

.field private audioVolume:F

.field private volatile ayuvFile:Lcom/vk/medianative/AYUVFile;

.field private callback:Lcom/vk/medianative/FFMpegVideoCompressor$Callback;

.field private final context:Landroid/content/Context;

.field private deviceYear:I

.field private in:Ljava/io/File;

.field private final isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private maxFrameSize:I

.field private mirror:I

.field private music:Ljava/io/File;

.field private musicDelay:I

.field private musicVolume:F

.field private out:Ljava/io/File;

.field private overlayBitmap:Landroid/graphics/Bitmap;

.field private overlayFile:Ljava/io/File;

.field private volatile process:Ljava/lang/Process;

.field private videoBitrate:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceYear"    # I

    .prologue
    const/4 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    iput v2, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->mirror:I

    .line 34
    const/high16 v0, 0x3f100000    # 0.5625f

    iput v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->aspectRatio:F

    .line 35
    iput v1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->audioVolume:F

    .line 36
    iput v1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->musicVolume:F

    .line 37
    iput v2, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->musicDelay:I

    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->context:Landroid/content/Context;

    .line 48
    iput p2, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->deviceYear:I

    .line 49
    return-void
.end method


# virtual methods
.method public addMusic(Ljava/io/File;)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "music"    # Ljava/io/File;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->music:Ljava/io/File;

    .line 87
    return-object p0
.end method

.method public addOverlay(Landroid/graphics/Bitmap;)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "overlay"    # Landroid/graphics/Bitmap;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->overlayBitmap:Landroid/graphics/Bitmap;

    .line 76
    return-object p0
.end method

.method public addOverlay(Ljava/io/File;)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "overlay"    # Ljava/io/File;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->overlayFile:Ljava/io/File;

    .line 71
    return-object p0
.end method

.method public aspectRatio(F)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "aspectRatio"    # F

    .prologue
    .line 65
    iput p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->aspectRatio:F

    .line 66
    return-object p0
.end method

.method public callback(Lcom/vk/medianative/FFMpegVideoCompressor$Callback;)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "callback"    # Lcom/vk/medianative/FFMpegVideoCompressor$Callback;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->callback:Lcom/vk/medianative/FFMpegVideoCompressor$Callback;

    .line 107
    return-object p0
.end method

.method public config(III)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "audioBitrate"    # I
    .param p2, "videoBitrate"    # I
    .param p3, "maxFrameSize"    # I

    .prologue
    .line 52
    iput p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->audioBitrate:I

    .line 53
    iput p2, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->videoBitrate:I

    .line 54
    iput p3, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->maxFrameSize:I

    .line 55
    return-object p0
.end method

.method public forceStop()V
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 201
    iget-object v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->process:Ljava/lang/Process;

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->process:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 204
    :cond_0
    iget-object v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->ayuvFile:Lcom/vk/medianative/AYUVFile;

    if-eqz v0, :cond_1

    .line 205
    iget-object v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->ayuvFile:Lcom/vk/medianative/AYUVFile;

    invoke-virtual {v0}, Lcom/vk/medianative/AYUVFile;->delete()V

    .line 207
    :cond_1
    return-void
.end method

.method public mirror(Z)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 1
    .param p1, "mirror"    # Z

    .prologue
    .line 81
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput v0, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->mirror:I

    .line 82
    return-object p0

    .line 81
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public path(Ljava/io/File;Ljava/io/File;)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "in"    # Ljava/io/File;
    .param p2, "out"    # Ljava/io/File;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->in:Ljava/io/File;

    .line 60
    iput-object p2, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->out:Ljava/io/File;

    .line 61
    return-object p0
.end method

.method public setAudioVolume(F)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "audioVolume"    # F

    .prologue
    .line 91
    iput p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->audioVolume:F

    .line 92
    return-object p0
.end method

.method public setMusicDelay(I)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "musicDelay"    # I

    .prologue
    .line 101
    iput p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->musicDelay:I

    .line 102
    return-object p0
.end method

.method public setMusicVolume(F)Lcom/vk/medianative/FFMpegVideoCompressor;
    .locals 0
    .param p1, "musicVolume"    # F

    .prologue
    .line 96
    iput p1, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->musicVolume:F

    .line 97
    return-object p0
.end method

.method public startCompression(Ljava/lang/String;)V
    .locals 10
    .param p1, "yuvPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vk/medianative/FFMpegVideoCompressor$VideoCompressException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 111
    iget-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 150
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    iget-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->overlayBitmap:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_3

    .line 116
    new-instance v5, Lcom/vk/medianative/AYUVFile;

    iget-object v6, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->overlayBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v5, v6}, Lcom/vk/medianative/AYUVFile;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->ayuvFile:Lcom/vk/medianative/AYUVFile;

    .line 121
    :cond_2
    :goto_1
    iget-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->ayuvFile:Lcom/vk/medianative/AYUVFile;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->ayuvFile:Lcom/vk/medianative/AYUVFile;

    invoke-virtual {v5, p1}, Lcom/vk/medianative/AYUVFile;->create(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    move v0, v3

    .line 123
    .local v0, "ayuvCreated":Z
    :goto_2
    iget-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-nez v5, :cond_0

    .line 127
    new-instance v1, Lcom/vk/medianative/FFMpegLib;

    iget-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->context:Landroid/content/Context;

    invoke-direct {v1, v5}, Lcom/vk/medianative/FFMpegLib;-><init>(Landroid/content/Context;)V

    .line 128
    .local v1, "lib":Lcom/vk/medianative/FFMpegLib;
    new-instance v2, Ljava/lang/ProcessBuilder;

    const/16 v5, 0xe

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v1}, Lcom/vk/medianative/FFMpegLib;->getLibPath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v4

    iget v6, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->audioBitrate:I

    .line 129
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    const/4 v6, 0x2

    iget v7, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->videoBitrate:I

    .line 130
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    iget v7, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->maxFrameSize:I

    .line 131
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x4

    iget v7, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->mirror:I

    .line 132
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v8, "%.3f"

    new-array v3, v3, [Ljava/lang/Object;

    iget v9, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->aspectRatio:F

    .line 133
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v3, v4

    invoke-static {v7, v8, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v6

    const/4 v4, 0x6

    iget v3, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->deviceYear:I

    const/16 v6, 0x7de

    if-lt v3, v6, :cond_5

    const-string/jumbo v3, "superfast"

    :goto_3
    aput-object v3, v5, v4

    const/4 v3, 0x7

    iget v4, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->audioVolume:F

    .line 135
    invoke-static {v4}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3

    const/16 v3, 0x8

    iget v4, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->musicVolume:F

    .line 136
    invoke-static {v4}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3

    const/16 v3, 0x9

    iget v4, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->musicDelay:I

    .line 137
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3

    const/16 v3, 0xa

    iget-object v4, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->in:Ljava/io/File;

    .line 138
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3

    const/16 v3, 0xb

    iget-object v4, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->out:Ljava/io/File;

    .line 139
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3

    const/16 v4, 0xc

    if-eqz v0, :cond_6

    iget-object v3, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->ayuvFile:Lcom/vk/medianative/AYUVFile;

    .line 140
    invoke-virtual {v3}, Lcom/vk/medianative/AYUVFile;->getPath()Ljava/lang/String;

    move-result-object v3

    :goto_4
    aput-object v3, v5, v4

    const/16 v4, 0xd

    iget-object v3, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->music:Ljava/io/File;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->music:Ljava/io/File;

    .line 141
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    :goto_5
    aput-object v3, v5, v4

    invoke-direct {v2, v5}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 143
    .local v2, "processBuilder":Ljava/lang/ProcessBuilder;
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v3

    const-string/jumbo v4, "LD_LIBRARY_PATH"

    invoke-virtual {v1}, Lcom/vk/medianative/FFMpegLib;->getLibDir()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    iget-object v3, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    if-nez v3, :cond_0

    .line 149
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->process:Ljava/lang/Process;

    goto/16 :goto_0

    .line 117
    .end local v0    # "ayuvCreated":Z
    .end local v1    # "lib":Lcom/vk/medianative/FFMpegLib;
    .end local v2    # "processBuilder":Ljava/lang/ProcessBuilder;
    :cond_3
    iget-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->overlayFile:Ljava/io/File;

    if-eqz v5, :cond_2

    .line 118
    new-instance v5, Lcom/vk/medianative/AYUVFile;

    iget-object v6, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->overlayFile:Ljava/io/File;

    invoke-direct {v5, v6}, Lcom/vk/medianative/AYUVFile;-><init>(Ljava/io/File;)V

    iput-object v5, p0, Lcom/vk/medianative/FFMpegVideoCompressor;->ayuvFile:Lcom/vk/medianative/AYUVFile;

    goto/16 :goto_1

    :cond_4
    move v0, v4

    .line 121
    goto/16 :goto_2

    .line 133
    .restart local v0    # "ayuvCreated":Z
    .restart local v1    # "lib":Lcom/vk/medianative/FFMpegLib;
    :cond_5
    const-string/jumbo v3, "ultrafast"

    goto/16 :goto_3

    .line 140
    :cond_6
    const-string/jumbo v3, ""

    goto :goto_4

    .line 141
    :cond_7
    const-string/jumbo v3, ""

    goto :goto_5
.end method

.method public waitForCompression()V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vk/medianative/FFMpegVideoCompressor$VideoCompressException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vk/medianative/FFMpegVideoCompressor;->process:Ljava/lang/Process;

    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    .line 154
    .local v13, "inputStream":Ljava/io/InputStream;
    new-instance v16, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v13}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v16

    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 157
    .local v16, "reader":Ljava/io/BufferedReader;
    :cond_0
    :goto_0
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v14

    .local v14, "line":Ljava/lang/String;
    if-eqz v14, :cond_2

    .line 158
    const/16 v3, 0x20

    invoke-virtual {v14, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v17

    .line 159
    .local v17, "space":I
    if-lez v17, :cond_0

    .line 162
    const/4 v3, 0x0

    move/from16 v0, v17

    invoke-virtual {v14, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 163
    .local v2, "command":Ljava/lang/String;
    add-int/lit8 v3, v17, 0x1

    invoke-virtual {v14, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    .line 164
    .local v15, "params":Ljava/lang/String;
    const/4 v3, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_1
    :goto_1
    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 166
    :pswitch_0
    const-string/jumbo v3, "compressVideo"

    invoke-static {v3, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 164
    :sswitch_0
    const-string/jumbo v4, "LOG"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v3, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v4, "PROGRESS"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :sswitch_2
    const-string/jumbo v4, "BYTES"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v3, 0x2

    goto :goto_1

    :sswitch_3
    const-string/jumbo v4, "VIDEO_INFO"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v3, 0x3

    goto :goto_1

    .line 169
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vk/medianative/FFMpegVideoCompressor;->callback:Lcom/vk/medianative/FFMpegVideoCompressor$Callback;

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Lcom/vk/medianative/FFMpegVideoCompressor$Callback;->onProgress(I)V

    goto :goto_0

    .line 172
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vk/medianative/FFMpegVideoCompressor;->callback:Lcom/vk/medianative/FFMpegVideoCompressor$Callback;

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Lcom/vk/medianative/FFMpegVideoCompressor$Callback;->onBytes(I)V

    goto :goto_0

    .line 175
    :pswitch_3
    const-string/jumbo v3, " "

    invoke-virtual {v15, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v18

    .line 176
    .local v18, "strParams":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vk/medianative/FFMpegVideoCompressor;->callback:Lcom/vk/medianative/FFMpegVideoCompressor$Callback;

    const/4 v4, 0x0

    aget-object v4, v18, v4

    .line 177
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x1

    aget-object v5, v18, v5

    .line 178
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x2

    aget-object v6, v18, v6

    .line 179
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x3

    aget-object v7, v18, v7

    .line 180
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x4

    aget-object v8, v18, v8

    .line 181
    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v8

    const/4 v10, 0x5

    aget-object v10, v18, v10

    .line 182
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 176
    invoke-interface/range {v3 .. v10}, Lcom/vk/medianative/FFMpegVideoCompressor$Callback;->onVideoInfo(IIIIDI)V

    goto/16 :goto_0

    .line 187
    .end local v2    # "command":Ljava/lang/String;
    .end local v15    # "params":Ljava/lang/String;
    .end local v17    # "space":I
    .end local v18    # "strParams":[Ljava/lang/String;
    :cond_2
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vk/medianative/FFMpegVideoCompressor;->process:Ljava/lang/Process;

    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v11

    .line 188
    .local v11, "i":I
    if-eqz v11, :cond_3

    .line 189
    new-instance v3, Lcom/vk/medianative/FFMpegVideoCompressor$VideoCompressException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Wrong answer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vk/medianative/FFMpegVideoCompressor$VideoCompressException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    .end local v11    # "i":I
    :catch_0
    move-exception v12

    .line 192
    .local v12, "ignored":Ljava/lang/InterruptedException;
    :try_start_1
    const-string/jumbo v3, "compressVideo"

    const-string/jumbo v4, "interrupted"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 195
    invoke-virtual/range {p0 .. p0}, Lcom/vk/medianative/FFMpegVideoCompressor;->forceStop()V

    .line 197
    .end local v12    # "ignored":Ljava/lang/InterruptedException;
    :goto_2
    return-void

    .line 195
    .restart local v11    # "i":I
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/vk/medianative/FFMpegVideoCompressor;->forceStop()V

    goto :goto_2

    .end local v11    # "i":I
    :catchall_0
    move-exception v3

    invoke-virtual/range {p0 .. p0}, Lcom/vk/medianative/FFMpegVideoCompressor;->forceStop()V

    throw v3

    .line 164
    :sswitch_data_0
    .sparse-switch
        -0x41c685ee -> :sswitch_3
        -0xd054dd3 -> :sswitch_1
        0x12724 -> :sswitch_0
        0x3cbc84b -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
