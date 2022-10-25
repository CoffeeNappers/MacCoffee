.class public Lcom/vk/stories/StoryViewersFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "StoryViewersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/StoryViewersFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 36
    const-class v0, Lcom/vk/stories/StoryViewersFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 37
    iget-object v0, p0, Lcom/vk/stories/StoryViewersFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "theme"

    const v2, 0x7f0b00b7

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 38
    return-void
.end method


# virtual methods
.method public setStory(Lcom/vk/stories/model/StoryEntry;)Lcom/vk/stories/StoryViewersFragment$Builder;
    .locals 3
    .param p1, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vk/stories/StoryViewersFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "owner_id"

    iget v2, p1, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 42
    iget-object v0, p0, Lcom/vk/stories/StoryViewersFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "id"

    iget v2, p1, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 43
    iget-object v0, p0, Lcom/vk/stories/StoryViewersFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "views_count"

    iget v2, p1, Lcom/vk/stories/model/StoryEntry;->viewsCount:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 44
    return-object p0
.end method
