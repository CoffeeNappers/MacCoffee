.class final synthetic Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# instance fields
.field private final arg$1:Landroid/os/Bundle;

.field private final arg$2:Landroid/content/Context;

.field private final arg$3:Z


# direct methods
.method private constructor <init>(Landroid/os/Bundle;Landroid/content/Context;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;->arg$1:Landroid/os/Bundle;

    iput-object p2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;->arg$2:Landroid/content/Context;

    iput-boolean p3, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;->arg$3:Z

    return-void
.end method

.method public static lambdaFactory$(Landroid/os/Bundle;Landroid/content/Context;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;-><init>(Landroid/os/Bundle;Landroid/content/Context;Z)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;->arg$1:Landroid/os/Bundle;

    iget-object v1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;->arg$2:Landroid/content/Context;

    iget-boolean v2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$10;->arg$3:Z

    invoke-static {v0, v1, v2, p1}, Lcom/vkontakte/android/GCMBroadcastReceiver;->lambda$null$7(Landroid/os/Bundle;Landroid/content/Context;ZLjava/util/ArrayList;)V

    return-void
.end method
