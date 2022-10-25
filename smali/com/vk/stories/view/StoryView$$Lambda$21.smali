.class final synthetic Lcom/vk/stories/view/StoryView$$Lambda$21;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryView;

.field private final arg$2:I


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryView;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryView$$Lambda$21;->arg$1:Lcom/vk/stories/view/StoryView;

    iput p2, p0, Lcom/vk/stories/view/StoryView$$Lambda$21;->arg$2:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryView;I)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryView$$Lambda$21;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/view/StoryView$$Lambda$21;-><init>(Lcom/vk/stories/view/StoryView;I)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryView$$Lambda$21;->arg$1:Lcom/vk/stories/view/StoryView;

    iget v1, p0, Lcom/vk/stories/view/StoryView$$Lambda$21;->arg$2:I

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/StoryView;->lambda$null$11(I)V

    return-void
.end method
