.class final synthetic Lcom/vk/music/view/PlaylistsContainer$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;


# instance fields
.field private final arg$1:Lcom/vk/music/model/PlaylistsModel;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/PlaylistsModel;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$2;->arg$1:Lcom/vk/music/model/PlaylistsModel;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/PlaylistsModel;)Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;
    .locals 1

    new-instance v0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$2;-><init>(Lcom/vk/music/model/PlaylistsModel;)V

    return-object v0
.end method


# virtual methods
.method public onRefresh()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$2;->arg$1:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistsModel;->loadPlaylists()V

    return-void
.end method
