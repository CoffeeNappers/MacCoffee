.class final synthetic Lcom/vk/sharing/target/TargetsLoader$4$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/sharing/target/TargetsLoader$4;


# direct methods
.method private constructor <init>(Lcom/vk/sharing/target/TargetsLoader$4;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/sharing/target/TargetsLoader$4$$Lambda$2;->arg$1:Lcom/vk/sharing/target/TargetsLoader$4;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$4;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/sharing/target/TargetsLoader$4$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/sharing/target/TargetsLoader$4$$Lambda$2;-><init>(Lcom/vk/sharing/target/TargetsLoader$4;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$4$$Lambda$2;->arg$1:Lcom/vk/sharing/target/TargetsLoader$4;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader$4;->lambda$onError$1()V

    return-void
.end method
