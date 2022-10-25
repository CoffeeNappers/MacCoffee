.class Lcom/vkontakte/android/api/masks/MasksResponse$1;
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
        "Lcom/vkontakte/android/UserProfile;",
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
    .line 30
    iput-object p1, p0, Lcom/vkontakte/android/api/masks/MasksResponse$1;->this$0:Lcom/vkontakte/android/api/masks/MasksResponse;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/UserProfile;
    .locals 1
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 33
    new-instance v0, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/masks/MasksResponse$1;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/UserProfile;

    move-result-object v0

    return-object v0
.end method
