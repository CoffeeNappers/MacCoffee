.class Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;
.super Ljava/lang/Object;
.source "AudioMessageUtils.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/audio/AudioMessageUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FocusListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V
    .locals 0

    .prologue
    .line 474
    iput-object p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p2, "x1"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;

    .prologue
    .line 474
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;-><init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 1
    .param p1, "focusChange"    # I

    .prologue
    .line 477
    packed-switch p1, :pswitch_data_0

    .line 485
    :goto_0
    return-void

    .line 480
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecording()V

    goto :goto_0

    .line 477
    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
