.class final synthetic Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/music/utils/SmallPlayerHelper;


# direct methods
.method private constructor <init>(Lcom/vk/music/utils/SmallPlayerHelper;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$2;->arg$1:Lcom/vk/music/utils/SmallPlayerHelper;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/utils/SmallPlayerHelper;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$2;-><init>(Lcom/vk/music/utils/SmallPlayerHelper;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$2;->arg$1:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-virtual {v0}, Lcom/vk/music/utils/SmallPlayerHelper;->onDestroyView()V

    return-void
.end method
