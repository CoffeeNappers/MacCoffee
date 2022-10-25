.class public Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;
.super Ljava/lang/Object;
.source "NewsfeedGetPromotionLists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Item"
.end annotation


# instance fields
.field public hidden:Z

.field public id:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "hidden"    # Z

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;->id:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;->title:Ljava/lang/String;

    .line 41
    iput-boolean p3, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;->hidden:Z

    .line 42
    return-void
.end method
