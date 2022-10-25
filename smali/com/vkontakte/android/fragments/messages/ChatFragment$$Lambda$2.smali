.class final synthetic Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$lambda$0(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    return-void
.end method
