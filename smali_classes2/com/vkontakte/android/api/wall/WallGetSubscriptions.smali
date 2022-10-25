.class public Lcom/vkontakte/android/api/wall/WallGetSubscriptions;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "WallGetSubscriptions.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 12
    const-string/jumbo v0, "execute.getWallSubscriptions"

    const-class v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 13
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/wall/WallGetSubscriptions;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/wall/WallGetSubscriptions;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    return-void
.end method
