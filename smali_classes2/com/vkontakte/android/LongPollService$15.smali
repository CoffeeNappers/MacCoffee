.class Lcom/vkontakte/android/LongPollService$15;
.super Ljava/lang/Object;
.source "LongPollService.java"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->initClient()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LongPollService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LongPollService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LongPollService;

    .prologue
    .line 2052
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService$15;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .locals 2
    .param p1, "chain"    # Lokhttp3/Interceptor$Chain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2055
    sget-boolean v1, Lcom/vkontakte/android/LongPollService;->connected:Z

    if-nez v1, :cond_0

    .line 2056
    const/4 v1, 0x1

    sput-boolean v1, Lcom/vkontakte/android/LongPollService;->connected:Z

    .line 2057
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->broadcastStateChanged()V

    .line 2059
    :cond_0
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v0

    .line 2060
    .local v0, "req":Lokhttp3/Request;
    invoke-interface {p1, v0}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v1

    return-object v1
.end method
