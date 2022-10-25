.class final synthetic Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

.field private final arg$2:[Z

.field private final arg$3:Ljava/util/ArrayList;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity;[ZLjava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;->arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

    iput-object p2, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;->arg$2:[Z

    iput-object p3, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;->arg$3:Ljava/util/ArrayList;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;[ZLjava/util/ArrayList;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;-><init>(Lcom/vkontakte/android/AudioPlayerActivity;[ZLjava/util/ArrayList;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;->arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;->arg$2:[Z

    iget-object v2, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$4;->arg$3:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/AudioPlayerActivity;->lambda$showBroadcastDialog$3([ZLjava/util/ArrayList;Landroid/content/DialogInterface;I)V

    return-void
.end method
