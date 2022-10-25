.class final synthetic Lcom/vkontakte/android/ui/layout/ExpandableBarLayout$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout$$Lambda$3;-><init>(Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;)V

    return-object v0
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout$$Lambda$3;->arg$1:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->lambda$closePanel$2(Landroid/animation/ValueAnimator;)V

    return-void
.end method
