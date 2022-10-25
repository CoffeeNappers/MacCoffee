.class public Lcom/vkontakte/android/api/stories/StoriesGetViewers;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "StoriesGetViewers.java"


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
.method public constructor <init>(IIII)V
    .locals 3
    .param p1, "ownerId"    # I
    .param p2, "storyId"    # I
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v2, 0x1

    .line 9
    const-string/jumbo v0, "stories.getViewers"

    const-class v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 10
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/stories/StoriesGetViewers;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "story_id"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/stories/StoriesGetViewers;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "name,screen_name,photo_50,photo_100,photo_200,sex,verified,can_write_private_message"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetViewers;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v0, "photo_sizes"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/stories/StoriesGetViewers;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v0, "extended"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/stories/StoriesGetViewers;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    return-void
.end method
