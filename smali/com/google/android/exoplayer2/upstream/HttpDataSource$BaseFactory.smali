.class public abstract Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;
.super Ljava/lang/Object;
.source "HttpDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/upstream/HttpDataSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseFactory"
.end annotation


# instance fields
.field private final requestProperties:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    .line 77
    return-void
.end method


# virtual methods
.method public final clearAllDefaultRequestProperties()V
    .locals 2

    .prologue
    .line 109
    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 110
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 111
    monitor-exit v1

    .line 112
    return-void

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final clearDefaultRequestProperty(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 101
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    monitor-exit v1

    .line 105
    return-void

    .line 104
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public bridge synthetic createDataSource()Lcom/google/android/exoplayer2/upstream/DataSource;
    .locals 1

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->createDataSource()Lcom/google/android/exoplayer2/upstream/HttpDataSource;

    move-result-object v0

    return-object v0
.end method

.method public final createDataSource()Lcom/google/android/exoplayer2/upstream/HttpDataSource;
    .locals 6

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->createDataSourceInternal()Lcom/google/android/exoplayer2/upstream/HttpDataSource;

    move-result-object v0

    .line 82
    .local v0, "dataSource":Lcom/google/android/exoplayer2/upstream/HttpDataSource;
    iget-object v4, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    monitor-enter v4

    .line 83
    :try_start_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 84
    .local v1, "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Lcom/google/android/exoplayer2/upstream/HttpDataSource;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 86
    .end local v1    # "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_0
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    return-object v0
.end method

.method protected abstract createDataSourceInternal()Lcom/google/android/exoplayer2/upstream/HttpDataSource;
.end method

.method public final setDefaultRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    invoke-static {p2}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 95
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$BaseFactory;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    monitor-exit v1

    .line 97
    return-void

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
