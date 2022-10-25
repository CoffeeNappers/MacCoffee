.class Lcom/danikula/videocache/Config;
.super Ljava/lang/Object;
.source "Config.java"


# instance fields
.field public final cacheRoot:Ljava/io/File;

.field public final diskUsage:Lcom/danikula/videocache/file/DiskUsage;

.field public final fileNameGenerator:Lcom/danikula/videocache/file/FileNameGenerator;

.field public final sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;


# direct methods
.method constructor <init>(Ljava/io/File;Lcom/danikula/videocache/file/FileNameGenerator;Lcom/danikula/videocache/file/DiskUsage;Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;)V
    .locals 0
    .param p1, "cacheRoot"    # Ljava/io/File;
    .param p2, "fileNameGenerator"    # Lcom/danikula/videocache/file/FileNameGenerator;
    .param p3, "diskUsage"    # Lcom/danikula/videocache/file/DiskUsage;
    .param p4, "sourceInfoStorage"    # Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/danikula/videocache/Config;->cacheRoot:Ljava/io/File;

    .line 23
    iput-object p2, p0, Lcom/danikula/videocache/Config;->fileNameGenerator:Lcom/danikula/videocache/file/FileNameGenerator;

    .line 24
    iput-object p3, p0, Lcom/danikula/videocache/Config;->diskUsage:Lcom/danikula/videocache/file/DiskUsage;

    .line 25
    iput-object p4, p0, Lcom/danikula/videocache/Config;->sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    .line 26
    return-void
.end method


# virtual methods
.method generateCacheFile(Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 29
    iget-object v1, p0, Lcom/danikula/videocache/Config;->fileNameGenerator:Lcom/danikula/videocache/file/FileNameGenerator;

    invoke-interface {v1, p1}, Lcom/danikula/videocache/file/FileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 30
    .local v0, "name":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/danikula/videocache/Config;->cacheRoot:Ljava/io/File;

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method
