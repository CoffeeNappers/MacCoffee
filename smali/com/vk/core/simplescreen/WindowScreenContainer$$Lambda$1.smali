.class final synthetic Lcom/vk/core/simplescreen/WindowScreenContainer$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field private final arg$1:Lcom/vk/core/simplescreen/WindowScreenContainer;

.field private final arg$2:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/vk/core/simplescreen/WindowScreenContainer;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/core/simplescreen/WindowScreenContainer$$Lambda$1;->arg$1:Lcom/vk/core/simplescreen/WindowScreenContainer;

    iput-object p2, p0, Lcom/vk/core/simplescreen/WindowScreenContainer$$Lambda$1;->arg$2:Landroid/view/View;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/core/simplescreen/WindowScreenContainer;Landroid/view/View;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .locals 1

    new-instance v0, Lcom/vk/core/simplescreen/WindowScreenContainer$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/core/simplescreen/WindowScreenContainer$$Lambda$1;-><init>(Lcom/vk/core/simplescreen/WindowScreenContainer;Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/core/simplescreen/WindowScreenContainer$$Lambda$1;->arg$1:Lcom/vk/core/simplescreen/WindowScreenContainer;

    iget-object v1, p0, Lcom/vk/core/simplescreen/WindowScreenContainer$$Lambda$1;->arg$2:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/vk/core/simplescreen/WindowScreenContainer;->lambda$new$0(Landroid/view/View;)V

    return-void
.end method
