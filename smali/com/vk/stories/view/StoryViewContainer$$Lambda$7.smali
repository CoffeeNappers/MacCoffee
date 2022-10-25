.class final synthetic Lcom/vk/stories/view/StoryViewContainer$$Lambda$7;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryViewContainer;


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$7;->arg$1:Lcom/vk/stories/view/StoryViewContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$7;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$7;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$7;->arg$1:Lcom/vk/stories/view/StoryViewContainer;

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {v0, p1}, Lcom/vk/stories/view/StoryViewContainer;->lambda$init$6(Ljava/lang/Throwable;)V

    return-void
.end method
