.class public Lcom/vk/core/widget/ViewShower;
.super Ljava/lang/Object;
.source "ViewShower.java"


# instance fields
.field private currentHideAnimator:Landroid/animation/Animator;

.field private currentShowAnimator:Landroid/animation/Animator;

.field private final targetView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "targetView"    # Landroid/view/View;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vk/core/widget/ViewShower;->targetView:Ljava/lang/ref/WeakReference;

    .line 19
    return-void
.end method

.method static synthetic access$002(Lcom/vk/core/widget/ViewShower;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/widget/ViewShower;
    .param p1, "x1"    # Landroid/animation/Animator;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    return-object p1
.end method

.method static synthetic access$102(Lcom/vk/core/widget/ViewShower;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/widget/ViewShower;
    .param p1, "x1"    # Landroid/animation/Animator;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    return-object p1
.end method

.method private cancelHideAnimator()V
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    .line 110
    :cond_0
    return-void
.end method

.method private cancelShowAnimator()V
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    .line 103
    :cond_0
    return-void
.end method


# virtual methods
.method public cancelAllRunningAnimations()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 22
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    if-eqz v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 24
    iput-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    if-eqz v0, :cond_1

    .line 27
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 28
    iput-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    .line 30
    :cond_1
    return-void
.end method

.method public createHideAnimator(Landroid/view/View;)Landroid/animation/Animator;
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 91
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v3, v1, v2

    invoke-static {p1, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    return-object v0
.end method

.method public createShowAnimator(Landroid/view/View;)Landroid/animation/Animator;
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 87
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    aput v3, v1, v2

    invoke-static {p1, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v2, 0x96

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    return-object v0
.end method

.method public dropViewState(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 95
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 96
    return-void
.end method

.method public hide(Z)V
    .locals 3
    .param p1, "setGoneAfter"    # Z

    .prologue
    .line 62
    iget-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    if-eqz v1, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 65
    :cond_1
    iget-object v1, p0, Lcom/vk/core/widget/ViewShower;->targetView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 66
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 69
    invoke-direct {p0}, Lcom/vk/core/widget/ViewShower;->cancelShowAnimator()V

    .line 72
    invoke-virtual {p0, v0}, Lcom/vk/core/widget/ViewShower;->createHideAnimator(Landroid/view/View;)Landroid/animation/Animator;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    .line 73
    iget-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    new-instance v2, Lcom/vk/core/widget/ViewShower$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/vk/core/widget/ViewShower$2;-><init>(Lcom/vk/core/widget/ViewShower;Landroid/view/View;Z)V

    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 83
    iget-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentHideAnimator:Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    goto :goto_0
.end method

.method public show()V
    .locals 3

    .prologue
    .line 34
    iget-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    if-eqz v1, :cond_1

    .line 58
    :cond_0
    :goto_0
    return-void

    .line 37
    :cond_1
    iget-object v1, p0, Lcom/vk/core/widget/ViewShower;->targetView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 38
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 41
    invoke-direct {p0}, Lcom/vk/core/widget/ViewShower;->cancelHideAnimator()V

    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_3

    .line 45
    :cond_2
    invoke-virtual {p0, v0}, Lcom/vk/core/widget/ViewShower;->dropViewState(Landroid/view/View;)V

    .line 47
    :cond_3
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 50
    invoke-virtual {p0, v0}, Lcom/vk/core/widget/ViewShower;->createShowAnimator(Landroid/view/View;)Landroid/animation/Animator;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    .line 51
    iget-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    new-instance v2, Lcom/vk/core/widget/ViewShower$1;

    invoke-direct {v2, p0}, Lcom/vk/core/widget/ViewShower$1;-><init>(Lcom/vk/core/widget/ViewShower;)V

    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 57
    iget-object v1, p0, Lcom/vk/core/widget/ViewShower;->currentShowAnimator:Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    goto :goto_0
.end method
