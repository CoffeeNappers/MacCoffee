.class public Lcom/vkontakte/android/api/stories/StoriesMarkAsSeen;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "StoriesMarkAsSeen.java"


# direct methods
.method public constructor <init>(IJLjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "ownerId"    # I
    .param p2, "storyId"    # J
    .param p4, "accessKey"    # Ljava/lang/String;
    .param p5, "source"    # Ljava/lang/String;

    .prologue
    .line 10
    const-string/jumbo v0, "stories.markSeen"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/stories/StoriesMarkAsSeen;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "story_id"

    invoke-virtual {p0, v0, p2, p3}, Lcom/vkontakte/android/api/stories/StoriesMarkAsSeen;->param(Ljava/lang/String;J)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v0, "source"

    invoke-virtual {p0, v0, p5}, Lcom/vkontakte/android/api/stories/StoriesMarkAsSeen;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 15
    const-string/jumbo v0, "access_key"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/stories/StoriesMarkAsSeen;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    :cond_0
    return-void
.end method
