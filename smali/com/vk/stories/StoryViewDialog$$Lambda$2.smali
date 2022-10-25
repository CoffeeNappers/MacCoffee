.class final synthetic Lcom/vk/stories/StoryViewDialog$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Landroid/animation/AnimatorSet;


# direct methods
.method private constructor <init>(Landroid/animation/AnimatorSet;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog$$Lambda$2;->arg$1:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public static lambdaFactory$(Landroid/animation/AnimatorSet;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoryViewDialog$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/stories/StoryViewDialog$$Lambda$2;-><init>(Landroid/animation/AnimatorSet;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$$Lambda$2;->arg$1:Landroid/animation/AnimatorSet;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->lambda$startOpenAnimation$1(Landroid/animation/AnimatorSet;)V

    return-void
.end method
