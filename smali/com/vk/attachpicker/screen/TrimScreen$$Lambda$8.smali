.class final synthetic Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$8;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vk/attachpicker/screen/TrimScreen;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/screen/TrimScreen;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$8;->arg$1:Lcom/vk/attachpicker/screen/TrimScreen;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$8;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$8;-><init>(Lcom/vk/attachpicker/screen/TrimScreen;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$8;->arg$1:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-virtual {v0}, Lcom/vk/attachpicker/screen/TrimScreen;->lambda$null$0()V

    return-void
.end method
