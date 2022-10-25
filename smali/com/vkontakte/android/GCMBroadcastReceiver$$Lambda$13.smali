.class final synthetic Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# instance fields
.field private final arg$1:Landroid/content/Context;

.field private final arg$2:Landroid/content/Intent;

.field private final arg$3:Ljava/lang/String;

.field private final arg$4:Z

.field private final arg$5:Z

.field private final arg$6:I

.field private final arg$7:Ljava/lang/String;

.field private final arg$8:Lcom/vkontakte/android/NotificationUtils$Type;

.field private final arg$9:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;ZZILjava/lang/String;Lcom/vkontakte/android/NotificationUtils$Type;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$1:Landroid/content/Context;

    iput-object p2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$2:Landroid/content/Intent;

    iput-object p3, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$3:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$4:Z

    iput-boolean p5, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$5:Z

    iput p6, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$6:I

    iput-object p7, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$7:Ljava/lang/String;

    iput-object p8, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$8:Lcom/vkontakte/android/NotificationUtils$Type;

    iput-boolean p9, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$9:Z

    return-void
.end method

.method public static lambdaFactory$(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;ZZILjava/lang/String;Lcom/vkontakte/android/NotificationUtils$Type;Z)Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .locals 10

    new-instance v0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p8

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;-><init>(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;ZZILjava/lang/String;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 10
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$1:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$2:Landroid/content/Intent;

    iget-object v2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$3:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$4:Z

    iget-boolean v4, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$5:Z

    iget v5, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$6:I

    iget-object v6, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$7:Ljava/lang/String;

    iget-object v7, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$8:Lcom/vkontakte/android/NotificationUtils$Type;

    iget-boolean v8, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$$Lambda$13;->arg$9:Z

    move-object v9, p1

    invoke-static/range {v0 .. v9}, Lcom/vkontakte/android/GCMBroadcastReceiver;->lambda$null$10(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;ZZILjava/lang/String;Lcom/vkontakte/android/NotificationUtils$Type;ZLjava/util/ArrayList;)V

    return-void
.end method
