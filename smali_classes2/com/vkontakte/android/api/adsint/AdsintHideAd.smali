.class public Lcom/vkontakte/android/api/adsint/AdsintHideAd;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AdsintHideAd.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "objectType"    # Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    .prologue
    .line 15
    const-string/jumbo v0, "adsint.hideAd"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 16
    const-string/jumbo v0, "ad_data"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/adsint/AdsintHideAd;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    const-string/jumbo v0, "object_type"

    invoke-virtual {p2}, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/adsint/AdsintHideAd;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    return-void
.end method
