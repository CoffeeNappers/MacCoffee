.class final synthetic Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

.field private final arg$2:Lcom/vkontakte/android/audio/player/PlayerTrack;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$1;->arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

    iput-object p2, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/player/PlayerTrack;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/audio/player/PlayerTrack;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$1;-><init>(Lcom/vkontakte/android/AudioPlayerActivity;Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$1;->arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vkontakte/android/AudioPlayerActivity;->lambda$confirmAndDelete$0(Lcom/vkontakte/android/audio/player/PlayerTrack;Landroid/content/DialogInterface;I)V

    return-void
.end method
