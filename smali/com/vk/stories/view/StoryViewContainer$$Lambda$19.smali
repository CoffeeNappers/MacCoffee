.class final synthetic Lcom/vk/stories/view/StoryViewContainer$$Lambda$19;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;


# instance fields
.field private final arg$1:Lcom/vk/stories/StoriesController$StoryUpload;


# direct methods
.method private constructor <init>(Lcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$19;->arg$1:Lcom/vk/stories/StoriesController$StoryUpload;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/StoriesController$StoryUpload;)Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$19;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryViewContainer$$Lambda$19;-><init>(Lcom/vk/stories/StoriesController$StoryUpload;)V

    return-object v0
.end method


# virtual methods
.method public storyView(Lcom/vk/stories/view/StoryView;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$$Lambda$19;->arg$1:Lcom/vk/stories/StoriesController$StoryUpload;

    invoke-static {v0, p1}, Lcom/vk/stories/view/StoryViewContainer;->lambda$dispatchUploadError$18(Lcom/vk/stories/StoriesController$StoryUpload;Lcom/vk/stories/view/StoryView;)V

    return-void
.end method
