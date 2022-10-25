.class final synthetic Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment$16;

.field private final arg$2:Z

.field private final arg$3:Ljava/util/ArrayList;

.field private final arg$4:J


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment$16;ZLjava/util/ArrayList;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment$16;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->arg$2:Z

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->arg$3:Ljava/util/ArrayList;

    iput-wide p4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->arg$4:J

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment$16;ZLjava/util/ArrayList;J)Ljava/lang/Runnable;
    .locals 7

    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment$16;ZLjava/util/ArrayList;J)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 6
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment$16;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->arg$2:Z

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->arg$3:Ljava/util/ArrayList;

    iget-wide v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->arg$4:J

    invoke-virtual {v0, v1, v2, v4, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->lambda$onMessagesLoaded$0(ZLjava/util/ArrayList;J)V

    return-void
.end method
