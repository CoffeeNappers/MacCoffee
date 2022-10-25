.class Lcom/vk/core/network/Network$ClientHolder;
.super Ljava/lang/Object;
.source "Network.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/network/Network;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClientHolder"
.end annotation


# instance fields
.field private builder:Lokhttp3/OkHttpClient$Builder;

.field private client:Lokhttp3/OkHttpClient;

.field private final id:Lcom/vk/core/network/Network$ClientType;

.field private final lock:Ljava/lang/Object;

.field final synthetic this$0:Lcom/vk/core/network/Network;


# direct methods
.method public constructor <init>(Lcom/vk/core/network/Network;Lcom/vk/core/network/Network$ClientType;)V
    .locals 2
    .param p2, "id"    # Lcom/vk/core/network/Network$ClientType;

    .prologue
    const/4 v1, 0x0

    .line 217
    iput-object p1, p0, Lcom/vk/core/network/Network$ClientHolder;->this$0:Lcom/vk/core/network/Network;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->lock:Ljava/lang/Object;

    .line 214
    iput-object v1, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    .line 215
    iput-object v1, p0, Lcom/vk/core/network/Network$ClientHolder;->client:Lokhttp3/OkHttpClient;

    .line 218
    iput-object p2, p0, Lcom/vk/core/network/Network$ClientHolder;->id:Lcom/vk/core/network/Network$ClientType;

    .line 219
    return-void
.end method

.method private empty()Z
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->client:Lokhttp3/OkHttpClient;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addHost()V
    .locals 3

    .prologue
    .line 247
    iget-object v1, p0, Lcom/vk/core/network/Network$ClientHolder;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 248
    :try_start_0
    invoke-direct {p0}, Lcom/vk/core/network/Network$ClientHolder;->empty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 249
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/Network;->makeBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    .line 251
    :cond_0
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    iget-object v2, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    invoke-static {v0, v2}, Lcom/vk/core/network/Network;->access$100(Lcom/vk/core/network/Network;Lokhttp3/OkHttpClient$Builder;)V

    .line 252
    iget-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->client:Lokhttp3/OkHttpClient;

    .line 253
    monitor-exit v1

    .line 254
    return-void

    .line 253
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public builder()Lokhttp3/OkHttpClient$Builder;
    .locals 1

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/vk/core/network/Network$ClientHolder;->client()Lokhttp3/OkHttpClient;

    .line 235
    iget-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    return-object v0
.end method

.method public client()Lokhttp3/OkHttpClient;
    .locals 2

    .prologue
    .line 222
    invoke-direct {p0}, Lcom/vk/core/network/Network$ClientHolder;->empty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 223
    iget-object v1, p0, Lcom/vk/core/network/Network$ClientHolder;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 224
    :try_start_0
    invoke-direct {p0}, Lcom/vk/core/network/Network$ClientHolder;->empty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/Network;->makeBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    .line 226
    iget-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->client:Lokhttp3/OkHttpClient;

    .line 228
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    :cond_1
    iget-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->client:Lokhttp3/OkHttpClient;

    return-object v0

    .line 228
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public removeHost()V
    .locals 3

    .prologue
    .line 257
    iget-object v1, p0, Lcom/vk/core/network/Network$ClientHolder;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 258
    :try_start_0
    invoke-direct {p0}, Lcom/vk/core/network/Network$ClientHolder;->empty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 259
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    iget-object v2, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    invoke-static {v0, v2}, Lcom/vk/core/network/Network;->access$200(Lcom/vk/core/network/Network;Lokhttp3/OkHttpClient$Builder;)V

    .line 260
    iget-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->client:Lokhttp3/OkHttpClient;

    .line 262
    :cond_0
    monitor-exit v1

    .line 263
    return-void

    .line 262
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setBuilder(Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient;
    .locals 2
    .param p1, "builder"    # Lokhttp3/OkHttpClient$Builder;

    .prologue
    .line 239
    iget-object v1, p0, Lcom/vk/core/network/Network$ClientHolder;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 240
    :try_start_0
    iput-object p1, p0, Lcom/vk/core/network/Network$ClientHolder;->builder:Lokhttp3/OkHttpClient$Builder;

    .line 241
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->client:Lokhttp3/OkHttpClient;

    .line 242
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    iget-object v0, p0, Lcom/vk/core/network/Network$ClientHolder;->client:Lokhttp3/OkHttpClient;

    return-object v0

    .line 242
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
