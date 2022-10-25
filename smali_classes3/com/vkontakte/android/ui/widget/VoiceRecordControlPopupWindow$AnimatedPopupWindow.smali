.class Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;
.super Landroid/widget/PopupWindow;
.source "VoiceRecordControlPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatedPopupWindow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Landroid/view/View;IIZ)V
    .locals 0
    .param p2, "contentView"    # Landroid/view/View;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "focusable"    # Z

    .prologue
    .line 466
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .line 467
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 468
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 472
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2300(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    .line 473
    return-void
.end method

.method public dismissSuper()V
    .locals 2

    .prologue
    .line 476
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2500(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$2400(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->setPaintColor(I)V

    .line 477
    invoke-super {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 478
    return-void
.end method
