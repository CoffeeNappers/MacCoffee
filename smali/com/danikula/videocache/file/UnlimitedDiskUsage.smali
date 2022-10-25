.class public Lcom/danikula/videocache/file/UnlimitedDiskUsage;
.super Ljava/lang/Object;
.source "UnlimitedDiskUsage.java"

# interfaces
.implements Lcom/danikula/videocache/file/DiskUsage;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public touch(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16
    return-void
.end method
