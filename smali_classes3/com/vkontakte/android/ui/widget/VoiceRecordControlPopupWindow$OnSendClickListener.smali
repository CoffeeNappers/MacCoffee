.class Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnSendClickListener;
.super Ljava/lang/Object;
.source "VoiceRecordControlPopupWindow.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnSendClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V
    .locals 0

    .prologue
    .line 322
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnSendClickListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$1;

    .prologue
    .line 322
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnSendClickListener;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 325
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$OnSendClickListener;->this$0:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->access$1200(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;->onSendClick()V

    .line 326
    return-void
.end method
