.class Lcom/vkontakte/android/LongPollService$12;
.super Ljava/lang/Object;
.source "LongPollService.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->sendOffline()V
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
        "Lorg/json/JSONObject;",
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
    .line 1893
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService$12;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1899
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1893
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LongPollService$12;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "j"    # Lorg/json/JSONObject;

    .prologue
    .line 1895
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->clear(Z)V

    .line 1896
    return-void
.end method
