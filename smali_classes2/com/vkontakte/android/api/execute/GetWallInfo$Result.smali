.class public Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
.super Ljava/lang/Object;
.source "GetWallInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/execute/GetWallInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public bdate:Ljava/lang/String;

.field public hasNewItemsResponse:Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

.field public needUpdateGoogleNow:Z

.field public time:I

.field public vkAccount:Lcom/vkontakte/android/auth/VKAccount;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
