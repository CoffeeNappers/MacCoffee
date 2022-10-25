.class final synthetic Lcom/vkontakte/android/NotificationActivity$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/NotificationActivity;

.field private final arg$2:Lcom/vkontakte/android/data/UserNotification;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/NotificationActivity;Lcom/vkontakte/android/data/UserNotification;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$1;->arg$1:Lcom/vkontakte/android/NotificationActivity;

    iput-object p2, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$1;->arg$2:Lcom/vkontakte/android/data/UserNotification;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/NotificationActivity;Lcom/vkontakte/android/data/UserNotification;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/NotificationActivity$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/NotificationActivity$$Lambda$1;-><init>(Lcom/vkontakte/android/NotificationActivity;Lcom/vkontakte/android/data/UserNotification;)V

    return-object v0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$1;->arg$1:Lcom/vkontakte/android/NotificationActivity;

    iget-object v1, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$1;->arg$2:Lcom/vkontakte/android/data/UserNotification;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/NotificationActivity;->lambda$onCreate$0(Lcom/vkontakte/android/data/UserNotification;Landroid/content/DialogInterface;)V

    return-void
.end method
