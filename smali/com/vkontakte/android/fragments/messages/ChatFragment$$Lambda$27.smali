.class final synthetic Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$27;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$27;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$27;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$27;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$27;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lambda$null$13(Ljava/util/ArrayList;)V

    return-void
.end method
