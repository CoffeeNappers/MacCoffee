.class final synthetic Lcom/vk/stories/view/StoryView$$Lambda$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;


# instance fields
.field private final arg$1:Lcom/vk/stories/view/StoryView;


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/view/StoryView$$Lambda$7;->arg$1:Lcom/vk/stories/view/StoryView;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryView$$Lambda$7;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoryView$$Lambda$7;-><init>(Lcom/vk/stories/view/StoryView;)V

    return-object v0
.end method


# virtual methods
.method public onFirstFrameRendered(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/view/StoryView$$Lambda$7;->arg$1:Lcom/vk/stories/view/StoryView;

    invoke-virtual {v0, p1}, Lcom/vk/stories/view/StoryView;->lambda$init$6(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    return-void
.end method
