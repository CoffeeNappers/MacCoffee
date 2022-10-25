.class public final enum Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
.super Ljava/lang/Enum;
.source "StatsTrackUploadServerStateAPIRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

.field public static final enum BAD_RESPONSE:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

.field public static final enum BAD_SERVER:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

.field public static final enum NO_NETWORK:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

.field public static final enum SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

.field public static final enum TIMEOUT:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

.field public static final enum UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 11
    new-instance v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    const-string/jumbo v1, "SUCCESS"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 12
    new-instance v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    const-string/jumbo v1, "UNKNOWN"

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 13
    new-instance v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    const-string/jumbo v1, "TIMEOUT"

    invoke-direct {v0, v1, v5}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->TIMEOUT:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 14
    new-instance v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    const-string/jumbo v1, "NO_NETWORK"

    invoke-direct {v0, v1, v6}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->NO_NETWORK:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 15
    new-instance v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    const-string/jumbo v1, "BAD_SERVER"

    invoke-direct {v0, v1, v7}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_SERVER:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 16
    new-instance v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    const-string/jumbo v1, "BAD_RESPONSE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_RESPONSE:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 10
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    sget-object v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->TIMEOUT:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->NO_NETWORK:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    aput-object v1, v0, v6

    sget-object v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_SERVER:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_RESPONSE:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->$VALUES:[Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->$VALUES:[Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    invoke-virtual {v0}, [Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    return-object v0
.end method
