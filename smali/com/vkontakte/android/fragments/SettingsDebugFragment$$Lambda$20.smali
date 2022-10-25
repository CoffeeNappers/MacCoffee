.class final synthetic Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$20;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/SettingsDebugFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$20;->arg$1:Lcom/vkontakte/android/fragments/SettingsDebugFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)Landroid/app/DatePickerDialog$OnDateSetListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$20;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$20;-><init>(Lcom/vkontakte/android/fragments/SettingsDebugFragment;)V

    return-object v0
.end method


# virtual methods
.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$20;->arg$1:Lcom/vkontakte/android/fragments/SettingsDebugFragment;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->lambda$null$2(Landroid/widget/DatePicker;III)V

    return-void
.end method
