.class Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "Stickers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/Stickers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GetAutoSuggestDictionaryRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 743
    const-string/jumbo v0, "store.getStickersKeywords"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 745
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;->setBackground(Z)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 747
    const-string/jumbo v0, "aliases"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 748
    const-string/jumbo v0, "all_products"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 749
    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 741
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;->parse(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0
    .param p1, "source"    # Lorg/json/JSONObject;

    .prologue
    .line 753
    return-object p1
.end method
