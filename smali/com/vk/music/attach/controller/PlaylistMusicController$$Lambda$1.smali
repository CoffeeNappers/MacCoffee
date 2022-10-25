.class final synthetic Lcom/vk/music/attach/controller/PlaylistMusicController$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/controller/PlaylistMusicController;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/controller/PlaylistMusicController;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController$$Lambda$1;->arg$1:Lcom/vk/music/attach/controller/PlaylistMusicController;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistMusicController;)Lcom/vkontakte/android/functions/VoidF;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/PlaylistMusicController$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/PlaylistMusicController$$Lambda$1;-><init>(Lcom/vk/music/attach/controller/PlaylistMusicController;)V

    return-object v0
.end method


# virtual methods
.method public f()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistMusicController$$Lambda$1;->arg$1:Lcom/vk/music/attach/controller/PlaylistMusicController;

    invoke-static {v0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->access$lambda$0(Lcom/vk/music/attach/controller/PlaylistMusicController;)V

    return-void
.end method
