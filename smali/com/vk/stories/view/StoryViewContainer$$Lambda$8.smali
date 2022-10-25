.class final synthetic Lcom/vk/stories/view/StoryViewContainer$$Lambda$8;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryViewContainer;

.field private final arg$2:Lcom/vk/stories/model/StoriesContainer;


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/model/StoriesContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$8;->arg$1:Lcom/vk/stories/view/StoryViewContainer;

    iput-object p2, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$8;->arg$2:Lcom/vk/stories/model/StoriesContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/model/StoriesContainer;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$8;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$8;-><init>(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/model/StoriesContainer;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$8;->arg$1:Lcom/vk/stories/view/StoryViewContainer;

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$8;->arg$2:Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v0, v1, p1}, Lcom/vk/stories/view/StoryViewContainer;->lambda$showStory$7(Lcom/vk/stories/model/StoriesContainer;Landroid/view/View;)V

    return-void
.end method
