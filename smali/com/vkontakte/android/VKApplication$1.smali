.class Lcom/vkontakte/android/VKApplication$1;
.super Ljava/lang/Object;
.source "VKApplication.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/VKApplication;->initEmoji(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/VKApplication;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/VKApplication;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/VKApplication;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/vkontakte/android/VKApplication$1;->this$0:Lcom/vkontakte/android/VKApplication;

    iput-object p2, p0, Lcom/vkontakte/android/VKApplication$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 212
    sget-object v2, Lcom/vk/core/network/Network$ClientType;->CLIENT_EMOJI:Lcom/vk/core/network/Network$ClientType;

    .line 213
    .local v2, "id":Lcom/vk/core/network/Network$ClientType;
    iget-object v3, p0, Lcom/vkontakte/android/VKApplication$1;->val$context:Landroid/content/Context;

    invoke-static {v3}, Lcom/vk/emoji/Emoji;->instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;

    move-result-object v1

    .line 214
    .local v1, "emoji":Lcom/vk/emoji/Emoji;
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/vk/core/network/Network;->getBuilder(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 215
    .local v0, "builder":Lokhttp3/OkHttpClient$Builder;
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v3

    invoke-virtual {v1}, Lcom/vk/emoji/Emoji;->getCache()Lokhttp3/Cache;

    move-result-object v4

    invoke-virtual {v0, v4}, Lokhttp3/OkHttpClient$Builder;->cache(Lokhttp3/Cache;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/vk/core/network/Network;->setBuilder(Lcom/vk/core/network/Network$ClientType;Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient;

    .line 217
    new-instance v3, Lcom/vkontakte/android/VKApplication$1$2;

    invoke-direct {v3, p0, v2}, Lcom/vkontakte/android/VKApplication$1$2;-><init>(Lcom/vkontakte/android/VKApplication$1;Lcom/vk/core/network/Network$ClientType;)V

    invoke-virtual {v1, v3}, Lcom/vk/emoji/Emoji;->init(Lokhttp3/Call$Factory;)Lcom/vk/emoji/Emoji;

    move-result-object v3

    .line 222
    invoke-virtual {v3}, Lcom/vk/emoji/Emoji;->emojiLoadObservable()Lio/reactivex/Observable;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/VKApplication$1$1;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/VKApplication$1$1;-><init>(Lcom/vkontakte/android/VKApplication$1;)V

    invoke-virtual {v3, v4}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 228
    return-void
.end method
