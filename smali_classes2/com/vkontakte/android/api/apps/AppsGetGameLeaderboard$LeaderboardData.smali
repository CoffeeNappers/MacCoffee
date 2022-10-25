.class public Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;
.super Ljava/lang/Object;
.source "AppsGetGameLeaderboard.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LeaderboardData"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public apiApplication:Lcom/vkontakte/android/data/ApiApplication;

.field public haveCurrentUserInLeaderboard:Z

.field public leaderboard:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameLeaderboard;",
            ">;"
        }
    .end annotation
.end field

.field public userLevelOrPointsCurrent:I

.field public userLevelOrPointsMax:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const-class v0, Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    iput-object v0, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    .line 48
    sget-object v0, Lcom/vkontakte/android/data/GameLeaderboard;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->leaderboard:Ljava/util/ArrayList;

    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->userLevelOrPointsCurrent:I

    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->haveCurrentUserInLeaderboard:Z

    .line 51
    return-void

    .line 50
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/vkontakte/android/data/ApiApplication;Ljava/util/ArrayList;IZ)V
    .locals 0
    .param p1, "apiApplication"    # Lcom/vkontakte/android/data/ApiApplication;
    .param p3, "userLevelOrPointsMax"    # I
    .param p4, "haveCurrentUserInLeaderboard"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/ApiApplication;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameLeaderboard;",
            ">;IZ)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p2, "leaderboard":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameLeaderboard;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    .line 41
    iput-object p2, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->leaderboard:Ljava/util/ArrayList;

    .line 42
    iput p3, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->userLevelOrPointsMax:I

    .line 43
    iput-boolean p4, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->haveCurrentUserInLeaderboard:Z

    .line 44
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v0, 0x0

    .line 60
    iget-object v1, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {p1, v1, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 61
    iget-object v1, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->leaderboard:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 62
    iget v1, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->userLevelOrPointsCurrent:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 63
    iget-boolean v1, p0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->haveCurrentUserInLeaderboard:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 64
    return-void
.end method
