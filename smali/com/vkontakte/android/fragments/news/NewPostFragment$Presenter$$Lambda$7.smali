.class final synthetic Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$OnSelectedListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$7;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$OnSelectedListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$7;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$7;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)V

    return-object v0
.end method


# virtual methods
.method public onDateSelected(Ljava/util/Calendar;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$7;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->lambda$showTimerDlg$7(Ljava/util/Calendar;)V

    return-void
.end method
