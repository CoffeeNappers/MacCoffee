.class final synthetic Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment$17;

.field private final arg$2:I

.field private final arg$3:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment$17;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment$17;

    iput p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;->arg$2:I

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;->arg$3:Ljava/lang/String;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment$17;ILjava/lang/String;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment$17;ILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment$17;

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;->arg$2:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;->arg$3:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->lambda$onError$1(ILjava/lang/String;)V

    return-void
.end method
