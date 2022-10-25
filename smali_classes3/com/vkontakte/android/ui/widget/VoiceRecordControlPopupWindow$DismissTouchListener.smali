.class Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;
.super Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;
.source "VoiceRecordControlPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DismissTouchListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V
    .locals 1

    .prologue
    .line 414
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$TouchInBoundsListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;

    .prologue
    .line 414
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 417
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2100(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 418
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 435
    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 420
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2100(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_0

    .line 423
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;->isViewInBounds(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 424
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2100(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    .line 425
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2300(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    goto :goto_0

    .line 427
    :cond_1
    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 428
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$DismissTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2100(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_0

    .line 418
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
