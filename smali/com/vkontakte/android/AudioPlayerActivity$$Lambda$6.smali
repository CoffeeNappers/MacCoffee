.class final synthetic Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/PopupMenu$OnDismissListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

.field private final arg$2:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$6;->arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

    iput-object p2, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$6;->arg$2:Landroid/view/View;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/view/View;)Landroid/widget/PopupMenu$OnDismissListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$6;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$6;-><init>(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method public onDismiss(Landroid/widget/PopupMenu;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$6;->arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$6;->arg$2:Landroid/view/View;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/AudioPlayerActivity;->lambda$onClick$4(Landroid/view/View;Landroid/widget/PopupMenu;)V

    return-void
.end method
