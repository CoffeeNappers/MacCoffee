.class final synthetic Lcom/vkontakte/android/data/Messages$$Lambda$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/Message;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/Message;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/data/Messages$$Lambda$7;->arg$1:Lcom/vkontakte/android/Message;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Messages$$Lambda$7;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/data/Messages$$Lambda$7;-><init>(Lcom/vkontakte/android/Message;)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/data/Messages$$Lambda$7;->arg$1:Lcom/vkontakte/android/Message;

    invoke-static {v0, p1, p2, p3}, Lcom/vkontakte/android/data/Messages;->lambda$broadcastNewMessage$7(Lcom/vkontakte/android/Message;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
