.class final synthetic Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/model/ObservableModel$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/model/MusicTrackModelImpl$2;

.field private final arg$2:Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;

.field private final arg$3:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/MusicTrackModelImpl$2;Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;->arg$1:Lcom/vk/music/model/MusicTrackModelImpl$2;

    iput-object p2, p0, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;->arg$2:Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;

    iput-object p3, p0, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;->arg$3:Lcom/vkontakte/android/audio/MusicTrack;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/MusicTrackModelImpl$2;Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vk/music/model/ObservableModel$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;-><init>(Lcom/vk/music/model/MusicTrackModelImpl$2;Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;Lcom/vkontakte/android/audio/MusicTrack;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;->arg$1:Lcom/vk/music/model/MusicTrackModelImpl$2;

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;->arg$2:Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;

    iget-object v2, p0, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;->arg$3:Lcom/vkontakte/android/audio/MusicTrack;

    check-cast p1, Lcom/vk/music/model/MusicTrackModel$Callback;

    invoke-virtual {v0, v1, v2, p1}, Lcom/vk/music/model/MusicTrackModelImpl$2;->lambda$success$0(Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/model/MusicTrackModel$Callback;)V

    return-void
.end method
