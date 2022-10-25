.class final synthetic Lcom/vk/stories/StoriesProcessor$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final arg$1:Landroid/graphics/Bitmap;

.field private final arg$2:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method private constructor <init>(Landroid/graphics/Bitmap;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$2;->arg$1:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$2;->arg$2:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static lambdaFactory$(Landroid/graphics/Bitmap;Ljava/util/concurrent/atomic/AtomicReference;)Ljava/util/concurrent/Callable;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoriesProcessor$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/StoriesProcessor$$Lambda$2;-><init>(Landroid/graphics/Bitmap;Ljava/util/concurrent/atomic/AtomicReference;)V

    return-object v0
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$2;->arg$1:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$2;->arg$2:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, v1}, Lcom/vk/stories/StoriesProcessor;->lambda$saveOverlayImage$3(Landroid/graphics/Bitmap;Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
