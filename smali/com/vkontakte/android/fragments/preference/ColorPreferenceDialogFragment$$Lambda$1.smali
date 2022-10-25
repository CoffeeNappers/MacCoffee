.class final synthetic Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/flask/colorpicker/OnColorSelectedListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment;)Lcom/flask/colorpicker/OnColorSelectedListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment;)V

    return-object v0
.end method


# virtual methods
.method public onColorSelected(I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/preference/ColorPreferenceDialogFragment;->lambda$onCreateDialogView$0(I)V

    return-void
.end method
