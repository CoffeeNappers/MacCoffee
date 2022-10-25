.class Lcom/vkontakte/android/fragments/AudioPlaylistFragment$2;
.super Landroid/content/BroadcastReceiver;
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
    .line 74
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$2;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 77
    sget-object v0, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_REMOVED:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$2;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$100(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V

    .line 80
    :cond_0
    return-void
.end method
