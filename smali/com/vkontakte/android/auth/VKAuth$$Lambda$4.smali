.class final synthetic Lcom/vkontakte/android/auth/VKAuth$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/auth/VKAuth$AuthListener;

.field private final arg$2:Lcom/vkontakte/android/auth/VKAuth$AuthResult;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$4;->arg$1:Lcom/vkontakte/android/auth/VKAuth$AuthListener;

    iput-object p2, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$4;->arg$2:Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$4;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$4;-><init>(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$4;->arg$1:Lcom/vkontakte/android/auth/VKAuth$AuthListener;

    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$4;->arg$2:Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    invoke-static {v0, v1}, Lcom/vkontakte/android/auth/VKAuth;->lambda$null$0(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)V

    return-void
.end method
