.class final synthetic Lcom/vk/stories/view/StoryView$$Lambda$11;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryView;


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryView$$Lambda$11;->arg$1:Lcom/vk/stories/view/StoryView;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryView;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryView$$Lambda$11;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$$Lambda$11;-><init>(Lcom/vk/stories/view/StoryView;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryView$$Lambda$11;->arg$1:Lcom/vk/stories/view/StoryView;

    invoke-virtual {v0, p1}, Lcom/vk/stories/view/StoryView;->lambda$init$12(Landroid/view/View;)V

    return-void
.end method
