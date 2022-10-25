.class Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OutsideTouchListener;
.super Ljava/lang/Object;
.source "VoiceRecordControlPopupWindow.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OutsideTouchListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V
    .locals 0

    .prologue
    .line 457
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OutsideTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;

    .prologue
    .line 457
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OutsideTouchListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 460
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OutsideTouchListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$800(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$AnimatedPopupWindow;->dismiss()V

    .line 461
    const/4 v0, 0x1

    return v0
.end method
