.class final synthetic Lcom/vk/stories/StoriesController$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# static fields
.field private static final instance:Lcom/vk/stories/StoriesController$$Lambda$3;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vk/stories/StoriesController$$Lambda$3;

    invoke-direct {v0}, Lcom/vk/stories/StoriesController$$Lambda$3;-><init>()V

    sput-object v0, Lcom/vk/stories/StoriesController$$Lambda$3;->instance:Lcom/vk/stories/StoriesController$$Lambda$3;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Ljava/util/concurrent/Callable;
    .locals 1

    sget-object v0, Lcom/vk/stories/StoriesController$$Lambda$3;->instance:Lcom/vk/stories/StoriesController$$Lambda$3;

    return-object v0
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {}, Lcom/vk/stories/StoriesController;->lambda$reloadStoriesFromCache$2()Lcom/vk/stories/model/GetStoriesResponse;

    move-result-object v0

    return-object v0
.end method
