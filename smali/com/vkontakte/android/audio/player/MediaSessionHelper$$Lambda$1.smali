.class final synthetic Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

.field private final arg$2:Lcom/vkontakte/android/audio/player/PlayerTrack;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/MediaSessionHelper;Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$1;->arg$1:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    iput-object p2, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/player/PlayerTrack;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/audio/player/MediaSessionHelper;Lcom/vkontakte/android/audio/player/PlayerTrack;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$1;-><init>(Lcom/vkontakte/android/audio/player/MediaSessionHelper;Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$1;->arg$1:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/player/PlayerTrack;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->lambda$update$0(Lcom/vkontakte/android/audio/player/PlayerTrack;Landroid/graphics/Bitmap;)V

    return-void
.end method
