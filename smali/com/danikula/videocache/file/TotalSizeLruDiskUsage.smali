.class public Lcom/danikula/videocache/file/TotalSizeLruDiskUsage;
.super Lcom/danikula/videocache/file/LruDiskUsage;
.source "TotalSizeLruDiskUsage.java"


# instance fields
.field private final maxSize:J


# direct methods
.method public constructor <init>(J)V
    .locals 3
    .param p1, "maxSize"    # J

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/danikula/videocache/file/LruDiskUsage;-><init>()V

    .line 15
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    .line 16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Max size must be positive number!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 18
    :cond_0
    iput-wide p1, p0, Lcom/danikula/videocache/file/TotalSizeLruDiskUsage;->maxSize:J

    .line 19
    return-void
.end method


# virtual methods
.method protected accept(Ljava/io/File;JI)Z
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .param p2, "totalSize"    # J
    .param p4, "totalCount"    # I

    .prologue
    .line 23
    iget-wide v0, p0, Lcom/danikula/videocache/file/TotalSizeLruDiskUsage;->maxSize:J

    cmp-long v0, p2, v0

    if-gtz v0, :cond_0

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
