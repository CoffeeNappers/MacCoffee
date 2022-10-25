.class final synthetic Lcom/vk/stories/view/StoryViewContainer$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/attachpicker/events/NotificationListener;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryViewContainer;


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$2;->arg$1:Lcom/vk/stories/view/StoryViewContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/attachpicker/events/NotificationListener;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$2;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    return-object v0
.end method


# virtual methods
.method public onNotification(IILjava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$2;->arg$1:Lcom/vk/stories/view/StoryViewContainer;

    check-cast p3, Lcom/vk/stories/StoriesController$StoryUpload;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vk/stories/view/StoryViewContainer;->lambda$new$1(IILcom/vk/stories/StoriesController$StoryUpload;)V

    return-void
.end method
