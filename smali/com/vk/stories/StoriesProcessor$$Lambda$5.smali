.class final synthetic Lcom/vk/stories/StoriesProcessor$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

.field private final arg$2:Ljava/io/File;


# direct methods
.method private constructor <init>(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;Ljava/io/File;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$5;->arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    iput-object p2, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$5;->arg$2:Ljava/io/File;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;Ljava/io/File;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoriesProcessor$$Lambda$5;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/StoriesProcessor$$Lambda$5;-><init>(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;Ljava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$5;->arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    iget-object v1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$5;->arg$2:Ljava/io/File;

    invoke-static {v0, v1}, Lcom/vk/stories/StoriesProcessor;->lambda$null$0(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;Ljava/io/File;)V

    return-void
.end method
