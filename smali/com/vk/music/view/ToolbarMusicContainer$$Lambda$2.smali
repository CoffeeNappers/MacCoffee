.class final synthetic Lcom/vk/music/view/ToolbarMusicContainer$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/view/MusicContainer$Host;


# instance fields
.field private final arg$1:Lcom/vk/music/view/ToolbarMusicContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/ToolbarMusicContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/ToolbarMusicContainer$$Lambda$2;->arg$1:Lcom/vk/music/view/ToolbarMusicContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/ToolbarMusicContainer;)Lcom/vk/music/view/MusicContainer$Host;
    .locals 1

    new-instance v0, Lcom/vk/music/view/ToolbarMusicContainer$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/music/view/ToolbarMusicContainer$$Lambda$2;-><init>(Lcom/vk/music/view/ToolbarMusicContainer;)V

    return-object v0
.end method


# virtual methods
.method public requestPlaylist()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/ToolbarMusicContainer$$Lambda$2;->arg$1:Lcom/vk/music/view/ToolbarMusicContainer;

    invoke-virtual {v0}, Lcom/vk/music/view/ToolbarMusicContainer;->lambda$new$1()V

    return-void
.end method
