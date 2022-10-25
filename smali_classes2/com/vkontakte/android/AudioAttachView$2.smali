.class Lcom/vkontakte/android/AudioAttachView$2;
.super Ljava/lang/Object;
.source "AudioAttachView.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioAttachView;->setData(Ljava/lang/String;Ljava/lang/String;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioAttachView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioAttachView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioAttachView;

    .prologue
    .line 223
    iput-object p1, p0, Lcom/vkontakte/android/AudioAttachView$2;->this$0:Lcom/vkontakte/android/AudioAttachView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 239
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/AudioAttachView$2;->this$0:Lcom/vkontakte/android/AudioAttachView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioAttachView;->access$202(Lcom/vkontakte/android/AudioAttachView;Z)Z

    .line 233
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 226
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->seekTo(I)V

    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/AudioAttachView$2;->this$0:Lcom/vkontakte/android/AudioAttachView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioAttachView;->access$202(Lcom/vkontakte/android/AudioAttachView;Z)Z

    .line 228
    return-void
.end method
