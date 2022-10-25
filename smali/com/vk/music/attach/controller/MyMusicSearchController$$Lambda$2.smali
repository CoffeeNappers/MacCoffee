.class final synthetic Lcom/vk/music/attach/controller/MyMusicSearchController$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/controller/MyMusicSearchController;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/controller/MyMusicSearchController;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController$$Lambda$2;->arg$1:Lcom/vk/music/attach/controller/MyMusicSearchController;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/controller/MyMusicSearchController;)Lcom/vkontakte/android/functions/VoidF;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/MyMusicSearchController$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/MyMusicSearchController$$Lambda$2;-><init>(Lcom/vk/music/attach/controller/MyMusicSearchController;)V

    return-object v0
.end method


# virtual methods
.method public f()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController$$Lambda$2;->arg$1:Lcom/vk/music/attach/controller/MyMusicSearchController;

    invoke-static {v0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->access$lambda$0(Lcom/vk/music/attach/controller/MyMusicSearchController;)V

    return-void
.end method
