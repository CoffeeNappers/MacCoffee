.class final synthetic Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/attach/loader/MusicLoader$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/loader/MusicLoader$1;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/loader/MusicLoader$1;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$3;->arg$1:Lcom/vk/music/attach/loader/MusicLoader$1;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/loader/MusicLoader$1;)Lcom/vk/music/attach/loader/MusicLoader$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$3;-><init>(Lcom/vk/music/attach/loader/MusicLoader$1;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$3;->arg$1:Lcom/vk/music/attach/loader/MusicLoader$1;

    check-cast p1, Lcom/vk/music/attach/loader/MusicLoader$Callback;

    invoke-virtual {v0, p1}, Lcom/vk/music/attach/loader/MusicLoader$1;->lambda$fail$2(Lcom/vk/music/attach/loader/MusicLoader$Callback;)V

    return-void
.end method
