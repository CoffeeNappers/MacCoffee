.class final synthetic Lcom/vk/music/model/MusicModelImpl$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/model/ObservableModel$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/model/MusicModelImpl;

.field private final arg$2:Lcom/vk/music/event/PlaylistChanged;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/MusicModelImpl;Lcom/vk/music/event/PlaylistChanged;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl$$Lambda$6;->arg$1:Lcom/vk/music/model/MusicModelImpl;

    iput-object p2, p0, Lcom/vk/music/model/MusicModelImpl$$Lambda$6;->arg$2:Lcom/vk/music/event/PlaylistChanged;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/MusicModelImpl;Lcom/vk/music/event/PlaylistChanged;)Lcom/vk/music/model/ObservableModel$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/model/MusicModelImpl$$Lambda$6;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/model/MusicModelImpl$$Lambda$6;-><init>(Lcom/vk/music/model/MusicModelImpl;Lcom/vk/music/event/PlaylistChanged;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$$Lambda$6;->arg$1:Lcom/vk/music/model/MusicModelImpl;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl$$Lambda$6;->arg$2:Lcom/vk/music/event/PlaylistChanged;

    check-cast p1, Lcom/vk/music/model/MusicModel$Callback;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/model/MusicModelImpl;->lambda$null$0(Lcom/vk/music/event/PlaylistChanged;Lcom/vk/music/model/MusicModel$Callback;)V

    return-void
.end method
