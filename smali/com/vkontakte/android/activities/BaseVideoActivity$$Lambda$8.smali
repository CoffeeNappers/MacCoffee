.class final synthetic Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$8;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/activities/BaseVideoActivity;

.field private final arg$2:Landroid/view/Window;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/activities/BaseVideoActivity;Landroid/view/Window;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$8;->arg$1:Lcom/vkontakte/android/activities/BaseVideoActivity;

    iput-object p2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$8;->arg$2:Landroid/view/Window;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;Landroid/view/Window;)Landroid/view/View$OnSystemUiVisibilityChangeListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$8;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$8;-><init>(Lcom/vkontakte/android/activities/BaseVideoActivity;Landroid/view/Window;)V

    return-object v0
.end method


# virtual methods
.method public onSystemUiVisibilityChange(I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$8;->arg$1:Lcom/vkontakte/android/activities/BaseVideoActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$8;->arg$2:Landroid/view/Window;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->lambda$initSystemView$8(Landroid/view/Window;I)V

    return-void
.end method
