.class final synthetic Lcom/vkontakte/android/data/Messages$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:I

.field private final arg$2:I

.field private final arg$3:Lcom/vkontakte/android/data/Messages$GetDialogsCallback;


# direct methods
.method private constructor <init>(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/vkontakte/android/data/Messages$$Lambda$2;->arg$1:I

    iput p2, p0, Lcom/vkontakte/android/data/Messages$$Lambda$2;->arg$2:I

    iput-object p3, p0, Lcom/vkontakte/android/data/Messages$$Lambda$2;->arg$3:Lcom/vkontakte/android/data/Messages$GetDialogsCallback;

    return-void
.end method

.method public static lambdaFactory$(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Messages$$Lambda$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/data/Messages$$Lambda$2;-><init>(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget v0, p0, Lcom/vkontakte/android/data/Messages$$Lambda$2;->arg$1:I

    iget v1, p0, Lcom/vkontakte/android/data/Messages$$Lambda$2;->arg$2:I

    iget-object v2, p0, Lcom/vkontakte/android/data/Messages$$Lambda$2;->arg$3:Lcom/vkontakte/android/data/Messages$GetDialogsCallback;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/data/Messages;->lambda$getDialogs$2(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)V

    return-void
.end method
