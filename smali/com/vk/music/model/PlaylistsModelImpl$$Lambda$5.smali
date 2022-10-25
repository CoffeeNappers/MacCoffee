.class final synthetic Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/model/ObservableModel$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/model/PlaylistsModelImpl;

.field private final arg$2:Lcom/vk/music/event/PlaylistCreated;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/event/PlaylistCreated;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$5;->arg$1:Lcom/vk/music/model/PlaylistsModelImpl;

    iput-object p2, p0, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$5;->arg$2:Lcom/vk/music/event/PlaylistCreated;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/event/PlaylistCreated;)Lcom/vk/music/model/ObservableModel$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$5;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$5;-><init>(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/event/PlaylistCreated;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$5;->arg$1:Lcom/vk/music/model/PlaylistsModelImpl;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$5;->arg$2:Lcom/vk/music/event/PlaylistCreated;

    check-cast p1, Lcom/vk/music/model/PlaylistsModel$Callback;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/model/PlaylistsModelImpl;->lambda$null$2(Lcom/vk/music/event/PlaylistCreated;Lcom/vk/music/model/PlaylistsModel$Callback;)V

    return-void
.end method
