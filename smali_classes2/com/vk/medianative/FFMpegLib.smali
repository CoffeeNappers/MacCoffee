.class Lcom/vk/medianative/FFMpegLib;
.super Ljava/lang/Object;
.source "FFMpegLib.java"


# static fields
.field static final LIBS:[Ljava/lang/String;

.field static final LIB_DIRECTORY:Ljava/lang/String; = "libvideo"

.field static final MAIN_LIB_NAME:Ljava/lang/String; = "libvkvideoartist.so"


# instance fields
.field private final libDir:Ljava/lang/String;

.field private final libPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 15
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "libvkvideoartist.so"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "libffmpeg.so"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/medianative/FFMpegLib;->LIBS:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {p1}, Lcom/vk/medianative/FFMpegLib;->getLibFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 25
    .local v0, "libFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/medianative/FFMpegLib;->libPath:Ljava/lang/String;

    .line 26
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/medianative/FFMpegLib;->libDir:Ljava/lang/String;

    .line 27
    return-void
.end method

.method private static copyFile(Ljava/io/File;Ljava/io/File;)V
    .locals 5
    .param p0, "src"    # Ljava/io/File;
    .param p1, "dst"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 79
    .local v1, "in":Ljava/io/InputStream;
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 82
    .local v3, "out":Ljava/io/OutputStream;
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 84
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    if-lez v2, :cond_0

    .line 85
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 87
    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 88
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 89
    return-void
.end method

.method private static getLibFile(Landroid/content/Context;)Ljava/io/File;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v2, v3, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 39
    .local v2, "nativeLibraryDir":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    const-string/jumbo v3, "libvkvideoartist.so"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .local v1, "libFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->canExecute()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 48
    .end local v1    # "libFile":Ljava/io/File;
    :goto_0
    return-object v1

    .line 45
    .restart local v1    # "libFile":Ljava/io/File;
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string/jumbo v4, "libvideo"

    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 46
    .local v0, "internalDir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/vk/medianative/FFMpegLib;->updateInternalLibs(Ljava/io/File;Ljava/io/File;)V

    .line 48
    new-instance v1, Ljava/io/File;

    .end local v1    # "libFile":Ljava/io/File;
    const-string/jumbo v3, "libvkvideoartist.so"

    invoke-direct {v1, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static updateInternalLibs(Ljava/io/File;Ljava/io/File;)V
    .locals 13
    .param p0, "src"    # Ljava/io/File;
    .param p1, "dst"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v12, 0x1

    .line 52
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 53
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_0

    .line 54
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v4, "Fail to create internal directory for library"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 58
    :cond_0
    sget-object v5, Lcom/vk/medianative/FFMpegLib;->LIBS:[Ljava/lang/String;

    array-length v6, v5

    move v3, v4

    :goto_0
    if-ge v3, v6, :cond_5

    aget-object v1, v5, v3

    .line 59
    .local v1, "lib":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 60
    .local v2, "srcFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    .line 61
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v5, "Library \'%s\' not found"

    new-array v6, v12, [Ljava/lang/Object;

    aput-object v1, v6, v4

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 63
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 65
    .local v0, "dstFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    cmp-long v7, v8, v10

    if-lez v7, :cond_3

    .line 66
    :cond_2
    invoke-static {v2, v0}, Lcom/vk/medianative/FFMpegLib;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 69
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ".so"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 70
    invoke-virtual {v0, v12, v12}, Ljava/io/File;->setExecutable(ZZ)Z

    move-result v7

    if-nez v7, :cond_4

    .line 71
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v4, "Cannot make video compression library executable"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 58
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 75
    .end local v0    # "dstFile":Ljava/io/File;
    .end local v1    # "lib":Ljava/lang/String;
    .end local v2    # "srcFile":Ljava/io/File;
    :cond_5
    return-void
.end method


# virtual methods
.method public getLibDir()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vk/medianative/FFMpegLib;->libDir:Ljava/lang/String;

    return-object v0
.end method

.method public getLibPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vk/medianative/FFMpegLib;->libPath:Ljava/lang/String;

    return-object v0
.end method
