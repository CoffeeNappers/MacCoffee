.class final synthetic Lcom/vkontakte/android/NotificationActivity$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/NotificationActivity;

.field private final arg$2:Ljava/lang/String;

.field private final arg$3:Lcom/vkontakte/android/data/UserNotification;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/NotificationActivity;Ljava/lang/String;Lcom/vkontakte/android/data/UserNotification;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$2;->arg$1:Lcom/vkontakte/android/NotificationActivity;

    iput-object p2, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$2;->arg$2:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$2;->arg$3:Lcom/vkontakte/android/data/UserNotification;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/NotificationActivity;Ljava/lang/String;Lcom/vkontakte/android/data/UserNotification;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/NotificationActivity$$Lambda$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/NotificationActivity$$Lambda$2;-><init>(Lcom/vkontakte/android/NotificationActivity;Ljava/lang/String;Lcom/vkontakte/android/data/UserNotification;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$2;->arg$1:Lcom/vkontakte/android/NotificationActivity;

    iget-object v1, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$2;->arg$2:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/NotificationActivity$$Lambda$2;->arg$3:Lcom/vkontakte/android/data/UserNotification;

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/NotificationActivity;->lambda$onCreate$1(Ljava/lang/String;Lcom/vkontakte/android/data/UserNotification;Landroid/content/DialogInterface;I)V

    return-void
.end method
