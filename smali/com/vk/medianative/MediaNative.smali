.class public Lcom/vk/medianative/MediaNative;
.super Ljava/lang/Object;
.source "MediaNative.java"


# static fields
.field private static sMediaSupported:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vk/medianative/MediaNative;->sMediaSupported:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dump()Ljava/lang/String;
    .locals 3

    .prologue
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .local v0, "state":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "LD_LIBRARY_PATH:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/facebook/soloader/SoLoader;->makeLdLibraryPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    const-string/jumbo v1, "SELF_MAPS:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/vk/medianative/MediaNative;->getSelfMaps()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    const-string/jumbo v1, "PID_MAPS:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/vk/medianative/MediaNative;->getPidMaps()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getABIList()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 137
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    .line 138
    .local v0, "abis":[Ljava/lang/String;
    const/4 v1, 0x0

    sget-object v2, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    aput-object v2, v0, v1

    .line 139
    const/4 v1, 0x1

    sget-object v2, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    aput-object v2, v0, v1

    .line 140
    return-object v0
.end method

.method public static getLibPath(Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-static {p0}, Lcom/facebook/soloader/SoLoader;->unpackLibraryAndDependencies(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private static getMaps(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "pid"    # Ljava/lang/String;

    .prologue
    .line 144
    const-string/jumbo v0, "empty"

    .line 145
    .local v0, "empty":Ljava/lang/String;
    const/4 v1, 0x0

    .line 147
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "cat /proc/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "/maps"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 148
    .local v2, "process":Ljava/lang/Process;
    if-eqz v2, :cond_2

    .line 149
    invoke-virtual {v2}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 150
    new-instance v4, Ljava/util/Scanner;

    invoke-direct {v4, v1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    const-string/jumbo v5, "\\A"

    invoke-virtual {v4, v5}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    move-result-object v3

    .line 151
    .local v3, "s":Ljava/util/Scanner;
    invoke-virtual {v3}, Ljava/util/Scanner;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Ljava/util/Scanner;->next()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 155
    .end local v0    # "empty":Ljava/lang/String;
    :cond_0
    if-eqz v1, :cond_1

    .line 157
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 161
    .end local v2    # "process":Ljava/lang/Process;
    .end local v3    # "s":Ljava/util/Scanner;
    :cond_1
    :goto_0
    return-object v0

    .line 155
    .restart local v0    # "empty":Ljava/lang/String;
    .restart local v2    # "process":Ljava/lang/Process;
    :cond_2
    if-eqz v1, :cond_1

    .line 157
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 158
    :catch_0
    move-exception v4

    goto :goto_0

    .line 153
    .end local v2    # "process":Ljava/lang/Process;
    :catch_1
    move-exception v4

    .line 155
    if-eqz v1, :cond_1

    .line 157
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 158
    :catch_2
    move-exception v4

    goto :goto_0

    .line 155
    :catchall_0
    move-exception v4

    if-eqz v1, :cond_3

    .line 157
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 158
    :cond_3
    :goto_1
    throw v4

    .end local v0    # "empty":Ljava/lang/String;
    .restart local v2    # "process":Ljava/lang/Process;
    .restart local v3    # "s":Ljava/util/Scanner;
    :catch_3
    move-exception v4

    goto :goto_0

    .end local v2    # "process":Ljava/lang/Process;
    .end local v3    # "s":Ljava/util/Scanner;
    .restart local v0    # "empty":Ljava/lang/String;
    :catch_4
    move-exception v5

    goto :goto_1
.end method

.method private static getPidMaps()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/medianative/MediaNative;->getMaps(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getSelfMaps()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    const-string/jumbo v0, "self"

    invoke-static {v0}, Lcom/vk/medianative/MediaNative;->getMaps(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 4
    .param p0, "applicationContext"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 23
    invoke-static {p0, v3}, Lcom/facebook/soloader/SoLoader;->init(Landroid/content/Context;Z)V

    .line 24
    const-string/jumbo v1, "ffmpeg"

    invoke-static {v1}, Lcom/vk/medianative/MediaNative;->loadLibrary(Ljava/lang/String;)V

    .line 25
    const-string/jumbo v1, "vkvideo"

    invoke-static {v1}, Lcom/vk/medianative/MediaNative;->loadLibrary(Ljava/lang/String;)V

    .line 26
    const-string/jumbo v1, "vkaudio"

    invoke-static {v1}, Lcom/vk/medianative/MediaNative;->loadLibrary(Ljava/lang/String;)V

    .line 27
    const-string/jumbo v1, "chronicle"

    invoke-static {v1}, Lcom/vk/medianative/MediaNative;->loadLibrary(Ljava/lang/String;)V

    .line 29
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-lt v1, v2, :cond_0

    .line 31
    :try_start_0
    invoke-static {}, Lcom/vk/medianative/MediaNative;->isX86()Z

    move-result v1

    if-nez v1, :cond_0

    .line 32
    const-string/jumbo v1, "vkmedia"

    invoke-static {v1}, Lcom/vk/medianative/MediaNative;->loadLibrary(Ljava/lang/String;)V

    .line 33
    const/4 v1, 0x1

    sput-boolean v1, Lcom/vk/medianative/MediaNative;->sMediaSupported:Z
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :cond_0
    :goto_0
    return-void

    .line 35
    :catch_0
    move-exception v0

    .line 36
    .local v0, "e":Ljava/lang/UnsatisfiedLinkError;
    sput-boolean v3, Lcom/vk/medianative/MediaNative;->sMediaSupported:Z

    goto :goto_0
.end method

.method public static isMediaSupported()Z
    .locals 1

    .prologue
    .line 19
    sget-boolean v0, Lcom/vk/medianative/MediaNative;->sMediaSupported:Z

    return v0
.end method

.method private static isX86()Z
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 109
    const/4 v1, 0x0

    .line 110
    .local v1, "abis":[Ljava/lang/String;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt v5, v6, :cond_0

    .line 111
    sget-object v1, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    .line 114
    :cond_0
    if-eqz v1, :cond_1

    array-length v5, v1

    if-nez v5, :cond_2

    .line 115
    :cond_1
    invoke-static {}, Lcom/vk/medianative/MediaNative;->getABIList()[Ljava/lang/String;

    move-result-object v1

    .line 118
    :cond_2
    if-eqz v1, :cond_7

    .line 119
    const/4 v3, 0x0

    .line 120
    .local v3, "hasX86":Z
    const/4 v2, 0x0

    .line 121
    .local v2, "hasArm":Z
    array-length v6, v1

    move v5, v4

    :goto_0
    if-ge v5, v6, :cond_6

    aget-object v0, v1, v5

    .line 122
    .local v0, "abi":Ljava/lang/String;
    const-string/jumbo v7, "x86"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    const-string/jumbo v7, "x86_64"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 123
    :cond_3
    const/4 v3, 0x1

    .line 121
    :cond_4
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 126
    :cond_5
    const-string/jumbo v7, "armeabi"

    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 127
    const/4 v2, 0x1

    .line 128
    goto :goto_1

    .line 131
    .end local v0    # "abi":Ljava/lang/String;
    :cond_6
    if-eqz v3, :cond_7

    if-nez v2, :cond_7

    const/4 v4, 0x1

    .line 133
    .end local v2    # "hasArm":Z
    .end local v3    # "hasX86":Z
    :cond_7
    return v4
.end method

.method private static loadLibrary(Ljava/lang/String;)V
    .locals 2
    .param p0, "libraryName"    # Ljava/lang/String;

    .prologue
    .line 99
    :try_start_0
    invoke-static {p0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :goto_0
    return-void

    .line 100
    :catch_0
    move-exception v0

    .line 102
    .local v0, "error":Ljava/lang/UnsatisfiedLinkError;
    :try_start_1
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 103
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public static native nativeAnimationPlayerCreate(Ljava/lang/String;IIZ)J
.end method

.method public static native nativeAnimationPlayerDecode(JLandroid/graphics/Bitmap;)I
.end method

.method public static native nativeAnimationPlayerGetSize(J)I
.end method

.method public static native nativeAnimationPlayerRelease(J)V
.end method

.method public static native nativeAnimationPlayerSeek(JI)Z
.end method

.method public static native nativeAudioGetTotalPcmDuration()J
.end method

.method public static native nativeAudioGetWaveform([SI)[B
.end method

.method public static native nativeAudioIsOpusFile(Ljava/lang/String;)I
.end method

.method public static native nativeAudioOpenOpusFile(Ljava/lang/String;)I
.end method

.method public static native nativeAudioReadOpusFile(Ljava/nio/ByteBuffer;I[I)V
.end method

.method public static native nativeAudioSeekOpusFile(F)I
.end method

.method public static native nativeAudioStartRecord(Ljava/lang/String;)I
.end method

.method public static native nativeAudioStopRecord()V
.end method

.method public static native nativeAudioWriteFrame(Ljava/nio/ByteBuffer;I)I
.end method

.method public static native nativeProcessorDestroy()V
.end method

.method public static native nativeProcessorDoFrame([BIIJI[IZ)J
.end method

.method public static native nativeProcessorGetFPS()I
.end method

.method public static native nativeProcessorGetVersion()I
.end method

.method public static native nativeProcessorInit(Ljava/lang/String;IIZ)Z
.end method

.method public static native nativeProcessorLoad(Ljava/lang/String;Z)Z
.end method
