.class final synthetic Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/controller/PlaylistsSearchController;

.field private final arg$2:Landroid/view/LayoutInflater;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/controller/PlaylistsSearchController;Landroid/view/LayoutInflater;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$5;->arg$1:Lcom/vk/music/attach/controller/PlaylistsSearchController;

    iput-object p2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$5;->arg$2:Landroid/view/LayoutInflater;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistsSearchController;Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$5;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$5;-><init>(Lcom/vk/music/attach/controller/PlaylistsSearchController;Landroid/view/LayoutInflater;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$5;->arg$1:Lcom/vk/music/attach/controller/PlaylistsSearchController;

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$5;->arg$2:Landroid/view/LayoutInflater;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->lambda$onViewAttached$4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
