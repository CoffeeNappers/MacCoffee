.class final synthetic Lcom/vk/stories/StoriesProcessor$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final arg$1:Landroid/graphics/Bitmap;

.field private final arg$2:Landroid/graphics/Bitmap;

.field private final arg$3:I

.field private final arg$4:I

.field private final arg$5:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method private constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILjava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$1:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$2:Landroid/graphics/Bitmap;

    iput p3, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$3:I

    iput p4, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$4:I

    iput-object p5, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$5:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static lambdaFactory$(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILjava/util/concurrent/atomic/AtomicReference;)Ljava/util/concurrent/Callable;
    .locals 6

    new-instance v0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/vk/stories/StoriesProcessor$$Lambda$3;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILjava/util/concurrent/atomic/AtomicReference;)V

    return-object v0
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 5
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$1:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$2:Landroid/graphics/Bitmap;

    iget v2, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$3:I

    iget v3, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$4:I

    iget-object v4, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->arg$5:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/vk/stories/StoriesProcessor;->lambda$saveOverlayImage$4(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILjava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
