.class Lcom/vk/lists/NextFromHolder;
.super Ljava/lang/Object;
.source "NextFromHolder.java"


# instance fields
.field private volatile nextFrom:Ljava/lang/String;

.field private pageSize:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string/jumbo v0, "0"

    iput-object v0, p0, Lcom/vk/lists/NextFromHolder;->nextFrom:Ljava/lang/String;

    .line 6
    const/16 v0, 0x1e

    iput v0, p0, Lcom/vk/lists/NextFromHolder;->pageSize:I

    return-void
.end method


# virtual methods
.method public declared-synchronized getIntNextFrom()I
    .locals 2

    .prologue
    .line 22
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/vk/lists/NextFromHolder;->getNextFrom()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 24
    :goto_0
    monitor-exit p0

    return v1

    .line 23
    :catch_0
    move-exception v0

    .line 24
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0

    .line 22
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getNextFrom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/lists/NextFromHolder;->nextFrom:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getPageSize()I
    .locals 1

    .prologue
    .line 9
    iget v0, p0, Lcom/vk/lists/NextFromHolder;->pageSize:I

    return v0
.end method

.method public declared-synchronized incrementNextFrom(I)V
    .locals 2
    .param p1, "totalCount"    # I

    .prologue
    .line 37
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/vk/lists/NextFromHolder;->getIntNextFrom()I

    move-result v0

    iget v1, p0, Lcom/vk/lists/NextFromHolder;->pageSize:I

    add-int/2addr v0, v1

    if-lt v0, p1, :cond_0

    .line 38
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/lists/NextFromHolder;->setNextFrom(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :goto_0
    monitor-exit p0

    return-void

    .line 40
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/vk/lists/NextFromHolder;->getIntNextFrom()I

    move-result v0

    iget v1, p0, Lcom/vk/lists/NextFromHolder;->pageSize:I

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/vk/lists/NextFromHolder;->setIntNextFrom(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setIntNextFrom(I)V
    .locals 1
    .param p1, "nextFrom"    # I

    .prologue
    .line 17
    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/lists/NextFromHolder;->setNextFrom(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    monitor-exit p0

    return-void

    .line 17
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setNextFrom(Ljava/lang/String;)V
    .locals 1
    .param p1, "nextFrom"    # Ljava/lang/String;

    .prologue
    .line 33
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/vk/lists/NextFromHolder;->nextFrom:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    monitor-exit p0

    return-void

    .line 33
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setPageSize(I)V
    .locals 0
    .param p1, "pageSize"    # I

    .prologue
    .line 13
    iput p1, p0, Lcom/vk/lists/NextFromHolder;->pageSize:I

    .line 14
    return-void
.end method
