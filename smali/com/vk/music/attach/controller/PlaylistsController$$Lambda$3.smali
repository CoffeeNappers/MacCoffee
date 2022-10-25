.class final synthetic Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/view/adapter/IdResolver;


# static fields
.field private static final instance:Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;

    invoke-direct {v0}, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;-><init>()V

    sput-object v0, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;->instance:Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;
    .locals 1

    sget-object v0, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;->instance:Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;

    return-object v0
.end method


# virtual methods
.method public resolve(Ljava/lang/Object;)J
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    check-cast p1, Lcom/vk/music/dto/Playlist;

    invoke-virtual {p1}, Lcom/vk/music/dto/Playlist;->getPid()J

    move-result-wide v0

    return-wide v0
.end method
