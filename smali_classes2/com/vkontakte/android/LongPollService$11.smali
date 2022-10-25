.class Lcom/vkontakte/android/LongPollService$11;
.super Ljava/lang/Object;
.source "LongPollService.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->sendOnline()V
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
        "Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LongPollService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LongPollService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LongPollService;

    .prologue
    .line 1865
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService$11;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1878
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 1879
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService$11;->this$0:Lcom/vkontakte/android/LongPollService;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/LongPollService;->access$802(Lcom/vkontakte/android/LongPollService;Z)Z

    .line 1881
    :cond_0
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;

    .prologue
    .line 1868
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService$11;->this$0:Lcom/vkontakte/android/LongPollService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/LongPollService;->access$802(Lcom/vkontakte/android/LongPollService;Z)Z

    .line 1869
    iget-boolean v0, p1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;->isEnabled:Z

    if-eqz v0, :cond_0

    .line 1870
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;->endpointUrl:Ljava/lang/String;

    iget-wide v2, p1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;->timeInterval:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/data/BenchmarkTracker;->startMFTracking(Ljava/lang/String;J)V

    .line 1874
    :goto_0
    return-void

    .line 1872
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->stopAndResetMFTracking()V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1865
    check-cast p1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LongPollService$11;->success(Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;)V

    return-void
.end method
