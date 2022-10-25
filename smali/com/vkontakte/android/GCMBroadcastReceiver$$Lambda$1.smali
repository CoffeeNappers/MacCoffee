.class final synthetic Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/GCMBroadcastReceiver;

.field private final arg$2:Landroid/content/Intent;

.field private final arg$3:Landroid/content/Context;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/GCMBroadcastReceiver;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;->arg$1:Lcom/vkontakte/android/GCMBroadcastReceiver;

    iput-object p2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;->arg$2:Landroid/content/Intent;

    iput-object p3, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;->arg$3:Landroid/content/Context;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/GCMBroadcastReceiver;Landroid/content/Intent;Landroid/content/Context;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;-><init>(Lcom/vkontakte/android/GCMBroadcastReceiver;Landroid/content/Intent;Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;->arg$1:Lcom/vkontakte/android/GCMBroadcastReceiver;

    iget-object v1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;->arg$2:Landroid/content/Intent;

    iget-object v2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$1;->arg$3:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/GCMBroadcastReceiver;->lambda$onReceive$11(Landroid/content/Intent;Landroid/content/Context;)V

    return-void
.end method
