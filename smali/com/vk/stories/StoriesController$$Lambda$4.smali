.class final synthetic Lcom/vk/stories/StoriesController$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final arg$1:Lorg/json/JSONObject;

.field private final arg$2:Lcom/vk/stories/model/StoryEntry;


# direct methods
.method private constructor <init>(Lorg/json/JSONObject;Lcom/vk/stories/model/StoryEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesController$$Lambda$4;->arg$1:Lorg/json/JSONObject;

    iput-object p2, p0, Lcom/vk/stories/StoriesController$$Lambda$4;->arg$2:Lcom/vk/stories/model/StoryEntry;

    return-void
.end method

.method public static lambdaFactory$(Lorg/json/JSONObject;Lcom/vk/stories/model/StoryEntry;)Ljava/util/concurrent/Callable;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoriesController$$Lambda$4;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/StoriesController$$Lambda$4;-><init>(Lorg/json/JSONObject;Lcom/vk/stories/model/StoryEntry;)V

    return-object v0
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesController$$Lambda$4;->arg$1:Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/vk/stories/StoriesController$$Lambda$4;->arg$2:Lcom/vk/stories/model/StoryEntry;

    invoke-static {v0, v1}, Lcom/vk/stories/StoriesController;->lambda$markStoryInJsonAsSeen$3(Lorg/json/JSONObject;Lcom/vk/stories/model/StoryEntry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
