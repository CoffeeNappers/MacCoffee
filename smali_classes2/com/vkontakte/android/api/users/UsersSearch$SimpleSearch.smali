.class public Lcom/vkontakte/android/api/users/UsersSearch$SimpleSearch;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "UsersSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/users/UsersSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleSearch"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 116
    const-string/jumbo v0, "users.search"

    const-class v1, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 117
    const-string/jumbo v0, "q"

    const-string/jumbo v1, "\""

    const-string/jumbo v2, "\\\""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/users/UsersSearch$SimpleSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 118
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/users/UsersSearch$SimpleSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 119
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/users/UsersSearch$SimpleSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 120
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_50,photo_100,photo_200"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/users/UsersSearch$SimpleSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 121
    return-void
.end method
