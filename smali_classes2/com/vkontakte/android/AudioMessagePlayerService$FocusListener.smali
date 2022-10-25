.class Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;
.super Ljava/lang/Object;
.source "AudioMessagePlayerService.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AudioMessagePlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FocusListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioMessagePlayerService;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0

    .prologue
    .line 695
    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;Lcom/vkontakte/android/AudioMessagePlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/AudioMessagePlayerService$1;

    .prologue
    .line 695
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    return-void
.end method

.method static synthetic lambda$onAudioFocusChange$0()V
    .locals 4

    .prologue
    .line 702
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 703
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/AudioTrack;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 704
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 706
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2, v3}, Landroid/media/AudioTrack;->setStereoVolume(FF)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 711
    .local v0, "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void

    .line 707
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 708
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Illegal track state"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 10
    .param p1, "focusChange"    # I

    .prologue
    const v1, 0x3e4ccccd    # 0.2f

    .line 698
    packed-switch p1, :pswitch_data_0

    .line 728
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 700
    :pswitch_1
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener$$Lambda$1;->lambdaFactory$()Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x5dc

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0

    .line 715
    :pswitch_2
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2400(Lcom/vkontakte/android/AudioMessagePlayerService;)I

    move-result v2

    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2500(Lcom/vkontakte/android/AudioMessagePlayerService;)I

    move-result v3

    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1400(Lcom/vkontakte/android/AudioMessagePlayerService;)J

    move-result-wide v4

    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    .line 716
    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2900(Lcom/vkontakte/android/AudioMessagePlayerService;)J

    move-result-wide v6

    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$700(Lcom/vkontakte/android/AudioMessagePlayerService;)F

    move-result v8

    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$3000(Lcom/vkontakte/android/AudioMessagePlayerService;)Z

    move-result v9

    .line 715
    invoke-static/range {v1 .. v9}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$3100(Lcom/vkontakte/android/AudioMessagePlayerService;IIJJFZ)V

    .line 717
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$400(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 718
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2200(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    goto :goto_0

    .line 721
    :pswitch_3
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 722
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    goto :goto_0

    .line 698
    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
