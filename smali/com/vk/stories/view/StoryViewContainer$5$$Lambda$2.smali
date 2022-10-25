.class final synthetic Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;


# static fields
.field private static final instance:Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;

    invoke-direct {v0}, Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;-><init>()V

    sput-object v0, Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;->instance:Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;
    .locals 1

    sget-object v0, Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;->instance:Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;

    return-object v0
.end method


# virtual methods
.method public storyView(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {p1}, Lcom/vk/stories/view/StoryViewContainer$5;->lambda$onClick$1(Lcom/vk/stories/view/StoryView;)V

    return-void
.end method
