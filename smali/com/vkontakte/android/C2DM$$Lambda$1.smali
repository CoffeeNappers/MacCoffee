.class final synthetic Lcom/vkontakte/android/C2DM$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/C2DM$ThrowableRunnable;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/C2DM$$Lambda$1;->arg$1:Lcom/vkontakte/android/C2DM$ThrowableRunnable;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/C2DM$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/C2DM$$Lambda$1;-><init>(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/C2DM$$Lambda$1;->arg$1:Lcom/vkontakte/android/C2DM$ThrowableRunnable;

    invoke-static {v0}, Lcom/vkontakte/android/C2DM;->lambda$post$1(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)V

    return-void
.end method
