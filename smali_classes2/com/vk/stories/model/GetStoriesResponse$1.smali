.class final Lcom/vk/stories/model/GetStoriesResponse$1;
.super Ljava/lang/Object;
.source "GetStoriesResponse.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/model/GetStoriesResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/vk/stories/model/StoryEntry;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/model/StoryEntry;)I
    .locals 4
    .param p1, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;
    .param p2, "t1"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 23
    iget-wide v0, p1, Lcom/vk/stories/model/StoryEntry;->date:J

    iget-wide v2, p2, Lcom/vk/stories/model/StoryEntry;->date:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 24
    const/4 v0, -0x1

    .line 28
    :goto_0
    return v0

    .line 25
    :cond_0
    iget-wide v0, p1, Lcom/vk/stories/model/StoryEntry;->date:J

    iget-wide v2, p2, Lcom/vk/stories/model/StoryEntry;->date:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 26
    const/4 v0, 0x1

    goto :goto_0

    .line 28
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 20
    check-cast p1, Lcom/vk/stories/model/StoryEntry;

    check-cast p2, Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {p0, p1, p2}, Lcom/vk/stories/model/GetStoriesResponse$1;->compare(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/model/StoryEntry;)I

    move-result v0

    return v0
.end method
