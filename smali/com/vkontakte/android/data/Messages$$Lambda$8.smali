.class final synthetic Lcom/vkontakte/android/data/Messages$$Lambda$8;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:I

.field private final arg$2:Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;


# direct methods
.method private constructor <init>(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/vkontakte/android/data/Messages$$Lambda$8;->arg$1:I

    iput-object p2, p0, Lcom/vkontakte/android/data/Messages$$Lambda$8;->arg$2:Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    return-void
.end method

.method public static lambdaFactory$(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Messages$$Lambda$8;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/data/Messages$$Lambda$8;-><init>(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget v0, p0, Lcom/vkontakte/android/data/Messages$$Lambda$8;->arg$1:I

    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$$Lambda$8;->arg$2:Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Messages;->lambda$getChatUsers$8(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    return-void
.end method
