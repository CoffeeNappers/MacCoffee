.class final synthetic Lcom/vk/stories/StoriesProcessor$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;


# direct methods
.method private constructor <init>(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$6;->arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoriesProcessor$$Lambda$6;

    invoke-direct {v0, p0}, Lcom/vk/stories/StoriesProcessor$$Lambda$6;-><init>(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesProcessor$$Lambda$6;->arg$1:Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    invoke-static {v0}, Lcom/vk/stories/StoriesProcessor;->lambda$null$1(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V

    return-void
.end method
