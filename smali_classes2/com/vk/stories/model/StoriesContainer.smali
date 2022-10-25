.class public Lcom/vk/stories/model/StoriesContainer;
.super Ljava/lang/Object;
.source "StoriesContainer.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final group:Lcom/vkontakte/android/api/Group;

.field public final storyEntries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final userProfile:Lcom/vkontakte/android/UserProfile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 172
    new-instance v0, Lcom/vk/stories/model/StoriesContainer$1;

    invoke-direct {v0}, Lcom/vk/stories/model/StoriesContainer$1;-><init>()V

    sput-object v0, Lcom/vk/stories/model/StoriesContainer;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    const-class v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    .line 168
    const-class v0, Lcom/vkontakte/android/api/Group;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    iput-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    .line 169
    sget-object v0, Lcom/vk/stories/model/StoryEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    .line 170
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/UserProfile;Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "userProfile"    # Lcom/vkontakte/android/UserProfile;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/UserProfile;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoryEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p2, "storyEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoryEntry;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    .line 24
    iput-object p2, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/Group;Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/api/Group;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoryEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p2, "storyEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoryEntry;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    .line 29
    iput-object p1, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    .line 30
    iput-object p2, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    .line 31
    return-void
.end method


# virtual methods
.method public canComment()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 147
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 148
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iget-boolean v0, v0, Lcom/vk/stories/model/StoryEntry;->canComment:Z

    .line 150
    :cond_0
    return v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 156
    const/4 v0, 0x0

    return v0
.end method

.method public getAuthorAvatarUrl()Ljava/lang/String;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 89
    invoke-virtual {p0}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iget-object v0, v0, Lcom/vk/stories/model/StoryEntry;->ownerPhoto:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iget-object v0, v0, Lcom/vk/stories/model/StoryEntry;->ownerPhoto:Ljava/lang/String;

    .line 96
    :goto_0
    return-object v0

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_1

    .line 92
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v0, :cond_2

    .line 94
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    iget-object v0, v0, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    goto :goto_0

    .line 96
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAuthorFirstName()Ljava/lang/String;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-virtual {p0}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iget-object v0, v0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iget-object v0, v0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    .line 84
    :goto_0
    return-object v0

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    goto :goto_0

    .line 81
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v0, :cond_2

    .line 82
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    iget-object v0, v0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    goto :goto_0

    .line 84
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAuthorFullName()Ljava/lang/String;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 65
    invoke-virtual {p0}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iget-object v0, v0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iget-object v0, v0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    .line 72
    :goto_0
    return-object v0

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_1

    .line 68
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    goto :goto_0

    .line 69
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v0, :cond_2

    .line 70
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    iget-object v0, v0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    goto :goto_0

    .line 72
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAuthorId()I
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 60
    :goto_0
    return v0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v0, :cond_1

    .line 58
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    iget v0, v0, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v0, v0

    goto :goto_0

    .line 60
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFirstStory()Lcom/vk/stories/model/StoryEntry;
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    return-object v0
.end method

.method public getLastLocalStory()Lcom/vk/stories/model/StoryEntry;
    .locals 2

    .prologue
    .line 138
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 139
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoryEntry;

    iget-boolean v1, v1, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-eqz v1, :cond_0

    .line 140
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoryEntry;

    .line 143
    :goto_1
    return-object v1

    .line 138
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 143
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getLastStory()Lcom/vk/stories/model/StoryEntry;
    .locals 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    return-object v0
.end method

.method public getStartIndex()I
    .locals 2

    .prologue
    .line 112
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 113
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoryEntry;

    iget-boolean v1, v1, Lcom/vk/stories/model/StoryEntry;->seen:Z

    if-nez v1, :cond_0

    .line 117
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 112
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 117
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getStartStory()Lcom/vk/stories/model/StoryEntry;
    .locals 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vk/stories/model/StoriesContainer;->getStartIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    return-object v0
.end method

.method public hasFailedUploads()Z
    .locals 4

    .prologue
    .line 34
    iget-object v3, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    if-eqz v3, :cond_1

    .line 35
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 36
    iget-object v3, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoryEntry;

    .line 37
    .local v1, "se":Lcom/vk/stories/model/StoryEntry;
    invoke-static {v1}, Lcom/vk/stories/StoriesController;->getUploadState(Lcom/vk/stories/model/StoryEntry;)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v2

    .line 38
    .local v2, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/vk/stories/StoriesController$StoryUpload;->uploadFailed()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 39
    const/4 v3, 0x1

    .line 43
    .end local v0    # "i":I
    .end local v1    # "se":Lcom/vk/stories/model/StoryEntry;
    .end local v2    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :goto_1
    return v3

    .line 35
    .restart local v0    # "i":I
    .restart local v1    # "se":Lcom/vk/stories/model/StoryEntry;
    .restart local v2    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 43
    .end local v0    # "i":I
    .end local v1    # "se":Lcom/vk/stories/model/StoryEntry;
    .end local v2    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public hasNewStories()Z
    .locals 2

    .prologue
    .line 129
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 130
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoryEntry;

    iget-boolean v1, v1, Lcom/vk/stories/model/StoryEntry;->seen:Z

    if-nez v1, :cond_0

    .line 131
    const/4 v1, 0x1

    .line 134
    :goto_1
    return v1

    .line 129
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 134
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public hasValidStories()Z
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPromo()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p0}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iget-boolean v0, v0, Lcom/vk/stories/model/StoryEntry;->isPromo:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public myStory()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 101
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    if-nez v1, :cond_1

    .line 104
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->userProfile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 162
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->group:Lcom/vkontakte/android/api/Group;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 163
    iget-object v0, p0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 164
    return-void
.end method
