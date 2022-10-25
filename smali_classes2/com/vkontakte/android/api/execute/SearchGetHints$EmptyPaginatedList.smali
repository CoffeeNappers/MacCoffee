.class Lcom/vkontakte/android/api/execute/SearchGetHints$EmptyPaginatedList;
.super Lme/grishka/appkit/api/PaginatedList;
.source "SearchGetHints.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/execute/SearchGetHints;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EmptyPaginatedList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lme/grishka/appkit/api/PaginatedList",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 118
    .local p0, "this":Lcom/vkontakte/android/api/execute/SearchGetHints$EmptyPaginatedList;, "Lcom/vkontakte/android/api/execute/SearchGetHints$EmptyPaginatedList<TT;>;"
    invoke-direct {p0}, Lme/grishka/appkit/api/PaginatedList;-><init>()V

    .line 119
    return-void
.end method


# virtual methods
.method public total()I
    .locals 1

    .prologue
    .line 127
    .local p0, "this":Lcom/vkontakte/android/api/execute/SearchGetHints$EmptyPaginatedList;, "Lcom/vkontakte/android/api/execute/SearchGetHints$EmptyPaginatedList<TT;>;"
    const/4 v0, 0x0

    return v0
.end method
