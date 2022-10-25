.class final synthetic Lcom/vkontakte/android/auth/VKAuth$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/auth/VKAuthState;

.field private final arg$2:Lcom/vkontakte/android/auth/VKAuth$AuthListener;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$2;->arg$1:Lcom/vkontakte/android/auth/VKAuthState;

    iput-object p2, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$2;->arg$2:Lcom/vkontakte/android/auth/VKAuth$AuthListener;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$2;-><init>(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$2;->arg$1:Lcom/vkontakte/android/auth/VKAuthState;

    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$2;->arg$2:Lcom/vkontakte/android/auth/VKAuth$AuthListener;

    invoke-static {v0, v1}, Lcom/vkontakte/android/auth/VKAuth;->lambda$authAsync$3(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    return-void
.end method
