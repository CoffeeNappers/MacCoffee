.class public Lcom/vk/stories/model/GetStoriesResponse;
.super Ljava/lang/Object;
.source "GetStoriesResponse.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/stories/model/GetStoriesResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final DATE_STORY_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/vk/stories/model/StoryEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final count:I

.field public final originalJsonObject:Lorg/json/JSONObject;

.field public final storiesResponse:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/vk/stories/model/GetStoriesResponse$1;

    invoke-direct {v0}, Lcom/vk/stories/model/GetStoriesResponse$1;-><init>()V

    sput-object v0, Lcom/vk/stories/model/GetStoriesResponse;->DATE_STORY_COMPARATOR:Ljava/util/Comparator;

    .line 161
    new-instance v0, Lcom/vk/stories/model/GetStoriesResponse$2;

    invoke-direct {v0}, Lcom/vk/stories/model/GetStoriesResponse$2;-><init>()V

    sput-object v0, Lcom/vk/stories/model/GetStoriesResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    .line 156
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/model/GetStoriesResponse;->originalJsonObject:Lorg/json/JSONObject;

    .line 157
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/stories/model/GetStoriesResponse;->count:I

    .line 158
    iget-object v0, p0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    sget-object v1, Lcom/vk/stories/model/StoriesContainer;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 159
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 18
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 37
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    .line 38
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vk/stories/model/GetStoriesResponse;->originalJsonObject:Lorg/json/JSONObject;

    .line 40
    if-nez p1, :cond_1

    .line 41
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/model/GetStoriesResponse;->count:I

    .line 104
    :cond_0
    return-void

    .line 45
    :cond_1
    const-string/jumbo v15, "count"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/model/GetStoriesResponse;->count:I

    .line 48
    new-instance v11, Landroid/util/SparseArray;

    invoke-direct {v11}, Landroid/util/SparseArray;-><init>()V

    .line 49
    .local v11, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v15, "profiles"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v15}, Lcom/vk/stories/model/GetStoriesResponse;->parseProfiles(Landroid/util/SparseArray;Lorg/json/JSONArray;)V

    .line 51
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    .line 52
    .local v5, "groups":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/api/Group;>;"
    const-string/jumbo v15, "groups"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v15}, Lcom/vk/stories/model/GetStoriesResponse;->parseGroups(Landroid/util/SparseArray;Lorg/json/JSONArray;)V

    .line 55
    const-string/jumbo v15, "items"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 56
    .local v2, "allStories":Lorg/json/JSONArray;
    if-eqz v2, :cond_0

    .line 57
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v6, v15, :cond_0

    .line 60
    :try_start_0
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v14

    .line 61
    .local v14, "userStories":Lorg/json/JSONArray;
    if-eqz v14, :cond_4

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-lez v15, :cond_4

    .line 62
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v9, "localStories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoryEntry;>;"
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_1
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v7, v15, :cond_3

    .line 64
    invoke-virtual {v14, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 65
    .local v8, "jo":Lorg/json/JSONObject;
    if-eqz v8, :cond_2

    .line 66
    new-instance v15, Lcom/vk/stories/model/StoryEntry;

    invoke-direct {v15, v8}, Lcom/vk/stories/model/StoryEntry;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 69
    .end local v8    # "jo":Lorg/json/JSONObject;
    :cond_3
    sget-object v15, Lcom/vk/stories/model/GetStoriesResponse;->DATE_STORY_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v9, v15}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 70
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-lez v15, :cond_4

    .line 71
    const/4 v15, 0x0

    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vk/stories/model/StoryEntry;

    iget v13, v15, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    .line 72
    .local v13, "uid":I
    if-lez v13, :cond_5

    .line 73
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    new-instance v17, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v11, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v17

    invoke-direct {v0, v15, v9}, Lcom/vk/stories/model/StoriesContainer;-><init>(Lcom/vkontakte/android/UserProfile;Ljava/util/ArrayList;)V

    invoke-virtual/range {v16 .. v17}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .end local v7    # "j":I
    .end local v9    # "localStories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoryEntry;>;"
    .end local v13    # "uid":I
    .end local v14    # "userStories":Lorg/json/JSONArray;
    :cond_4
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 75
    .restart local v7    # "j":I
    .restart local v9    # "localStories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoryEntry;>;"
    .restart local v13    # "uid":I
    .restart local v14    # "userStories":Lorg/json/JSONArray;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    new-instance v17, Lcom/vk/stories/model/StoriesContainer;

    neg-int v15, v13

    invoke-virtual {v5, v15}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/api/Group;

    move-object/from16 v0, v17

    invoke-direct {v0, v15, v9}, Lcom/vk/stories/model/StoriesContainer;-><init>(Lcom/vkontakte/android/api/Group;Ljava/util/ArrayList;)V

    invoke-virtual/range {v16 .. v17}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 79
    .end local v7    # "j":I
    .end local v9    # "localStories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoryEntry;>;"
    .end local v13    # "uid":I
    .end local v14    # "userStories":Lorg/json/JSONArray;
    :catch_0
    move-exception v3

    .line 81
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    .line 82
    .local v12, "story":Lorg/json/JSONObject;
    if-eqz v12, :cond_4

    .line 83
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .restart local v9    # "localStories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoryEntry;>;"
    new-instance v15, Lcom/vk/stories/model/StoryEntry;

    invoke-direct {v15, v12}, Lcom/vk/stories/model/StoryEntry;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-lez v15, :cond_4

    .line 86
    const/4 v15, 0x0

    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vk/stories/model/StoryEntry;

    iget v13, v15, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    .line 87
    .restart local v13    # "uid":I
    if-gez v13, :cond_6

    .line 88
    neg-int v15, v13

    invoke-virtual {v5, v15}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/api/Group;

    .line 89
    .local v4, "group":Lcom/vkontakte/android/api/Group;
    if-eqz v4, :cond_4

    .line 90
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    new-instance v16, Lcom/vk/stories/model/StoriesContainer;

    move-object/from16 v0, v16

    invoke-direct {v0, v4, v9}, Lcom/vk/stories/model/StoriesContainer;-><init>(Lcom/vkontakte/android/api/Group;Ljava/util/ArrayList;)V

    invoke-virtual/range {v15 .. v16}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 93
    .end local v4    # "group":Lcom/vkontakte/android/api/Group;
    :cond_6
    invoke-virtual {v11, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/UserProfile;

    .line 94
    .local v10, "p":Lcom/vkontakte/android/UserProfile;
    if-eqz v10, :cond_4

    .line 95
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    new-instance v16, Lcom/vk/stories/model/StoriesContainer;

    move-object/from16 v0, v16

    invoke-direct {v0, v10, v9}, Lcom/vk/stories/model/StoriesContainer;-><init>(Lcom/vkontakte/android/UserProfile;Ljava/util/ArrayList;)V

    invoke-virtual/range {v15 .. v16}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method private parseGroups(Landroid/util/SparseArray;Lorg/json/JSONArray;)V
    .locals 4
    .param p2, "groupsJson"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;",
            "Lorg/json/JSONArray;",
            ")V"
        }
    .end annotation

    .prologue
    .line 127
    .local p1, "groups":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/api/Group;>;"
    if-eqz p2, :cond_1

    .line 128
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 129
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 130
    .local v1, "jo":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 132
    :try_start_0
    new-instance v2, Lcom/vkontakte/android/api/Group;

    invoke-direct {v2, v1}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    .line 133
    .local v2, "up":Lcom/vkontakte/android/api/Group;
    if-eqz v2, :cond_0

    .line 134
    iget v3, v2, Lcom/vkontakte/android/api/Group;->id:I

    invoke-virtual {p1, v3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .end local v2    # "up":Lcom/vkontakte/android/api/Group;
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 142
    .end local v0    # "i":I
    .end local v1    # "jo":Lorg/json/JSONObject;
    :cond_1
    return-void

    .line 136
    .restart local v0    # "i":I
    .restart local v1    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private parseProfiles(Landroid/util/SparseArray;Lorg/json/JSONArray;)V
    .locals 4
    .param p2, "profilesJson"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Lorg/json/JSONArray;",
            ")V"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz p2, :cond_1

    .line 109
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 110
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 111
    .local v1, "jo":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 113
    :try_start_0
    new-instance v2, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v2, v1}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 114
    .local v2, "up":Lcom/vkontakte/android/UserProfile;
    if-eqz v2, :cond_0

    .line 115
    iget v3, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {p1, v3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .end local v2    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 123
    .end local v0    # "i":I
    .end local v1    # "jo":Lorg/json/JSONObject;
    :cond_1
    return-void

    .line 117
    .restart local v0    # "i":I
    .restart local v1    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    goto :goto_1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 146
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 151
    iget v0, p0, Lcom/vk/stories/model/GetStoriesResponse;->count:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 152
    iget-object v0, p0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 153
    return-void
.end method
