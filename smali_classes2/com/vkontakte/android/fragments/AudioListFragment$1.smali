.class Lcom/vkontakte/android/fragments/AudioListFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "AudioListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/AudioListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$1;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 77
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_ADDED:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 78
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$1;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$000(Lcom/vkontakte/android/fragments/AudioListFragment;)V

    .line 83
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_REMOVED:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MID:Ljava/lang/String;

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, "mid":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$1;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$100(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;)V

    goto :goto_0
.end method
