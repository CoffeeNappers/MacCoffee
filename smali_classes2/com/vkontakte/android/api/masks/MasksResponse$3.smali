.class Lcom/vkontakte/android/api/masks/MasksResponse$3;
.super Lcom/vkontakte/android/data/Parser;
.source "MasksResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/masks/MasksResponse;-><init>(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Lcom/vk/masks/model/Mask;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/masks/MasksResponse;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/masks/MasksResponse;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/masks/MasksResponse;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/api/masks/MasksResponse$3;->this$0:Lcom/vkontakte/android/api/masks/MasksResponse;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vk/masks/model/Mask;
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 45
    new-instance v0, Lcom/vk/masks/model/Mask;

    invoke-direct {v0, p1}, Lcom/vk/masks/model/Mask;-><init>(Lorg/json/JSONObject;)V

    .line 46
    .local v0, "m":Lcom/vk/masks/model/Mask;
    iget v1, v0, Lcom/vk/masks/model/Mask;->ownerId:I

    if-gez v1, :cond_0

    .line 47
    iget v1, v0, Lcom/vk/masks/model/Mask;->ownerId:I

    iget-object v2, p0, Lcom/vkontakte/android/api/masks/MasksResponse$3;->this$0:Lcom/vkontakte/android/api/masks/MasksResponse;

    iget-object v2, v2, Lcom/vkontakte/android/api/masks/MasksResponse;->groups:Ljava/util/ArrayList;

    invoke-static {v1, v2}, Lcom/vkontakte/android/api/masks/MasksResponse;->access$000(ILjava/util/ArrayList;)Lcom/vkontakte/android/api/Group;

    move-result-object v1

    iput-object v1, v0, Lcom/vk/masks/model/Mask;->ownerGroup:Lcom/vkontakte/android/api/Group;

    .line 51
    :goto_0
    return-object v0

    .line 49
    :cond_0
    iget v1, v0, Lcom/vk/masks/model/Mask;->ownerId:I

    iget-object v2, p0, Lcom/vkontakte/android/api/masks/MasksResponse$3;->this$0:Lcom/vkontakte/android/api/masks/MasksResponse;

    iget-object v2, v2, Lcom/vkontakte/android/api/masks/MasksResponse;->profiles:Ljava/util/ArrayList;

    invoke-static {v1, v2}, Lcom/vkontakte/android/api/masks/MasksResponse;->access$100(ILjava/util/ArrayList;)Lcom/vkontakte/android/UserProfile;

    move-result-object v1

    iput-object v1, v0, Lcom/vk/masks/model/Mask;->ownerProfile:Lcom/vkontakte/android/UserProfile;

    goto :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/masks/MasksResponse$3;->parse(Lorg/json/JSONObject;)Lcom/vk/masks/model/Mask;

    move-result-object v0

    return-object v0
.end method
