.class public Lcom/vkontakte/android/api/fave/FaveGetLinks;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "FaveGetLinks.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# static fields
.field private static ID_COUNT:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput v0, Lcom/vkontakte/android/api/fave/FaveGetLinks;->ID_COUNT:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 20
    const-string/jumbo v0, "fave.getLinks"

    new-instance v1, Lcom/vkontakte/android/api/fave/FaveGetLinks$1;

    invoke-direct {v1}, Lcom/vkontakte/android/api/fave/FaveGetLinks$1;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/Parser;)V

    .line 37
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/fave/FaveGetLinks;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 38
    return-void
.end method

.method static synthetic access$008()I
    .locals 2

    .prologue
    .line 14
    sget v0, Lcom/vkontakte/android/api/fave/FaveGetLinks;->ID_COUNT:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/vkontakte/android/api/fave/FaveGetLinks;->ID_COUNT:I

    return v0
.end method
