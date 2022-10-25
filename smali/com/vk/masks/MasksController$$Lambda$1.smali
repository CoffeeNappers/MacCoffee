.class final synthetic Lcom/vk/masks/MasksController$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Lcom/vk/masks/MasksController;


# direct methods
.method private constructor <init>(Lcom/vk/masks/MasksController;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/masks/MasksController$$Lambda$1;->arg$1:Lcom/vk/masks/MasksController;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/masks/MasksController;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vk/masks/MasksController$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/masks/MasksController$$Lambda$1;-><init>(Lcom/vk/masks/MasksController;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/masks/MasksController$$Lambda$1;->arg$1:Lcom/vk/masks/MasksController;

    check-cast p1, Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lcom/vk/masks/MasksController;->access$lambda$0(Lcom/vk/masks/MasksController;Lio/reactivex/disposables/Disposable;)V

    return-void
.end method
