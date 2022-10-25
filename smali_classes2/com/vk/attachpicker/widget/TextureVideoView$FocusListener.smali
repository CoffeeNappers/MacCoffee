.class Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;
.super Ljava/lang/Object;
.source "TextureVideoView.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/widget/TextureVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FocusListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/widget/TextureVideoView;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V
    .locals 0

    .prologue
    .line 832
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/attachpicker/widget/TextureVideoView;Lcom/vk/attachpicker/widget/TextureVideoView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/attachpicker/widget/TextureVideoView;
    .param p2, "x1"    # Lcom/vk/attachpicker/widget/TextureVideoView$1;

    .prologue
    .line 832
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;-><init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onAudioFocusChange$0()V
    .locals 5

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    .line 839
    iget-object v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$800(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    .line 840
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 841
    iget-object v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$1300(Lcom/vk/attachpicker/widget/TextureVideoView;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    iget-object v4, p0, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v4}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$1300(Lcom/vk/attachpicker/widget/TextureVideoView;)Z

    move-result v4

    if-eqz v4, :cond_2

    :goto_1
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 843
    :cond_0
    return-void

    :cond_1
    move v1, v3

    .line 841
    goto :goto_0

    :cond_2
    move v2, v3

    goto :goto_1
.end method

.method public onAudioFocusChange(I)V
    .locals 4
    .param p1, "focusChange"    # I

    .prologue
    const/4 v2, 0x0

    .line 835
    packed-switch p1, :pswitch_data_0

    .line 855
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 837
    :pswitch_1
    invoke-static {p0}, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x5dc

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0

    .line 847
    :pswitch_2
    iget-object v1, p0, Lcom/vk/attachpicker/widget/TextureVideoView$FocusListener;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$800(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    .line 848
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 849
    invoke-virtual {v0, v2, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    goto :goto_0

    .line 835
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
