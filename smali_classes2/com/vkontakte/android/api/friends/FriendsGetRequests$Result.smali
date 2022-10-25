.class public Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;
.super Ljava/lang/Object;
.source "FriendsGetRequests.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/friends/FriendsGetRequests;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public list:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;"
        }
    .end annotation
.end field

.field public total:I


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/data/VKList;I)V
    .locals 0
    .param p2, "total"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p1, "list":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/RequestUserProfile;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    iput-object p1, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->list:Lcom/vkontakte/android/data/VKList;

    .line 193
    iput p2, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->total:I

    .line 194
    return-void
.end method
