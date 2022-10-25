.class final synthetic Lcom/vk/music/view/PlaylistContainer$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# instance fields
.field private final arg$1:Lcom/vk/music/view/PlaylistContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/PlaylistContainer$$Lambda$3;->arg$1:Lcom/vk/music/view/PlaylistContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/PlaylistContainer;)Lcom/vkontakte/android/functions/F1;
    .locals 1

    new-instance v0, Lcom/vk/music/view/PlaylistContainer$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vk/music/view/PlaylistContainer$$Lambda$3;-><init>(Lcom/vk/music/view/PlaylistContainer;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$$Lambda$3;->arg$1:Lcom/vk/music/view/PlaylistContainer;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/PlaylistContainer;->lambda$new$3(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
