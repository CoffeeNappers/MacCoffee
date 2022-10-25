.class public Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
.super Ljava/lang/Object;
.source "StatsTrackUploadServerStateAPIRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Args"
.end annotation


# instance fields
.field public fileName:Ljava/lang/String;

.field public fileSize:J

.field public httpError:Ljava/lang/String;

.field public httpStatus:I

.field public methodName:Ljava/lang/String;

.field public state:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

.field public uploadUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
