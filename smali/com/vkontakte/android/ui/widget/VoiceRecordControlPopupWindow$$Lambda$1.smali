.class final synthetic Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$$Lambda$1;-><init>(Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;)V

    return-object v0
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->lambda$show$0()V

    return-void
.end method
