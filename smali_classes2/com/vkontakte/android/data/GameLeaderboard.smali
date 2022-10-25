.class public Lcom/vkontakte/android/data/GameLeaderboard;
.super Ljava/lang/Object;
.source "GameLeaderboard.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/data/GameLeaderboard;",
            ">;"
        }
    .end annotation
.end field

.field public static KEY_LEVEL:Ljava/lang/String;

.field public static KEY_POINTS:Ljava/lang/String;

.field public static KEY_USER_ID:Ljava/lang/String;


# instance fields
.field public final intValue:I

.field public isPoints:Z

.field public place:I

.field public final userId:I

.field public final userProfile:Lcom/vkontakte/android/UserProfile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-string/jumbo v0, "user_id"

    sput-object v0, Lcom/vkontakte/android/data/GameLeaderboard;->KEY_USER_ID:Ljava/lang/String;

    .line 17
    const-string/jumbo v0, "points"

    sput-object v0, Lcom/vkontakte/android/data/GameLeaderboard;->KEY_POINTS:Ljava/lang/String;

    .line 18
    const-string/jumbo v0, "level"

    sput-object v0, Lcom/vkontakte/android/data/GameLeaderboard;->KEY_LEVEL:Ljava/lang/String;

    .line 82
    new-instance v0, Lcom/vkontakte/android/data/GameLeaderboard$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/GameLeaderboard$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/GameLeaderboard;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->isPoints:Z

    .line 56
    const-class v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    .line 57
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->place:I

    .line 58
    return-void

    .line 55
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/vkontakte/android/UserProfile;IZ)V
    .locals 1
    .param p1, "userProfile"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "pointsOrLevel"    # I
    .param p3, "isPoints"    # Z

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    .line 30
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    iput v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    .line 31
    iput p2, p0, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    .line 32
    iput-boolean p3, p0, Lcom/vkontakte/android/data/GameLeaderboard;->isPoints:Z

    .line 33
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Landroid/util/SparseArray;)V
    .locals 5
    .param p1, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .local p2, "profileSparseArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v4, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    sget-object v2, Lcom/vkontakte/android/data/GameLeaderboard;->KEY_USER_ID:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    .line 37
    sget-object v2, Lcom/vkontakte/android/data/GameLeaderboard;->KEY_POINTS:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, "points":Ljava/lang/String;
    sget-object v2, Lcom/vkontakte/android/data/GameLeaderboard;->KEY_LEVEL:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "level":Ljava/lang/String;
    iget v2, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    sget-object v3, Lcom/vkontakte/android/UserProfile;->EMPTY_USER:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p2, v2, v3}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iput-object v2, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    .line 41
    iput-boolean v4, p0, Lcom/vkontakte/android/data/GameLeaderboard;->isPoints:Z

    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 43
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/data/GameLeaderboard;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    .line 44
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/vkontakte/android/data/GameLeaderboard;->isPoints:Z

    .line 50
    :goto_0
    return-void

    .line 45
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 46
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/GameLeaderboard;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    goto :goto_0

    .line 48
    :cond_1
    iput v4, p0, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method

.method public parseInt(Ljava/lang/String;)I
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 62
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 64
    :goto_0
    return v1

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x0

    .line 75
    iget v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 76
    iget v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->intValue:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 77
    iget-boolean v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->isPoints:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->userProfile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 79
    iget v0, p0, Lcom/vkontakte/android/data/GameLeaderboard;->place:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 80
    return-void

    :cond_0
    move v0, v1

    .line 77
    goto :goto_0
.end method
