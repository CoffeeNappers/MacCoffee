.class final synthetic Lcom/vk/music/model/PlayerModelImpl$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/model/ObservableModel$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/model/PlayerModelImpl;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/PlayerModelImpl;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/PlayerModelImpl$$Lambda$3;->arg$1:Lcom/vk/music/model/PlayerModelImpl;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/PlayerModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/model/PlayerModelImpl$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vk/music/model/PlayerModelImpl$$Lambda$3;-><init>(Lcom/vk/music/model/PlayerModelImpl;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/PlayerModelImpl$$Lambda$3;->arg$1:Lcom/vk/music/model/PlayerModelImpl;

    check-cast p1, Lcom/vk/music/model/PlayerModel$Callback;

    invoke-virtual {v0, p1}, Lcom/vk/music/model/PlayerModelImpl;->lambda$onStateChanged$2(Lcom/vk/music/model/PlayerModel$Callback;)V

    return-void
.end method
