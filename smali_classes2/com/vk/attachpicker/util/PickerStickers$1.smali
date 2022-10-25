.class final Lcom/vk/attachpicker/util/PickerStickers$1;
.super Ljava/lang/Object;
.source "PickerStickers.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/util/PickerStickers;->loadFromServer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 43
    return-void
.end method

.method public success(Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;)V
    .locals 1
    .param p1, "result"    # Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;

    .prologue
    .line 31
    if-eqz p1, :cond_0

    .line 33
    :try_start_0
    invoke-virtual {p1}, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->saveToCache()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :cond_0
    :goto_0
    return-void

    .line 34
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 28
    check-cast p1, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/util/PickerStickers$1;->success(Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;)V

    return-void
.end method
