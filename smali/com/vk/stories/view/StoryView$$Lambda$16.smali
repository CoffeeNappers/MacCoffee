.class final synthetic Lcom/vk/stories/view/StoryView$$Lambda$16;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/stories/StoryVideoCache$UrlCallback;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryView;

.field private final arg$2:Lcom/vk/stories/model/StoryEntry;


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryView;Lcom/vk/stories/model/StoryEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryView$$Lambda$16;->arg$1:Lcom/vk/stories/view/StoryView;

    iput-object p2, p0, Lcom/vk/stories/view/StoryView$$Lambda$16;->arg$2:Lcom/vk/stories/model/StoryEntry;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryView;Lcom/vk/stories/model/StoryEntry;)Lcom/vk/stories/StoryVideoCache$UrlCallback;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryView$$Lambda$16;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/view/StoryView$$Lambda$16;-><init>(Lcom/vk/stories/view/StoryView;Lcom/vk/stories/model/StoryEntry;)V

    return-object v0
.end method


# virtual methods
.method public onLinkReady(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryView$$Lambda$16;->arg$1:Lcom/vk/stories/view/StoryView;

    iget-object v1, p0, Lcom/vk/stories/view/StoryView$$Lambda$16;->arg$2:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v0, v1, p1}, Lcom/vk/stories/view/StoryView;->lambda$openStory$19(Lcom/vk/stories/model/StoryEntry;Ljava/lang/String;)V

    return-void
.end method
