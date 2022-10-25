.class public Lcom/vkontakte/android/api/masks/MasksResponse;
.super Ljava/lang/Object;
.source "MasksResponse.java"


# instance fields
.field public final groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field public final masks:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;"
        }
    .end annotation
.end field

.field public final profiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/data/VKList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p1, "masks":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/masks/model/Mask;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/api/masks/MasksResponse;->masks:Lcom/vkontakte/android/data/VKList;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/masks/MasksResponse;->profiles:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/masks/MasksResponse;->groups:Ljava/util/ArrayList;

    .line 27
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string/jumbo v0, "profiles"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/api/masks/MasksResponse$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/masks/MasksResponse$1;-><init>(Lcom/vkontakte/android/api/masks/MasksResponse;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/masks/MasksResponse;->parseJsonArray(Lorg/json/JSONArray;Lcom/vkontakte/android/data/Parser;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/masks/MasksResponse;->profiles:Ljava/util/ArrayList;

    .line 36
    const-string/jumbo v0, "groups"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/api/masks/MasksResponse$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/masks/MasksResponse$2;-><init>(Lcom/vkontakte/android/api/masks/MasksResponse;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/masks/MasksResponse;->parseJsonArray(Lorg/json/JSONArray;Lcom/vkontakte/android/data/Parser;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/masks/MasksResponse;->groups:Ljava/util/ArrayList;

    .line 42
    new-instance v0, Lcom/vkontakte/android/data/VKList;

    new-instance v1, Lcom/vkontakte/android/api/masks/MasksResponse$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/masks/MasksResponse$3;-><init>(Lcom/vkontakte/android/api/masks/MasksResponse;)V

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    iput-object v0, p0, Lcom/vkontakte/android/api/masks/MasksResponse;->masks:Lcom/vkontakte/android/data/VKList;

    .line 54
    return-void
.end method

.method static synthetic access$000(ILjava/util/ArrayList;)Lcom/vkontakte/android/api/Group;
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 17
    invoke-static {p0, p1}, Lcom/vkontakte/android/api/masks/MasksResponse;->findGroup(ILjava/util/ArrayList;)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(ILjava/util/ArrayList;)Lcom/vkontakte/android/UserProfile;
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 17
    invoke-static {p0, p1}, Lcom/vkontakte/android/api/masks/MasksResponse;->findUserProfile(ILjava/util/ArrayList;)Lcom/vkontakte/android/UserProfile;

    move-result-object v0

    return-object v0
.end method

.method private static findGroup(ILjava/util/ArrayList;)Lcom/vkontakte/android/api/Group;
    .locals 2
    .param p0, "groupId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)",
            "Lcom/vkontakte/android/api/Group;"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "groups":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 58
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/Group;

    iget v1, v1, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v1, v1

    if-ne v1, p0, :cond_0

    .line 59
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/Group;

    .line 62
    :goto_1
    return-object v1

    .line 57
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 62
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private static findUserProfile(ILjava/util/ArrayList;)Lcom/vkontakte/android/UserProfile;
    .locals 2
    .param p0, "userId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Lcom/vkontakte/android/UserProfile;"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 67
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v1, p0, :cond_0

    .line 68
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 71
    :goto_1
    return-object v1

    .line 66
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 71
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private static parseJsonArray(Lorg/json/JSONArray;Lcom/vkontakte/android/data/Parser;)Ljava/util/ArrayList;
    .locals 3
    .param p0, "jo"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/json/JSONArray;",
            "Lcom/vkontakte/android/data/Parser",
            "<TT;>;)",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<TT;>;"
    if-nez p0, :cond_1

    .line 76
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    :cond_0
    return-object v1

    .line 78
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 79
    .local v1, "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 80
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/data/Parser;->parse(Lorg/json/JSONObject;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
