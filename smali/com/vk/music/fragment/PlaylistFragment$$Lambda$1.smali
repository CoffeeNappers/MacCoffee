.class final synthetic Lcom/vk/music/fragment/PlaylistFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;


# instance fields
.field private final arg$1:Lcom/vk/music/fragment/PlaylistFragment;


# direct methods
.method private constructor <init>(Lcom/vk/music/fragment/PlaylistFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/fragment/PlaylistFragment$$Lambda$1;->arg$1:Lcom/vk/music/fragment/PlaylistFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/fragment/PlaylistFragment;)Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;
    .locals 1

    new-instance v0, Lcom/vk/music/fragment/PlaylistFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/music/fragment/PlaylistFragment$$Lambda$1;-><init>(Lcom/vk/music/fragment/PlaylistFragment;)V

    return-object v0
.end method


# virtual methods
.method public createView(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment$$Lambda$1;->arg$1:Lcom/vk/music/fragment/PlaylistFragment;

    invoke-virtual {v0, p1}, Lcom/vk/music/fragment/PlaylistFragment;->lambda$createDelegate$0(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
