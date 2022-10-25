.class public Lcom/vkontakte/android/RequestUserProfile;
.super Lcom/vkontakte/android/UserProfile;
.source "RequestUserProfile.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public info:Ljava/lang/String;

.field public isOutgoing:Z

.field public isSuggesting:Z

.field public message:Ljava/lang/String;

.field public mutualFriends:[Lcom/vkontakte/android/UserProfile;

.field public numMutualFriends:I

.field public sent:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    new-instance v0, Lcom/vkontakte/android/RequestUserProfile$1;

    invoke-direct {v0}, Lcom/vkontakte/android/RequestUserProfile$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/RequestUserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/UserProfile;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 7
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 20
    invoke-direct {p0, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 21
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/RequestUserProfile;->message:Ljava/lang/String;

    .line 22
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v1

    .line 23
    .local v1, "sentVal":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    const/4 v3, 0x0

    :goto_0
    iput-object v3, p0, Lcom/vkontakte/android/RequestUserProfile;->sent:Ljava/lang/Boolean;

    .line 24
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/RequestUserProfile;->info:Ljava/lang/String;

    .line 25
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    .line 26
    .local v2, "size":I
    new-array v3, v2, [Lcom/vkontakte/android/UserProfile;

    iput-object v3, p0, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    .line 27
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v2, :cond_2

    .line 28
    iget-object v6, p0, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    const-class v3, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    aput-object v3, v6, v0

    .line 27
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 23
    .end local v0    # "i":I
    .end local v2    # "size":I
    :cond_0
    if-ne v1, v4, :cond_1

    move v3, v4

    :goto_2
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0

    :cond_1
    move v3, v5

    goto :goto_2

    .line 30
    .restart local v0    # "i":I
    .restart local v2    # "size":I
    :cond_2
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/RequestUserProfile;->numMutualFriends:I

    .line 31
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v3

    if-ne v3, v4, :cond_3

    move v3, v4

    :goto_3
    iput-boolean v3, p0, Lcom/vkontakte/android/RequestUserProfile;->isOutgoing:Z

    .line 32
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v3

    if-ne v3, v4, :cond_4

    :goto_4
    iput-boolean v4, p0, Lcom/vkontakte/android/RequestUserProfile;->isSuggesting:Z

    .line 33
    return-void

    :cond_3
    move v3, v5

    .line 31
    goto :goto_3

    :cond_4
    move v4, v5

    .line 32
    goto :goto_4
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 5
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 37
    invoke-super {p0, p1}, Lcom/vkontakte/android/UserProfile;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 38
    iget-object v2, p0, Lcom/vkontakte/android/RequestUserProfile;->message:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 39
    iget-object v2, p0, Lcom/vkontakte/android/RequestUserProfile;->sent:Ljava/lang/Boolean;

    if-nez v2, :cond_0

    const/4 v2, -0x1

    :goto_0
    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 40
    iget-object v2, p0, Lcom/vkontakte/android/RequestUserProfile;->info:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 41
    iget-object v2, p0, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    if-nez v2, :cond_2

    move v1, v4

    .line 42
    .local v1, "size":I
    :goto_1
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 43
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, v1, :cond_3

    .line 44
    iget-object v2, p0, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    aget-object v2, v2, v0

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 43
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 39
    .end local v0    # "i":I
    .end local v1    # "size":I
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/RequestUserProfile;->sent:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v3

    goto :goto_0

    :cond_1
    move v2, v4

    goto :goto_0

    .line 41
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    array-length v1, v2

    goto :goto_1

    .line 46
    .restart local v0    # "i":I
    .restart local v1    # "size":I
    :cond_3
    iget v2, p0, Lcom/vkontakte/android/RequestUserProfile;->numMutualFriends:I

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 47
    iget-boolean v2, p0, Lcom/vkontakte/android/RequestUserProfile;->isOutgoing:Z

    if-eqz v2, :cond_4

    move v2, v3

    :goto_3
    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 48
    iget-boolean v2, p0, Lcom/vkontakte/android/RequestUserProfile;->isSuggesting:Z

    if-eqz v2, :cond_5

    :goto_4
    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 49
    return-void

    :cond_4
    move v2, v4

    .line 47
    goto :goto_3

    :cond_5
    move v3, v4

    .line 48
    goto :goto_4
.end method
