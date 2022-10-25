.class Lcom/vkontakte/android/fragments/AudioPlaylistFragment$1;
.super Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;
.source "AudioPlaylistFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/AudioPlaylistFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$1;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 1
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$1;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$000(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V

    .line 71
    return-void
.end method
