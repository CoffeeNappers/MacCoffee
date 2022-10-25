.class public Lcom/vkontakte/android/api/masks/MasksGetModel;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MasksGetModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;",
        ">;"
    }
.end annotation


# static fields
.field public static final DEFAULT:Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 12
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;

    const/4 v1, 0x1

    const-string/jumbo v2, "https://vk.com/source/masks/android_model.zip"

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/api/masks/MasksGetModel;->DEFAULT:Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "engineVersion"    # I

    .prologue
    .line 16
    const-string/jumbo v0, "masks.getModel"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 17
    const-string/jumbo v0, "engine_version"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/masks/MasksGetModel;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;
    .locals 2
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 22
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;

    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/masks/MasksGetModel;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;

    move-result-object v0

    return-object v0
.end method
