.class final synthetic Lcom/vk/music/view/PlaylistsContainer$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# instance fields
.field private final arg$1:Lcom/vk/music/view/PlaylistsContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistsContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$6;->arg$1:Lcom/vk/music/view/PlaylistsContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/PlaylistsContainer;)Lcom/vkontakte/android/functions/F1;
    .locals 1

    new-instance v0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$6;

    invoke-direct {v0, p0}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$6;-><init>(Lcom/vk/music/view/PlaylistsContainer;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$6;->arg$1:Lcom/vk/music/view/PlaylistsContainer;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/PlaylistsContainer;->lambda$new$3(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
