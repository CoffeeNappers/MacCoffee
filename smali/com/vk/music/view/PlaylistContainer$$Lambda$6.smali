.class final synthetic Lcom/vk/music/view/PlaylistContainer$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/music/view/PlaylistContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/PlaylistContainer$$Lambda$6;->arg$1:Lcom/vk/music/view/PlaylistContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/PlaylistContainer;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/music/view/PlaylistContainer$$Lambda$6;

    invoke-direct {v0, p0}, Lcom/vk/music/view/PlaylistContainer$$Lambda$6;-><init>(Lcom/vk/music/view/PlaylistContainer;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$$Lambda$6;->arg$1:Lcom/vk/music/view/PlaylistContainer;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/PlaylistContainer;->lambda$null$2(Landroid/view/View;)V

    return-void
.end method
