.class Lcom/vkontakte/android/AudioAttachView$1;
.super Landroid/widget/SeekBar;
.source "AudioAttachView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioAttachView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioAttachView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioAttachView;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioAttachView;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/vkontakte/android/AudioAttachView$1;->this$0:Lcom/vkontakte/android/AudioAttachView;

    invoke-direct {p0, p2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 123
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 132
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 125
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/AudioAttachView$1;->this$0:Lcom/vkontakte/android/AudioAttachView;

    invoke-static {v0}, Lcom/vkontakte/android/AudioAttachView;->access$000(Lcom/vkontakte/android/AudioAttachView;)V

    goto :goto_0

    .line 129
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/AudioAttachView$1;->this$0:Lcom/vkontakte/android/AudioAttachView;

    invoke-static {v0}, Lcom/vkontakte/android/AudioAttachView;->access$100(Lcom/vkontakte/android/AudioAttachView;)V

    goto :goto_0

    .line 123
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
