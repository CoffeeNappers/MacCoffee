.class Lcom/vkontakte/android/api/masks/MasksResponse$2;
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
        "Lcom/vkontakte/android/api/Group;",
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
    .line 36
    iput-object p1, p0, Lcom/vkontakte/android/api/masks/MasksResponse$2;->this$0:Lcom/vkontakte/android/api/masks/MasksResponse;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/Group;
    .locals 1
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v0, Lcom/vkontakte/android/api/Group;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

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
    .line 36
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/masks/MasksResponse$2;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    return-object v0
.end method
