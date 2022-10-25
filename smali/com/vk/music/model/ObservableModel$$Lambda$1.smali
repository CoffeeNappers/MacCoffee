.class final synthetic Lcom/vk/music/model/ObservableModel$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/music/model/ObservableModel;

.field private final arg$2:Lcom/vk/music/model/ObservableModel$Notification;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/ObservableModel;Lcom/vk/music/model/ObservableModel$Notification;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/ObservableModel$$Lambda$1;->arg$1:Lcom/vk/music/model/ObservableModel;

    iput-object p2, p0, Lcom/vk/music/model/ObservableModel$$Lambda$1;->arg$2:Lcom/vk/music/model/ObservableModel$Notification;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/ObservableModel;Lcom/vk/music/model/ObservableModel$Notification;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/music/model/ObservableModel$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/model/ObservableModel$$Lambda$1;-><init>(Lcom/vk/music/model/ObservableModel;Lcom/vk/music/model/ObservableModel$Notification;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/ObservableModel$$Lambda$1;->arg$1:Lcom/vk/music/model/ObservableModel;

    iget-object v1, p0, Lcom/vk/music/model/ObservableModel$$Lambda$1;->arg$2:Lcom/vk/music/model/ObservableModel$Notification;

    invoke-virtual {v0, v1}, Lcom/vk/music/model/ObservableModel;->lambda$notifyObservers$0(Lcom/vk/music/model/ObservableModel$Notification;)V

    return-void
.end method
