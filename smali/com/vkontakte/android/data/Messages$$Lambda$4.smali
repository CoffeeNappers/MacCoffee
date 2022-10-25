.class final synthetic Lcom/vkontakte/android/data/Messages$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;

.field private final arg$2:I


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/data/Messages$$Lambda$4;->arg$1:Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;

    iput p2, p0, Lcom/vkontakte/android/data/Messages$$Lambda$4;->arg$2:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;I)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Messages$$Lambda$4;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/data/Messages$$Lambda$4;-><init>(Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;I)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/data/Messages$$Lambda$4;->arg$1:Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;

    iget v1, p0, Lcom/vkontakte/android/data/Messages$$Lambda$4;->arg$2:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Messages;->lambda$getUnreadCount$4(Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;I)V

    return-void
.end method
