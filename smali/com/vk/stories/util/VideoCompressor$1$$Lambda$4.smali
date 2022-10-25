.class final synthetic Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

.field private final arg$2:J

.field private final arg$3:J

.field private final arg$4:Ljava/io/File;


# direct methods
.method private constructor <init>(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;JJLjava/io/File;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->arg$1:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    iput-wide p2, p0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->arg$2:J

    iput-wide p4, p0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->arg$3:J

    iput-object p6, p0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->arg$4:Ljava/io/File;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;JJLjava/io/File;)Ljava/lang/Runnable;
    .locals 7

    new-instance v0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;-><init>(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;JJLjava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 7
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->arg$1:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    iget-wide v2, p0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->arg$2:J

    iget-wide v4, p0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->arg$3:J

    iget-object v6, p0, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->arg$4:Ljava/io/File;

    invoke-static/range {v1 .. v6}, Lcom/vk/stories/util/VideoCompressor$1;->lambda$run$3(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;JJLjava/io/File;)V

    return-void
.end method
