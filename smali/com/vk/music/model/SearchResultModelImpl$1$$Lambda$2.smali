.class final synthetic Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/model/ObservableModel$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/model/SearchResultModelImpl$1;

.field private final arg$2:Ljava/util/List;

.field private final arg$3:Ljava/util/List;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/SearchResultModelImpl$1;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;->arg$1:Lcom/vk/music/model/SearchResultModelImpl$1;

    iput-object p2, p0, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;->arg$2:Ljava/util/List;

    iput-object p3, p0, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;->arg$3:Ljava/util/List;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/SearchResultModelImpl$1;Ljava/util/List;Ljava/util/List;)Lcom/vk/music/model/ObservableModel$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;-><init>(Lcom/vk/music/model/SearchResultModelImpl$1;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;->arg$1:Lcom/vk/music/model/SearchResultModelImpl$1;

    iget-object v1, p0, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;->arg$2:Ljava/util/List;

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;->arg$3:Ljava/util/List;

    check-cast p1, Lcom/vk/music/model/SearchResultModel$Callback;

    invoke-virtual {v0, v1, v2, p1}, Lcom/vk/music/model/SearchResultModelImpl$1;->lambda$success$1(Ljava/util/List;Ljava/util/List;Lcom/vk/music/model/SearchResultModel$Callback;)V

    return-void
.end method
