.class public Lcom/vkontakte/android/api/execute/SendServerInfo;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "SendServerInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/execute/SendServerInfo$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/execute/SendServerInfo$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    const-string/jumbo v0, "execute.sendServerInfo"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    return-void
.end method
