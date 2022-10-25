.class final synthetic Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/music/view/PlaylistsContainer$UserListener;

.field private final arg$2:Lcom/vk/music/dto/Playlist;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistsContainer$UserListener;Lcom/vk/music/dto/Playlist;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$1;->arg$1:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    iput-object p2, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$1;->arg$2:Lcom/vk/music/dto/Playlist;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/PlaylistsContainer$UserListener;Lcom/vk/music/dto/Playlist;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$1;-><init>(Lcom/vk/music/view/PlaylistsContainer$UserListener;Lcom/vk/music/dto/Playlist;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$1;->arg$1:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener$$Lambda$1;->arg$2:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vk/music/view/PlaylistsContainer$UserListener;->lambda$onActionClick$0(Lcom/vk/music/dto/Playlist;Landroid/content/DialogInterface;I)V

    return-void
.end method
