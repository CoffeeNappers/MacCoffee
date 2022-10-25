.class final synthetic Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/event/Subscriber;


# instance fields
.field private final arg$1:Lcom/vk/music/model/PlaylistsModelImpl;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/PlaylistsModelImpl;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$3;->arg$1:Lcom/vk/music/model/PlaylistsModelImpl;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl;)Lcom/vk/music/event/Subscriber;
    .locals 1

    new-instance v0, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$3;-><init>(Lcom/vk/music/model/PlaylistsModelImpl;)V

    return-object v0
.end method


# virtual methods
.method public onEvent(Lcom/vk/music/event/Event;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$3;->arg$1:Lcom/vk/music/model/PlaylistsModelImpl;

    check-cast p1, Lcom/vk/music/event/PlaylistRemoved;

    invoke-virtual {v0, p1}, Lcom/vk/music/model/PlaylistsModelImpl;->lambda$new$5(Lcom/vk/music/event/PlaylistRemoved;)V

    return-void
.end method
