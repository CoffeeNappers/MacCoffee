.class Lcom/vkontakte/android/NotificationButtonsReceiver$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "NotificationButtonsReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/NotificationButtonsReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/NotificationButtonsReceiver;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/NotificationButtonsReceiver;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/NotificationButtonsReceiver;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/vkontakte/android/NotificationButtonsReceiver$1;->this$0:Lcom/vkontakte/android/NotificationButtonsReceiver;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 38
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    .line 39
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 35
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/NotificationButtonsReceiver$1;->success(Ljava/lang/Integer;)V

    return-void
.end method
