.class final synthetic Lcom/vk/camera/camera1/Camera1View$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/camera/camera1/Camera1View;


# direct methods
.method private constructor <init>(Lcom/vk/camera/camera1/Camera1View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/camera/camera1/Camera1View$$Lambda$1;->arg$1:Lcom/vk/camera/camera1/Camera1View;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/camera/camera1/Camera1View;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/camera/camera1/Camera1View$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/camera/camera1/Camera1View$$Lambda$1;-><init>(Lcom/vk/camera/camera1/Camera1View;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View$$Lambda$1;->arg$1:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->startTimer()V

    return-void
.end method
