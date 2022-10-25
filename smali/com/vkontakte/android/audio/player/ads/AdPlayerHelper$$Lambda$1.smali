.class final synthetic Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

.field private final arg$2:Lcom/vkontakte/android/audio/MusicTrack;

.field private final arg$3:Ljava/lang/String;

.field private final arg$4:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    iput-object p2, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/MusicTrack;

    iput-object p3, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->arg$3:Ljava/lang/String;

    iput-object p4, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->arg$4:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;-><init>(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    return-object v0
.end method


# virtual methods
.method public onComplete()V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->arg$1:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->arg$3:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->arg$4:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->lambda$play$0(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    return-void
.end method
