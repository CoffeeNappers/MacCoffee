.class public Lcom/danikula/videocache/file/TotalCountLruDiskUsage;
.super Lcom/danikula/videocache/file/LruDiskUsage;
.source "TotalCountLruDiskUsage.java"


# instance fields
.field private final maxCount:I


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "maxCount"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/danikula/videocache/file/LruDiskUsage;-><init>()V

    .line 15
    if-gtz p1, :cond_0

    .line 16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Max count must be positive number!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 18
    :cond_0
    iput p1, p0, Lcom/danikula/videocache/file/TotalCountLruDiskUsage;->maxCount:I

    .line 19
    return-void
.end method


# virtual methods
.method protected accept(Ljava/io/File;JI)Z
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .param p2, "totalSize"    # J
    .param p4, "totalCount"    # I

    .prologue
    .line 23
    iget v0, p0, Lcom/danikula/videocache/file/TotalCountLruDiskUsage;->maxCount:I

    if-gt p4, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic touch(Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10
    invoke-super {p0, p1}, Lcom/danikula/videocache/file/LruDiskUsage;->touch(Ljava/io/File;)V

    return-void
.end method
