.class Lcom/vkontakte/android/data/UserNotification$2;
.super Ljava/lang/Object;
.source "UserNotification.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/UserNotification;->hideNotification(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/UserNotification;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/UserNotification;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/data/UserNotification;

    .prologue
    .line 426
    iput-object p1, p0, Lcom/vkontakte/android/data/UserNotification$2;->this$0:Lcom/vkontakte/android/data/UserNotification;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v2, 0x0

    .line 435
    iget-object v0, p0, Lcom/vkontakte/android/data/UserNotification$2;->this$0:Lcom/vkontakte/android/data/UserNotification;

    invoke-static {v0, v2}, Lcom/vkontakte/android/data/UserNotification;->access$002(Lcom/vkontakte/android/data/UserNotification;Z)Z

    .line 436
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string/jumbo v1, "error"

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 437
    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    const/4 v3, 0x1

    .line 429
    iget-object v0, p0, Lcom/vkontakte/android/data/UserNotification$2;->this$0:Lcom/vkontakte/android/data/UserNotification;

    invoke-static {v0, v3}, Lcom/vkontakte/android/data/UserNotification;->access$002(Lcom/vkontakte/android/data/UserNotification;Z)Z

    .line 430
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "ok"

    aput-object v2, v0, v1

    aput-object p1, v0, v3

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 431
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 426
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/UserNotification$2;->success(Ljava/lang/Boolean;)V

    return-void
.end method
