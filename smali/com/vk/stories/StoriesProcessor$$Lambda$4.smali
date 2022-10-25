.class final synthetic Lcom/vk/stories/StoriesProcessor$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Lbolts/Continuation;


# instance fields
.field private final arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;

.field private final arg$2:Ljava/util/concurrent/atomic/AtomicReference;

.field private final arg$3:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method private constructor <init>(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$4;->arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;

    iput-object p2, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$4;->arg$2:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p3, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$4;->arg$3:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)Lbolts/Continuation;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoriesProcessor$$Lambda$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/vk/stories/StoriesProcessor$$Lambda$4;-><init>(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)V

    return-object v0
.end method


# virtual methods
.method public then(Lbolts/Task;)Ljava/lang/Object;
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$4;->arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;

    iget-object v1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$4;->arg$2:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v2, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$4;->arg$3:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, v1, v2, p1}, Lcom/vk/stories/StoriesProcessor;->lambda$saveOverlayImage$5(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;Lbolts/Task;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
