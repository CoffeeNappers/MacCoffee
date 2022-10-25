.class final synthetic Lcom/vk/music/view/EditPlaylistContainer$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF;


# instance fields
.field private final arg$1:Lcom/vk/music/view/EditPlaylistContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/EditPlaylistContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$1;->arg$1:Lcom/vk/music/view/EditPlaylistContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/EditPlaylistContainer;)Lcom/vkontakte/android/functions/VoidF;
    .locals 1

    new-instance v0, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$1;-><init>(Lcom/vk/music/view/EditPlaylistContainer;)V

    return-object v0
.end method


# virtual methods
.method public f()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$1;->arg$1:Lcom/vk/music/view/EditPlaylistContainer;

    invoke-static {v0}, Lcom/vk/music/view/EditPlaylistContainer;->access$lambda$0(Lcom/vk/music/view/EditPlaylistContainer;)V

    return-void
.end method
