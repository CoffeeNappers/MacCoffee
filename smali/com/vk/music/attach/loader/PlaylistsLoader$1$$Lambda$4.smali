.class final synthetic Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/loader/PlaylistsLoader$1;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/loader/PlaylistsLoader$1;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$4;->arg$1:Lcom/vk/music/attach/loader/PlaylistsLoader$1;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistsLoader$1;)Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$4;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$4;-><init>(Lcom/vk/music/attach/loader/PlaylistsLoader$1;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$4;->arg$1:Lcom/vk/music/attach/loader/PlaylistsLoader$1;

    check-cast p1, Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;

    invoke-virtual {v0, p1}, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->lambda$fail$3(Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V

    return-void
.end method
