.class final synthetic Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

.field private final arg$2:Ljava/lang/String;

.field private final arg$3:Ljava/util/ArrayList;

.field private final arg$4:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->arg$2:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->arg$3:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->arg$4:Ljava/lang/String;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->arg$2:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->arg$3:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->arg$4:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lambda$null$14(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method
