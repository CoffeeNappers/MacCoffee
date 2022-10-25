.class final synthetic Lcom/vk/music/view/RecommendedContainer$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lme/grishka/appkit/views/DividerItemDecoration$Provider;


# instance fields
.field private final arg$1:Lcom/vk/music/view/RecommendedContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/RecommendedContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/RecommendedContainer$$Lambda$2;->arg$1:Lcom/vk/music/view/RecommendedContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/RecommendedContainer;)Lme/grishka/appkit/views/DividerItemDecoration$Provider;
    .locals 1

    new-instance v0, Lcom/vk/music/view/RecommendedContainer$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/music/view/RecommendedContainer$$Lambda$2;-><init>(Lcom/vk/music/view/RecommendedContainer;)V

    return-object v0
.end method


# virtual methods
.method public needDrawDividerAfter(I)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer$$Lambda$2;->arg$1:Lcom/vk/music/view/RecommendedContainer;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/RecommendedContainer;->lambda$new$1(I)Z

    move-result v0

    return v0
.end method
