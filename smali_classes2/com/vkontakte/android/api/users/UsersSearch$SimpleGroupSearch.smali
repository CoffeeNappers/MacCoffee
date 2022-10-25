.class public Lcom/vkontakte/android/api/users/UsersSearch$SimpleGroupSearch;
.super Lcom/vkontakte/android/api/users/UsersSearch$SimpleSearch;
.source "UsersSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/users/UsersSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleGroupSearch"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;III)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "fromList"    # Ljava/lang/String;
    .param p3, "groupId"    # I
    .param p4, "offset"    # I
    .param p5, "count"    # I

    .prologue
    .line 127
    invoke-direct {p0, p1, p4, p5}, Lcom/vkontakte/android/api/users/UsersSearch$SimpleSearch;-><init>(Ljava/lang/String;II)V

    .line 128
    const-string/jumbo v0, "group_id"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/users/UsersSearch$SimpleGroupSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 129
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 130
    const-string/jumbo v0, "from_list"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/users/UsersSearch$SimpleGroupSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 132
    :cond_0
    return-void
.end method
