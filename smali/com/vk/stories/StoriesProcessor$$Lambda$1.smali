.class final synthetic Lcom/vk/stories/StoriesProcessor$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Landroid/graphics/Bitmap;

.field private final arg$2:Landroid/graphics/Bitmap;

.field private final arg$3:I

.field private final arg$4:I

.field private final arg$5:Z

.field private final arg$6:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;


# direct methods
.method private constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$1:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$2:Landroid/graphics/Bitmap;

    iput p3, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$3:I

    iput p4, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$4:I

    iput-boolean p5, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$5:Z

    iput-object p6, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$6:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    return-void
.end method

.method public static lambdaFactory$(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)Ljava/lang/Runnable;
    .locals 7

    new-instance v0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/vk/stories/StoriesProcessor$$Lambda$1;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 6
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$1:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$2:Landroid/graphics/Bitmap;

    iget v2, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$3:I

    iget v3, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$4:I

    iget-boolean v4, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$5:Z

    iget-object v5, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->arg$6:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    invoke-static/range {v0 .. v5}, Lcom/vk/stories/StoriesProcessor;->lambda$processImage$2(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V

    return-void
.end method
