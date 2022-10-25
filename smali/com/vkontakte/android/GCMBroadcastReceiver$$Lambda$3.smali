.class final synthetic Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# instance fields
.field private final arg$1:Landroid/content/Context;

.field private final arg$2:Landroid/content/Intent;

.field private final arg$3:I

.field private final arg$4:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/content/Intent;IZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->arg$1:Landroid/content/Context;

    iput-object p2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->arg$2:Landroid/content/Intent;

    iput p3, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->arg$3:I

    iput-boolean p4, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->arg$4:Z

    return-void
.end method

.method public static lambdaFactory$(Landroid/content/Context;Landroid/content/Intent;IZ)Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;-><init>(Landroid/content/Context;Landroid/content/Intent;IZ)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->arg$1:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->arg$2:Landroid/content/Intent;

    iget v2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->arg$3:I

    iget-boolean v3, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$3;->arg$4:Z

    invoke-static {v0, v1, v2, v3, p1}, Lcom/vkontakte/android/GCMBroadcastReceiver;->lambda$null$0(Landroid/content/Context;Landroid/content/Intent;IZLjava/util/ArrayList;)V

    return-void
.end method
