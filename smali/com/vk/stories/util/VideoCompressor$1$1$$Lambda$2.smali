.class final synthetic Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

.field private final arg$2:I


# direct methods
.method private constructor <init>(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$2;->arg$1:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    iput p2, p0, Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$2;->arg$2:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;I)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$2;-><init>(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;I)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$2;->arg$1:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    iget v1, p0, Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$2;->arg$2:I

    invoke-static {v0, v1}, Lcom/vk/stories/util/VideoCompressor$1$1;->lambda$onBytes$1(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;I)V

    return-void
.end method
