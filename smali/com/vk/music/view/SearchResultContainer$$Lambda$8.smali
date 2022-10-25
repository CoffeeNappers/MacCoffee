.class final synthetic Lcom/vk/music/view/SearchResultContainer$$Lambda$8;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF;


# instance fields
.field private final arg$1:Lcom/vk/music/view/SearchResultContainer;

.field private final arg$2:Lcom/vk/music/model/SearchResultModel;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/SearchResultContainer;Lcom/vk/music/model/SearchResultModel;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/SearchResultContainer$$Lambda$8;->arg$1:Lcom/vk/music/view/SearchResultContainer;

    iput-object p2, p0, Lcom/vk/music/view/SearchResultContainer$$Lambda$8;->arg$2:Lcom/vk/music/model/SearchResultModel;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/SearchResultContainer;Lcom/vk/music/model/SearchResultModel;)Lcom/vkontakte/android/functions/VoidF;
    .locals 1

    new-instance v0, Lcom/vk/music/view/SearchResultContainer$$Lambda$8;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/view/SearchResultContainer$$Lambda$8;-><init>(Lcom/vk/music/view/SearchResultContainer;Lcom/vk/music/model/SearchResultModel;)V

    return-object v0
.end method


# virtual methods
.method public f()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer$$Lambda$8;->arg$1:Lcom/vk/music/view/SearchResultContainer;

    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer$$Lambda$8;->arg$2:Lcom/vk/music/model/SearchResultModel;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/SearchResultContainer;->lambda$new$6(Lcom/vk/music/model/SearchResultModel;)V

    return-void
.end method
