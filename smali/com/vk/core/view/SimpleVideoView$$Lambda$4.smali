.class final synthetic Lcom/vk/core/view/SimpleVideoView$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/core/view/SimpleVideoView;

.field private final arg$2:Landroid/net/Uri;


# direct methods
.method private constructor <init>(Lcom/vk/core/view/SimpleVideoView;Landroid/net/Uri;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView$$Lambda$4;->arg$1:Lcom/vk/core/view/SimpleVideoView;

    iput-object p2, p0, Lcom/vk/core/view/SimpleVideoView$$Lambda$4;->arg$2:Landroid/net/Uri;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/core/view/SimpleVideoView;Landroid/net/Uri;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/core/view/SimpleVideoView$$Lambda$4;

    invoke-direct {v0, p0, p1}, Lcom/vk/core/view/SimpleVideoView$$Lambda$4;-><init>(Lcom/vk/core/view/SimpleVideoView;Landroid/net/Uri;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$$Lambda$4;->arg$1:Lcom/vk/core/view/SimpleVideoView;

    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$$Lambda$4;->arg$2:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->lambda$setVideoUri$3(Landroid/net/Uri;)V

    return-void
.end method
