.class Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/WriteBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SeekDelegate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 0

    .prologue
    .line 1219
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/WriteBar;Lcom/vkontakte/android/ui/WriteBar$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/WriteBar$1;

    .prologue
    .line 1219
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    return-void
.end method


# virtual methods
.method public onSeekBarDrag(F)V
    .locals 5
    .param p1, "progress"    # F

    .prologue
    .line 1222
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$600(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget v4, v4, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getPendingRecord(I)Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    move-result-object v0

    .line 1223
    .local v0, "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    if-eqz v0, :cond_0

    .line 1224
    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->isPlaying()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1225
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 1226
    .local v1, "context":Landroid/content/Context;
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1227
    .local v2, "intentPlayer":Landroid/content/Intent;
    const-string/jumbo v3, "action"

    const/4 v4, 0x7

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1228
    const-string/jumbo v3, "progress"

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 1229
    invoke-virtual {v1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1234
    .end local v1    # "context":Landroid/content/Context;
    .end local v2    # "intentPlayer":Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 1231
    :cond_1
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->setProgress(Ljava/lang/Float;)V

    goto :goto_0
.end method
