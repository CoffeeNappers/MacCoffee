.class final synthetic Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF1Int;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1Int;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    check-cast p1, Lcom/vkontakte/android/api/models/Notification;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->lambda$new$1(Lcom/vkontakte/android/api/models/Notification;I)V

    return-void
.end method
