.class final synthetic Lcom/vk/stories/view/StoryView$$Lambda$15;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryView;

.field private final arg$2:Lcom/vk/stories/model/StoryEntry;

.field private final arg$3:I


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryView;Lcom/vk/stories/model/StoryEntry;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryView$$Lambda$15;->arg$1:Lcom/vk/stories/view/StoryView;

    iput-object p2, p0, Lcom/vk/stories/view/StoryView$$Lambda$15;->arg$2:Lcom/vk/stories/model/StoryEntry;

    iput p3, p0, Lcom/vk/stories/view/StoryView$$Lambda$15;->arg$3:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryView;Lcom/vk/stories/model/StoryEntry;I)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryView$$Lambda$15;

    invoke-direct {v0, p0, p1, p2}, Lcom/vk/stories/view/StoryView$$Lambda$15;-><init>(Lcom/vk/stories/view/StoryView;Lcom/vk/stories/model/StoryEntry;I)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryView$$Lambda$15;->arg$1:Lcom/vk/stories/view/StoryView;

    iget-object v1, p0, Lcom/vk/stories/view/StoryView$$Lambda$15;->arg$2:Lcom/vk/stories/model/StoryEntry;

    iget v2, p0, Lcom/vk/stories/view/StoryView$$Lambda$15;->arg$3:I

    invoke-virtual {v0, v1, v2}, Lcom/vk/stories/view/StoryView;->lambda$deleteStory$18(Lcom/vk/stories/model/StoryEntry;I)V

    return-void
.end method
