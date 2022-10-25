.class final synthetic Lcom/vk/music/attach/controller/Controller$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/controller/Controller;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/controller/Controller;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/controller/Controller$$Lambda$4;->arg$1:Lcom/vk/music/attach/controller/Controller;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/controller/Controller;)Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/Controller$$Lambda$4;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/Controller$$Lambda$4;-><init>(Lcom/vk/music/attach/controller/Controller;)V

    return-object v0
.end method


# virtual methods
.method public onLastReached()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller$$Lambda$4;->arg$1:Lcom/vk/music/attach/controller/Controller;

    invoke-virtual {v0}, Lcom/vk/music/attach/controller/Controller;->onEndOfListReached()V

    return-void
.end method
