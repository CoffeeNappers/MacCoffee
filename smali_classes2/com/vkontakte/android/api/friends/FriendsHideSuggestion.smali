.class public Lcom/vkontakte/android/api/friends/FriendsHideSuggestion;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "FriendsHideSuggestion.java"


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "userID"    # I

    .prologue
    .line 10
    const-string/jumbo v0, "friends.hideSuggestion"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    const-string/jumbo v0, "user_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/friends/FriendsHideSuggestion;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    return-void
.end method
