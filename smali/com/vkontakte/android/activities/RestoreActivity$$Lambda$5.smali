.class final synthetic Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/activities/RestoreActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/activities/RestoreActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$5;->arg$1:Lcom/vkontakte/android/activities/RestoreActivity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity;)Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$5;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$5;-><init>(Lcom/vkontakte/android/activities/RestoreActivity;)V

    return-object v0
.end method


# virtual methods
.method public resendCode(ZLjava/lang/Runnable;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$5;->arg$1:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/activities/RestoreActivity;->lambda$setStep$3(ZLjava/lang/Runnable;)V

    return-void
.end method
