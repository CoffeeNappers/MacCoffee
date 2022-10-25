.class final Lcom/vkontakte/android/attachments/FriendsRecommAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "FriendsRecommAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/FriendsRecommAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/FriendsRecommAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/FriendsRecommAttachment;
    .locals 9
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 55
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "nextFrom":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    .line 57
    .local v0, "count":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 58
    .local v4, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 59
    new-instance v3, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v3}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 60
    .local v3, "p":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    iput v5, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 61
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 62
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 63
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 64
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    iput v5, v3, Lcom/vkontakte/android/UserProfile;->online:I

    .line 65
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    if-ne v5, v6, :cond_0

    move v5, v6

    :goto_1
    iput-boolean v5, v3, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 66
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    if-ne v5, v6, :cond_1

    move v5, v6

    :goto_2
    iput-boolean v5, v3, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 67
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    iput-object v5, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 68
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    iget-object v8, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    invoke-static {v5, v8}, Lcom/vkontakte/android/SystemUtils;->deserializeBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 69
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v5, v7

    .line 65
    goto :goto_1

    :cond_1
    move v5, v7

    .line 66
    goto :goto_2

    .line 71
    .end local v3    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_2
    new-instance v5, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    invoke-direct {v5, v4, v2}, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;-><init>(Ljava/util/ArrayList;Ljava/lang/String;)V

    return-object v5
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/FriendsRecommAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/FriendsRecommAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 75
    new-array v0, p1, [Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/FriendsRecommAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    move-result-object v0

    return-object v0
.end method
