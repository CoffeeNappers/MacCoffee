.class Lcom/vkontakte/android/VKApplication$1$2;
.super Ljava/lang/Object;
.source "VKApplication.java"

# interfaces
.implements Lokhttp3/Call$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/VKApplication$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/VKApplication$1;

.field final synthetic val$id:Lcom/vk/core/network/Network$ClientType;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/VKApplication$1;Lcom/vk/core/network/Network$ClientType;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/VKApplication$1;

    .prologue
    .line 217
    iput-object p1, p0, Lcom/vkontakte/android/VKApplication$1$2;->this$1:Lcom/vkontakte/android/VKApplication$1;

    iput-object p2, p0, Lcom/vkontakte/android/VKApplication$1$2;->val$id:Lcom/vk/core/network/Network$ClientType;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newCall(Lokhttp3/Request;)Lokhttp3/Call;
    .locals 2
    .param p1, "request"    # Lokhttp3/Request;

    .prologue
    .line 220
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/VKApplication$1$2;->val$id:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v0, v1}, Lcom/vk/core/network/Network;->getClient(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    return-object v0
.end method
