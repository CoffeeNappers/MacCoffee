.class final synthetic Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;

.field private final arg$2:Lcom/vk/music/dto/PlaylistSearchResult;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;Lcom/vk/music/dto/PlaylistSearchResult;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1$$Lambda$2;->arg$1:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;

    iput-object p2, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1$$Lambda$2;->arg$2:Lcom/vk/music/dto/PlaylistSearchResult;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;Lcom/vk/music/dto/PlaylistSearchResult;)Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1$$Lambda$2;-><init>(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;Lcom/vk/music/dto/PlaylistSearchResult;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1$$Lambda$2;->arg$1:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1$$Lambda$2;->arg$2:Lcom/vk/music/dto/PlaylistSearchResult;

    check-cast p1, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;->lambda$success$1(Lcom/vk/music/dto/PlaylistSearchResult;Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;)V

    return-void
.end method
