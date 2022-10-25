.class final synthetic Lcom/vk/music/attach/controller/SearchController$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/controller/SearchController;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/controller/SearchController;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/controller/SearchController$$Lambda$1;->arg$1:Lcom/vk/music/attach/controller/SearchController;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/controller/SearchController;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/SearchController$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/SearchController$$Lambda$1;-><init>(Lcom/vk/music/attach/controller/SearchController;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/controller/SearchController$$Lambda$1;->arg$1:Lcom/vk/music/attach/controller/SearchController;

    invoke-virtual {v0}, Lcom/vk/music/attach/controller/SearchController;->onStartSearch()V

    return-void
.end method
