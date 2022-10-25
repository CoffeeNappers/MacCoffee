.class final Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;
.super Ljava/lang/Object;
.source "HttpProxyCacheServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/danikula/videocache/HttpProxyCacheServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "WaitRequestsRunnable"
.end annotation


# instance fields
.field private final startSignal:Ljava/util/concurrent/CountDownLatch;

.field final synthetic this$0:Lcom/danikula/videocache/HttpProxyCacheServer;


# direct methods
.method public constructor <init>(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0
    .param p2, "startSignal"    # Ljava/util/concurrent/CountDownLatch;

    .prologue
    .line 316
    iput-object p1, p0, Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;->this$0:Lcom/danikula/videocache/HttpProxyCacheServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 317
    iput-object p2, p0, Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;->startSignal:Ljava/util/concurrent/CountDownLatch;

    .line 318
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;->startSignal:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 323
    iget-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;->this$0:Lcom/danikula/videocache/HttpProxyCacheServer;

    invoke-static {v0}, Lcom/danikula/videocache/HttpProxyCacheServer;->access$100(Lcom/danikula/videocache/HttpProxyCacheServer;)V

    .line 324
    return-void
.end method
