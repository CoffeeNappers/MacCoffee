.class public Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;
.super Ljava/lang/Object;
.source "ForwardingRequestListener.java"

# interfaces
.implements Lcom/facebook/imagepipeline/listener/RequestListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "ForwardingRequestListener"


# instance fields
.field private final mRequestListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/listener/RequestListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/facebook/imagepipeline/listener/RequestListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "requestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/facebook/imagepipeline/listener/RequestListener;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    .line 30
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 31
    .local v0, "requestListener":Lcom/facebook/imagepipeline/listener/RequestListener;
    iget-object v2, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 33
    .end local v0    # "requestListener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public varargs constructor <init>([Lcom/facebook/imagepipeline/listener/RequestListener;)V
    .locals 1
    .param p1, "requestListeners"    # [Lcom/facebook/imagepipeline/listener/RequestListener;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    .line 37
    return-void
.end method

.method private onException(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 189
    const-string/jumbo v0, "ForwardingRequestListener"

    invoke-static {v0, p1, p2}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 190
    return-void
.end method


# virtual methods
.method public onProducerEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "producerName"    # Ljava/lang/String;
    .param p3, "producerEventName"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 120
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 121
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 123
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestListener;->onProducerEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 124
    :catch_0
    move-exception v0

    .line 126
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onIntermediateChunkStart"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 129
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public onProducerFinishWithCancellation(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "producerName"    # Ljava/lang/String;
    .param p3    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p3, "extraMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 105
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 106
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 108
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestListener;->onProducerFinishWithCancellation(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 109
    :catch_0
    move-exception v0

    .line 111
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onProducerFinishWithCancellation"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 114
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public onProducerFinishWithFailure(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V
    .locals 5
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "producerName"    # Ljava/lang/String;
    .param p3, "t"    # Ljava/lang/Throwable;
    .param p4    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p4, "extraMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 90
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 91
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 93
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/listener/RequestListener;->onProducerFinishWithFailure(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 94
    :catch_0
    move-exception v0

    .line 96
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onProducerFinishWithFailure"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 99
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public onProducerFinishWithSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "producerName"    # Ljava/lang/String;
    .param p3    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p3, "extraMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 72
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 73
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 75
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestListener;->onProducerFinishWithSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 76
    :catch_0
    move-exception v0

    .line 78
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onProducerFinishWithSuccess"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 81
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public onProducerStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "producerName"    # Ljava/lang/String;

    .prologue
    .line 56
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 57
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 58
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 60
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1, p2}, Lcom/facebook/imagepipeline/listener/RequestListener;->onProducerStart(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 61
    :catch_0
    move-exception v0

    .line 63
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onProducerStart"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 66
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public onRequestCancellation(Ljava/lang/String;)V
    .locals 5
    .param p1, "requestId"    # Ljava/lang/String;

    .prologue
    .line 165
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 166
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 167
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 169
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1}, Lcom/facebook/imagepipeline/listener/RequestListener;->onRequestCancellation(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 170
    :catch_0
    move-exception v0

    .line 172
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onRequestCancellation"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 175
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public onRequestFailure(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ljava/lang/Throwable;Z)V
    .locals 5
    .param p1, "request"    # Lcom/facebook/imagepipeline/request/ImageRequest;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;
    .param p4, "isPrefetch"    # Z

    .prologue
    .line 151
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 152
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 153
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 155
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/listener/RequestListener;->onRequestFailure(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ljava/lang/Throwable;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 156
    :catch_0
    move-exception v0

    .line 158
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onRequestFailure"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 161
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public onRequestStart(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "request"    # Lcom/facebook/imagepipeline/request/ImageRequest;
    .param p2, "callerContext"    # Ljava/lang/Object;
    .param p3, "requestId"    # Ljava/lang/String;
    .param p4, "isPrefetch"    # Z

    .prologue
    .line 42
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 43
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 44
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 46
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/listener/RequestListener;->onRequestStart(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 49
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onRequestStart"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 52
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public onRequestSuccess(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "request"    # Lcom/facebook/imagepipeline/request/ImageRequest;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "isPrefetch"    # Z

    .prologue
    .line 133
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 134
    .local v3, "numberOfListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 135
    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    .line 137
    .local v2, "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :try_start_0
    invoke-interface {v2, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestListener;->onRequestSuccess(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 138
    :catch_0
    move-exception v0

    .line 140
    .local v0, "exception":Ljava/lang/Exception;
    const-string/jumbo v4, "InternalListener exception in onRequestSuccess"

    invoke-direct {p0, v4, v0}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->onException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 143
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v2    # "listener":Lcom/facebook/imagepipeline/listener/RequestListener;
    :cond_0
    return-void
.end method

.method public requiresExtraMap(Ljava/lang/String;)Z
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 179
    iget-object v2, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 180
    .local v1, "numberOfListeners":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 181
    iget-object v2, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;->mRequestListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/listener/RequestListener;

    invoke-interface {v2, p1}, Lcom/facebook/imagepipeline/listener/RequestListener;->requiresExtraMap(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 182
    const/4 v2, 0x1

    .line 185
    :goto_1
    return v2

    .line 180
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 185
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method
