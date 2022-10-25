.class final synthetic Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/model/ObservableModel$Notification;


# instance fields
.field private final arg$1:Lcom/vk/music/model/MusicTrackModelImpl$1;

.field private final arg$2:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/MusicTrackModelImpl$1;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$1;->arg$1:Lcom/vk/music/model/MusicTrackModelImpl$1;

    iput-object p2, p0, Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/MusicTrack;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/model/MusicTrackModelImpl$1;Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vk/music/model/ObservableModel$Notification;
    .locals 1

    new-instance v0, Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$1;-><init>(Lcom/vk/music/model/MusicTrackModelImpl$1;Lcom/vkontakte/android/audio/MusicTrack;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$1;->arg$1:Lcom/vk/music/model/MusicTrackModelImpl$1;

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/MusicTrack;

    check-cast p1, Lcom/vk/music/model/MusicTrackModel$Callback;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/model/MusicTrackModelImpl$1;->lambda$success$0(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/model/MusicTrackModel$Callback;)V

    return-void
.end method
