.class public Lcom/facebook/device/yearclass/DeviceInfo;
.super Ljava/lang/Object;
.source "DeviceInfo.java"


# static fields
.field private static final CPU_FILTER:Ljava/io/FileFilter;

.field public static final DEVICEINFO_UNKNOWN:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 95
    new-instance v0, Lcom/facebook/device/yearclass/DeviceInfo$1;

    invoke-direct {v0}, Lcom/facebook/device/yearclass/DeviceInfo$1;-><init>()V

    sput-object v0, Lcom/facebook/device/yearclass/DeviceInfo;->CPU_FILTER:Ljava/io/FileFilter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static extractValue([BI)I
    .locals 4
    .param p0, "buffer"    # [B
    .param p1, "index"    # I

    .prologue
    .line 240
    :goto_0
    array-length v2, p0

    if-ge p1, v2, :cond_2

    aget-byte v2, p0, p1

    const/16 v3, 0xa

    if-eq v2, v3, :cond_2

    .line 241
    aget-byte v2, p0, p1

    invoke-static {v2}, Ljava/lang/Character;->isDigit(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 242
    move v0, p1

    .line 243
    .local v0, "start":I
    add-int/lit8 p1, p1, 0x1

    .line 244
    :goto_1
    array-length v2, p0

    if-ge p1, v2, :cond_0

    aget-byte v2, p0, p1

    invoke-static {v2}, Ljava/lang/Character;->isDigit(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 245
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 247
    :cond_0
    new-instance v1, Ljava/lang/String;

    const/4 v2, 0x0

    sub-int v3, p1, v0

    invoke-direct {v1, p0, v2, v0, v3}, Ljava/lang/String;-><init>([BIII)V

    .line 248
    .local v1, "str":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 252
    .end local v0    # "start":I
    .end local v1    # "str":Ljava/lang/String;
    :goto_2
    return v2

    .line 250
    :cond_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 252
    :cond_2
    const/4 v2, -0x1

    goto :goto_2
.end method

.method public static getCPUMaxFreqKHz()I
    .locals 12

    .prologue
    .line 119
    const/4 v7, -0x1

    .line 121
    .local v7, "maxFreq":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/facebook/device/yearclass/DeviceInfo;->getNumberOfCPUCores()I

    move-result v10

    if-ge v6, v10, :cond_4

    .line 122
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "/sys/devices/system/cpu/cpu"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "/cpufreq/cpuinfo_max_freq"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 124
    .local v4, "filename":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 125
    .local v1, "cpuInfoMaxFreqFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 126
    const/16 v10, 0x80

    new-array v0, v10, [B

    .line 127
    .local v0, "buffer":[B
    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 129
    .local v9, "stream":Ljava/io/FileInputStream;
    :try_start_1
    invoke-virtual {v9, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 130
    const/4 v3, 0x0

    .line 132
    .local v3, "endIndex":I
    :goto_1
    aget-byte v10, v0, v3

    invoke-static {v10}, Ljava/lang/Character;->isDigit(I)Z

    move-result v10

    if-eqz v10, :cond_0

    array-length v10, v0

    if-ge v3, v10, :cond_0

    .line 133
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 135
    :cond_0
    new-instance v8, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v8, v0, v10, v3}, Ljava/lang/String;-><init>([BII)V

    .line 136
    .local v8, "str":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 137
    .local v5, "freqBound":Ljava/lang/Integer;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-le v10, v7, :cond_1

    .line 138
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    .line 143
    :cond_1
    :try_start_2
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    .line 121
    .end local v0    # "buffer":[B
    .end local v3    # "endIndex":I
    .end local v5    # "freqBound":Ljava/lang/Integer;
    .end local v8    # "str":Ljava/lang/String;
    .end local v9    # "stream":Ljava/io/FileInputStream;
    :cond_2
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 140
    .restart local v0    # "buffer":[B
    .restart local v9    # "stream":Ljava/io/FileInputStream;
    :catch_0
    move-exception v10

    .line 143
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    goto :goto_2

    .line 157
    .end local v0    # "buffer":[B
    .end local v1    # "cpuInfoMaxFreqFile":Ljava/io/File;
    .end local v4    # "filename":Ljava/lang/String;
    .end local v9    # "stream":Ljava/io/FileInputStream;
    :catch_1
    move-exception v2

    .line 158
    .local v2, "e":Ljava/io/IOException;
    const/4 v7, -0x1

    .line 160
    .end local v2    # "e":Ljava/io/IOException;
    :cond_3
    :goto_3
    return v7

    .line 143
    .restart local v0    # "buffer":[B
    .restart local v1    # "cpuInfoMaxFreqFile":Ljava/io/File;
    .restart local v4    # "filename":Ljava/lang/String;
    .restart local v9    # "stream":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v10

    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    throw v10

    .line 147
    .end local v0    # "buffer":[B
    .end local v1    # "cpuInfoMaxFreqFile":Ljava/io/File;
    .end local v4    # "filename":Ljava/lang/String;
    .end local v9    # "stream":Ljava/io/FileInputStream;
    :cond_4
    const/4 v10, -0x1

    if-ne v7, v10, :cond_3

    .line 148
    new-instance v9, Ljava/io/FileInputStream;

    const-string/jumbo v10, "/proc/cpuinfo"

    invoke-direct {v9, v10}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 150
    .restart local v9    # "stream":Ljava/io/FileInputStream;
    :try_start_3
    const-string/jumbo v10, "cpu MHz"

    invoke-static {v10, v9}, Lcom/facebook/device/yearclass/DeviceInfo;->parseFileForValue(Ljava/lang/String;Ljava/io/FileInputStream;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result v5

    .line 151
    .local v5, "freqBound":I
    mul-int/lit16 v5, v5, 0x3e8

    .line 152
    if-le v5, v7, :cond_5

    move v7, v5

    .line 154
    :cond_5
    :try_start_4
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    goto :goto_3

    .end local v5    # "freqBound":I
    :catchall_1
    move-exception v10

    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    throw v10
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
.end method

.method private static getCoresFromCPUFileList()I
    .locals 2

    .prologue
    .line 92
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/sys/devices/system/cpu/"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/facebook/device/yearclass/DeviceInfo;->CPU_FILTER:Ljava/io/FileFilter;

    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method private static getCoresFromFileInfo(Ljava/lang/String;)I
    .locals 5
    .param p0, "fileLocation"    # Ljava/lang/String;

    .prologue
    .line 68
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 69
    .local v3, "is":Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 70
    .local v0, "buf":Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 71
    .local v2, "fileContents":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 72
    invoke-static {v2}, Lcom/facebook/device/yearclass/DeviceInfo;->getCoresFromFileString(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 74
    .end local v0    # "buf":Ljava/io/BufferedReader;
    .end local v2    # "fileContents":Ljava/lang/String;
    .end local v3    # "is":Ljava/io/InputStream;
    :goto_0
    return v4

    .line 73
    :catch_0
    move-exception v1

    .line 74
    .local v1, "e":Ljava/io/IOException;
    const/4 v4, -0x1

    goto :goto_0
.end method

.method static getCoresFromFileString(Ljava/lang/String;)I
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 84
    if-eqz p0, :cond_0

    const-string/jumbo v1, "0-[\\d]+$"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 85
    :cond_0
    const/4 v0, -0x1

    .line 88
    :goto_0
    return v0

    .line 87
    :cond_1
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 88
    .local v0, "cores":I
    goto :goto_0
.end method

.method public static getNumberOfCPUCores()I
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 37
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xa

    if-gt v2, v3, :cond_1

    .line 42
    const/4 v0, 0x1

    .line 58
    .local v0, "cores":I
    :cond_0
    :goto_0
    return v0

    .line 46
    .end local v0    # "cores":I
    :cond_1
    :try_start_0
    const-string/jumbo v2, "/sys/devices/system/cpu/possible"

    invoke-static {v2}, Lcom/facebook/device/yearclass/DeviceInfo;->getCoresFromFileInfo(Ljava/lang/String;)I

    move-result v0

    .line 47
    .restart local v0    # "cores":I
    if-ne v0, v4, :cond_2

    .line 48
    const-string/jumbo v2, "/sys/devices/system/cpu/present"

    invoke-static {v2}, Lcom/facebook/device/yearclass/DeviceInfo;->getCoresFromFileInfo(Ljava/lang/String;)I

    move-result v0

    .line 50
    :cond_2
    if-ne v0, v4, :cond_0

    .line 51
    invoke-static {}, Lcom/facebook/device/yearclass/DeviceInfo;->getCoresFromCPUFileList()I
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    goto :goto_0

    .line 53
    :catch_0
    move-exception v1

    .line 54
    .local v1, "e":Ljava/lang/SecurityException;
    const/4 v0, -0x1

    .line 57
    goto :goto_0

    .line 55
    .end local v1    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v1

    .line 56
    .local v1, "e":Ljava/lang/NullPointerException;
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static getTotalMemory(Landroid/content/Context;)J
    .locals 8
    .param p0, "c"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 172
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-lt v3, v6, :cond_1

    .line 173
    new-instance v1, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v1}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 174
    .local v1, "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    const-string/jumbo v3, "activity"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 175
    .local v0, "am":Landroid/app/ActivityManager;
    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 176
    if-eqz v1, :cond_0

    .line 177
    iget-wide v4, v1, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    .line 193
    .end local v0    # "am":Landroid/app/ActivityManager;
    .end local v1    # "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    :goto_0
    return-wide v4

    .line 179
    .restart local v0    # "am":Landroid/app/ActivityManager;
    .restart local v1    # "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    :cond_0
    const-wide/16 v4, -0x1

    goto :goto_0

    .line 182
    .end local v0    # "am":Landroid/app/ActivityManager;
    .end local v1    # "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    :cond_1
    const-wide/16 v4, -0x1

    .line 184
    .local v4, "totalMem":J
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    const-string/jumbo v3, "/proc/meminfo"

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    .local v2, "stream":Ljava/io/FileInputStream;
    :try_start_1
    const-string/jumbo v3, "MemTotal"

    invoke-static {v3, v2}, Lcom/facebook/device/yearclass/DeviceInfo;->parseFileForValue(Ljava/lang/String;Ljava/io/FileInputStream;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    int-to-long v4, v3

    .line 187
    const-wide/16 v6, 0x400

    mul-long/2addr v4, v6

    .line 189
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    goto :goto_0

    .line 191
    .end local v2    # "stream":Ljava/io/FileInputStream;
    :catch_0
    move-exception v3

    goto :goto_0

    .line 189
    .restart local v2    # "stream":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    throw v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method private static parseFileForValue(Ljava/lang/String;Ljava/io/FileInputStream;)I
    .locals 8
    .param p0, "textToMatch"    # Ljava/lang/String;
    .param p1, "stream"    # Ljava/io/FileInputStream;

    .prologue
    const/16 v7, 0xa

    .line 206
    const/16 v5, 0x400

    new-array v0, v5, [B

    .line 208
    .local v0, "buffer":[B
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .line 209
    .local v3, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_5

    .line 210
    aget-byte v5, v0, v1

    if-eq v5, v7, :cond_0

    if-nez v1, :cond_2

    .line 211
    :cond_0
    aget-byte v5, v0, v1

    if-ne v5, v7, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 212
    :cond_1
    move v2, v1

    .local v2, "j":I
    :goto_1
    if-ge v2, v3, :cond_2

    .line 213
    sub-int v4, v2, v1

    .line 215
    .local v4, "textIndex":I
    aget-byte v5, v0, v2

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v5, v6, :cond_3

    .line 209
    .end local v2    # "j":I
    .end local v4    # "textIndex":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 219
    .restart local v2    # "j":I
    .restart local v4    # "textIndex":I
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v4, v5, :cond_4

    .line 220
    invoke-static {v0, v2}, Lcom/facebook/device/yearclass/DeviceInfo;->extractValue([BI)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 229
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v3    # "length":I
    .end local v4    # "textIndex":I
    :goto_2
    return v5

    .line 212
    .restart local v1    # "i":I
    .restart local v2    # "j":I
    .restart local v3    # "length":I
    .restart local v4    # "textIndex":I
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 227
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v3    # "length":I
    .end local v4    # "textIndex":I
    :catch_0
    move-exception v5

    .line 229
    :cond_5
    :goto_3
    const/4 v5, -0x1

    goto :goto_2

    .line 225
    :catch_1
    move-exception v5

    goto :goto_3
.end method
