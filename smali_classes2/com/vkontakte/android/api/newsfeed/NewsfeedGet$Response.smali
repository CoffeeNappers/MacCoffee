.class public Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
.super Lcom/vkontakte/android/data/VKFromList;
.source "NewsfeedGet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/VKFromList",
        "<",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;"
    }
.end annotation


# instance fields
.field public isSmartNews:Ljava/lang/Boolean;

.field public lists:Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsfeedList;",
            ">;"
        }
    .end annotation
.end field

.field public notifications:Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation
.end field

.field public stories:Lcom/vk/stories/model/GetStoriesResponse;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 59
    invoke-direct {p0, p1}, Lcom/vkontakte/android/data/VKFromList;-><init>(Ljava/lang/String;)V

    .line 50
    iput-object v0, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    .line 53
    iput-object v0, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    .line 60
    return-void
.end method
