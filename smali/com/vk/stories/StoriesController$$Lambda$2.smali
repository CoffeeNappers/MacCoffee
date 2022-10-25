.class final synthetic Lcom/vk/stories/StoriesController$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoriesController$$Lambda$2;->arg$1:Ljava/lang/String;

    return-void
.end method

.method public static lambdaFactory$(Ljava/lang/String;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoriesController$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/stories/StoriesController$$Lambda$2;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoriesController$$Lambda$2;->arg$1:Ljava/lang/String;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p1}, Lcom/vk/stories/StoriesController;->lambda$markAsSeen$1(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
