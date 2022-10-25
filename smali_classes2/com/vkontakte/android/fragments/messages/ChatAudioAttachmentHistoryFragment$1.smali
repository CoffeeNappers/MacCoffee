.class Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;
.super Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;
.source "ChatAudioAttachmentHistoryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 1
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->updateList()V

    .line 50
    return-void
.end method

.method public onTrackListChanged(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->updateList()V

    .line 55
    return-void
.end method
