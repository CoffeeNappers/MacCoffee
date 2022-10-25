.class final Lcom/vk/sharing/KitKatTransitions;
.super Ljava/lang/Object;
.source "KitKatTransitions.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static run(Landroid/view/ViewGroup;)V
    .locals 5
    .param p0, "root"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x1

    .line 19
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_0

    .line 20
    new-instance v0, Landroid/support/transition/AutoTransition;

    invoke-direct {v0}, Landroid/support/transition/AutoTransition;-><init>()V

    .line 21
    .local v0, "transition":Landroid/support/transition/Transition;
    const-wide/16 v2, 0x64

    invoke-virtual {v0, v2, v3}, Landroid/support/transition/Transition;->setDuration(J)Landroid/support/transition/Transition;

    .line 22
    const v1, 0x7f100354

    invoke-virtual {v0, v1, v4}, Landroid/support/transition/Transition;->excludeTarget(IZ)Landroid/support/transition/Transition;

    .line 23
    const v1, 0x7f100353

    invoke-virtual {v0, v1, v4}, Landroid/support/transition/Transition;->excludeTarget(IZ)Landroid/support/transition/Transition;

    .line 24
    invoke-static {p0, v0}, Landroid/support/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroid/support/transition/Transition;)V

    .line 26
    .end local v0    # "transition":Landroid/support/transition/Transition;
    :cond_0
    return-void
.end method
