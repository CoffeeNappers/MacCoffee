.class final synthetic Lcom/vk/music/model/MusicModelImpl$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/event/Subscriber;


# instance fields
.field private final arg$1:Lcom/vk/music/model/MusicModelImpl;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/MusicModelImpl;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl$$Lambda$2;->arg$1:Lcom/vk/music/model/MusicModelImpl;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/MusicModelImpl;)Lcom/vk/music/event/Subscriber;
    .locals 1

    new-instance v0, Lcom/vk/music/model/MusicModelImpl$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/music/model/MusicModelImpl$$Lambda$2;-><init>(Lcom/vk/music/model/MusicModelImpl;)V

    return-object v0
.end method


# virtual methods
.method public onEvent(Lcom/vk/music/event/Event;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$$Lambda$2;->arg$1:Lcom/vk/music/model/MusicModelImpl;

    check-cast p1, Lcom/vk/music/event/PlaylistCreated;

    invoke-virtual {v0, p1}, Lcom/vk/music/model/MusicModelImpl;->lambda$new$3(Lcom/vk/music/event/PlaylistCreated;)V

    return-void
.end method
