.class final synthetic Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$3;->arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;)Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$3;-><init>(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;)V

    return-object v0
.end method


# virtual methods
.method public onComplete()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$3;->arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->lambda$onProgress$2()V

    return-void
.end method
