.class final synthetic Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/music/view/PlaylistContainer$UserListener;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistContainer$UserListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$3;->arg$1:Lcom/vk/music/view/PlaylistContainer$UserListener;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/PlaylistContainer$UserListener;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$3;-><init>(Lcom/vk/music/view/PlaylistContainer$UserListener;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$UserListener$$Lambda$3;->arg$1:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0, p1, p2}, Lcom/vk/music/view/PlaylistContainer$UserListener;->lambda$onMenuItemClick$2(Landroid/content/DialogInterface;I)V

    return-void
.end method
