.class Lcom/vkontakte/android/NotificationButtonsReceiver$4;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "NotificationButtonsReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/NotificationButtonsReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/NotificationButtonsReceiver;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/NotificationButtonsReceiver;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/NotificationButtonsReceiver;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vkontakte/android/NotificationButtonsReceiver$4;->this$0:Lcom/vkontakte/android/NotificationButtonsReceiver;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->reload(Z)V

    .line 90
    return-void
.end method
