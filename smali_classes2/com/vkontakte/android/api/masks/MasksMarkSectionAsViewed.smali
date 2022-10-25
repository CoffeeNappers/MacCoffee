.class public Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MasksMarkSectionAsViewed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "sectionId"    # I

    .prologue
    .line 12
    const-string/jumbo v0, "execute.markMaskSectionAsViewed"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 13
    const-string/jumbo v0, "section_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;
    .locals 1
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 18
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;-><init>(Lorg/json/JSONObject;)V

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
    .line 9
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;

    move-result-object v0

    return-object v0
.end method
