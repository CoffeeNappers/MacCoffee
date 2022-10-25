.class public Lcom/vkontakte/android/api/wall/WallGetComments$Result;
.super Ljava/lang/Object;
.source "WallGetComments.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/wall/WallGetComments;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public canComment:Z

.field public canLike:Z

.field public canRepost:Z

.field public comments:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/NewsComment;",
            ">;"
        }
    .end annotation
.end field

.field public liked:Z

.field public likes:Lorg/json/JSONArray;

.field public reposted:Z

.field public totalLikes:I

.field public totalReposts:I

.field public totalViews:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
