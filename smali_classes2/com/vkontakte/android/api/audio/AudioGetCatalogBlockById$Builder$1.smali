.class Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$1;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioGetCatalogBlockById.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->buildSection()Lcom/vkontakte/android/api/VKAPIRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vk/music/dto/Section;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;
    .param p2, "method"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$1;->this$0:Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vk/music/dto/Section;
    .locals 2
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$1;->this$0:Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    invoke-static {v1, p1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->access$000(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Lorg/json/JSONObject;)Lcom/vk/music/dto/Section;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 43
    :goto_0
    return-object v1

    .line 41
    :catch_0
    move-exception v0

    .line 42
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 43
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$1;->parse(Lorg/json/JSONObject;)Lcom/vk/music/dto/Section;

    move-result-object v0

    return-object v0
.end method
