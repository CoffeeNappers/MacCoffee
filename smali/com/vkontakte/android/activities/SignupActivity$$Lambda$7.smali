.class final synthetic Lcom/vkontakte/android/activities/SignupActivity$$Lambda$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF0;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/activities/SignupActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/activities/SignupActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$7;->arg$1:Lcom/vkontakte/android/activities/SignupActivity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity;)Lcom/vkontakte/android/functions/VoidF0;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$7;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$7;-><init>(Lcom/vkontakte/android/activities/SignupActivity;)V

    return-object v0
.end method


# virtual methods
.method public f()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$7;->arg$1:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/SignupActivity;->access$lambda$3(Lcom/vkontakte/android/activities/SignupActivity;)V

    return-void
.end method
