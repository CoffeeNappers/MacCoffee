.class public final enum Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;
.super Ljava/lang/Enum;
.source "AdsintHideAd.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/adsint/AdsintHideAd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ObjectType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

.field public static final enum ad:Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

.field public static final enum source:Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 11
    new-instance v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    const-string/jumbo v1, "ad"

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->ad:Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    new-instance v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    const-string/jumbo v1, "source"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->source:Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    .line 10
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    sget-object v1, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->ad:Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->source:Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->$VALUES:[Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->$VALUES:[Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    invoke-virtual {v0}, [Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    return-object v0
.end method
