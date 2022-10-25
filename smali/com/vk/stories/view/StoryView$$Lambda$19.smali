.class final synthetic Lcom/vk/stories/view/StoryView$$Lambda$19;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryView;


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryView$$Lambda$19;->arg$1:Lcom/vk/stories/view/StoryView;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryView;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryView$$Lambda$19;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$$Lambda$19;-><init>(Lcom/vk/stories/view/StoryView;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryView$$Lambda$19;->arg$1:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$lambda$0(Lcom/vk/stories/view/StoryView;)V

    return-void
.end method
