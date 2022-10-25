.class final synthetic Lcom/vk/sharing/target/TargetsLoader$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;


# instance fields
.field private final arg$1:Lcom/vk/sharing/target/TargetsLoader;


# direct methods
.method private constructor <init>(Lcom/vk/sharing/target/TargetsLoader;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/sharing/target/TargetsLoader$$Lambda$1;->arg$1:Lcom/vk/sharing/target/TargetsLoader;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader;)Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;
    .locals 1

    new-instance v0, Lcom/vk/sharing/target/TargetsLoader$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/sharing/target/TargetsLoader$$Lambda$1;-><init>(Lcom/vk/sharing/target/TargetsLoader;)V

    return-object v0
.end method


# virtual methods
.method public onResult(Ljava/util/List;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader$$Lambda$1;->arg$1:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/target/TargetsLoader;->lambda$searchGroups$1(Ljava/util/List;)V

    return-void
.end method
