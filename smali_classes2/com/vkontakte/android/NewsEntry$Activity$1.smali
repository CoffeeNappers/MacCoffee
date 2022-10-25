.class final Lcom/vkontakte/android/NewsEntry$Activity$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "NewsEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/NewsEntry$Activity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/NewsEntry$Activity;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1739
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/NewsEntry$Activity;
    .locals 6
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 1743
    new-instance v0, Lcom/vkontakte/android/NewsEntry$Activity;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry$Activity;-><init>()V

    .line 1744
    .local v0, "activity":Lcom/vkontakte/android/NewsEntry$Activity;
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    iput v3, v0, Lcom/vkontakte/android/NewsEntry$Activity;->type:I

    .line 1746
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry$Activity;->likesText:Ljava/lang/String;

    .line 1747
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    .line 1748
    .local v1, "counter":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1749
    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry$Activity;->users:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1748
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1751
    :cond_0
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    .line 1752
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_1

    .line 1753
    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1752
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1756
    :cond_1
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    iput v3, v0, Lcom/vkontakte/android/NewsEntry$Activity;->commentID:I

    .line 1757
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    iput v3, v0, Lcom/vkontakte/android/NewsEntry$Activity;->commentFromID:I

    .line 1758
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readLong()J

    move-result-wide v4

    iput-wide v4, v0, Lcom/vkontakte/android/NewsEntry$Activity;->commentDate:J

    .line 1759
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry$Activity;->commentText:Ljava/lang/String;

    .line 1760
    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1739
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/NewsEntry$Activity$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/NewsEntry$Activity;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/NewsEntry$Activity;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 1765
    new-array v0, p1, [Lcom/vkontakte/android/NewsEntry$Activity;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1739
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/NewsEntry$Activity$1;->newArray(I)[Lcom/vkontakte/android/NewsEntry$Activity;

    move-result-object v0

    return-object v0
.end method
