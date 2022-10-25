.class final synthetic Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

.field private final arg$2:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$2;->arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    iput-object p2, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$2;->arg$2:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$2;-><init>(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V

    return-object v0
.end method


# virtual methods
.method public onComplete()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$2;->arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$2;->arg$2:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->lambda$onCompleted$1(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V

    return-void
.end method
