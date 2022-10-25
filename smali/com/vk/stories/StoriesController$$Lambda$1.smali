.class final synthetic Lcom/vk/stories/StoriesController$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Ljava/lang/String;

.field private final arg$2:Lcom/vk/stories/model/StoryEntry;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesController$$Lambda$1;->arg$1:Ljava/lang/String;

    iput-object p2, p0, Lcom/vk/stories/StoriesController$$Lambda$1;->arg$2:Lcom/vk/stories/model/StoryEntry;

    return-void
.end method

.method public static lambdaFactory$(Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoriesController$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/StoriesController$$Lambda$1;-><init>(Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesController$$Lambda$1;->arg$1:Ljava/lang/String;

    iget-object v1, p0, Lcom/vk/stories/StoriesController$$Lambda$1;->arg$2:Lcom/vk/stories/model/StoryEntry;

    invoke-static {v0, v1, p1}, Lcom/vk/stories/StoriesController;->lambda$markAsSeen$0(Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;Ljava/lang/Object;)V

    return-void
.end method
