.class Lcom/vkontakte/android/api/VKAPIRequest$2;
.super Ljava/lang/Object;
.source "VKAPIRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/VKAPIRequest;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/VKAPIRequest;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 322
    .local p0, "this":Lcom/vkontakte/android/api/VKAPIRequest$2;, "Lcom/vkontakte/android/api/VKAPIRequest$2;"
    iput-object p1, p0, Lcom/vkontakte/android/api/VKAPIRequest$2;->this$0:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 325
    .local p0, "this":Lcom/vkontakte/android/api/VKAPIRequest$2;, "Lcom/vkontakte/android/api/VKAPIRequest$2;"
    iget-object v0, p0, Lcom/vkontakte/android/api/VKAPIRequest$2;->this$0:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v0, v0, Lcom/vkontakte/android/api/VKAPIRequest;->httpCall:Lokhttp3/Call;

    if-eqz v0, :cond_0

    .line 326
    iget-object v0, p0, Lcom/vkontakte/android/api/VKAPIRequest$2;->this$0:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v0, v0, Lcom/vkontakte/android/api/VKAPIRequest;->httpCall:Lokhttp3/Call;

    invoke-interface {v0}, Lokhttp3/Call;->cancel()V

    .line 327
    iget-object v0, p0, Lcom/vkontakte/android/api/VKAPIRequest$2;->this$0:Lcom/vkontakte/android/api/VKAPIRequest;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/api/VKAPIRequest;->httpCall:Lokhttp3/Call;

    .line 329
    :cond_0
    return-void
.end method
