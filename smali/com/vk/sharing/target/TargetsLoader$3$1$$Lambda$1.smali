.class final synthetic Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/sharing/target/TargetsLoader$3$1;

.field private final arg$2:Ljava/util/ArrayList;


# direct methods
.method private constructor <init>(Lcom/vk/sharing/target/TargetsLoader$3$1;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$1;->arg$1:Lcom/vk/sharing/target/TargetsLoader$3$1;

    iput-object p2, p0, Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$1;->arg$2:Ljava/util/ArrayList;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader$3$1;Ljava/util/ArrayList;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$1;-><init>(Lcom/vk/sharing/target/TargetsLoader$3$1;Ljava/util/ArrayList;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$1;->arg$1:Lcom/vk/sharing/target/TargetsLoader$3$1;

    iget-object v1, p0, Lcom/vk/sharing/target/TargetsLoader$3$1$$Lambda$1;->arg$2:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader$3$1;->lambda$onResult$0(Ljava/util/ArrayList;)V

    return-void
.end method
